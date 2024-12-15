<script setup>
import UpdateInfo from './Partial/UpdateInfo.vue';
import UpdatePassword from './Partial/UpdatePassword.vue';
import DeleteAccount from './Partial/DeleteAccount.vue';
import { Head } from '@inertiajs/vue3';

defineProps({
    user:Object,
    status:String
})
</script>


<template>
    <Head title="- Profile"/>
    <UpdateInfo :user="user" :status="status"/>
    <UpdatePassword/>
    <DeleteAccount/>
</template>