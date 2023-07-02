<script setup lang="ts">
import { inject, onMounted, reactive, ref } from 'vue';
import CategoriaMaterial from '@/models/CategoriaMaterial';
import ServiceFactory from '@/factory/ServiceFactory';
import TipoMaterial from '@/models/TipoMaterial';

const serviceFactory = inject('serviceFactory') as ServiceFactory;
const state = reactive<{
  categorias: CategoriaMaterial[],
  categoriaForm: CategoriaMaterial,
  tipoForm: TipoMaterial
}>({
    categorias: [],
    categoriaForm: {} as CategoriaMaterial,
    tipoForm: {} as TipoMaterial
  });

onMounted(async () => {
	load();
});

const load = async () => {
	const categorias = await serviceFactory.createMaterialService().find();
	state.categorias = categorias;
	console.log(categorias);
};

/**
 * CATEGORIA MATERIAL
 */
const dialogCreate = ref(false);
const dialogUpdate = ref(false);
const dialogRemove = ref(false);

function openCreateDialog() {
  state.categoriaForm = new CategoriaMaterial();
  dialogCreate.value = true
}
const create = async () => {
	await serviceFactory
		.createMaterialService()
		.createCategoria(state.categoriaForm);
	dialogCreate.value = false;
	await load();
};

function openUpdateDialog(categoria: CategoriaMaterial) {
  state.categoriaForm = Object.assign(new CategoriaMaterial(), categoria)
  dialogUpdate.value = true
}
const update = async () => {
	await serviceFactory
		.createMaterialService()
		.updateCategoria(state.categoriaForm);
	dialogUpdate.value = false;
	await load();

};

function openRemoveDialog(categoria: CategoriaMaterial) {
	state.categoriaForm = Object.assign(new CategoriaMaterial(), categoria);
  dialogRemove.value = true
}
const remove = async () => {
  await serviceFactory.createMaterialService().deleteCategoria(state.categoriaForm);
  dialogRemove.value = false
  await load()
};

/**
 * TIPO MATERIAL
 */
const dialogCreateTipo = ref(false);
const dialogUpdateTipo = ref(false);
const dialogRemoveTipo = ref(false);

function openCreateDialogTipo(categoriaParams: CategoriaMaterial) {
  state.tipoForm = new TipoMaterial();
  state.tipoForm.categoria = new CategoriaMaterial(categoriaParams.id);
  dialogCreateTipo.value = true
}
const createTipoMaterial = async () => {
  console.log(state.tipoForm)
	await serviceFactory.createMaterialService().createTipoMaterial(state.tipoForm);
	dialogCreateTipo.value = false;
	await load();
};

function openUpdateDialogTipo(categoriaParams: CategoriaMaterial, tipoParams: TipoMaterial) {
  state.tipoForm = Object.assign(new TipoMaterial(), tipoParams)
  state.tipoForm.categoria = new CategoriaMaterial(categoriaParams.id);
  console.log(state.tipoForm)
  dialogUpdateTipo.value = true
}
const updateTipoMaterial = async () => {
  console.log(state.tipoForm)
	await serviceFactory.createMaterialService().updateTipoMaterial(state.tipoForm);
	dialogUpdateTipo.value = false;
	await load();
};

function openRemoveDialogTipo() {
  console.log(state.tipoForm)
  dialogRemoveTipo.value = true
}
const removeTipoMaterial = async () => {
  console.log(state.tipoForm)
	await serviceFactory.createMaterialService().deleteTipoMaterial(state.tipoForm);
	dialogRemoveTipo.value = false;
	dialogUpdateTipo.value = false;
	await load();
};



</script>

<template>
	<q-btn
		class="q-mb-lg"
		label="Nova Categoria"
		type="submit"
		color="primary"
		@click="openCreateDialog()"
	/>

  <div
		class="q-pb-md"
		v-for="categoria in state.categorias"
		:key="categoria.id"
	>
		<q-expansion-item
			expand-icon-toggle
			class="shadow-2 overflow-hidden bg-white"
			style="border-radius: 12px"
			expand-icon-class="text-primary"
		>
			<template v-slot:header>
				<q-item-section>{{ categoria.nome }}</q-item-section>

				<q-item-section class="text-right">
					<div>
						<q-btn @click="openUpdateDialog(categoria)" round flat icon="o_edit"></q-btn>

						<q-btn @click="openCreateDialogTipo(categoria)" round flat icon="o_add"></q-btn>

						<q-btn @click="openRemoveDialog(categoria)" round flat icon="o_delete"></q-btn>
					</div>
				</q-item-section>
			</template>

			<q-separator></q-separator>

			<div class="q-pa-md">
				<q-chip
					clickable
					outline
					color="primary"
					text-color="white"
					icon-right="o_edit"
					v-for="material in categoria.tipos"
          @click="openUpdateDialogTipo(categoria, material)"
				>
					{{ material.nome }}
				</q-chip>
			</div>
		</q-expansion-item>
	</div>

	<div id="categoria">
		<q-dialog v-model="dialogCreate" persistent>
			<q-card style="width: 700px; max-width: 80vw">
				<q-form @submit.prevent="create()">
					<q-card-section>
						<div class="text-h6">Cadastrar Material</div>
					</q-card-section>

					<q-separator></q-separator>

					<q-card-section>
						<label class="text-weight-medium">Categoria:</label>
						<q-input
							v-model="state.categoriaForm.nome"
							outlined
							lazy-rules
							:rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"
						/>
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
			<q-card style="width: 700px; max-width: 80vw">
				<q-form @submit.prevent="update()">
					<q-card-section>
						<div class="text-h6">Editar Categoria</div>
					</q-card-section>

					<q-separator></q-separator>

					<q-card-section>
						<label class="text-weight-medium">Categoria:</label>
						<q-input
							v-model="state.categoriaForm.nome"
							outlined
						/>
					</q-card-section>

					<q-separator></q-separator>
					<q-card-section class="q-gutter-sm q-pl-sm q-py-sm">
						<q-btn type="submit" color="primary" label="Salvar"></q-btn>
						<q-btn flat v-close-popup>Cancelar</q-btn>
					</q-card-section>
				</q-form>
			</q-card>
		</q-dialog>

    <q-dialog v-model="dialogRemove" persistent>
    <q-card class="text-center q-pt-md q-pb-lg" style="width: 450px; max-width: 80vw;">
      <q-card-section>
        <q-icon name="o_error_outline" color="primary" size="90px"></q-icon>
        <div class="q-mt-md text-h6">Você tem certeza que deseja excluir a categoria?</div>
        <div class="text-subtitle text-grey">Essa ação não poderá ser revertida, deseja confirmar?</div>
      </q-card-section>

      <q-card-section class="q-gutter-xl q-pl-sm q-py-sm">
        <q-btn outline color="primary" class="shadow-1" v-close-popup>Cancelar</q-btn>
        <q-btn @click="remove()" color="primary" label="Confirmar"></q-btn>
      </q-card-section>
    </q-card>
    </q-dialog>

	</div>

  <div id="tipos">
		<q-dialog v-model="dialogCreateTipo" persistent>
			<q-card style="width: 700px; max-width: 80vw">
				<q-form @submit.prevent="createTipoMaterial()">
					<q-card-section>
						<div class="text-h6">Cadastrar Tipo Material</div>
					</q-card-section>

					<q-separator></q-separator>

					<q-card-section>
						<label class="text-weight-medium">Tipo:</label>
						<q-input
							v-model="state.tipoForm.nome"
							outlined
							lazy-rules
							:rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"
						/>
					</q-card-section>

					<q-separator></q-separator>
					<q-card-section class="q-gutter-sm q-pl-sm q-py-sm">
						<q-btn type="submit" color="primary" label="Salvar"></q-btn>
						<q-btn flat v-close-popup>Cancelar</q-btn>
					</q-card-section>
				</q-form>
			</q-card>
		</q-dialog>

		<q-dialog v-model="dialogUpdateTipo" persistent>
			<q-card style="width: 700px; max-width: 80vw">
				<q-form @submit.prevent="updateTipoMaterial()">
					<q-card-section>
						<div class="text-h6">Editar Tipo Material</div>
					</q-card-section>

					<q-separator></q-separator>

					<q-card-section>
						<label class="text-weight-medium">Tipo:</label>
						<q-input
							v-model="state.tipoForm.nome"
							outlined
							lazy-rules
							:rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"
						/>
					</q-card-section>

					<q-separator></q-separator>
					<q-card-section class="q-gutter-sm q-pl-sm q-py-sm">
            <q-btn type="submit" color="primary" label="Salvar"></q-btn>
						<q-btn @click="openRemoveDialogTipo()" type="submit" color="negative" label="Remover"></q-btn>
						<q-btn flat v-close-popup>Cancelar</q-btn>
					</q-card-section>
				</q-form>
			</q-card>
		</q-dialog>

    <q-dialog v-model="dialogRemoveTipo" persistent>
    <q-card class="text-center q-pt-md q-pb-lg" style="width: 450px; max-width: 80vw;">
      <q-card-section>
        <q-icon name="o_error_outline" color="primary" size="90px"></q-icon>
        <div class="q-mt-md text-h6">Você tem certeza que deseja excluir o tipo de material?</div>
        <div class="text-subtitle text-grey">Essa ação não poderá ser revertida, deseja confirmar?</div>
      </q-card-section>

      <q-card-section class="q-gutter-xl q-pl-sm q-py-sm">
        <q-btn outline color="primary" class="shadow-1" v-close-popup>Cancelar</q-btn>
        <q-btn @click="removeTipoMaterial()" color="primary" label="Confirmar"></q-btn>
      </q-card-section>
    </q-card>
    </q-dialog>

  </div>
</template>

<style scoped></style>
