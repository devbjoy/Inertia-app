<script setup>
import { Head, router } from '@inertiajs/vue3';
import Container from '../../Components/Container.vue';
import { computed } from 'vue';

const props = defineProps({
    listing:Object,
    login:Number
})

const deleteListing = ()=>{
    if(confirm('Are you sure ! you want to delete it')){
        router.post(route('listing.destroy',props.listing[0].id),{_method:'DELETE'})
    }
}

const show = computed(() => (props.listing[0].user_id === props.login) ? true : false)


const approved = () =>{
    const msg = props.listing[0].approved ? 'Disapproved this listing' : 'Approved this listing';

    if(confirm(msg)){
        router.put(route('admin.approve',props.listing[0].id))
    }
}
</script>

<template>
<Head title="- Listing Details"/>
<div v-if="$page.props.auth.role === 'admin'" class="bg-slate-800 text-white mb-6 p-6 rounded-md font-medium flex items-center justify-between">
    <p>This listing is {{ listing[0].approved ? "Approved" : "Disapproved"}}</p>
    <button @click="approved" class="bg-slate-600 px-3 py-1 rounded-md">
        {{ listing[0].approved ? "Disapproved it" : "Approved it" }}
    </button>
</div>
<Container class="flex gap-4">
    <div class="w-1/4 rounded-md overflow-hidden">
        <img :src="listing[0].image ? `/storage/${listing[0].image}` : '/storage/images/listing/default.png'" alt="" class="w-full h-full object-cover object-center">
    </div>
    <div class="w-3/4">
        <!-- listing info -->
        <div class="mb-6">
            <div class="flex items-center justify-between mb-2 gap-2">
                <p class="text-slate-400 w-full border-b">Listing detail</p>
                <div class="flex items-center gap-2" v-if="show">
                    <Link :href="route('listing.edit',listing[0].id)" class="text-white flex items-center gap-2 px-6 py-2 hover:outline hover:outline-green-500 outline-offset-2 bg-green-500 rounded-md">
                        <i class="fa-solid fa-up-right-from-square"></i>
                        Edit    
                    </Link>
                    <button type="button" @click.prevent="deleteListing" class="text-white flex items-center gap-2 px-6 py-2 hover:outline hover:outline-red-500 outline-offset-2 bg-red-500 rounded-md">
                        <i class="fa-solid fa-trash"></i>
                        Delete</button>
                </div>
            </div>
            <h3 class="font-bold text-2xl mb-4">
                {{ listing[0].title }}
            </h3>
            <p>{{ listing[0].desc }}</p>
        </div>
        <!-- contact info -->
         <div class="mb-6">
            <p class="text-slate-400 w-full border-b mb-2">Contact info</p>
            <!-- Email -->
            <div v-if="listing[0].email" class="flex items-center gap-2 mb-2">
                <i class="fa-solid fa-at"></i>
                <p>Email:</p>
                <a :href="`mailto:${listing[0].email}`" class="text-indigo-500 hover:text-indigo-600 font-medium underlin dark:text-indigo-400 dark:hover:text-indigo-500">
                    {{ listing[0].email }}
                </a>
            </div>
            <!-- Link -->
            <div v-if="listing[0].link" class="flex items-center gap-2 mb-2">
                <i class="fa-solid fa-up-right-from-square"></i>
                <p>External Link:</p>
                <a :href="listing[0].link" target="_blank" class="text-indigo-500 hover:text-indigo-600 font-medium underlin dark:text-indigo-400 dark:hover:text-indigo-500">
                    {{ listing[0].link }}
                </a>
            </div>
            <!-- User -->
            <div class="flex items-center gap-2 mb-2">
                <i class="fa-solid fa-user"></i>
                <p>Listed by:</p>
                <Link :href="route('home',{user_id:listing[0].user_id})" class="text-indigo-500 hover:text-indigo-600 font-medium underlin dark:text-indigo-400 dark:hover:text-indigo-500">
                    {{ listing[0].user.name }}
                </Link>
            </div>
         </div>
         <!-- tags section -->
          <div v-if="listing[0].tags" class="mb-6">
            <p class="text-slate-400 w-full border-b mb-2">Tags</p>
            <div class="flex items-center gap-3">
                <div v-for="tag in listing[0].tags.split(',')" :key="tag">
                    <Link :href="route('home',{ tag })" class="bg-slate-500 text-white px-3 py-1 rounded-full hover:bg-slate-700 dark:hover:bg-slate-900">{{ tag }}</Link>
                </div>
            </div>

          </div>
    </div>
</Container>
</template>