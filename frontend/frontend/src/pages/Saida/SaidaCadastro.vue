<script setup lang="ts">
import ServiceFactory from '@/factory/ServiceFactory';
import CategoriaMaterial from '@/models/CategoriaMaterial';
import Fornecedor from '@/models/Fornecedor';
import Motorista from '@/models/Motorista';
import Pagination from '@/models/Pagination';
import Saida from '@/models/Saida';
import TipoMaterial from '@/models/TipoMaterial';
import Veiculo from '@/models/Veiculo';
import { inject, onMounted, reactive, ref, watch } from 'vue'
import { useRouter } from 'vue-router';
import MaterialItem from '@/models/MaterialItem';
import Maquina from '@/models/Maquina';
import Produto from '@/models/Produto';

const state = reactive<{
  saida: Saida, 
  destinatarios: Fornecedor[]
  veiculos: Veiculo[], 
  fornecedores: Fornecedor[],
  motoristas: Motorista[], 
  categorias: CategoriaMaterial[], 
  categoriaForm: CategoriaMaterial, 
  tipoForm: TipoMaterial, 
  tipos: TipoMaterial[],
  pagination: Pagination, 
  materialItems: MaterialItem[],
  maquinas: Maquina[],
  produtos: Produto[],
}
  
>({ 
  saida: new Saida(),
  destinatarios: [],
  veiculos: [], 
  fornecedores: [],
  motoristas: [],
  categorias: [], 
  categoriaForm: new CategoriaMaterial(), 
  tipos: [], 
  tipoForm: new TipoMaterial(),
  pagination : new Pagination(), 
  materialItems: [],
  maquinas: [],
  produtos: [],
})

const serviceFactory = inject("serviceFactory") as ServiceFactory;
const step = ref(1)
const router = useRouter();
const totalQuantidade = ref(0.0)
const checkMaterialItems = ref([])
const stepper = ref(null);

const columns = [
  { name: 'data', align: 'left', label: 'Data', field: row => formataData(row.createdAt), sortable: true },
  { name: 'nome', align: 'left', label: 'Fornecedor', field: row => row.entrada.fornecedor.nome, sortable: true },
  { name: 'quantidade', align: 'left', label: 'Quantidade', field: row => row.quantidade, sortable: true },
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

const tiposSaidasLabel = {
  'SAIDA_PADRAO': 'Saída padrão',
  'SAIDA_TRANSFORMACAO': 'Saída para transformação'
}

watch(() => state.tipoForm,(currentValue, oldValue) => {
        buscaMaterialItems()
      }
    );

watch(() => checkMaterialItems.value,(currentValue, oldValue) => {
  atualizaQuantidade()
  }
);

watch(() => state.categoriaForm,(currentValue, oldValue) => {
  limparTipoForm()
  }
);

watch(() => step.value,(currentValue, oldValue) => {
  if(state.saida.tipo_saida == "SAIDA_TRANSFORMACAO"){
    if(currentValue == 2 && oldValue == 1){
      step.value++
    }
    if(currentValue == 2 && oldValue == 3){
      step.value--
    }
  }
  }
);

onMounted(async () => {
  state.destinatarios = await (await serviceFactory.createFornecedorService().find(state.pagination, "filters[isDestinatario]=true")).fornecedores;
  state.veiculos = await serviceFactory.createVeiculoService().find();
  state.fornecedores = await serviceFactory.createFornecedorService().findAll();
  state.motoristas = await serviceFactory.createMotoristaService().find();
  state.fornecedores = await serviceFactory.createFornecedorService().findAll();
  state.categorias = await serviceFactory.createMaterialService().find();
  state.tipos = await serviceFactory.createMaterialService().find();
  buscaMaterialItems()
  state.maquinas = await serviceFactory.createMaquinaService().find()
  state.produtos = await serviceFactory.createProdutoService().find()
})

async function finalizar() {
  create().then(data => {
    router.push({ name: 'Saida.gerenciamento'})
  })
}

async function finalizarECadastrarAnexo() {
  create().then(data => {
    console.log(data)
    router.push({ name: 'Saida.anexos', params: {saidaId: data.id}})
  })
}

async function finalizarECadastrarNovaSaida() {
  create().then(data => {
    location.reload()
  })
}

async function create(){
  state.saida.material_items = []
  for(let item of checkMaterialItems.value){
    state.saida.material_items.push(item.id)
  }
  // for(let entrada of checkMaterialItems.value){
  //   for(let itemSaida of entrada.material_items){
  //     state.saida.material_items.push(itemSaida.id)
  //   }
  // }
  state.saida.generateCode()

  const saidaCadastrada = await serviceFactory.createSaidaService().create(state.saida);
  return saidaCadastrada
}

async function buscaMaterialItems(){
  state.materialItems = (await serviceFactory.createMaterialItemService().findDisponiveis(`filters[categoria_material][nome][$eq]=${state.categoriaForm.nome}&filters[tipo_material][nome][$eq]=${state.tipoForm.nome}&filters[isDisponivelEstoque][$eq]=true`));
  console.log(state.materialItems)
}

function formataData(data){
  return new Date(data).toLocaleDateString('pt-BR')
}

function atualizaQuantidade(){
  totalQuantidade.value = 0.0
  for(const item of checkMaterialItems.value){
    totalQuantidade.value = totalQuantidade.value + parseFloat(item.quantidade)
  } 
}

function proximaEtapa() {
  if(
    (
      step.value === 1 && 
      ((state.saida.fornecedor && state.saida.tipo_saida == 'SAIDA_PADRAO') || 
      (state.saida.maquina && state.saida.tipo_saida == 'SAIDA_TRANSFORMACAO'))
    ) ||
    (
      step.value === 2 &&
      state.saida.veiculo &&
      state.saida.motorista
    ) ||
    (
      step.value === 3 &&
      checkMaterialItems.value.length > 0
    ) ||
    (
      step.value === 4 &&
      (state.saida.tipo_saida == 'SAIDA_PADRAO') ||
      (state.saida.produto && state.saida.quantidade_produto && state.saida.tipo_saida == 'SAIDA_TRANSFORMACAO')
    ) ||
    (
      step.value === 5
    )
  )stepper.value.next();
}

function getSelectedString () {
  return checkMaterialItems.value.length === 0 ? '' : `${checkMaterialItems.value.length} ${checkMaterialItems.value.length > 1 ? 'itens selecionados' : 'item selecionado'} de ${state.materialItems.length}`
}

function limparTipoForm () {
  state.tipoForm = null
}

</script>

<template>
  <q-card flat class="quixada-bg-grey">
    <q-card-section>
			<div class="text-h5 text-weight-medium">Cadastrar Nova Saída</div>
		</q-card-section>

    <q-card-section>
      <div class="q-pa-md">
        <q-stepper v-model="step" ref="stepper" animated active-color="primary">
          <q-step :name="1" prefix="1" title="" >
            <q-card-section>
              <div class="q-pa-md"></div>
              <div class="text-h6 text-weight-medium text-aling-center row justify-center items-center" >Selecionar Destino</div>
              <div class="q-pa-md"></div> 
              <div class="q-gutter-sm row justify-center items-center">
                <q-radio v-model="state.saida.tipo_saida" val="SAIDA_PADRAO" label="Saída padrão"/>
                <q-radio v-model="state.saida.tipo_saida" val="SAIDA_TRANSFORMACAO" label="Saída para transformação"/>
              </div>
              <div class="q-pa-md"></div>
              <q-form class="row q-col-gutter-x-lg q-col-gutter-y-lg">
              <div class="col-2"></div> 
              <div class="col-8 justify-center items-center" v-if="state.saida.tipo_saida == 'SAIDA_PADRAO'">
                <q-select label="Destinatário" v-model="state.saida.fornecedor" :options="state.destinatarios" option-label="nome" 
                option-value="id" emit-value map-options outlined lazy-rules/>
              </div>
              <div class="col-8 justify-center items-center" v-if="state.saida.tipo_saida == 'SAIDA_TRANSFORMACAO'">
                <q-select label="Reciclagem" v-model="state.saida.maquina" :options="state.maquinas" option-label="nome" 
                option-value="id" map-options outlined lazy-rules/>
              </div>
              </q-form>
            </q-card-section>
          </q-step>
      
          <q-step :name="2" prefix="2" title="" v-if="state.saida.tipo_saida != 'SAIDA_TRANSFORMACAO'">
            <div v-if="state.saida.tipo_saida == 'SAIDA_PADRAO'">
              <q-card-section>
                <div class="q-pa-md"></div>
                <div class="text-h6 text-weight-medium row justify-center items-center">Selecionar Transporte</div>
                <div class="q-pa-md"></div>
                <div class="q-gutter-sm">
                  <q-radio v-model="state.saida.tipo_saida" val="SAIDA_PADRAO" label="Saída padrão" disable/>
                </div>
                <div class="q-pa-md"></div>
                <div class="col-4">
                  <q-select label="Destinatário" v-model="state.saida.fornecedor" :options="state.destinatarios" option-label="nome" 
                  option-value="id" map-options emit-value outlined disable/>
                </div>
                <div class="q-pa-md"></div>
                <q-form class="row q-col-gutter-x-lg q-col-gutter-y-lg">
                <div class="col-6">
                  <q-select label="Veículo" outlined v-model="state.saida.veiculo" :options="state.veiculos" 
                  option-label="nome" map-options option-value="id" emit-value/>
                </div>
                <div class="col-6">
                  <q-select label="Motorista" outlined v-model="state.saida.motorista" :options="state.motoristas" 
                  option-label="nome" map-options option-value="id" emit-value/>
                </div>
              </q-form>
            </q-card-section>
            </div>
            <div v-else>
              TRANSFORMAÇÃO
            </div>
          </q-step>
      
          <q-step :name="3" :prefix="state.saida.tipo_saida == 'SAIDA_TRANSFORMACAO' ? 2 : 3" title="">
            <q-card-section>
              <div class="q-pa-md"></div>
                <div class="text-h6 text-weight-medium row justify-center items-center">Selecionar Material</div>
                <div class="q-pa-md"></div>
                <div class="q-gutter-sm">
                  <q-radio v-model="state.saida.tipo_saida" :val="state.saida.tipo_saida" :label="tiposSaidasLabel[state.saida.tipo_saida]" disable/>
                </div>
                <div class="q-pa-md"></div>
                <div class="col-4">
                  <q-select v-if="state.saida.tipo_saida == 'SAIDA_TRANSFORMACAO'" label="Máquina" v-model="state.saida.maquina" :options="state.maquinas" option-label="nome" 
                  option-value="id" map-options outlined disable/>
                  <q-select v-if="state.saida.tipo_saida == 'SAIDA_PADRAO'" label="Destinatário" v-model="state.saida.fornecedor" :options="state.destinatarios" option-label="nome" 
                  option-value="id" map-options outlined disable/>
                </div>
                <div class="q-pa-md"></div>
              <!-- <q-form class="row q-col-gutter-x-lg q-col-gutter-y-lg"> -->
              <q-card-section class="row q-col-gutter-x-lg q-col-gutter-y-lg">
              <div class="col-6">
                <q-select label="Categoria do Material" outlined v-model="state.categoriaForm" :options="state.categorias" 
                option-label="nome" emit-value/>
              </div>
              <div class="col-6">
                <q-select label="Tipo do Material" outlined v-model="state.tipoForm" :options="state.categoriaForm.tipos" 
                option-label="nome" emit-value/>
              </div>
            </q-card-section>
              <!-- </q-form> -->
              <div class="q-pa-md"></div>
              <div class="q-pb-md">
                <q-table
                  :rows="state.materialItems"
                  :columns="columns"
                  row-key="id"
                  :selected-rows-label="getSelectedString"
                  selection="multiple"
                  v-model:selected="checkMaterialItems"
                />
                <div class="q-pb-md"></div>
                <q-card class="row justify-center items-center">
                  <div style="color:#05445E; font-weight: bold">
                    Total: 
                    {{ totalQuantidade }}
                    kg
                  </div>
                </q-card>
              </div>
            </q-card-section> 
          </q-step>

          <q-step :name="4" :prefix="state.saida.tipo_saida == 'SAIDA_TRANSFORMACAO' ? 3 : 4" title="">
            <q-card-section>
              <div class="q-pa-md"></div>
              <div class="text-h6 text-weight-medium text-aling-center row justify-center items-center">Informações Adicionais</div>
              <div class="q-pa-md"></div>
              <div class="q-pa-md"></div>
              <q-form class="row q-col-gutter-x-lg q-col-gutter-y-lg">
              <div class="col-2"></div> 
              <div class="col-8 justify-center items-center">
                <q-select  v-if="state.saida.tipo_saida == 'SAIDA_TRANSFORMACAO'" label="Máquina" v-model="state.saida.maquina" :options="state.maquinas" option-label="nome" 
                option-value="id" map-options outlined disable lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>
                <q-select v-if="state.saida.tipo_saida == 'SAIDA_PADRAO'" label="Destinatário" v-model="state.saida.fornecedor" :options="state.destinatarios" option-label="nome" 
                option-value="id" map-options outlined disable lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>
                <!-- <q-input filled v-model="observacao" label="Observações" /> -->
                <q-input  v-model="state.saida.observacao" label="Observações" filled type="textarea"/>
                <div class="q-pa-md"></div>
                <div v-if="state.saida.tipo_saida == 'SAIDA_TRANSFORMACAO'">
                  <div class="text-h6 text-weight-medium text-aling-center row justify-center items-center">Produção</div>
                  <div class="q-pa-md"></div>
                  <div class="row">
                    <div class="col-8">
                      <q-select label="Produto" outlined v-model="state.saida.produto" :options="state.produtos" 
                      option-label="nome" emit-value/>
                    </div>
                    <div class="col-1"></div>
                    <div class="col-3">
                      <q-input
                        type="number"
                        outlined
                        v-model="state.saida.quantidade_produto"
                        label="Quantidade"
                        hint="Quantidade"
                        lazy-rules
                        :rules="[ val => val && val.length > 0 || 'Please type something']"
                      />
                    </div>
                  </div>
                </div>
              </div>
              </q-form>
            </q-card-section>
          </q-step>
          <q-step :name="5" :prefix="state.saida.tipo_saida == 'SAIDA_TRANSFORMACAO' ? 4 : 5" title="">
            <q-card-section>
              <div class="q-pa-md"></div>
              <div class="text-h6 text-weight-medium row justify-center items-center">Resumo</div>
              <div class="q-pa-md"></div>
              <div class="q-gutter-sm">
                <q-radio v-model="state.saida.tipo_saida" :val="state.saida.tipo_saida" :label="tiposSaidasLabel[state.saida.tipo_saida]" disable/>
              </div>
             <div class="q-pb-md" v-if="state.saida.tipo_saida == 'SAIDA_PADRAO'">
              <q-expansion-item
                default-opened
                expand-icon-toggle
                class="shadow-2 overflow-hidden"
                :header-class="id"
                style="border-radius: 12px"
                expand-icon-class="text-primary">
                <q-table
                  :rows="checkMaterialItems"
                  :columns="columns"
                  row-key="nome"
                  :selected-rows-label="getSelectedString"
                  v-model:selected="checkMaterialItems"
                />
              
              </q-expansion-item>
                <hr>
                observação: <br>
                {{ state.saida.observacao }}
              </div>
              <div class="q-pb-md" v-if="state.saida.tipo_saida == 'SAIDA_TRANSFORMACAO'">
                <div class="q-pb-lg">
                  <q-expansion-item
                    default-opened
                    expand-icon-toggle
                    class="shadow-2 overflow-hidden bg-white"
                    style="border-radius: 12px"
                    expand-icon-class="text-primary"
                    header-class="bg-white text-primary text-weight-bold"
                  >
                    <template v-slot:header>
                      <q-item-section>
                        <div>
                          <q-chip v-if="state.saida.tipo_saida === 'SAIDA_TRANSFORMACAO'" size="12px" outline icon="o_sync_alt" color="primary" text-color="white">
                            Transformação
                          </q-chip>
                        </div>            
                      </q-item-section> 
                    <q-separator></q-separator>
                      <q-item-section class="text-center">
                        {{ state.saida.maquina?.nome }}
                      </q-item-section>
                      <q-item-section class="text-right">
                        <div>
                          <span> {{ formataData(new Date(Date.now())) }} </span>
                          <span class="q-mx-xs"></span>
                        </div>
                      </q-item-section>
                    </template>

                    <q-separator></q-separator>

                    <q-card>
                      <q-card-section>

                        <div style="display: flex; margin: auto ;">

                        <q-table style="flex: 6;" dense flat :rows="checkMaterialItems" :columns="columnsSaidaTransformacao" hide-pagination
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
                              <q-td class="text-center" v-if="state.saida.tipo_saida === 'SAIDA_TRANSFORMACAO' && props.rowIndex == 0" key="produto">
                                {{ state.saida.produto?.nome }}
                              </q-td>
                              <q-td class="text-center" v-if="state.saida.tipo_saida === 'SAIDA_TRANSFORMACAO' && props.rowIndex == 0" key="quantidade_produto">
                                {{ state.saida.quantidade_produto }}
                              </q-td>
                            </q-tr>
                          </template>
                        </q-table>
                      </div>

                        <q-separator></q-separator>

                        <div class="q-mt-lg q-mb-sm row">
                          <div class="col-8">
                            <label class="text-primary">Observação:</label>
                            <div> {{state.saida.observacao}} </div>
                          </div>
                          <div class="col-4 q-gutter-sm text-right">
                          </div>
                        </div>

                      </q-card-section>
                    </q-card>

                  </q-expansion-item>
                </div>
              </div> 
            </q-card-section>
          </q-step>
      
          <template v-slot:navigation>
            <q-stepper-navigation class="row justify-center items-center">
              <q-btn v-if="step > 1" outline color="primary" @click="$refs.stepper.previous()" label=" Voltar " class="q-ml-sm" />
                <div class="q-pa-md"></div>
              <q-btn v-if="step < 5" @click="proximaEtapa()" color="primary" label="Continuar" />
              <q-btn v-if="step == 5" @click="finalizar()" color="primary" label="Finalizar" />
              <div class="q-pa-md"></div>
              <q-btn v-if="step == 5" @click="finalizarECadastrarAnexo()" color="primary" label="Finalizar e Cadastrar" />
              <div class="q-pa-md"></div>
              <q-btn v-if="step == 5" @click="finalizarECadastrarNovaSaida()" color="primary" label="Finalizar e Cadastrar Nova Saída" />
            </q-stepper-navigation>
          </template>
        </q-stepper>
      </div>
    </q-card-section>

  </q-card>
</template>