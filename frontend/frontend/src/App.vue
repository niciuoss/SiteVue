<script setup lang="ts">
import VueAnnouncer from '@vue-a11y/announcer';
import Notify from './components/Layouts/Notify.vue';
</script>

<template>
  <Notify></Notify>
  <router-view/>
  <VueAnnouncer></VueAnnouncer>
</template>

<style scoped>
</style>
