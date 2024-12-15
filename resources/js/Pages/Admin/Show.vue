<script setup>
import PaginateLink from '../../Components/PaginateLink.vue';
import InputField from '../../Components/InputField.vue';
import SessionMessage from '../../Components/SessionMessage.vue';
import { Head, router, useForm } from '@inertiajs/vue3';



const porps = defineProps({
    user:Object,
    listings: Object,
    status: String
})
const params = route().params

const form = useForm({
    search:params.search
})

const search = ()=>{
    router.get(route('admin.show',{
        search: form.search,
        user: porps.user.id,
        disapproved: params.disapproved
    }))
}

const toggleDisApproved = (e) => {
    if(e.target.checked){
        router.get(route('admin.show',{
            search: params.search,
            user: params.user,
            disapproved: true
        }))
    }else{
        router.get(route('admin.show',{
            search: params.search,
            user: params.user,
            disapproved: null
        }))
    }
}

const approved = (listing) =>{
    const msg = listing.approved ? 'Disapproved this listing' : 'Approved this listing';

    if(confirm(msg)){
        router.put(route('admin.approve',listing.id))
    }
}

</script>


<template>
    <Head :title="`- ${user.name} listing`"/>

    <SessionMessage :status="status"/>
    <!-- heading -->
    <div class="flex items-center justify-between mb-4">
        <div class="flex items-center justify-between mb-4">
            <div class="flex items-end gap-2">
                <!-- search -->
                <form @submit.prevent="search">
                    <InputField v-model="form.search" lable="" icon="magnifying-glass" placeholder="Search..."/>
                </form>

                <Link 
                    v-if="params.search"
                    class="px-2 py-[6px] rounded-md bg-indigo-500 text-white flex items-center gap-2"
                    :href="route('admin.show',{...params,search:null,page:null})"
                    >
                    {{ params.search }}
                    <i class="fa-solid fa-xmark"></i>
                </Link>
            </div>
        </div>  
     <div class="flex items-center gap-2 text-xs hover:bg-slate-300 dark:hover:bg-slate-800 px-2 py-1 rounded-md">
            <input :checked="params.disapproved" id="toggleRole" type="checkbox" @input="toggleDisApproved" class="rounded-md border-1 outline-0 text-indigo-500 ring-indigo-500 border-slate-700 cursor-pointer">
            <label for="toggleRole" class="block text-sm font-medium text-slate-700 dark:text-slate-300 cursor-pointer">
                Show disapproved listing            
            </label>
         </div>   
    </div>

    <!-- table -->
    <table class="bg-white dark:bg-slate-800 w-full rounded-lg overflow-hidden ring-1 ring-slate-300">
        <thead>
            <tr class="bg-slate-600 text-slate-300 uppercase text-xs text-left">
                <th class="w-3/6 p-3">Title</th>
                <th class="w-2/6 p-3">approved</th>
                <th class="w-1/6 p-3">View</th>
            </tr>
        </thead>

        <tbody class="divide-y divide-slate-300 divide-dashed">
            
            <tr v-for="listing in listings.data" :key="user.id">
                <td class="w-4/6 py-5 px-3">
                    <p class="font-bold mb-1">{{ listing.title }}</p>
                </td>

                <td class="w-1/6 py-5 px-3">
                   <button @click.prevent="approved(listing)">
                    <i :class="`fa-solid fa-${listing.approved ? 'circle-check text-green-500' : 'circle-xmark text-red-500'}`"></i>
                   </button>
                </td>

                <td class="w-1/6 py-5 px-3 text-2xl text-center">
                    <Link :href="route('listing.show',listing.id)" class="fa-solid fa-up-right-from-square px-3 text-indigo-300"></Link>
                </td>
            </tr>
        </tbody>
      </table>
      <div class="mt-6">
         <PaginateLink :paginate="listings"/>
      </div>
</template>