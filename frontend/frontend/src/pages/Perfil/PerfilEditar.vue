<script setup lang="ts">import { inject, onMounted, reactive, ref } from 'vue';
import ServiceFactory from '@/factory/ServiceFactory';
import Usuario from '@/models/Usuario';
import Papel from '@/models/Papel';
import { useRouter } from 'vue-router';

const router = useRouter();

const props = defineProps({
  usuarioId: {type: Number, required: true},
})

const serviceFactory = inject("serviceFactory") as ServiceFactory;

const state = reactive<{ usuario: Usuario, papeis: Papel[], changePassword: any}>({
  usuario: new Usuario(),
  papeis: [],
  changePassword: { currentPassword: "", password: "", passwordConfirmation: ""}
})

async function update() {
  const usuarioPerfil = new Usuario()
  usuarioPerfil.id = state.usuario.id
  usuarioPerfil.username = state.usuario.username
  usuarioPerfil.email = state.usuario.email
  usuarioPerfil.telefone = state.usuario.telefone
  await serviceFactory.createUsuarioService().update(usuarioPerfil);
  router.push({name: 'Perfil'})
}

async function updateSenha() {
  await serviceFactory.createAuthService().changePassword(state.changePassword);
}


onMounted(async () => {
  const usuario = await serviceFactory.createUsuarioService().me();
  state.usuario = usuario
})

const value = ref('aaa')
</script>

<template>
	<q-card flat class="quixada-bg-grey">
		<q-card-section>
			<div class="text-h5 text-weight-medium">Perfil</div>
		</q-card-section>

		<q-card-section>
      <q-form @submit="update()" class="row q-col-gutter-x-lg q-col-gutter-y-lg">
				<div class="col-6">
					<label class="text-weight-medium">Papel:</label>
          <q-select
            v-model="state.usuario.papel"
            option-label="description"
            option-value="id"
            map-options
            outlined
            readonly
          />
				</div>

        <div class="col-6">
          <label class="text-weight-medium">CPF:</label>
          <q-input v-model="state.usuario.cpf" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']" readonly></q-input>
        </div>

        <div class="col-12">
          <label class="text-weight-medium">Nome:</label>
          <q-input v-model="state.usuario.username" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"></q-input>
        </div>

        <div class="col-6">
          <label class="text-weight-medium">Email:</label>
          <q-input v-model="state.usuario.email" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"></q-input>
        </div>
        <div class="col-6">
          <label class="text-weight-medium">Telefone:</label>
          <q-input v-model="state.usuario.telefone" outlined></q-input>
        </div>


				<div>
					<q-btn label="Atualizar perfil" type="submit" color="primary" />
				</div>

      </q-form>
		</q-card-section>

		<q-card-section>
			<div class="text-h5 text-weight-medium">Alterar senha</div>
		</q-card-section>


		<q-card-section>
      <q-form @submit="updateSenha()" class="row q-col-gutter-x-lg q-col-gutter-y-lg">
				<div class="col-4">
					<label class="text-weight-medium">Senha atual:</label>
          <q-input v-model="state.changePassword.currentPassword" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"></q-input>
				</div>

        <div class="col-4">
					<label class="text-weight-medium">Nova senha:</label>
          <q-input v-model="state.changePassword.password" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"></q-input>
				</div>
				<div class="col-4">
					<label class="text-weight-medium">Repetir nova senha:</label>
          <q-input v-model="state.changePassword.passwordConfirmation" outlined lazy-rules :rules="[(val) => (val && val.length > 0) || 'Campo obrigatório']"></q-input>
				</div>

				<div>
					<q-btn label="Alterar senha" type="submit" color="primary" />
				</div>

      </q-form>
		</q-card-section>


  </q-card>

</template>
