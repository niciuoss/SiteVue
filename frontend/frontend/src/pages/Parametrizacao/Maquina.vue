<script setup lang="ts">
import { inject, onMounted, reactive, ref } from 'vue';
import Maquina from '@/models/Maquina';
import ServiceFactory from '@/factory/ServiceFactory';

const serviceFactory = inject("serviceFactory") as ServiceFactory;
const state = reactive<{ maquinas: Maquina[], maquinaForm: Maquina  }>({ maquinas: [], maquinaForm: new Maquina() });

const dialogUpdate = ref(false)
const dialogCreate = ref(false)
const dialogDelete = ref(false)


onMounted(async () => {
  load()
})

const load = async () => {
  const maquinas = await serviceFactory.createMaquinaService().find();
  state.maquinas = maquinas
  console.log(state.maquinas)
}

const columns = [
  { name: 'attributes.nome', align: 'left', label: 'Máquina', field: 'attributes.nome', sortable: true },
  { name: 'actions', align: 'right', label: '', field: '', sortable: false },
]

function openCreateDialog() {
  state.maquinaForm = new Maquina()
  console.log(state.maquinaForm)
  dialogCreate.value = true
}
async function create() {
  console.log(state.maquinaForm)
  await serviceFactory.createMaquinaService().create(state.maquinaForm);
  dialogCreate.value = false
  await load()
}

function openUpdateDialog(maquina: Maquina) {
  state.maquinaForm = Object.assign(new Maquina(), maquina) //new Maquina(maquina.id, new MaquinaAttributes(maquina.nome))
  dialogUpdate.value = true
}
async function update() {
  console.log(state.maquinaForm)
  await serviceFactory.createMaquinaService().update(state.maquinaForm);
  dialogUpdate.value = false
  await load()
}

async function remove () {
  console.log(state.maquinaForm)
  await serviceFactory.createMaquinaService().delete(state.maquinaForm);
  dialogDelete.value = false
  await load()
}





function openDeleteDialog(maquina: Maquina) {
  state.maquinaForm = new Maquina(maquina.id)
  dialogDelete.value = true
}

</script>

<template>
  <q-btn class="q-mb-lg" label="Nova Máquina" type="submit" color="primary" @click="openCreateDialog" />

  <q-dialog v-model="dialogCreate" persistent>
    <q-card style="width: 700px; max-width: 80vw;">
      <q-form @submit.prevent="create()">
        <q-card-section>
          <div class="text-h6">Cadastrar Máquina</div>
        </q-card-section>

        <q-separator ></q-separator>

        <q-card-section>
          <label class="text-weight-medium">Nome:</label>
          <q-input v-model="state.maquinaForm.nome" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>
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
          <div class="text-h6">Editar Máquina</div>
        </q-card-section>

        <q-separator ></q-separator>

        <q-card-section>
          <label class="text-weight-medium">Nome:</label>
          <q-input v-model="state.maquinaForm.nome" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>
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
        <div class="q-mt-md text-h6">Você tem certeza que deseja excluir a máquina?</div>
        <div class="text-subtitle text-grey">Essa ação não poderá ser revertida, deseja confirmar?</div>
      </q-card-section>

      <q-card-section class="q-gutter-xl q-pl-sm q-py-sm">
        <q-btn outline color="primary" class="shadow-1" v-close-popup>Cancelar</q-btn>
        <q-btn @click="remove" color="primary" label="Confirmar"></q-btn>
      </q-card-section>
    </q-card>
  </q-dialog>

  <div class="q-pb-md">
    <q-table :rows="state.maquinas" :columns="columns">
      <template v-slot:body="props">
        <q-tr :props="props">
          <q-td key="attributes.nome" :props="props">
            {{ props.row.nome }}
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
