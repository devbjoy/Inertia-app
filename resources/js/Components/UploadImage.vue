<script setup>
import { ref } from 'vue';

const emit = defineEmits(['image'])

const props = defineProps({sendImage:String})

const imageExist = props.sendImage ? `/storage/${props.sendImage}` : null;

const preview = ref(imageExist);
const overSize = ref(false);
const revertBtn = ref(false);

const selectImage = (e)=>{
    preview.value = URL.createObjectURL(e.target.files[0])
    overSize.value = e.target.files[0].size > 3145728
    revertBtn.value = true;
    emit('image',e.target.files[0])
}

const revertImageChange = ()=>{
    revertBtn.value = false;
    overSize.value = false;
    preview.value = imageExist;
    emit('image',null)
}

</script>

<template>
    <div>
        <span class="block text-sm font-medium mb-1 text-slate-700 dark:text-slate-300" :class="{'!text-red-500':overSize}">
            {{ overSize ? 'This image size is gratter than 3Mb' : 'Image (Max size 3Mb)' }}
        </span>
        <label for="image" 
        class="block rounded-md bg-slate-300 
        h-[140px] overflow-hidden 
        cursor-pointer border-slate-300 border relative"
        :class="{'!border-red-500': overSize}">
            <img :src="preview ?? '/storage/images/listing/default.png'"
            class="h-full w-full object-cover">
            <button @click.prevent="revertImageChange" v-if="revertBtn" type="button" class="absolute top-2 right-2 bg-white/70 w-8 h-8 rounded-full grid place-items-center text-slate-700">
                <i class="fa-solid fa-rotate-left"></i>
            </button>
        </label>
        <input @input="selectImage" type="file" id="image" hidden>
    </div>
</template>