<script setup>
import Container from '../../Components/Container.vue';
import Title from '../../Components/Title.vue';
import TextLink from '../../Components/TextLink.vue';
import InputField from '../../Components/InputField.vue';
import PrimaryBtn from '../../Components/PrimaryBtn.vue';
import { Head, useForm } from '@inertiajs/vue3';
import ErrorMessage from '../../Components/ErrorMessage.vue';

const form = useForm({
    name:'',
    email:'',
    password:'',
    password_confirmation:''
})
const submit = ()=>{
    form.post(route('register'),{
        onFinish:() => form.reset('password','password_confirmation')   
    })
}


</script>

<template>
    <Head title="- Register"/>
    <Container class="w-1/2">
        <div class="mb-8 text-center">
            <Title>Register a new account</Title>
            <p>Already have an account? <TextLink routeName="login" label="Login"/></p>
        </div>

        <ErrorMessage :errors="form.errors"/>
        <form class="space-y-6" @submit.prevent="submit">
            <InputField v-model="form.name" label="Name" icon="id-badge" placeholder="Enter your name"/>
            <InputField v-model="form.email" label="Email" icon="at" placeholder="Enter your email"/>
            <InputField v-model="form.password" label="Password" type="password" icon="key" placeholder="Enter your password"/>
            <InputField v-model="form.password_confirmation" label="Confirm Password" type="password" icon="key" placeholder="Enter your confirm password"/>
            <p class="text-slate-500 text-sm dark:text-slate-400">
                By creating an account, you agree to our Terms of Service and Privacy Policy
            </p>
            <PrimaryBtn :disabled="form.processing">Register</PrimaryBtn>
        </form>
    </Container>
</template>