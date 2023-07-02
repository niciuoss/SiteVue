<script setup>
import { inject } from 'vue';
import NotificacaoBar from './NotificacaoBar.vue';
const serviceFactory = inject("serviceFactory");
const notificacaoService = serviceFactory.getNotificacaoService()
</script>

<template> 
  <div v-for="notificacao in notificacaoService.notificacoes" :key="notificacao">
    <NotificacaoBar :notificacao="notificacao"></NotificacaoBar>
  </div>
</template>

