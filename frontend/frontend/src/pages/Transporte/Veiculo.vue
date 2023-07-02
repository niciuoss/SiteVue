<script setup lang="ts">
import { inject, onMounted, reactive, ref } from 'vue';
import Veiculo from '@/models/Veiculo';
import ServiceFactory from '@/factory/ServiceFactory';
import Fornecedor from '@/models/Fornecedor';

const serviceFactory = inject("serviceFactory") as ServiceFactory;
const state = reactive<{
  veiculos: Veiculo[],
  veiculoForm: Veiculo,
  fornecedores: Fornecedor[]
}>({
  veiculos: [],
  veiculoForm: new Veiculo(),
  fornecedores: []
});

const dialogUpdate = ref(false)
const dialogCreate = ref(false)
const dialogDelete = ref(false)


onMounted(async () => {
  load()
})

const load = async () => {
  state.veiculos = await serviceFactory.createVeiculoService().find();
  state.fornecedores = await serviceFactory.createFornecedorService().findAll();
}

const columns = [
{ name: 'attributes.nome', align: 'left', label: 'Veículo', field: 'attributes.nome', sortable: true },
{ name: 'attributes.placa', align: 'left', label: 'Placa', field: 'attributes.placa', sortable: true },
{ name: 'externo', align: 'left', label: 'Externo', field: 'externo', sortable: true },
{ name: 'fornecedor', align: 'left', label: 'Fornecedor', field: 'fornecedor', sortable: true },
  { name: 'actions', align: 'right', label: '', field: '', sortable: false },
]

async function create() {
  console.log(state.veiculoForm)
  await serviceFactory.createVeiculoService().create(state.veiculoForm);
  dialogCreate.value = false
  await load()
}

async function update() {
  await serviceFactory.createVeiculoService().update(state.veiculoForm);
  dialogUpdate.value = false
  await load()
}

async function remove () {
  console.log(state.veiculoForm)
  await serviceFactory.createVeiculoService().delete(state.veiculoForm);
  dialogDelete.value = false
  await load()
}

function openCreateDialog() {
  state.veiculoForm = new Veiculo()
  console.log(state.veiculoForm)
  dialogCreate.value = true
}

function openUpdateDialog(veiculo: Veiculo) {
  state.veiculoForm = Object.assign(new Veiculo(), veiculo)
  dialogUpdate.value = true
}

function openDeleteDialog(maquina: Veiculo) {
  state.veiculoForm = new Veiculo(maquina.id)
  dialogDelete.value = true
}

</script>

<template>
  <q-btn class="q-mb-lg" label="Novo Veículo" type="submit" color="primary" @click="openCreateDialog" />

  <q-dialog v-model="dialogCreate" persistent>
    <q-card style="width: 700px; max-width: 80vw;">
      <q-form @submit.prevent="create()">
        <q-card-section>
          <div class="text-h6">Cadastrar Veículo</div>
        </q-card-section>

        <q-separator ></q-separator>

        <q-card-section>
          <div class="q-mb-sm" style="margin-left: -10px;">
            <q-checkbox v-model="state.veiculoForm.isExterno" label="Veículo é externo?"  />
          </div>

          <div class="q-mb-md" v-if="state.veiculoForm.isExterno">
            <label class="text-weight-medium">Selecione o Fornecedor:</label>
            <q-select
              v-model="state.veiculoForm.fornecedor"
              :options="state.fornecedores"
              option-label="nome"
              option-value="id"
              map-options
              emit-value
              outlined
            />
          </div>

          <label class="text-weight-medium">Nome:</label>
          <q-input v-model="state.veiculoForm.nome" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>

          <label class="text-weight-medium">Placa:</label>
          <q-input v-model="state.veiculoForm.placa" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>
        </q-card-section>

        <q-separator></q-separator>
        <q-card-section class="q-gutter-sm q-pl-sm q-py-sm">
          <q-btn type="submit" color="primary" label="Salvar"></q-btn>
          <q-btn flat v-close-popup>Cancelar</q-btn>
        </q-card-section>
      </q-form>
    </q-card>
  </q-dialog>


  <q-dialog v-model="dialogUpdate" persistent>
    <q-card style="width: 700px; max-width: 80vw;">
      <q-form @submit.prevent="update()">
        <q-card-section>
          <div class="text-h6">Editar Veículo</div>
        </q-card-section>

        <q-separator ></q-separator>

        <q-card-section>
          <div class="q-mb-sm" style="margin-left: -10px;">
            <q-checkbox v-model="state.veiculoForm.isExterno" label="Motorista é externo?"  />
          </div>

          <div class="q-mb-md" v-if="state.veiculoForm.isExterno">
            <label class="text-weight-medium">Selecione o Fornecedor:</label>
            <q-select
              v-model="state.veiculoForm.fornecedor"
              :options="state.fornecedores"
              option-label="nome"
              option-value="id"
              map-options
              emit-value
              outlined
            />
          </div>

          <label class="text-weight-medium">Nome:</label>
          <q-input v-model="state.veiculoForm.nome" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>

          <label class="text-weight-medium">Placa:</label>
          <q-input v-model="state.veiculoForm.placa" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>
        </q-card-section>

        <q-separator></q-separator>
        <q-card-section class="q-gutter-sm q-pl-sm q-py-sm">
          <q-btn type="submit" color="primary" label="Salvar"></q-btn>
          <q-btn flat v-close-popup>Cancelar</q-btn>
        </q-card-section>
      </q-form>
    </q-card>
  </q-dialog>

  <q-dialog v-model="dialogDelete" persistent>
    <q-card class="text-center q-pt-md q-pb-lg" style="width: 450px; max-width: 80vw;">
      <q-card-section>
        <q-icon name="o_error_outline" color="primary" size="90px"></q-icon>
        <div class="q-mt-md text-h6">Você tem certeza que deseja excluir o veículo?</div>
        <div class="text-subtitle text-grey">Essa ação não poderá ser revertida, deseja confirmar?</div>
      </q-card-section>

      <q-card-section class="q-gutter-xl q-pl-sm q-py-sm">
        <q-btn outline color="primary" class="shadow-1" v-close-popup>Cancelar</q-btn>
        <q-btn @click="remove" color="primary" label="Confirmar"></q-btn>
      </q-card-section>
    </q-card>
  </q-dialog>

  <div class="q-pb-md">
    <q-table :rows="state.veiculos" :columns="columns">
      <template v-slot:body="props">
        <q-tr :props="props">
          <q-td key="attributes.nome" :props="props">
            {{ props.row.nome }}
          </q-td>
          <q-td key="attributes.placa" :props="props">
            {{ props.row.placa }}
          </q-td>
          <q-td key="externo" :props="props">
            {{ props.row.isExterno? 'Sim' : 'Não' }}
          </q-td>
          <q-td key="fornecedor" :props="props">
            {{ props.row.fornecedor.nome }}
          </q-td>
          <q-td key="actions" :props="props">
            <q-btn round flat icon="o_edit" @click="openUpdateDialog(props.row)"></q-btn>
            <q-btn round flat icon="o_delete" @click="openDeleteDialog(props.row)"></q-btn>
          </q-td>
        </q-tr>
      </template>
    </q-table>
  </div>

</template>

<style scoped>
</style>
