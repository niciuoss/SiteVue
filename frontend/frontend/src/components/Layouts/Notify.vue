<script setup>
import { Notify } from 'quasar'
import { onMounted } from 'vue';

const anArray = []

function showNotif () {
  Notify.create('Danger, Will Robinson! Danger!')
}

onMounted(async () => {
  anArray.forEach((item) => { Notify.create(item) })
});


</script>

<template>

</template>

