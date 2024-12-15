<script setup>
import Container from '../../Components/Container.vue';
import Title from '../../Components/Title.vue';
import InputField from '../../Components/InputField.vue';
import PrimaryBtn from '../../Components/PrimaryBtn.vue';
import { Head, useForm } from '@inertiajs/vue3';
import ErrorMessage from '../../Components/ErrorMessage.vue';

const props = defineProps({
    token:String,
    email: String
})

const form = useForm({
    token:props.token,
    email:props.email,
    password:'',
    password_confirmation:''
})
const submit = ()=>{
    form.post(route('password.update'),{
        onFinish:() => form.reset('password','password_confirmation')   
    })
}

</script>

<template>
    <Head title="- Reset password"/>
    <Container class="w-1/2">
        <div class="mb-8 text-center">
            <Title>Reset Your Password</Title>
        </div>

        <ErrorMessage :errors="form.errors"/>
        <form class="space-y-6" @submit.prevent="submit">
            <InputField v-model="form.email" label="Email" icon="at" placeholder="Enter your email"/>
            <InputField v-model="form.password" label="Password" type="password" icon="key" placeholder="Enter your password"/>
            <InputField v-model="form.password_confirmation" label="Confirm Password" type="password" icon="key" placeholder="Enter your confirm password"/>

            <PrimaryBtn :disabled="form.processing">Reset Password</PrimaryBtn>
        </form>
    </Container>
</template>