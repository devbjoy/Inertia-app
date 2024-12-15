<script setup>
import { Link, router } from '@inertiajs/vue3';

const params = route().params;

const searchUser = (id)=>{
    router.get(route('home'),{
        user_id:id,
        search:params.search,
        tag:params.tag
    })
}

const searchTag = (tag)=>{
    router.get(route('home'),{
        user_id:params.user_id,
        search:params.search,
        tag:tag
    })
}

defineProps({
    listing:Object
})


</script>

<template>
    <div class="bg-white rounded-lg shadow-lg overflow-hidden dark:bg-slate-800 h-full flex flex-col justify-between">
        <!-- images -->
         <Link :href="route('listing.show',listing.id)">
            <img class="w-full h-48 object-cover bg-gray-300" :src="listing.image ? `/storage/${listing.image}` : '/storage/images/listing/default.png'" alt="">
         </Link>
    
        <!-- title and user -->
         <div class="p-4">
            <h3 class="font-bold text-lg mb-2">
                {{ listing.title.substring(0,40) }}...
            </h3>
            <p>Listed on {{ new Date(listing.created_at).toLocaleDateString() }} by 
                <button @click="searchUser(listing.user.id)" class="text-indigo-500 hover:text-indigo-600 font-medium underline dark:text-indigo-400 dark:hover:text-indigo-500">
                    {{ listing.user.name }}
                </button></p>
         </div>
         <!-- tags -->
          <div v-if="listing.tags" class="flex items-center gap-3 px-4 pb-4">
            <div v-for="tag in listing.tags.split(',')">
                <button @click="searchTag(tag)" class="bg-slate-500 text-white px-2 py-px rounded-full hover:bg-slate-700 dark:hover:bg-slate-900">
                    {{ tag }}
                </button>
            </div>
          </div>
    </div>
</template>