<?php

namespace App\Http\Controllers;

use App\Http\Middleware\NotSuspended;
use App\Models\Listings;
use Illuminate\Support\Facades\Storage;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Routing\Controllers\HasMiddleware;
use Illuminate\Routing\Controllers\Middleware;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Inertia\Inertia;

class ListingsController extends Controller implements HasMiddleware
{
    public static function middleware()
    {
        return [
            new Middleware(['auth','verified',NotSuspended::class],except:['index','show'])
        ];
    }
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $listings = Listings::whereHas('user',function(Builder $query){
            $query->where('role','!=','suspended');
        })
            ->with('user')
            ->where('approved',true)
            ->filter(request(['search','user_id','tag']))
            ->latest()
            ->paginate(6)
            ->withQueryString();

        return Inertia::render('Home',[
                    'listings' => $listings,
                    'searchTerms' => $request->search
                    ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return Inertia::render('listing/Create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // $newtags = explode(',',$request->tags);
        // $newtags = array_map('trim',$newtags);
        // $newtags = array_filter($newtags);
        // $newtags = array_unique($newtags);
        // $newtags = implode(',',$newtags);

        $fields = $request->validate([
            'title' => ['required','max:191'],
            'desc' => ['required','min:10'],
            'email' => ['nullable','email'],
            'link' => ['nullable','url'],
            'tags' => ['nullable','string'],
            'image' => ['nullable','max:3072','mimes:jpg,png,jpeg']
        ]);

        if($request->hasFile('image')){
            $fields['image']= Storage::disk('public')->put('images/listing', $request->image);   
        }

        $fields['tags'] = implode(',',array_unique(array_filter(array_map('trim',explode(',',$request->tags)))));

        $request->user()->listings()->create($fields);

        return redirect()->route('dashboard')->with('status','listing create successfully');
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $listing = Listings::with('user')->where('id',$id)->get();
        
        $login = Auth::check() ? Auth::user()->id : false;
    
        return Inertia::render('listing/Show',['listing'=>$listing,'login' => $login]);
        
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $listing = Listings::where('id',$id)->get();

        return Inertia::render('listing/Edit',['listing' => $listing]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $listing = Listings::find($id);
        $fields = $request->validate([
            'title' => ['required','max:191'],
            'desc' => ['required','min:10'],
            'email' => ['nullable','email'],
            'link' => ['nullable','url'],
            'tags' => ['nullable','string'],
            'image' => ['nullable','max:3072','mimes:jpg,png,jpeg']
        ]);

        if($request->hasFile('image')){

            if($listing->image){
                Storage::disk('public')->delete($listing->image);
            }

            $fields['image']= Storage::disk('public')->put('images/listing', $request->image);   
        }else{
            $fields['image'] = $listing->image;
        }
        $fields['approved'] = false;
        $fields['tags'] = implode(',',array_unique(array_filter(array_map('trim',explode(',',$request->tags)))));

        $listing->update($fields);

        return redirect()->route('dashboard')->with('status','listing updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $listing = Listings::find($id);

        if($listing->image){
            Storage::disk('public')->delete($listing->image);
        }

        $listing->delete();

        return redirect()->route('dashboard')->with('status','listing deleted successfully');

    }
}
