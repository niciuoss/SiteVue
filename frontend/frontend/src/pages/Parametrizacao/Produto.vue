<script setup lang="ts">
import { inject, onMounted, reactive, ref } from 'vue';
import Produto from '@/models/Produto';
import ServiceFactory from '@/factory/ServiceFactory';

const serviceFactory = inject("serviceFactory") as ServiceFactory;
const state = reactive<{ produtos: Produto[], produtoForm: Produto  }>({ produtos: [], produtoForm: new Produto() });

const dialogUpdate = ref(false)
const dialogCreate = ref(false)
const dialogDelete = ref(false)


onMounted(async () => {
  load()
})

const load = async () => {
  const produtos = await serviceFactory.createProdutoService().find();
  state.produtos = produtos
  console.log(state.produtos)
}

const columns = [
  { name: 'attributes.nome', align: 'left', label: 'Produto', field: 'attributes.nome', sortable: true },
  { name: 'actions', align: 'right', label: '', field: '', sortable: false },
]

async function create() {
  console.log(state.produtoForm)
  await serviceFactory.createProdutoService().create(state.produtoForm);
  dialogCreate.value = false
  await load()
}

async function update() {
  console.log(state.produtoForm)
  await serviceFactory.createProdutoService().update(state.produtoForm);
  dialogUpdate.value = false
  await load()
}

async function remove () {
  console.log(state.produtoForm)
  await serviceFactory.createProdutoService().delete(state.produtoForm);
  dialogDelete.value = false
  await load()
}


function openCreateDialog() {
  state.produtoForm = new Produto()
  console.log(state.produtoForm)
  dialogCreate.value = true
}

function openUpdateDialog(produto: Produto) {
  state.produtoForm = Object.assign(new Produto(), produto)
  dialogUpdate.value = true
}

function openDeleteDialog(produto: Produto) {
  state.produtoForm = new Produto(produto.id)
  dialogDelete.value = true
}

</script>

<template>
  <q-btn class="q-mb-lg" label="Novo Produto" type="submit" color="primary" @click="openCreateDialog" />

  <q-dialog v-model="dialogCreate" persistent>
    <q-card style="width: 700px; max-width: 80vw;">
      <q-form @submit.prevent="create()">
        <q-card-section>
          <div class="text-h6">Cadastrar Produto</div>
        </q-card-section>

        <q-separator ></q-separator>

        <q-card-section>
          <label class="text-weight-medium">Nome:</label>
          <q-input v-model="state.produtoForm.nome" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>
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
          <div class="text-h6">Editar Produto</div>
        </q-card-section>

        <q-separator ></q-separator>

        <q-card-section>
          <label class="text-weight-medium">Nome:</label>
          <q-input v-model="state.produtoForm.nome" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>
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
        <div class="q-mt-md text-h6">Você tem certeza que deseja excluir o produto?</div>
        <div class="text-subtitle text-grey">Essa ação não poderá ser revertida, deseja confirmar?</div>
      </q-card-section>

      <q-card-section class="q-gutter-xl q-pl-sm q-py-sm">
        <q-btn outline color="primary" class="shadow-1" v-close-popup>Cancelar</q-btn>
        <q-btn @click="remove" color="primary" label="Confirmar"></q-btn>
      </q-card-section>
    </q-card>
  </q-dialog>

  <div class="q-pb-md">
    <q-table :rows="state.produtos" :columns="columns">
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
