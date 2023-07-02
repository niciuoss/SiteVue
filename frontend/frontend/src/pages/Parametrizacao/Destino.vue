<script setup lang="ts">
import { inject, onMounted, reactive, ref } from 'vue';
import Destino from '@/models/Destino';
import ServiceFactory from '@/factory/ServiceFactory';

const serviceFactory = inject("serviceFactory") as ServiceFactory;
const state = reactive<{ destinos: Destino[], destinoForm: Destino  }>({ destinos: [], destinoForm: new Destino() });

const dialogUpdate = ref(false)
const dialogCreate = ref(false)
const dialogDelete = ref(false)


onMounted(async () => {
  load()
})

const load = async () => {
  const destinos = await serviceFactory.createDestinoService().find();
  state.destinos = destinos
  console.log(state.destinos)
}

const columns = [
{ name: 'attributes.nome', align: 'left', label: 'Destino', field: 'attributes.nome', sortable: true },
{ name: 'endereco', align: 'left', label: 'Endereço', field: 'endereco.nome', sortable: true },
  { name: 'actions', align: 'right', label: '', field: '', sortable: false },
]

async function create() {
  console.log(state.destinoForm)
  await serviceFactory.createDestinoService().create(state.destinoForm);
  dialogCreate.value = false
  await load()
}

async function update() {
  console.log(state.destinoForm)
  await serviceFactory.createDestinoService().update(state.destinoForm);
  dialogUpdate.value = false
  await load()
}

async function remove () {
  console.log(state.destinoForm)
  await serviceFactory.createDestinoService().delete(state.destinoForm);
  dialogDelete.value = false
  await load()
}


function openCreateDialog() {
  state.destinoForm = new Destino()
  console.log(state.destinoForm)
  dialogCreate.value = true
}

function openUpdateDialog(destino: Destino) {
  state.destinoForm = Object.assign(new Destino(), destino)
  dialogUpdate.value = true
}

function openDeleteDialog(destino: Destino) {
  state.destinoForm = new Destino(destino.id)
  dialogDelete.value = true
}

</script>

<template>
  <q-btn class="q-mb-lg" label="Nova Destino" type="submit" color="primary" @click="openCreateDialog" />

  <q-dialog v-model="dialogCreate" persistent>
    <q-card style="width: 700px; max-width: 80vw;">
      <q-form @submit.prevent="create()">
        <q-card-section>
          <div class="text-h6">Cadastrar Destino</div>
        </q-card-section>

        <q-separator ></q-separator>

        <q-card-section>
          <label class="text-weight-medium">Nome:</label>
          <q-input v-model="state.destinoForm.nome" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>

          <label class="text-weight-medium">CEP:</label>
          <q-input v-model="state.destinoForm.cep" outlined/>

          <label class="text-weight-medium">Rua:</label>
          <q-input v-model="state.destinoForm.rua" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>

          <label class="text-weight-medium">Número:</label>
          <q-input v-model="state.destinoForm.numero" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>

          <label class="text-weight-medium">Bairro:</label>
          <q-input v-model="state.destinoForm.bairro" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>

          <label class="text-weight-medium">Cidade:</label>
          <q-input v-model="state.destinoForm.cidade" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>

          <label class="text-weight-medium">Estado:</label>
          <q-input v-model="state.destinoForm.estado" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>
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
          <div class="text-h6">Editar Destino</div>
        </q-card-section>

        <q-separator ></q-separator>

        <q-card-section>
          <label class="text-weight-medium">Nome:</label>
          <q-input v-model="state.destinoForm.nome" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>

          <label class="text-weight-medium">CEP:</label>
          <q-input v-model="state.destinoForm.cep" outlined/>

          <label class="text-weight-medium">Rua:</label>
          <q-input v-model="state.destinoForm.rua" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>

          <label class="text-weight-medium">Número:</label>
          <q-input v-model="state.destinoForm.numero" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>

          <label class="text-weight-medium">Bairro:</label>
          <q-input v-model="state.destinoForm.bairro" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>

          <label class="text-weight-medium">Cidade:</label>
          <q-input v-model="state.destinoForm.cidade" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>

          <label class="text-weight-medium">Estado:</label>
          <q-input v-model="state.destinoForm.estado" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>
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
        <div class="q-mt-md text-h6">Você tem certeza que deseja excluir o destino?</div>
        <div class="text-subtitle text-grey">Essa ação não poderá ser revertida, deseja confirmar?</div>
      </q-card-section>

      <q-card-section class="q-gutter-xl q-pl-sm q-py-sm">
        <q-btn outline color="primary" class="shadow-1" v-close-popup>Cancelar</q-btn>
        <q-btn @click="remove" color="primary" label="Confirmar"></q-btn>
      </q-card-section>
    </q-card>
  </q-dialog>

  <div class="q-pb-md">
    <q-table :rows="state.destinos" :columns="columns">
      <template v-slot:body="props">
        <q-tr :props="props">
          <q-td key="attributes.nome" :props="props">
            {{ props.row.nome }}
          </q-td>
          <q-td key="endereco" :props="props">
            {{ props.row.getEndereco() }}
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
