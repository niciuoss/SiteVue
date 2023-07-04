<script setup lang="ts">
import { inject, onMounted, reactive, ref } from 'vue';
import CategoriaMaterial from '@/models/CategoriaMaterial';
import ServiceFactory from '@/factory/ServiceFactory';

import Material from '@/pages/Parametrizacao/Material.vue'
import Maquina from '@/pages/Parametrizacao/Maquina.vue'
import Produto from '@/pages/Parametrizacao/Produto.vue'
import Destino from '@/pages/Parametrizacao/Destino.vue'

const serviceFactory = inject("serviceFactory") as ServiceFactory;

const tab = ref('material')


const materialDialog = ref(false)


onMounted(async () => {
})
</script>

<template>
	<q-card flat class="quixada-bg-grey">
		<q-card-section class="q-pb-md">
			<div class="text-h5 text-weight-medium">Parametrização</div>
		</q-card-section>

    <q-card-section>
      <q-tabs
        v-model="tab"
        class="text-grey"
        active-color="primary"
        indicator-color="primary"
        align="justify"
      >
        <q-tab name="material" label="Material" />
        <q-tab name="maquina" label="Máquina" />
        <q-tab name="destino" label="Destino" />
      </q-tabs>

      <q-separator />

      <q-tab-panels v-model="tab" animated class="quixada-bg-grey">
        <q-tab-panel name="material">
          <Material></Material>
        </q-tab-panel>
        <q-tab-panel name="maquina">
          <Maquina></Maquina>
        </q-tab-panel>
        <q-tab-panel name="produto">
          <Produto></Produto>
        </q-tab-panel>
        <q-tab-panel name="destino">
          <Destino></Destino>
        </q-tab-panel>
      </q-tab-panels>




    </q-card-section>
  </q-card>

</template>

<style scoped>
</style>
