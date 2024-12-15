<script setup>
import Container from '../../../Components/Container.vue';
import Title from '../../../Components/Title.vue';
import InputField from '../../../Components/InputField.vue';
import PrimaryBtn from '../../../Components/PrimaryBtn.vue';
import ErrorMessage from '../../../Components/ErrorMessage.vue';
import SessionMessage from '../../../Components/SessionMessage.vue';
import { router, useForm } from '@inertiajs/vue3';



const form = useForm({
    current_password:'',
    password:'',
    password_confirmation:''
})

const submit = ()=>{
    form.put(route('profile.password'),{
        onSuccess:() => form.reset(),
        onError:() => form.reset(),
        preserveScroll: true
    })
}

</script>

<template>
    <Container class="mb-6">
        <div class="mb-8">
            <Title>Update Password</Title>
            <p>Ensure your are using a long, random password to stay secure</p>
        </div>
        
        <ErrorMessage :errors="form.errors"/>
        <form class="space-y-6" @submit.prevent="submit">
            <InputField v-model="form.current_password" type="password" label="Current Password" icon="key" placeholder="Enter your current password" class="w-1/2"/>            
            <InputField v-model="form.password" type="password" label="Password" icon="key" placeholder="Enter your new password" class="w-1/2"/>            
            <InputField v-model="form.password_confirmation" type="password" label="Confirm Password" icon="key" placeholder="Enter your new confirm password" class="w-1/2"/> 
            <p class="text-green-500 font-medium" v-if="form.recentlySuccessful">Saved!</p>           
            <PrimaryBtn :disabled="form.processing">save</PrimaryBtn>
        </form>
    </Container>
</template>