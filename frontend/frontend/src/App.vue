<script setup lang="ts">
import VueAnnouncer from '@vue-a11y/announcer';
import NotifyTelite from './components/Layouts/Notify.vue';
</script>

<template>
  <NotifyTelite></NotifyTelite>
  <router-view/>
  <VueAnnouncer></VueAnnouncer>
</template>

<style scoped>
</style>
