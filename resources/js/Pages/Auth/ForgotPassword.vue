<script setup>
import Container from '../../Components/Container.vue';
import InputField from '../../Components/InputField.vue';
import PrimaryBtn from '../../Components/PrimaryBtn.vue';
import { Head, useForm } from '@inertiajs/vue3';
import ErrorMessage from '../../Components/ErrorMessage.vue';
import SessionMessage from '../../Components/SessionMessage.vue';

defineProps({
    status:String
})

const form = useForm({
    email:'',
})
const submit = ()=>{
    form.post(route('password.email'))
}


</script>

<template>
    <Head title="- Forgot Password"/>
    <Container class="w-1/2">
        <div class="mb-8 text-center">
            <p>No any problem you can forgot your password easely</p>
        </div>
        <SessionMessage :status="status"/>
        <ErrorMessage :errors="form.errors"/>
        <form class="space-y-6" @submit.prevent="submit">
            <InputField v-model="form.email" label="Email" icon="at" placeholder="Enter your email"/>
            <PrimaryBtn :disabled="form.processing">Send Password Reset Link</PrimaryBtn>
        </form>
    </Container>
</template>