<script setup>
import Container from '../../Components/Container.vue';
import Title from '../../Components/Title.vue';
import TextLink from '../../Components/TextLink.vue';
import InputField from '../../Components/InputField.vue';
import PrimaryBtn from '../../Components/PrimaryBtn.vue';
import { Head, useForm } from '@inertiajs/vue3';
import ErrorMessage from '../../Components/ErrorMessage.vue';
import CheckBox from '../../Components/CheckBox.vue';
import SessionMessage from '../../Components/SessionMessage.vue';
import SuccessMessage from '../../Components/SuccessMessage.vue';

defineProps({
    status:String
})

const form = useForm({
    email:'',
    password:'',
    remember:null
})
const submit = ()=>{
    form.post(route('login'),{
        onFinish:() => form.reset('password')   
    })
}


</script>

<template>
    <Head title="- Login"/>
    <Container class="w-1/2">
        <div class="mb-8 text-center">
            <Title>Login to your account</Title>
            <p>Need an account? <TextLink routeName="register" label="Register"/></p>
        </div>
        <SuccessMessage :status="status"/>
        <ErrorMessage :errors="form.errors"/>
        <form class="space-y-6" @submit.prevent="submit">
            <InputField v-model="form.email" label="Email" icon="at" placeholder="Enter your email"/>
            <InputField v-model="form.password" label="Password" type="password" icon="key" placeholder="Enter your password"/>

            <div class="flex items-center justify-between">
                <CheckBox v-model="form.remember" name="remember">Remember me</CheckBox>
                <TextLink routeName="password.request" label="Forgot Password"/>
            </div>
            <PrimaryBtn :disabled="form.processing">Login</PrimaryBtn>
        </form>
    </Container>
</template>