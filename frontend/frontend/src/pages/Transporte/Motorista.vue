<script setup lang="ts">
import { inject, onMounted, reactive, ref } from 'vue';
import Motorista from '@/models/Motorista';
import ServiceFactory from '@/factory/ServiceFactory';
import Fornecedor from '@/models/Fornecedor';

const serviceFactory = inject("serviceFactory") as ServiceFactory;
const state = reactive<{
  motoristas: Motorista[],
  motoristaForm: Motorista,
  fornecedores: Fornecedor[],  }>({
    motoristas: [],
    motoristaForm: new Motorista(),
    fornecedores: [] });

const dialogUpdate = ref(false)
const dialogCreate = ref(false)
const dialogDelete = ref(false)


onMounted(async () => {
  load()
})

const load = async () => {
  state.motoristas = await serviceFactory.createMotoristaService().find();
  state.fornecedores = await serviceFactory.createFornecedorService().findAll();
}

const columns = [
  { name: 'attributes.nome', align: 'left', label: 'Nome', field: 'attributes.nome', sortable: true },
  { name: 'attributes.cpf', align: 'left', label: 'CPF', field: 'attributes.cpf', sortable: true },
  { name: 'attributes.cnh', align: 'left', label: 'CNH', field: 'attributes.cnh', sortable: true },
  { name: 'attributes.telefone', align: 'left', label: 'Telefone', field: 'attributes.telefone', sortable: true },
  { name: 'externo', align: 'left', label: 'Externo', field: 'externo', sortable: true },
  { name: 'fornecedor', align: 'left', label: 'Fornecedor', field: 'fornecedor', sortable: true },
  { name: 'actions', align: 'right', label: '', field: '', sortable: false },
]

async function create() {
  console.log(state.motoristaForm)

  if(!state.motoristaForm.isExterno) {
    state.motoristaForm.fornecedor = undefined
  }

  await serviceFactory.createMotoristaService().create(state.motoristaForm);
  dialogCreate.value = false
  await load()
}

async function update() {
  console.log(state.motoristaForm)
  await serviceFactory.createMotoristaService().update(state.motoristaForm);
  dialogUpdate.value = false
  await load()
}

async function remove () {
  console.log(state.motoristaForm)
  await serviceFactory.createMotoristaService().delete(state.motoristaForm);
  dialogDelete.value = false
  await load()
}


function openCreateDialog() {
  state.motoristaForm = new Motorista()
  console.log(state.motoristaForm)
  dialogCreate.value = true
}

function openUpdateDialog(motorista: Motorista) {
  state.motoristaForm = Object.assign(new Motorista(), motorista)
  dialogUpdate.value = true
}

function openDeleteDialog(motorista: Motorista) {
  state.motoristaForm =  Object.assign({}, motorista)
  dialogDelete.value = true
}

</script>

<template>
  <q-btn class="q-mb-lg" label="Novo Motorista" type="submit" color="primary" @click="openCreateDialog" />

  <q-dialog v-model="dialogCreate" persistent>
    <q-card style="width: 700px; max-width: 80vw;">
      <q-form @submit.prevent="create()">
        <q-card-section>
          <div class="text-h6">Cadastrar Motorista</div>
        </q-card-section>

        <q-separator ></q-separator>

        <q-card-section>
          <div class="q-mb-sm" style="margin-left: -10px;">
            <q-checkbox v-model="state.motoristaForm.isExterno" label="Motorista é externo?"  />
          </div>

          <div class="q-mb-md" v-if="state.motoristaForm.isExterno">
            <label class="text-weight-medium">Selecione o Fornecedor:</label>
            <q-select
              v-model="state.motoristaForm.fornecedor"
              :options="state.fornecedores"
              option-label="nome"
              option-value="id"
              map-options
              emit-value
              outlined
            />
          </div>

          <label class="text-weight-medium">Nome:</label>
          <q-input v-model="state.motoristaForm.nome" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>

          <label class="text-weight-medium">CPF:</label>
          <q-input v-model="state.motoristaForm.cpf" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>

          <label class="text-weight-medium">CNH:</label>
          <q-input v-model="state.motoristaForm.cnh" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>

          <label class="text-weight-medium">Telefone:</label>
          <q-input v-model="state.motoristaForm.telefone" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>
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
          <div class="text-h6">Editar Motorista</div>
        </q-card-section>

        <q-separator ></q-separator>

        <q-card-section>
          <div class="q-mb-sm" style="margin-left: -10px;">
            <q-checkbox v-model="state.motoristaForm.isExterno" label="Motorista é externo?"  />
          </div>


          <div class="q-mb-md" v-if="state.motoristaForm.isExterno">
            <label class="text-weight-medium">Selecione o Fornecedor:</label>
            <q-select
              v-model="state.motoristaForm.fornecedor"
              :options="state.fornecedores"
              option-label="nome"
              option-value="id"
              map-options
              emit-value
              outlined
            />
          </div>

          <label class="text-weight-medium">Nome:</label>
          <q-input v-model="state.motoristaForm.nome" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>

          <label class="text-weight-medium">CPF:</label>
          <q-input v-model="state.motoristaForm.cpf" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>

          <label class="text-weight-medium">CNH:</label>
          <q-input v-model="state.motoristaForm.cnh" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>

          <label class="text-weight-medium">Telefone:</label>
          <q-input v-model="state.motoristaForm.telefone" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>
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
        <div class="q-mt-md text-h6">Você tem certeza que deseja excluir o motorista?</div>
        <div class="text-subtitle text-grey">Essa ação não poderá ser revertida, deseja confirmar?</div>
      </q-card-section>

      <q-card-section class="q-gutter-xl q-pl-sm q-py-sm">
        <q-btn outline color="primary" class="shadow-1" v-close-popup>Cancelar</q-btn>
        <q-btn @click="remove" color="primary" label="Confirmar"></q-btn>
      </q-card-section>
    </q-card>
  </q-dialog>

  <div class="q-pb-md">
    <q-table :rows="state.motoristas" :columns="columns">
      <template v-slot:body="props">
        <q-tr :props="props">
          <q-td key="attributes.nome" :props="props">
            {{ props.row.nome }}
          </q-td>
          <q-td key="attributes.cpf" :props="props">
            {{ props.row.cpf }}
          </q-td>
          <q-td key="attributes.cnh" :props="props">
            {{ props.row.cnh }}
          </q-td>
          <q-td key="attributes.telefone" :props="props">
            {{ props.row.telefone }}
          </q-td>
          <q-td key="externo" :props="props">
            {{ props.row.isExterno? 'Sim' : 'Não' }}
          </q-td>
          <q-td key="fornecedor" :props="props">
            {{ props.row.isExterno? props.row.fornecedor.nome : '-' }}
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
