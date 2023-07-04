<script setup lang="ts">

import { onMounted, ref } from 'vue';


onMounted(async () => {
});
const texto = ref('Informações sobre o site')

</script>

<template>
	<q-card flat class="quixada-bg-grey">
		<q-card-section>
			<div class="text-weight-medium">Visão Geral</div>
		</q-card-section>
		<q-card-section>
        {{ texto }}
      </q-card-section>
    </q-card>

		<div class="col-4">
    <q-card flat bordered class="my-card">
      <q-card-section>
        <div class="">Título da informação</div>
      </q-card-section>

      <q-card-section class="q-pt-none">
        O site está disponível para que seja possível 
        fazer o gerenciamento de resíduos recebidos e coletados pela cidade
      </q-card-section>

      <q-separator inset />

      <q-card-section>
          Acesse as principais funcionalidades no menu lateral
      </q-card-section>
    </q-card>
		</div>
		
</template>
