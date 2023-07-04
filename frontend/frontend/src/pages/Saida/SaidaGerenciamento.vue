<script setup lang="ts">import { inject, onMounted, reactive, ref, watch } from 'vue';
import { FilterSaida } from '@/models/FilterSaida'
import { Saida } from '@/models/Saida';
import Pagination from '@/models/Pagination';
import ServiceFactory from '@/factory/ServiceFactory';
import CategoriaMaterial from '@/models/CategoriaMaterial';
import FilterParser from '@/libs/FilterParser';
import Produto from '@/models/Produto';
import Maquina from '@/models/Maquina';
import QrCode from "./QrCode.vue";

const serviceFactory = inject("serviceFactory") as ServiceFactory;

const state = reactive<{
  saidas: Saida[]
  pagination: Pagination
  filterSaida: FilterSaida,
  categorias: CategoriaMaterial[],
  maquinas: Maquina[],
  produtos: Produto[],
  tipo_saida: string[],
  tiposFornecedores: string[]
 }>({
  saidas: [],
  pagination: new Pagination(),
  filterSaida: new FilterSaida(),
  categorias: [],
  maquinas: [],
  produtos:[],
  tipo_saida: ['SAIDA_PADRAO', 'SAIDA_TRANSFORMACAO'],
  tiposFornecedores: ['FORNECEDOR', 'PEV', 'DOACAO'],
});

const columnsSaidaPadrao = [
{ name: 'categoriaMaterial', align: 'left', label: 'Categoria', field: 'categoriaMaterial', sortable: true },
{ name: 'tipoMaterial', align: 'left', label: 'Tipo', field: 'tipoMaterial', sortable: true },
{ name: 'quantidade', align: 'center', label: 'Quantidade (kg)', field: 'quantidade', sortable: true },

]

const columnsSaidaTransformacao = [
{ name: 'categoriaMaterial', align: 'left', label: 'Categoria', field: 'categoriaMaterial', sortable: true },
{ name: 'tipoMaterial', align: 'left', label: 'Tipo', field: 'tipoMaterial', sortable: true },
{ name: 'quantidade', align: 'center', label: 'Quantidade (kg)', field: 'quantidade', sortable: true },
{ name: 'fornecedor', align: 'center', label: 'Fornecedor', field: 'fornecedor', sortable: true },
{ name: 'icon', align: 'center', label: '', field: 'icon', icon:'o_sync_alt', sortable: true },
{ name: 'produto', align: 'center', label: 'Produção', field: 'produto', sortable: true },
{ name: 'quantidadeP', align: 'center', label: 'Quantidade', field: 'quantidadeP', sortable: true },
]

async function loadSaidasFilter() {
   const filter = state.filterSaida.fn() + '&' + parser.queryFilterString('filters[tipo_saida][$in]', filterTipoSaida.value)
   const { saidas, pagination } = await serviceFactory.createSaidaService().find(state.pagination, filter);
   state.saidas = saidas
   state.pagination = pagination
}

onMounted(async () => {
  const categorias = await serviceFactory.createMaterialService().find();
  state.categorias = categorias

  const produtos = await serviceFactory.createProdutoService().find();
  state.produtos = produtos
  await loadSaidasFilter()
});

const verImagem = (index: any) => {
  carousel.value = true
  idImage.value = index
}

let carousel = ref(false)
let slide = ref(1)
let idImage = ref(0)

const parser = new FilterParser();

const filterTipoSaida = ref(['SAIDA_PADRAO'])

const headerclassPorTipoSaida = {
  'SAIDA_TRANSFORMACRAO': 'bg-white text-primary text-weight-bold',
	'SAIDA_PADRAO': 'bg-white text-primary text-weight-bold',
} as any

const descricaoPorTipoSaida = {
	'SAIDA_TRANSFORMACAO': 'Transformação',
} as any

watch(() => state.pagination.pageSize,() => {
  state.pagination.page = 1
  loadSaidasFilter()
  }
);

watch(() => state.saidas,() => {
  }
);

function clearFilters() {
  state.filterSaida.dataInicial = '';
  state.filterSaida.dataFinal = '';
  state.filterSaida.categoriaMaterial = '';
  state.filterSaida.tipoMaterial = '';
  state.filterSaida.tipoFornecedor = '';
  state.filterSaida.nomeFornecedor = '';
  loadSaidasFilter()
}
</script>

<template>
	<q-card flat class="quixada-bg-grey">
		<q-card-section>
			<div class="text-h5 text-weight-medium">Saidas</div>
      <div class="q-mt-xs q-gutter-sm">
        <q-checkbox size="md" @click="loadSaidasFilter()" v-model="filterTipoSaida" val="SAIDA_PADRAO" label="Saída Padrão"/>
        <q-checkbox size="md" @click="loadSaidasFilter()" v-model="filterTipoSaida" val="SAIDA_TRANSFORMACAO" label="Saída Transformação" />
      </div>
      <div class="row items-center q-mt-sm q-gutter-x-md">
        <div style="min-width: 200px" :class="{'bg-primary': state.filterSaida.filtroAtivo && state.filterSaida.dataInicial,'filtro-dataInicial':true}">
          <q-input label="Inicio" outlined v-model="state.filterSaida.dataInicial">
            <template v-slot:append>
              <q-icon name="o_event" class="cursor-pointer">
                <q-popup-proxy cover transition-show="scale" transition-hide="scale">
                  <q-date v-model="state.filterSaida.dataInicial" mask="DD/MM/YYYY">
                    <div class="row items-center justify-end">
                      <q-btn v-close-popup label="Close" color="primary" flat />
                    </div>
                  </q-date>
                </q-popup-proxy>
              </q-icon>
            </template>
          </q-input>
        </div>

        <div style="min-width: 200px" :class="{'bg-primary': state.filterSaida.filtroAtivo && state.filterSaida.dataFinal,'filtro-dataFinal':true}">
          <q-input label="Termino" outlined v-model="state.filterSaida.dataFinal">
            <template v-slot:append>
              <q-icon name="o_event" class="cursor-pointer">
                <q-popup-proxy cover transition-show="scale" transition-hide="scale">
                  <q-date v-model="state.filterSaida.dataFinal" mask="DD/MM/YYYY">
                    <div class="row items-center justify-end">
                      <q-btn v-close-popup label="Close" color="primary" flat />
                    </div>
                  </q-date>
                </q-popup-proxy>
              </q-icon>
            </template>
          </q-input>
        </div>

        <div style="min-width: 200px; margin: 10px 10px 10px 10px;">
          <q-select :class="{'bg-primary text-white': state.filterSaida.filtroAtivo && state.filterSaida.categoriaMaterial,'filtro-tipoMaterial':true}" label="Categoria" outlined @update:model-value="state.filterSaida.tipoMaterial = ''" v-model="state.filterSaida.categoriaMaterial" :options="state.categorias" option-label="nome" option-value="nome" emit-value/>
        </div>

        <div style="min-width: 200px; margin: 10px 10px 10px 10px;" :class="{'bg-primary': state.filterSaida.filtroAtivo && state.filterSaida.tipoFornecedor,'filtro-tipoFornecedor':true}">
          <q-select label="Tipo Fornecedor" outlined v-model="state.filterSaida.tipoFornecedor" :options="state.tiposFornecedores"/>
        </div>

        <div style="min-width: 200px; margin: 10px 10px 10px 10px;" :class="{'bg-primary': state.filterSaida.filtroAtivo && state.filterSaida.nomeFornecedor,'filtro-nomeFornecedor':true}">
          <q-input label="Fornecedor" outlined v-model="state.filterSaida.nomeFornecedor"/>
        </div>

        <div class="col-shrink">
          <q-btn @click="loadSaidasFilter()" class="q-mt-auto bg-primary text-white vertical-middle	" round flat icon="o_search"></q-btn>
        </div>

        <div class="col-shrink">
          <q-btn @click="clearFilters()" class="q-mt-auto text-primary vertical-middle	" round outline icon="o_filter_alt_off"></q-btn>
        </div>

      </div>
    
		</q-card-section>

    <q-card-section class="q-pt-xs">
      <div style="max-width: 200px;" class="text-right">
        <q-select label="itens por página" outlined v-model="state.pagination.pageSize" :options="[1, 2, 3, 40]" dense/>
      </div>
    </q-card-section>

    <q-card-section class="q-pt-xs">
      <div v-if="state.saidas.length === 0"
      style="display: flex; justify-content: center; align-items: center; overflow: hidden; height: 20vh;"
      class="q-pb-lg bg-white shadow-2 overflow-hidden bg-white"
      >
      <q-icon outline name="o_warning" size="20px"></q-icon>
      
      <span>Sem dados disponíveis</span>
      </div>
    </q-card-section>
    

    <q-card-section class="q-pt-xs">
      <div class="q-pb-lg" v-for="saida,index in state.saidas" :key="saida.id">
        <q-expansion-item
          default-opened
          expand-icon-toggle
          class="shadow-2 overflow-hidden bg-white"
          style="border-radius: 12px"
          expand-icon-class="text-primary"
          :header-class="headerclassPorTipoSaida[saida.tipo_saida!]"
        >
          <template v-slot:header>
            <q-item-section>
              <div>
                #{{ saida.id }}
                <q-chip v-if="saida.tipo_saida === 'SAIDA_TRANSFORMACAO'" size="12px" outline icon="o_sync_alt" color="primary" text-color="white">
                  {{descricaoPorTipoSaida[saida.tipo_saida!]}}
                </q-chip>
              </div>            
            </q-item-section> 
          <q-separator></q-separator>
            <q-item-section class="text-center">
              <template v-if="saida.tipo_saida === 'SAIDA_PADRAO'">
                {{ saida.fornecedor?.nome }}
              </template>
              <template v-else-if="saida.tipo_saida === 'SAIDA_TRANSFORMACAO'">
                {{ saida.maquina?.nome }}
              </template>
            </q-item-section>
            <q-item-section class="text-right">
              <div>
                <span> {{ saida.criadoEm() }} </span>
                <span class="q-mx-xs"></span>
              </div>
            </q-item-section>
          </template>

          <q-separator></q-separator>

          <q-card>
            <q-card-section>

              <div style="display: flex; margin: auto ;">

              <q-table v-if="saida.tipo_saida === 'SAIDA_PADRAO'" style="flex: 1;" flat :rows="saida.material_items" :columns="columnsSaidaPadrao" hide-pagination
              table-header-class="quixada-bg-grey text-primary text-bold">
                <template v-slot:header="props">
                  <q-tr :props="props" class="quixada-bg-grey">
                    <q-th
                      class="text-primary"
                      style="font-weight: bold;"
                      v-for="col in props.cols"
                      :key="col.name"
                      :props="props"
                      >
                      {{ col.label }}
                    </q-th>
                  </q-tr>
                </template>
                <template v-slot:body="props">
                  <q-tr :props="props">
                    <q-td key="categoriaMaterial" :props="props">
                      {{ props.row.categoria_material.nome }}
                    </q-td>
                    <q-td key="tipoMaterial" :props="props">
                      {{ props.row.tipo_material.nome }}
                    </q-td>
                    <q-td key="quantidade" :props="props">
                      {{ props.row.quantidade }} kg
                    </q-td>
                  </q-tr>
                </template>
              </q-table>

              <q-table style="flex: 6;" v-if="saida.tipo_saida === 'SAIDA_TRANSFORMACAO'" dense flat :rows="saida.material_items" :columns="columnsSaidaTransformacao" hide-pagination
              table-header-class="quixada-bg-grey text-primary text-bold">
                <template v-slot:header="props">
                  <q-tr :props="props" class="quixada-bg-grey">
                    <q-th
                      class="text-primary"
                      style="font-weight: bold;"
                      v-for="col in props.cols"
                      :key="col.name"
                      :props="props"
                      >
                      
                      <template v-if="col.name === 'icon'">
                        <q-icon name="o_sync_alt"></q-icon>
                      </template>
                      <template v-else>
                        {{ col.label }}
                      </template>
                    </q-th>
                  </q-tr>
                </template>
                <template v-slot:body="props">
                  <q-tr :props="props">
                    <q-td key="categoriaMaterial" :props="props">
                      {{ props.row.categoria_material.nome }}
                    </q-td>
                    <q-td key="tipoMaterial" :props="props">
                      {{ props.row.tipo_material.nome }}
                    </q-td>
                    <q-td key="quantidade" :props="props">
                      {{ props.row.quantidade }} kg
                    </q-td>
                    <q-td key="fornecedor" :props="props">
                      {{ props.row.entrada.fornecedor.nome }}
                    </q-td>
                    <q-td>
                      <!-- VAZIO || COLUNA DO ÍCONE DE PRODUÇÃO -->
                    </q-td>
                    <q-td class="text-center" v-if="saida.tipo_saida === 'SAIDA_TRANSFORMACAO' && props.rowIndex == 0" key="produto">
                      {{ saida.produto?.nome }}
                    </q-td>
                    <q-td class="text-center" v-if="saida.tipo_saida === 'SAIDA_TRANSFORMACAO' && props.rowIndex == 0" key="quantidade_produto">
                      {{ saida.quantidade_produto }}
                    </q-td>
                  </q-tr>
                </template>
              </q-table>
              <div style="flex: 1;display: flex; flex-direction: column; align-items: center; padding: 0 20px 0 20px;" v-if="saida.tipo_saida === 'SAIDA_TRANSFORMACAO'">
                <span style="font-size: 10px; text-align: center;">Mova sua câmera sobre a tela para ter acesso ao Qrcode</span>
                <QrCode :code="saida.code"></QrCode>
              </div>
            </div>

              <q-separator></q-separator>

              <div class="q-mt-lg q-mb-sm row">
                <div class="col-8">
                  <label class="text-primary">Observação:</label>
                  <div> {{saida.observacao}} </div>
                </div>
                <div class="col-4 q-gutter-sm text-right">
                  <q-btn @click="verImagem(index)" outline icon="o_image" size="md" class="bg-white text-primary" v-if="saida.media?.length > 0">
                    <span class="q-ml-xs">Ver</span>
                  </q-btn>
                  <q-btn v-if="false" :href="`https://www.google.com.br/maps/search/${saida.fornecedor?.getEndereco()}`" target="_blank" outline icon="o_room" size="md" class="bg-white text-primary">
                    <span class="q-ml-xs">Maps</span>
                  </q-btn>
                  <q-btn v-if="false" :href="`https://www.google.com.br/maps/dir/${saida.fornecedor?.getEndereco()}/${saida.destino?.getEndereco()}`" target="_blank" outline icon="o_directions" size="md" class="bg-white text-primary">
                    <span class="q-ml-xs">Rota</span>
                  </q-btn>
                  <q-btn-dropdown outline color="primary" label="Baixar relatório" class="bg-white text-primary">
                    <q-list>
                      <q-item clickable v-close-popup v-for="i in 3">
                        <q-item-section>
                          <q-item-label>Relatório.pdf</q-item-label>
                        </q-item-section>
                      </q-item>
                    </q-list>
                  </q-btn-dropdown>
                </div>
              </div>

            </q-card-section>
          </q-card>

        </q-expansion-item>
      </div>

      <div class="row q-py-lg justify-end">
        <q-pagination v-if="state.saidas.length" class="align-rigth" @click="loadSaidasFilter()" v-model="state.pagination.page" :max="state.pagination.pageCount" direction-links/>
      </div>
        <div style="max-width: 200px;" class="text-right">
          <q-select label="itens por página" outlined v-model="state.pagination.pageSize" :options="[1, 2, 3, 40]" dense/>
        </div>
		</q-card-section>
  </q-card>
</template>