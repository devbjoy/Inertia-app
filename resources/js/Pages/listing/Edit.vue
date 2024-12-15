<script setup>
import { Head, useForm } from '@inertiajs/vue3';
import Container  from '../../Components/Container.vue';
import InputField from '../../Components/InputField.vue';
import Title from '../../Components/Title.vue';
import PrimaryBtn from '../../Components/PrimaryBtn.vue'
import Textarea from '../../Components/Textarea.vue';
import UploadImage from '../../Components/UploadImage.vue';
import ErrorMessage from '../../Components/ErrorMessage.vue';

const props = defineProps({
    listing:Object
})

const form = useForm({
    title:props.listing[0].title,
    tags:props.listing[0].tags,
    email:props.listing[0].email,
    link:props.listing[0].link,
    desc:props.listing[0].desc,
    image:null,
    _method: 'PUT'
})

const storeImage = (e)=>{
    form.image = e;
}

const submit = ()=>{
    form.post(route('listing.update',props.listing[0].id))
}

</script>


<template>
    <Head title="- Edit listing"/>
    <Container>
        <div class="mb-6">
            <Title>Edit a Listing</Title>
        </div>
        <ErrorMessage :errors="form.errors"/>
        <form @submit.prevent="submit" class="grid grid-cols-2 gap-6">
            <div class="space-y-6">
                <InputField v-model="form.title" label="Title" icon="heading" placeholder="My new listing"/>
                <InputField v-model="form.tags" label="Tags (separate with comma)" icon="tags" placeholder="one, two, three"/>
                <Textarea v-model="form.desc" label="Description" icon="newspaper" placeholder="This is my listing description"/>
            </div>
            <div class="space-y-6">
                <InputField v-model="form.email" label="Email" icon="at" placeholder="example@gmail.com"/>
                <InputField v-model="form.link" label="External Link" icon="up-right-from-square" placeholder="https://example.com"/>
                <UploadImage  @image="storeImage" :sendImage="listing[0].image"/>
            </div>
            <div>
                <PrimaryBtn :disabled="form.processing">Update</PrimaryBtn>
            </div>
        </form>
    </Container>
</template>