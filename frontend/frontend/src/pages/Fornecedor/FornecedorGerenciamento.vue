<script setup lang="ts">

import { inject, onMounted, reactive, ref } from 'vue';
import Fornecedor from '@/models/Fornecedor';
import Pagination from '@/models/Pagination';
import ServiceFactory from '@/factory/ServiceFactory';
import FilterParser from '@/libs/FilterParser';

const serviceFactory = inject("serviceFactory") as ServiceFactory;


const state = reactive<{ fornecedores: Fornecedor[], pagination: Pagination
 }>({ fornecedores: [], pagination : new Pagination() });

const parser = new FilterParser();

const filterTiposFornecedor = ref(['FORNECEDOR'])

const headerclassPorTipoFornecedor = {
	'FORNECEDOR': 'bg-white bbg-fornecedor text-primary text-weight-bold',
	'PEV': 'bg-white bbg-fornecedor-pev text-primary text-weight-bold',
	'DOACAO': 'bg-white bbg-fornecedor-doacao text-primary text-weight-bold'
} as any

const descricaoPorTipoFornecedor = {
	'FORNECEDOR': 'Fornecedor',
	'PEV': 'PEV',
	'DOACAO': 'Doação'
} as any

async function loadPageFilter() {
   const filter = parser.queryFilterString('filters[tipo][$in]', filterTiposFornecedor.value)
   const { fornecedores, pagination } = await serviceFactory.createFornecedorService().find(state.pagination, filter);
   state.fornecedores = fornecedores
   state.pagination = pagination
}

onMounted(async () => {
  await loadPageFilter()
});
</script>

<template>
	<q-card flat class="telite-bg-grey">
		<q-card-section>
			<div class="text-h5 text-weight-medium">Fornecedores</div>
      <div class="q-mt-xs q-gutter-sm">
        <q-checkbox size="md" @click="loadPageFilter" v-model="filterTiposFornecedor" val="FORNECEDOR" label="Fornecedor" />
        <q-checkbox size="md" @click="loadPageFilter" v-model="filterTiposFornecedor" val="PEV" label="PEV" />
        <q-checkbox size="md" @click="loadPageFilter" v-model="filterTiposFornecedor" val="DOACAO" label="Doação" />
      </div>
		</q-card-section>

		<q-card-section>

      <div class="q-pb-lg" v-for="fornecedor in state.fornecedores" :key="fornecedor.id">
        <q-expansion-item
          expand-icon-toggle
          class="shadow-2 overflow-hidden"
          :header-class="headerclassPorTipoFornecedor[fornecedor.tipo!]"
          style="border-radius: 12px"
          expand-icon-class="text-primary"
        >
          <template v-slot:header>
            <q-item-section>
              <span>
                {{ fornecedor.nome }}
                <q-chip outline color="primary" text-color="white">
                  {{descricaoPorTipoFornecedor[fornecedor.tipo!]}}
                </q-chip>

              </span>


            </q-item-section>
            <q-item-section>
              {{ fornecedor.getEndereco() }}
            </q-item-section>
            <q-item-section class="text-right">
              <div>
                <q-btn round flat icon="o_room"></q-btn>
                <q-btn :to="{ name: 'Fornecedor.anexos', params: {fornecedorId: fornecedor.id} }" round flat icon="o_file_present"></q-btn>
                <q-btn :to="{ name: 'Fornecedor.editar', params: {fornecedorId: fornecedor.id} }" round flat icon="o_edit"></q-btn>
              </div>
            </q-item-section>
          </template>
          <q-separator></q-separator>

          <q-card>
            <q-card-section>
              <div class="row text-grey-7 text-weight-bold">
                <div class="col-2">
                  <div>CPF/CNPJ:</div>
                  {{ fornecedor.cnpjcpf }}
                </div>
                <div class="col-2">
                  <div>Horário da Coleta:</div>
                  {{ fornecedor.horarioColeta }}
                </div>
                <div class="col-2">
                  <div>Destinatário:</div>
                  {{ fornecedor.isDestinatario ? 'Sim' : 'Não' }}
                </div>
              </div>
            </q-card-section>
          </q-card>
        </q-expansion-item>
      </div>

      <div class="row q-py-lg justify-end">
        <q-pagination @click="loadPageFilter" v-model="state.pagination.page" :max="state.pagination.pageCount" direction-links/>
      </div>
    </q-card-section>
  </q-card>
</template>

