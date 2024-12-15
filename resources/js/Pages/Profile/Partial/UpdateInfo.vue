<script setup>
import Container from '../../../Components/Container.vue';
import Title from '../../../Components/Title.vue';
import InputField from '../../../Components/InputField.vue';
import PrimaryBtn from '../../../Components/PrimaryBtn.vue';
import ErrorMessage from '../../../Components/ErrorMessage.vue';
import SessionMessage from '../../../Components/SessionMessage.vue';
import { router, useForm } from '@inertiajs/vue3';

const props = defineProps({
    user:Object,
    status:String
})

const form = useForm({
    name:props.user.name,
    email:props.user.email
})

const submit = () =>{
    form.patch(route('porfile.update'))
}

const resendEmail = (e)=>{
    router.post(route('verification.send'),{},{
        onStart:()=> e.target.disabled = true,
        onFinish:()=> e.target.disabled = false,
    })
}

</script>

<template>
    <Container class="mb-6">
        <div class="mb-8">
            <Title>Update Information</Title>
            <p>Update your account profile Information and email address</p>
        </div>
        
        <ErrorMessage :errors="form.errors"/>
        <form class="space-y-6" @submit.prevent="submit">
            <InputField v-model="form.name" label="Name" icon="id-badge" placeholder="Enter your Name" class="w-1/2"/>
            <InputField v-model="form.email" label="Email" icon="at" placeholder="Enter your email" class="w-1/2"/>
            <div v-if="props.user.email_verified_at === null">
                <SessionMessage :status="status"/>
                <p>Your Email Address is unverified
                <button @click="resendEmail" class="text-indigo-500 hover:text-indigo-600 font-medium underline dark:text-indigo-400 dark:hover:text-indigo-500 disabled:text-slate-300 disabled:cursor-wait">Click here to re-send the verification email</button>
                </p>
            </div>
            <PrimaryBtn :disabled="form.processing">Save</PrimaryBtn>
        </form>
    </Container>
</template>