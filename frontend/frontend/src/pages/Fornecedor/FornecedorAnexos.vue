<script setup lang="ts">
import ServiceFactory from '@/factory/ServiceFactory';
import Fornecedor from '@/models/Fornecedor';
import { inject, onMounted, reactive, ref } from 'vue';
import { useRouter } from 'vue-router';
import Arquivo from '@/models/Arquivo';
const router = useRouter();

const serviceFactory = inject("serviceFactory") as ServiceFactory;
const state = reactive<{ fornecedor: Fornecedor, filesUploaded: Arquivo[],  fileDelete: any }>({ fornecedor: new Fornecedor(), filesUploaded: [], fileDelete: null });

const columns = ref([{}])
const baseUrl = ref()
const loadingUpdate = ref(false)
const confirmar = ref(false)

const props = defineProps({
  	fornecedorId: {type: Number, required: true},
})

onMounted(async () => {
	await getAnexos()
	columns.value = [
		{
			name: 'NOME',
			required: true,
			label: 'Nome',
			align: 'left',
			field: row => row.nome,
			format: val => `${val}`,
			sortable: true
		},
		{ name: 'actions', align: 'right', label: '', field: '', sortable: false },
	]
	baseUrl.value = await serviceFactory.createUploadService().getUrlBase()
});

async function getAnexos() {
	const fornecedor = await serviceFactory.createFornecedorService().findOne(props.fornecedorId);
	state.fornecedor = fornecedor
}

function alertaDeletar(row: any){
    confirmar.value = true
    state.fileDelete = row
}

async function deletar(){
	let deletarArquivo = await serviceFactory.createArquivoService().delete(state.fileDelete.id)
	if(!deletarArquivo){
		return null
	}
	let deletarUpload = await serviceFactory.createUploadService().delete(state.fileDelete.id_media)
	if(deletarUpload){
		getAnexos()
	}
}

async function uploadFile(){
    loadingUpdate.value = true
	state.filesUploaded = await serviceFactory.createUploadService().upload(file.value)
	const arquivosUploaded = await serviceFactory.createArquivoService().create(state.filesUploaded)
	await serviceFactory.createFornecedorService().insertFile(arquivosUploaded, props.fornecedorId)
	file.value = null
    loadingUpdate.value = false
	getAnexos()
}

const file = ref(null)
</script>
<template>
	<q-card flat class="quixada-bg-grey">
		<q-card-section>
			<div class="text-h5 text-weight-medium">Gerenciar Anexos</div>
		</q-card-section>
		<q-card-section>
		<q-form class="row q-col-gutter-x-lg q-col-gutter-y-lg">
			<div class="col-10">
				<label class="text-weight-medium">Anexos:</label>
				<div class="row">
					<div class="col-10">
						<q-file filled bottom-slots v-model="file" label="Selecionar Arquivo" multiple>
							<!--<template v-slot:append>
								<q-icon v-if="file !== null" name="close" @click.stop.prevent="file = null" class="cursor-pointer" />
								<q-icon name="create_new_folder" @click.stop.prevent />
							</template>
							-->
							<template v-slot:after>
								<q-btn @click="uploadFile" class="full-height" color="primary" :disabled="loadingUpdate">
								<div v-if="loadingUpdate">
									<q-circular-progress 
										reverse
										indeterminate
										size="18px"
										color="light-blue"
										class="q-ma-md"
									/>
								</div>
								<div v-else>
									Enviar
								</div>
								</q-btn>
							</template>
						</q-file>
						<q-dialog v-model="confirmar" persistent>
							<q-card>
								<q-card-section class="row items-center">
									<q-avatar icon="o_delete" color="primary" text-color="white" />
									<span class="q-ml-sm">Deseja excluir o arquivo {{ state.fileDelete.nome }}?.</span>
								</q-card-section>
								<q-card-actions align="right">
									<q-btn flat label="Cancelar" color="primary" v-close-popup />
									<q-btn flat label="Confirmar" color="primary" @click="deletar()" v-close-popup />
								</q-card-actions>
							</q-card>
						</q-dialog>
					</div>
				</div>
			</div>
		</q-form>
		</q-card-section>
		<q-separator ></q-separator>
		<div class="q-pa-md">
			<q-table
			title="Anexos"
			:rows="state.fornecedor.arquivos"
			:columns="columns"
			row-key="nome"
			>
				<template v-slot:body="props">
					<q-tr :props="props">
						<q-td key="NOME" :props="props">
							<a :href="baseUrl+props.row.url" target="_blank">{{props.row.nome}}</a>
						</q-td>
                        <q-td key="actions" :props="props">
                            <q-btn round flat icon="o_delete" @click="alertaDeletar(props.row)"></q-btn>
                        </q-td>
					</q-tr>
				</template>
			</q-table>
		</div>
  </q-card>

</template>

<style lang="sass" scoped></style>
