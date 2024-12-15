<script setup>
import Container from '../../Components/Container.vue';
import InputField from '../../Components/InputField.vue';
import PrimaryBtn from '../../Components/PrimaryBtn.vue';
import { Head, useForm } from '@inertiajs/vue3';
import ErrorMessage from '../../Components/ErrorMessage.vue';

const form = useForm({
    password:''
})
const submit = ()=>{
    form.post(route('password.confirm'),{
        onFinish:() => form.reset()   
    })
}


</script>

<template>
    <Head title="- Confirm Password"/>
    <Container class="w-1/2">
        <div class="mb-8 text-center">
            <p>Please Confirm Your password, before you are contune</p>
        </div>
        <ErrorMessage :errors="form.errors"/>
        <form class="space-y-6" @submit.prevent="submit">
            <InputField v-model="form.password" label="Password" type="password" icon="key" placeholder="Enter your password"/>
            <PrimaryBtn :disabled="form.processing">Confirm Password</PrimaryBtn>
        </form>
    </Container>
</template>