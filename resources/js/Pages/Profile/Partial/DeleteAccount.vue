<script setup>
import Container from '../../../Components/Container.vue';
import Title from '../../../Components/Title.vue';
import InputField from '../../../Components/InputField.vue';
import PrimaryBtn from '../../../Components/PrimaryBtn.vue';
import ErrorMessage from '../../../Components/ErrorMessage.vue';
import SessionMessage from '../../../Components/SessionMessage.vue';
import { useForm } from '@inertiajs/vue3';
import { ref } from 'vue';

const show = ref(false);

const form = useForm({
    password:''
})

const submit = ()=>{
    form.delete(route('profile.delete'),{
        onFinish:() => form.reset(),
        preserveScroll: true
    })
}

</script>

<template>
    <Container class="mb-6">
        <div class="mb-8">
            <Title>Delete Account</Title>
            <p>Once you account is deleted, all of its resources data will be permanently deleted. This action cannot be undone.</p>
        </div>
        <div v-if="show">
            <ErrorMessage :errors="form.errors"/>
            <form class="space-y-6 flex gap-2" @submit.prevent="submit">
                <InputField v-model="form.password" type="password" label="Confirm Password" icon="key" placeholder="Enter your password" class="w-1/2"/>                      
                <PrimaryBtn :disabled="form.processing">Confirm</PrimaryBtn>
                <button class="text-indigo-500 underline font-medium" @click="show = false">Cancel</button>
            </form>
        </div>
        <button class="py-2 px-6 rounded-lg bg-red-500 text-white" @click="show = true" v-if="!show">
            <i class="fa-solid fa-triangle-exclamation mr-2"></i>
            Delete Account</button>
    </Container>
</template>