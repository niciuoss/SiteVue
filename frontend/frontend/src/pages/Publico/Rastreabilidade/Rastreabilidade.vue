<script setup lang="ts">
import { onMounted, reactive, inject } from 'vue';
import { fabBlogger, fabFacebookSquare, fabInstagramSquare } from '@quasar/extras/fontawesome-v5'
import ServiceFactory from '@/factory/ServiceFactory';
import Saida from '@/models/Saida';

const serviceFactory = inject("serviceFactory") as ServiceFactory;

const state = reactive<{ saida: any }>({ saida: null });

const props = defineProps({
  code: {type: String, required: true},
})
onMounted(async () => {
	state.saida = await serviceFactory.createSaidaService().rastreio(props.code)
});

</script>

<template>
  <q-layout view="hhh lpR fFf" v-if="state.saida?.nome_produto != null">
	
    <q-header reveal class="bg-primary text-white">
      	<q-toolbar>
        	<q-toolbar-title class="q-pt-md">
				<q-toolbar-title class="text-center">
					<a href="https://www.quixada.com.br" target="_blank"><q-img src="../../../assets/logo.png" style="max-width: 50px"/></a>
				</q-toolbar-title>
        	</q-toolbar-title>
      	</q-toolbar>
		<p class="q-mt-sm q-mb-xs text-caption text-center">Para fabricar o produto:</p> 
		<p class="q-my-xs text-h5 text-center text-weight-bolder">{{ state.saida?.nome_produto }}</p> 
		<p class="q-mt-md q-mb-xs text-caption text-center">foram necessários:</p> 
		<p class="q-my-xs text-h4 text-center text-weight-bolder">{{ state.saida?.quantidade_material }} kg</p> 
		<p class="q-my-xs text-h5 text-center text-weight-light">de {{ state.saida?.tipo_material }}</p> 
		
    </q-header>

    <q-page-container>
		<div class="row">
			<div class="col col-sm-2 col-lg-3">
			</div>
			<div class="col col-xs-12 col-sm-8 col-lg-6">
				<div class="q-mt-lg text-center text-primary">
					Contribuintes de resíduos para essa fabricação:
					<div class="q-mx-lg" v-for="item in state.saida?.material_items">
						<q-list class="q-mx-lg q-my-lg" bordered separator>
							<q-item class="text-left item">
								<q-item-section class="text-weight-bolder">{{ item.fornecedor }}</q-item-section>
								<q-item-section side>{{ item.quantidade }} kg</q-item-section>
							</q-item>
						</q-list>
					</div>
				</div>
			</div>
		</div>
		
		
    </q-page-container>
    <q-footer style="background: #f1f1f1" class="text-primary text-center">
	  <a href="https://blog.quixada.com.br" target="_blank"><q-icon class="q-mx-xs q-my-md" :name="fabBlogger" color="primary" size="32px" /></a>
	  <a href="https://www.facebook.com/telhasquixada/" target="_blank"><q-icon class="q-mx-xs q-my-md" :name="fabFacebookSquare" color="primary" size="32px" /></a>
	  <a href="https://www.instagram.com/telhasquixada" target="_blank"><q-icon class="q-mx-xs q-my-md" :name="fabInstagramSquare" color="primary" size="32px" /></a>
	  <div class="bg-primary text-white text-weight-light q-py-lg text-center">*Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s*</div>
    </q-footer>

  </q-layout>
</template>
<style>
	.item{
		border-left: 5px solid #06404F
	}
</style>