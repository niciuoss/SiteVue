<script setup lang="ts">
import {onMounted } from 'vue';
import QRious from 'qrious'

const props = defineProps({
  code: {type: String, required: true},
})

onMounted(async () => {
    new QRious({
        level: "H",
        padding: 10,
        size: 170,
        element: document.getElementById(props.code),
        value: `http://localhost:9000/qrcode/${props.code?.toString()}`,
    });
});
</script>

<template>
    <canvas :id="props.code"></canvas>
</template>