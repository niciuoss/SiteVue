<script setup lang="ts">
import { ref } from 'vue';
import { useAuthStore } from '../../stores/AuthStore';
import NotificacaoContainer from '../Notificacao/NotificacaoContainer.vue';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';

const leftDrawerOpen = ref(false);

function toggleLeftDrawer() {
	leftDrawerOpen.value = !leftDrawerOpen.value;
}

function aumentarTamanho(){
	var fonte: any;

	fonte = document.getElementById('body')

	const fonteReal = fonte.style.fontSize.replace("px", "");
	
	fonte.style.fontSize = "16px"
	fonte.style.fontSize = parseInt(fonteReal) + parseInt("1") + "px"
}

function diminuirTamanho(){
	var fonte: any;

	fonte = document.getElementById('body')

	const fonteReal = fonte.style.fontSize.replace("px", "");

	fonte.style.fontSize = "16px";
	fonte.style.fontSize = parseInt(fonteReal) + parseInt("-1") + "px"
}

function tamanhoNormal(){
	var fonte: any;

	fonte = document.getElementById('body')

	const fonteReal = fonte.style.fontSize.replace("px", "");

	fonte.style.fontSize = "16px";
}

const authStore = useAuthStore();

</script>

<template>
	<q-layout view="hHh Lpr lFf">
		
		<q-header elevated>
			<q-toolbar>
				<q-btn
					flat
					dense
					round
					icon="o_menu"
					aria-label="Menu"
					@click="toggleLeftDrawer"
				/>
				
				<q-toolbar-title class="text-center">
					<q-img src="../../assets/logo.png" style="max-width: 50px"/>
				</q-toolbar-title>
				
				<q-btn 
					aria-label="Aumentar tamanho da fonte"
					icon="o_text_increase"
					@click="aumentarTamanho"
				 >
				</q-btn>
				
				<q-btn
				aria-label="Normalizar tamanho da fonte"
				icon="o_font_download"
				@click="tamanhoNormal"
				></q-btn>

				<q-btn
					aria-label="Diminuir tamanho da fonte"
					icon="o_text_decrease"
					@click="diminuirTamanho"
				>
				</q-btn>

				

				<q-btn
					stretch
					flat
					icon="o_account_circle"
					:label="authStore.session.username?.split(' ')[0]"
					icon-right="o_arrow_drop_down"
				>
					<q-menu fit>
						<q-list>
							<q-item :to="{ name: 'Perfil'}" clickable>
								<q-item-section>Perfil</q-item-section>
							</q-item>
							<q-separator />
							<q-item  @click="authStore.logout()" clickable>
								<q-item-section>Sair</q-item-section>
							</q-item>
							
						</q-list>
					</q-menu>
				</q-btn>
			</q-toolbar>
		</q-header>

		<q-drawer class="bg-primary text-white" v-model="leftDrawerOpen" show-if-above bordered>
			<q-list>
				<q-item :to="{ name: 'Visao.geral'}" clickable>
					<q-item-section avatar>
						<q-icon name="o_dashboard" />
					</q-item-section>

					<q-item-section>
						<q-item-label>Visão Geral</q-item-label>
					</q-item-section>
				</q-item>

				<q-expansion-item expand-separator icon="o_add" label="Entradas" >
					<q-item :to="{ name: 'Entrada.cadastro'}" :inset-level="1" clickable>
						<q-item-section>Cadastrar Entrada</q-item-section>
					</q-item>
					<q-item :to="{ name: 'Entrada.gerenciamento'}" :inset-level="1" clickable>
						<q-item-section> Gerenciar Entradas</q-item-section>
					</q-item>
				</q-expansion-item>

				<q-expansion-item expand-separator icon="o_remove" label="Saídas">
					<q-item :to="{ name: 'Saida.cadastro'}" :inset-level="1" clickable>
						<q-item-section>Cadastrar Saída</q-item-section>
					</q-item>
					<q-item :to="{ name: 'Saida.gerenciamento'}" :inset-level="1" clickable>
						<q-item-section> Gerenciar Saídas</q-item-section>
					</q-item>
				</q-expansion-item>

				<q-expansion-item expand-separator icon="o_maps_home_work" label="Fornecedor">
					<q-item :to="{ name: 'Fornecedor.cadastro'}" :inset-level="1" clickable>
						<q-item-section>Cadastrar Fornecedor</q-item-section>
					</q-item>
					<q-item :to="{ name: 'Fornecedor.gerenciamento'}" :inset-level="1" clickable>
						<q-item-section> Gerenciar Fornecedor</q-item-section>
					</q-item>
				</q-expansion-item>

				<q-item :to="{ name: 'Transporte.gerenciamento'}" clickable>
					<q-item-section avatar>
						<q-icon name="o_local_shipping" />
					</q-item-section>
					
					<q-item-section>
						<q-item-label>Transporte</q-item-label>
					</q-item-section>
				</q-item>

				<q-item :to="{ name: 'Parametrizacao.gerenciamento'}" clickable>
					<q-item-section avatar>
						<q-icon name="o_settings" />
					</q-item-section>
					
					<q-item-section>
						<q-item-label>Parametrização</q-item-label>
					</q-item-section>
				</q-item>

        <q-expansion-item expand-separator icon="o_manage_accounts" label="Usuários">
					<q-item :to="{ name: 'Usuario.cadastro'}" :inset-level="1" clickable>
						<q-item-section>Cadastrar Usuário</q-item-section>
					</q-item>
					<q-item :to="{ name: 'Usuario.gerenciamento'}" :inset-level="1" clickable>
						<q-item-section> Gerenciar Usuários</q-item-section>
					</q-item>
				</q-expansion-item>

			</q-list>
		</q-drawer>
		<q-page-container class="q-ml-lg q-mr-lg">
			<q-breadcrumbs class="q-ml-md q-mt-md" v-if="0">
				<q-breadcrumbs-el label="Administração" />
				<q-breadcrumbs-el label="Visão Geral" />
				<q-breadcrumbs-el label="Breadcrumbs" />
				<q-breadcrumbs-el label="Breadcrumbs" />
			</q-breadcrumbs>
			
			<NotificacaoContainer></NotificacaoContainer>
			<router-view></router-view>
		</q-page-container>
	</q-layout>
</template>