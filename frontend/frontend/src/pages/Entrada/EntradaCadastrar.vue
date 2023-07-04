<script setup lang="ts">

import ServiceFactory from '@/factory/ServiceFactory';
import CategoriaMaterial from '@/models/CategoriaMaterial';
import Fornecedor from '@/models/Fornecedor';
import TipoMaterial from '@/models/TipoMaterial';
import Destino from '@/models/Destino';
import { inject, onMounted, reactive, ref, watch } from 'vue'
import { useRouter } from 'vue-router';
import Entrada from '@/models/Entrada';
import MaterialItem from '@/models/MaterialItem';
import { QTableProps } from 'quasar';
import { type } from 'os';

const router = useRouter();

const serviceFactory = inject("serviceFactory") as ServiceFactory;

const columns: QTableProps['columns'] = [
  { name: 'categoria', align: 'left', label: 'Categoria', field: '', sortable: true },
  { name: 'tipo', align: 'left', label: 'Tipo', field: '', sortable: true },
  { name: 'quantidade', align: 'left', label: 'Quantidade', field: '', sortable: true },
  { name: 'actions', align: 'right', label: '', field: '', sortable: false },
];

const stepper = ref(null);

const state = reactive<{
  fornecedores: Fornecedor[],
  destinos: Destino[]
  categoriasDeMaterial: CategoriaMaterial[],
  tiposDeMaterial: TipoMaterial[],
  entradaForm: Entrada,
  materialItemForm: MaterialItem,
  step: number,
}>({
  fornecedores: [],
  destinos: [],
  tiposDeMaterial: [],
  categoriasDeMaterial: [],
  entradaForm: new Entrada(),
  materialItemForm: new MaterialItem(),
  step: 1
})

async function create() {
  return await serviceFactory.createEntradaService().create(state.entradaForm);
}

async function finalizar() {
  create().then(data => {
    router.push({ name: 'Entrada.gerenciamento'})
  })
}

async function finalizarECadastrarAnexo() {
  create().then(data => {
    router.push({ name: 'Entrada.anexos', params: {entradaId: data.id}})
  })
}

async function finalizarECadastrarNovaEntrada() {
  create().then(data => {
    location.reload()
  })
}

function addMaterialItem() {
  state.entradaForm.addMaterialItem(Object.assign(new MaterialItem(), state.materialItemForm));
  state.materialItemForm = new MaterialItem();
  state.materialItemForm.quantidade = 10
}

function removeMaterialItem(materialItem: MaterialItem) {
  state.entradaForm.removeMaterialItem(materialItem);
}

function proximaEtapa() {
  if(state.step === 1 && state.entradaForm.fornecedor?.id && state.entradaForm.destino?.id) {
    stepper.value.next();
  }
  if(state.step === 2 && state.entradaForm.material_items && state.entradaForm.material_items.length > 0) {
    stepper.value.next();
  }
  if(state.step === 3) {
    stepper.value.next();
  }
}

onMounted(async () => {
  state.fornecedores = await serviceFactory.createFornecedorService().findAll();
  state.destinos = await serviceFactory.createDestinoService().findAll();
  state.categoriasDeMaterial = await serviceFactory.createMaterialService().findAllCategoria();
  state.tiposDeMaterial = await serviceFactory.createMaterialService().find();

  state.entradaForm.observacao = ""
})

</script>

<template>


  <q-card flat class="quixada-bg-grey">
    <q-card-section>
			<div class="text-h5 text-weight-medium">Cadastrar Nova Entrada</div>
		</q-card-section>

    <q-card-section>
      <div class="q-pa-md">
        <q-stepper v-model="state.step" ref="stepper" animated active-color="primary">
          <q-step :name="1" prefix="1" title="" >
            <q-card-section>
              <div class="q-pa-md"></div>
              <div class="text-h6 text-weight-medium text-aling-center row justify-center items-center" >Selecionar Fornecedor</div>
              <div class="q-pa-md"></div>
              <div class="col-8 justify-center items-center">
                <q-select label="Fornecedor" v-model="state.entradaForm.fornecedor" :options="state.fornecedores" option-label="nome" option-value="id" map-options outlined lazy-rules/>
              </div>

              <div class="q-pa-md"></div>
              <div class="text-h6 text-weight-medium text-aling-center row justify-center items-center" >Selecionar Destino</div>
              <div class="q-pa-md"></div>
              <div class="col-8 justify-center items-center">
                <q-select label="Destino" v-model="state.entradaForm.destino" :options="state.destinos" option-label="nome" option-value="id" map-options outlined lazy-rules/>
              </div>


              <div class="q-pa-md"></div>

            </q-card-section>
          </q-step>


          <q-step :name="2" prefix="2" title="">
            <q-card-section>
              <div class="q-pa-md"></div>
                <div class="text-h6 text-weight-medium row justify-center items-center">Selecionar Material</div>
                <div class="q-pa-md"></div>

                <div class="q-pa-md"></div>
                <div>
                  <q-select label="Fornecedor" v-model="state.entradaForm.fornecedor" :options="state.fornecedores" option-label="nome" option-value="id" map-options outlined disable/>
                </div>
                <div class="q-pa-md"></div>
              <div class="row q-col-gutter-x-lg q-col-gutter-y-lg">
              <div class="col-3">
                  <q-select
                    outlined
                    label="Categoria"
                    v-model="state.materialItemForm.categoriaMaterial"
                    :options="state.categoriasDeMaterial"
                    option-label="nome"
                    emit-value
                  >
                    <template v-slot:append>
                      <q-icon name="o_close" @click.stop.prevent="state.materialItemForm.categoriaMaterial = new CategoriaMaterial()" class="cursor-pointer" />
                    </template>
                  </q-select>



              </div>
              <div class="col-3">
                <q-select
                    :disable="state.materialItemForm.categoriaMaterial?.id ? false : true"
                    outlined
                    label="Tipo"
                    v-model="state.materialItemForm.tipoMaterial"
                    :options="state.materialItemForm.categoriaMaterial?.tipos"
                    option-label="nome"
                    emit-value
                  >
                    <template v-slot:append>
                      <q-icon name="o_close" @click.stop.prevent="state.materialItemForm.tipoMaterial = new TipoMaterial()" class="cursor-pointer" />
                    </template>
                  </q-select>
              </div>

              <div class="col-3">
                <q-input
                  :disable="state.materialItemForm?.tipoMaterial?.id ? false : true"
                  outlined
                  label="Quantidade"
                  v-model="state.materialItemForm.quantidade"
                >
                  <template v-slot:append>kg</template>
                </q-input>

              </div>

              <div class="col-3">
                <q-btn
                  :disable="state.materialItemForm?.quantidade && state.materialItemForm?.quantidade > 0 ? false : true"
                  @click="addMaterialItem()"
                  outline
                  color="primary"
                  icon="o_add"
                  label="Adicionar Material"/>
              </div>
            </div>
              <!-- </q-form> -->
              <div class="q-pa-md"></div>
              <div class="q-pb-md">
                <q-table
                  :rows="state.entradaForm.material_items"
                  :columns="columns"
                >
                  <template v-slot:body="props">
                    <q-tr :props="props">
                      <q-td key="categoria" :props="props">
                        {{ props.row.categoriaMaterial.nome }}
                      </q-td>
                      <q-td key="tipo" :props="props">
                        {{ props.row.tipoMaterial.nome }}
                      </q-td>
                      <q-td key="quantidade" :props="props">
                        {{ props.row.quantidade }}
                      </q-td>
                      <q-td key="actions" :props="props">
                        <q-btn round flat icon="o_delete" @click="removeMaterialItem(props.row)"></q-btn>
                      </q-td>
                    </q-tr>
                  </template>
              </q-table>

              </div>

            </q-card-section>
          </q-step>

          <q-step :name="3" prefix="3" title="">
            <q-card-section>
              <div class="q-pa-md"></div>
              <div class="text-h6 text-weight-medium text-aling-center row justify-center items-center">Informações Adicionais</div>
              <div class="q-pa-md"></div>
              <div class="q-pa-md"></div>
              <q-form class="row q-col-gutter-x-lg q-col-gutter-y-lg">
              <div class="col-12 justify-center items-center">
                <q-select label="Fornecedor" v-model="state.entradaForm.fornecedor" :options="state.fornecedores" option-label="nome"
                option-value="id" map-options outlined disable lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>
                <q-input  v-model="state.entradaForm.observacao" label="Observações" filled type="textarea"/>
                <div class="q-pa-md"></div>
              </div>
              </q-form>
            </q-card-section>
          </q-step>
          <q-step :name="4" prefix="4" title="">
            <q-card-section>
              <div class="q-pa-md"></div>
              <div class="text-h6 text-weight-medium row justify-center items-center">Resumo</div>
              <div class="q-pa-md"></div>
             <div class="q-pb-md">

              <div class="q-mb-md">
                <q-select label="Fornecedor" v-model="state.entradaForm.fornecedor" :options="state.fornecedores" option-label="nome" option-value="id" map-options outlined disable/>
              </div>

              <div class="q-mb-md">
                <q-select label="Destino" v-model="state.entradaForm.destino" :options="state.destinos" option-label="nome" option-value="id" map-options outlined lazy-rules disable/>
              </div>

              <q-table
                  :rows="state.entradaForm.material_items"
                  :columns="columns"
                >
                  <template v-slot:body="props">
                    <q-tr :props="props">
                      <q-td key="categoria" :props="props">
                        {{ props.row.categoriaMaterial.nome }}
                      </q-td>
                      <q-td key="tipo" :props="props">
                        {{ props.row.tipoMaterial.nome }}
                      </q-td>
                      <q-td key="quantidade" :props="props">
                        {{ props.row.quantidade }}
                      </q-td>
                      <q-td key="actions" :props="props">
                        <q-btn round flat icon="o_delete" @click="removeMaterialItem(props.row)" disable></q-btn>
                      </q-td>
                    </q-tr>
                  </template>
              </q-table>

                <p class="q-mt-md">Observação: <br> {{ state.entradaForm.observacao }}</p>
              </div>
            </q-card-section>
          </q-step>

          <template v-slot:navigation>
            <q-stepper-navigation class="row justify-center items-center">
              <q-btn v-if="state.step > 1" outline color="primary" @click="$refs.stepper.previous()" label=" Voltar " class="q-ml-sm" />
              <div class="q-pa-xs"></div>

              <q-btn v-if="state.step < 4" @click="proximaEtapa()" color="primary" label="Continuar" />
              <q-btn v-if="state.step == 4" @click="finalizar()" color="primary" label="Finalizar" />

              <div class="q-pa-xs"></div>
              <q-btn v-if="state.step == 4" @click="finalizarECadastrarAnexo()" color="primary" label="Finalizar e Cadastrar Anexos" />
              <div class="q-pa-xs"></div>
              <q-btn v-if="state.step == 4" @click="finalizarECadastrarNovaEntrada()" color="primary" label="Finalizar e Cadastrar Nova Entrada" />
            </q-stepper-navigation>
          </template>
        </q-stepper>
      </div>
    </q-card-section>

  </q-card>
</template>