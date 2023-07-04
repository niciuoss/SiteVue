<script setup lang="ts">import { inject, onMounted, reactive, ref } from 'vue';
import ServiceFactory from '@/factory/ServiceFactory';
import Usuario from '@/models/Usuario';
import Papel from '@/models/Papel';
import { useRouter } from 'vue-router';

const router = useRouter();

const serviceFactory = inject("serviceFactory") as ServiceFactory;

const state = reactive<{ usuario: Usuario, papeis: Papel[]}>({ usuario: new Usuario(), papeis: [] })

async function create() {
  await serviceFactory.createUsuarioService().create(state.usuario);
  router.push({name: 'Usuario.gerenciamento'})
}


onMounted(async () => {
  state.papeis = await serviceFactory.createPapelService().find();
})
</script>

<template>
	<q-card flat class="quixada-bg-grey">
		<q-card-section>
			<div class="text-h5 text-weight-medium">Cadastrar Usuário</div>
		</q-card-section>

		<q-card-section>
      <q-form @submit="create()" class="row q-col-gutter-x-lg q-col-gutter-y-lg">
				<div class="col-4">
					<label class="text-weight-medium">Papel:</label>
          <q-select
            v-model="state.usuario.papel"
            :options="state.papeis"
            option-label="description"
            option-value="id"
            map-options
            outlined
          />
				</div>

        <div class="col-8"></div>

        <div class="col-8">
          <label class="text-weight-medium">Nome:</label>
          <q-input v-model="state.usuario.username" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"></q-input>
        </div>
        <div class="col-4">
          <label class="text-weight-medium">CPF:</label>
          <q-input v-model="state.usuario.cpf" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"></q-input>
        </div>

        <div class="col-8">
          <label class="text-weight-medium">Email:</label>
          <q-input v-model="state.usuario.email" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"></q-input>
        </div>
        <div class="col-4">
          <label class="text-weight-medium">Telefone:</label>
          <q-input v-model="state.usuario.telefone" outlined></q-input>
        </div>


				<div>
					<q-btn label="Salvar" type="submit" color="primary" />
				</div>

      </q-form>
		</q-card-section>
  </q-card>

</template>
