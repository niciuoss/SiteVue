<script setup lang="ts">
import { ref } from 'vue';

import Motorista from '@/pages/Transporte/Motorista.vue'
import Veiculo from '@/pages/Transporte/Veiculo.vue'


const tab = ref('motorista')
</script>

<template>
	<q-card flat class="quixada-bg-grey">
		<q-card-section class="q-pb-md">
			<div class="text-h5 text-weight-medium">Transporte</div>
		</q-card-section>

    <q-card-section>
      <q-tabs
        v-model="tab"
        class="text-grey"
        active-color="primary"
        indicator-color="primary"
        align="justify"
      >
        <q-tab name="motorista" label="Motorista" />
        <q-tab name="veiculo" label="Veículo" />
      </q-tabs>

      <q-separator />

      <q-tab-panels v-model="tab" animated class="quixada-bg-grey">
        <q-tab-panel name="motorista">
          <Motorista></Motorista>
        </q-tab-panel>
        <q-tab-panel name="veiculo">
          <Veiculo></Veiculo>
        </q-tab-panel>
      </q-tab-panels>




    </q-card-section>
  </q-card>

</template>

<style scoped>
</style>
