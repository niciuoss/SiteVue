<script setup lang="ts">
import { inject, onMounted, reactive, ref } from 'vue';
import Usuario from '@/models/Usuario';
import ServiceFactory from '@/factory/ServiceFactory';

const serviceFactory = inject("serviceFactory") as ServiceFactory;

const state = reactive<{ usuarios: Usuario[] }>({ usuarios: [] });

onMounted(async () => {
   const {usuarios} = await serviceFactory.createUsuarioService().find();
   state.usuarios = usuarios
});

const columns = [
{ name: 'username', align: 'left', label: 'Nome', field: 'username', sortable: true },
{ name: 'cpf', align: 'left', label: 'CPF', field: 'cpf', sortable: false },
{ name: 'email', align: 'left', label: 'Email', field: 'email', sortable: false },
{ name: 'telefone', align: 'left', label: 'Telefone', field: 'telefone', sortable: false },
{ name: 'role.name', align: 'left', label: 'Papel', field: 'role.email', sortable: false },

{ name: 'actions', align: 'right', label: '', field: '', sortable: false },
]


</script>

<template>
	<q-card flat class="quixada-bg-grey">
		<q-card-section>
			<div class="text-h5 text-weight-medium">Usuários</div>
		</q-card-section>

    <q-card-section>
      <q-table :rows="state.usuarios" :columns="columns">
        <template v-slot:body="props">
          <q-tr :props="props">
            <q-td key="username" :props="props">
              {{ props.row.username }}
            </q-td>
            <q-td key="cpf" :props="props">
              {{ props.row.cpf }}
            </q-td>
            <q-td key="email" :props="props">
              {{ props.row.email }}
            </q-td>
            <q-td key="telefone" :props="props">
              {{ props.row.telefone }}
            </q-td>
            <q-td key="role.name" :props="props">
              {{ props.row.role.name }}
            </q-td>

            <q-td key="actions" :props="props">
              <q-btn aria-label="Editar" :to="{ name: 'Usuario.editar', params: {usuarioId: props.row.id} }" round flat icon="o_edit"></q-btn>
            </q-td>
          </q-tr>
        </template>

      </q-table>
		</q-card-section>
	</q-card>
</template>

