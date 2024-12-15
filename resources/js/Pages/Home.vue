<script setup>
import Card from '../Components/Card.vue';
import PaginateLink from '../Components/PaginateLink.vue';
import InputField from '../Components/InputField.vue';
import { router, useForm } from '@inertiajs/vue3';



const props = defineProps({
    listings:Object,
    searchTerms:String
})

const params = route().params;
const userName = params.user_id ? props.listings.data.find(i => i.user_id === Number(params.user_id)).user.name : null;

const form = useForm({
    search:props.searchTerms
})

const search = ()=>{
    router.get(route('home'),{
        search:form.search,
        user_id:params.user_id,
        tag:params.tag
    })
}

</script>

<template>
    <Head title="- Latest Listing"/>
    <!-- search section -->
     <div class="mb-4 flex justify-between align-center">
        <div class="flex justify-center gap-2">
            <!-- removing tag filter -->
            <Link 
                v-if="params.tag"
                class="px-2 py-1 rounded-md bg-indigo-500 text-white flex items-center gap-2"
                :href="route('home',{...params,tag:null,page:null})"
                >
                {{ params.tag }}
                <i class="fa-solid fa-xmark"></i>
            </Link>
            <!-- removing search filter -->
            <Link 
                v-if="params.search"
                class="px-2 py-1 rounded-md bg-indigo-500 text-white flex items-center gap-2"
                :href="route('home',{...params,search:null,page:null})"
                >
                {{ params.search }}
                <i class="fa-solid fa-xmark"></i>
            </Link>
            <Link 
                v-if="params.user_id"
                class="px-2 py-1 rounded-md bg-indigo-500 text-white flex items-center gap-2"
                :href="route('home',{...params,user_id:null,page:null})"
                >
                {{ userName}}
                <i class="fa-solid fa-xmark"></i>
            </Link>
        </div>
        <div class="w-1/4">
            <form @submit.prevent="search">
                <InputField label="" icon="magnifying-glass" placeholder="Search..." type="search" v-model="form.search"/>
            </form>
        </div>
     </div>
    <!-- all listing item -->
    <div v-if="Object.keys(listings.data).length">
         <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            <div v-for="listing in listings.data" :key="listing.id">
                <Card :listing="listing"/>
            </div>
         </div>
         <div class="mt-8">
            <PaginateLink :paginate="listings"/>
         </div>
    </div>
    <div v-else>
        There is no listing
    </div>
    
</template>