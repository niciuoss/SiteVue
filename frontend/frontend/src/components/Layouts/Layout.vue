<script setup lang="ts">
import { useAuthStore } from '@/stores/AuthStore';
import { onMounted } from 'vue';
import LayoutAdministrador from './LayoutAdministrador.vue'

const authStore = useAuthStore();

const layoutByRole = {
  'ADMINISTRADOR' : LayoutAdministrador,
  'OPERADOR_ESTOQUE' : '',
}

onMounted(async () => {
  useAuthStore().getSession();
});

</script>

<template>
  <component :is="(layoutByRole as any)[authStore.session.role!]"></component>
</template>
