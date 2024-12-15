<script setup>
defineProps({
    status:String
})
</script>


<template>
    <div v-if="status" class="mb-4 font-medium text-sm bg-green-500 px-2 py-3 rounded text-center text-white">
        Password Change Successfully
    </div>
</template>