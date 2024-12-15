<script setup>
import PrimaryBtn from '../../Components/PrimaryBtn.vue';
import Container from '../../Components/Container.vue';
import { Head, useForm } from '@inertiajs/vue3';
import SessionMessage from '../../Components/SessionMessage.vue';

const form = useForm({});

defineProps({
    status:String
})

const submit = ()=>{
    form.post(route('verification.send'));
}

</script>

<template>
    <Head title="- Email Verification"/>
    <Container class="w-1/2">
        <div class="mb-8">
            <p>Thanks for signing up! Before getting started, could
                your verify
                your email address by clicking on the link we just
                emailed to 
                you? If you didn't receive the email, we will gladly
                send you
                another
            </p>
        </div>
        <SessionMessage :status="status"/>
        <form @submit.prevent="submit">
            <PrimaryBtn :disabled="form.processing">Send Verification Email</PrimaryBtn>
        </form>
    </Container>
  
</template>