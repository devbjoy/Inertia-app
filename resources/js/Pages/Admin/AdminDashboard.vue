<script setup>
import { Head, Link, router, useForm } from '@inertiajs/vue3';
import PaginateLink from '../../Components/PaginateLink.vue';
import RoleSelect from '../../Components/RoleSelect.vue';
import SessionMessage from '../../Components/SessionMessage.vue';
import InputField from '../../Components/InputField.vue';

defineProps({
    users:Object,
    status:String
})

const params = route().params;

const form = useForm({search: params.search})

const search = ()=>{
    router.get(route('admin.index',{
        search: form.search,
        user_role: params.user_role
    }))
}

const toggleRole = (e)=>{
    if(e.target.checked){
        router.get(route('admin.index',{
            user_role: 'suspended',
            search: params.search 
        }))
    }else{
        router.get(route('admin.index',{
            user_role: null,
            search: params.search
        }))
    }
}
</script>


<template>
    <Head title="- Admin"/>

    <SessionMessage :status="status"/>
    <!-- Heading -->
     <div class="flex items-center justify-between mb-4">
        <div class="flex items-end gap-2">
            <!-- search -->
             <form @submit.prevent="search">
                 <InputField v-model="form.search" lable="" icon="magnifying-glass" placeholder="Search..."/>
             </form>

             <Link 
                v-if="params.search"
                class="px-2 py-[6px] rounded-md bg-indigo-500 text-white flex items-center gap-2"
                :href="route('admin.index',{...params,search:null,page:null})"
                >
                {{ params.search }}
                <i class="fa-solid fa-xmark"></i>
            </Link>
        </div>

        <!-- toggle role btn -->
         <div class="flex items-center gap-2 text-xs hover:bg-slate-300 dark:hover:bg-slate-800 px-2 py-1 rounded-md">
            <input :checked="params.user_role" id="toggleRole" type="checkbox" @input="toggleRole" class="rounded-md border-1 outline-0 text-indigo-500 ring-indigo-500 border-slate-700 cursor-pointer">
            <label for="toggleRole" class="block text-sm font-medium text-slate-700 dark:text-slate-300 cursor-pointer">
                Show suspended users
            </label>
         </div>
     </div>

     <!-- table -->
      <table class="bg-white dark:bg-slate-800 w-full rounded-lg overflow-hidden ring-1 ring-slate-300">
        <thead>
            <tr class="bg-slate-600 text-slate-300 uppercase text-xs text-left">
                <th class="w-3/6 p-3">Name</th>
                <th class="w-2/6 p-3">Role</th>
                <th class="w-1/6 p-3">Listing</th>
                <th class="w-1/6 p-3">View</th>
            </tr>
        </thead>

        <tbody class="divide-y divide-slate-300 divide-dashed">
            
            <tr v-for="user in users.data" :key="user.id">
                <td class="w-3/6 py-5 px-3">
                    <p class="font-bold mb-1">{{ user.name }}</p>
                    <p class="font-light text-xs">{{ user.email }}</p>
                </td>

                <td class="w-2/6 py-5 px-3">
                    <RoleSelect :user="user"/>
                </td>

                <td class="w-1/6 py-5 px-3">
                    <div class="flex items-center gap-6">
                        <div class="flex items-center gap-1">
                            <p>{{ user.listings.filter(t => t.approved).length }}</p>
                            <i class="fa-solid fa-circle-check text-green-500"></i>
                        </div>
                        <div class="flex items-center gap-1">
                            <p>{{ user.listings.filter(t => !t.approved).length }}</p>
                            <i class="fa-solid fa-circle-check text-red-500"></i>
                        </div>
                    </div>
                   <!-- {{ user.listings.length }} -->
                </td>

                <td class="w-1/6 py-5 px-3">
                    <Link :href="route('admin.show',user.id)" class="fa-solid fa-up-right-from-square px-3 text-indigo-300"></Link>
                </td>
            </tr>
        </tbody>
      </table>
      <div class="mt-6">
         <PaginateLink :paginate="users"/>
      </div>
</template>