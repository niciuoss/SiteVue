<script setup lang="ts">
import ServiceFactory from '@/factory/ServiceFactory';
import Fornecedor from '@/models/Fornecedor';
import { inject, onMounted, reactive, ref } from 'vue';
import { useRouter } from 'vue-router';
const router = useRouter();

const serviceFactory = inject("serviceFactory") as ServiceFactory;
const state = reactive<{ fornecedor: Fornecedor }>({ fornecedor: new Fornecedor() });

const props = defineProps({
  fornecedorId: {type: Number, required: true},
})

const optionsDestinatario = [
	{
		label: 'Sim',
		value: true
	},
	{
		label: 'Não',
		value: false
	},
]

onMounted(async () => {
  const fornecedor = await serviceFactory.createFornecedorService().findOne(props.fornecedorId);
  state.fornecedor = fornecedor
});

async function update() {
  await serviceFactory.createFornecedorService().update(state.fornecedor);
  router.push({name: 'Fornecedor.gerenciamento'})
}

const estados = ref(
[
  "Acre",
  "Alagoas",
  "Amapá",
  "Amazonas",
  "Bahia",
  "Ceará",
  "Distrito Federal",
  "Espírito Santo",
  "Goiás",
  "Maranhão",
  "Mato Grosso",
  "Mato Grosso do Sul",
  "Minas Gerais",
  "Pará",
  "Paraíba",
  "Paraná",
  "Pernambuco",
  "Piauí",
  "Rio de Janeiro",
  "Rio Grande do Norte",
  "Rio Grande do Sul",
  "Rondônia",
  "Roraima",
  "Santa Catarina",
  "São Paulo",
  "Sergipe",
  "Tocantins",
])

const file = ref(null)
</script>

<template>
	<q-card flat class="telite-bg-grey">
		<q-card-section>
			<div class="text-h5 text-weight-medium">Editar Fornecedor</div>
		</q-card-section>
    <q-card-section>
      <q-form @submit="update()" class="row q-col-gutter-x-lg q-col-gutter-y-lg">
        <div class="col-4">
          <label class="text-weight-medium">Tipo de Fornecedor:</label>
          <div class="q-gutter-sm">
            <q-radio v-model="state.fornecedor.tipo" val="FORNECEDOR" label="Fornecedor" />
            <q-radio v-model="state.fornecedor.tipo" val="PEV" label="PEV" />
            <q-radio v-model="state.fornecedor.tipo" val="DOACAO" label="Doação" />
          </div>
        </div>
        <div class="col-8">
          <label class="text-weight-medium">Destinatário:</label>
          <div>
            <q-option-group v-model="state.fornecedor.isDestinatario" :options="optionsDestinatario" color="primary" inline/>
          </div>
        </div>

				<div class="col-8">
					<label class="text-weight-medium">Nome:</label>
					<q-input v-model="state.fornecedor.nome" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"/>
				</div>

				<div class="col-4">
					<label class="text-weight-medium">CPF/CNPJ:</label>
					<q-input
						v-model="state.fornecedor.cnpjcpf"
						outlined
						lazy-rules
						:rules="[(val) => (state.fornecedor.tipo == 'DOACAO' || val && val.length > 0) || 'Campo obrigatório']"
					/>
				</div>

				<div class="col-8">
					<label class="text-weight-medium">Email:</label>
					<q-input
						v-model="state.fornecedor.email"
						outlined
						lazy-rules
						:rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"
					/>
				</div>

				<div class="col-4">
					<label class="text-weight-medium">Telefone:</label>
					<q-input
						v-model="state.fornecedor.telefone"
						outlined
						lazy-rules
					/>
				</div>

				<div class="col-2">
					<label class="text-weight-medium">CEP:</label>
					<q-input
						v-model="state.fornecedor.cep"
						outlined
						lazy-rules
					/>
				</div>
				<div class="col-6">
					<label class="text-weight-medium">Rua:</label>
					<q-input
						v-model="state.fornecedor.rua"
						outlined
						lazy-rules
						:rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"
					/>
				</div>
				<div class="col-4">
					<label class="text-weight-medium">Número:</label>
					<q-input
						v-model="state.fornecedor.numero"
						outlined
						lazy-rules
						:rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"
					/>
				</div>

        <div class="col-2">
					<label class="text-weight-medium">Bairro:</label>
					<q-input
						v-model="state.fornecedor.bairro"
						outlined
						lazy-rules
						:rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"
					/>
				</div>
				<div class="col-6">
					<label class="text-weight-medium">Cidade:</label>
					<q-input
						v-model="state.fornecedor.cidade"
						outlined
						lazy-rules
						:rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"
					/>
				</div>
				<div class="col-4">
					<label class="text-weight-medium">Estado:</label>
          <q-select
            v-model="state.fornecedor.estado"
            :options="estados"
            outlined lazy-rules
            :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"
          />
				</div>

        <div class="col-2">
					<label class="text-weight-medium">Horário da Coleta:</label>
					<q-input
						v-model="state.fornecedor.horarioColeta"
						outlined
					>
          <template v-slot:prepend><q-icon name="o_schedule"/></template>
        </q-input>
				</div>

        <div class="col-10"></div>

				<div>
					<q-btn label="Salvar" type="submit" color="primary" />
				</div>

      </q-form>
    </q-card-section>
  </q-card>

</template>

<style lang="sass" scoped></style>
