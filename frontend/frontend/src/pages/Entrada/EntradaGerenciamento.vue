<script setup lang="ts">import { inject, onMounted, reactive, ref} from 'vue';
import { FilterEntrada } from '@/models/FilterEntrada'
import Entrada from '@/models/Entrada';
import Pagination from '@/models/Pagination';
import ServiceFactory from '@/factory/ServiceFactory';
import CategoriaMaterial from '@/models/CategoriaMaterial';
import TipoMaterial from '@/models/TipoMaterial';
import Relatorio from '../Relatorio/Relatorio.vue';
import 'jspdf-autotable';
import jsPDF from 'jspdf'

const serviceFactory = inject("serviceFactory") as ServiceFactory;

const state = reactive<{
  entradas: Entrada[]
  pagination: Pagination
  filterEntrada: FilterEntrada,
  categorias: CategoriaMaterial[],
  tiposFornecedores: string[]
}>({
  entradas: [],
  pagination: new Pagination(),
  filterEntrada: new FilterEntrada(),
  categorias: [],
  tiposFornecedores: ['FORNECEDOR', 'PEV', 'DOACAO'],
});

const columns = [
{ name: 'categoriaMaterial', align: 'left', label: 'Categoria', field: 'categoriaMaterial', sortable: true },
{ name: 'tipoMaterial', align: 'left', label: 'Tipo', field: 'tipoMaterial', sortable: true },
{ name: 'quantidade', align: 'center', label: 'Quantidade (kg)', field: 'quatidade', sortable: true },
{ name: 'status', align: 'center', label: 'Status', field: 'status', sortable: true },
{ name: 'dataSaida', align: 'center', label: 'Data de saída', field: 'dataSaida', sortable: true },
]

const searchEntradas = async () => {
  loadEntradas()
  console.log(state.filterEntrada)
}

async function loadEntradas() {
  const { entradas, pagination } = await serviceFactory.createEntradaService().find(state.pagination, state.filterEntrada.fn());
  state.entradas = entradas
  state.pagination = pagination
  clearFiles()
}

function clearFiles(){
  for(const entrada of state.entradas){
    for(const file of entrada.arquivos){
      const index = entrada.arquivos.indexOf(file)
      if(file.extensao == ".pdf"){
        entrada.arquivos.splice(index, 1);
      }
    }
  }
}

onMounted(async () => {
  await loadEntradas()
  const categorias = await serviceFactory.createMaterialService().find();
  state.categorias = categorias
  baseUrl.value = await serviceFactory.createUploadService().getUrlBase();
});

const verImagem = (index: any) => {
  carousel.value = true
  indexImages.value = index
  slide.value = state.entradas[index].arquivos[0].id
  maximizedToggle.value = true
}

let carousel = ref(false)
let slide = ref(1)
let indexImages = ref(0)
let baseUrl = ref()
let maximizedToggle = ref(false)

// RELATORIO = TERMO DE DESCARTE", "AMBIENTALMENTE CORRETO

const heading = ref(["TERMO DE DESCARTE", "AMBIENTALMENTE CORRETO"])

const texto = ref([
  "E que o(s) mesmo(s) est(ão) sendo doado(s) espontanaemente, sem coação ou vício de consentimento, a título gratuito, por livre e espontenea vontade, e estou apto para esta doação.", 
  "Solicito que todas as informações pessoais contidas nos mesmos devem ser apagadas. "
])

const destinatario = ref([
  "DONATÁRIO: Prefeitura, sediada no endereço Rua Orlando Mariosa, 87, Reta. CEP:63870000, Comendador Levy Gasparian, Quixadá. Identificada com CNPJ 25325000000192"
])

const acordo = ref([
  "O presente acordo passa a vigor entre ambas as partes a partir da assinatura do doador, da conferência dos resíduos pelo donatário, e da aassintura do donatário e testemunhas.",
  "Este termo será enviado para o email cadastrado, e podendo ser consultado a qualquer momento pelop doador ou por órgãos de regulação municipal, estudual ou federal."
])

function termoDescartePDF(index) {
  const headerTable = [
    { title: "Categoria", dataKey: "categoria" },
    { title: "Tipo", dataKey: "tipo" },
    { title: "Quantidade", dataKey: "quantidade" }
  ];
  
  const doc = new jsPDF({
    unit: "mm",
    format: "a4",
  })

  // var img = new Image();
  // img.src = 'http://localhost:1337/uploads/logo2_2dffba9d32.png?updated_at=2023-01-22T10:27:59.561Z';
  // doc.addImage(img, 'PNG', 91, 10, 28, 22);


  const entrada = state.entradas[index];
  doc.setFontSize(18).setFont("helvetica", "bold").text(heading.value, 105, 43, { align: "center", maxWidth: 210 });
  doc
    .setFontSize(12)
    .setFont("helvetica", "normal", 400)
    .text("DOADOR: "
      + entrada.fornecedor.nome
      + " inscrito no CPF/CNPJ sob o nº "
      + entrada.fornecedor?.cnpjcpf
      + "e no RG nº,"
      + entrada.fornecedor?.cnpjcpf
      + "residente em domiciliado à "
      + entrada.fornecedor?.rua
      + ", na cidade de "
      + entrada.fornecedor?.cidade  
      + ". Abaixo assinado, atestado para os devidos fins, a título de doação os produtos com as seguintes características."
      , 10, 65, { align: "justify", maxWidth: 190});

  doc.autoTable({ 
    body: entrada.material_items.map(item => {
      return {categoria: item.categoria_material.nome, tipo: item.tipo_material?.nome, quantidade: item.quantidade + "kg"}
    }),
    columns: headerTable, 
    margin: { left: 10, top: 90, right: 10 }
  });

  const finalY = doc.autoTable.previous.finalY

  doc.text(texto.value, 10, finalY + 10, { align: "justify", maxWidth: 190 });
  doc.text(destinatario.value, 10, finalY + 30, { align: "justify", maxWidth: 190 });  
  doc.text(acordo.value, 30, finalY + 50, { align: "justify", maxWidth: 170 });
  doc.text("Comendador Levy Gasparian, "+ entrada.criadoEm(), 200, finalY + 100, { align: "right", maxWidth: 190 });


  
  doc.setFillColor(200, 200, 200).rect(10, doc.internal.pageSize.height - 18, 190, 6, 'F'); // caixa 

  doc
    .setFont("times")
    .setFontSize(11)
    .setTextColor(0, 0, 255)
    .text("Código de controle para validação: 2608.2022.E68S.N248", 105, doc.internal.pageSize.height - 14, { align: "center", maxWidth: 210 })

  doc
    .setFont("times")
    .setFontSize(11)
    .setTextColor(50, 50, 50)
    .text("Consultar autenticidade via: sistema.quixada.com.br"
    + " - Relatório gerado pelo sistema Quixadá ®"
    , 105, doc.internal.pageSize.height - 6, { align: "center", maxWidth: 210 })

  doc.output("dataurlnewwindow");
}

// RELATORIO = TERMO DE DESCARTE", "AMBIENTALMENTE CORRETO

/////////////////////////////////////////////////////////////

// RELATORIO = MTR

function mtrPDF(index) {

  const headerTable = [
    { title: "Tipo", dataKey: "tipo" },
    { title: "Quantidade", dataKey: "quantidade" }
  ];
  
  const doc = new jsPDF({
    unit: "mm",
    format: "a4",
  })

  // var img = new Image();
  // img.src = 'http://localhost:1337/uploads/logo2_2dffba9d32.png?updated_at=2023-01-22T10:27:59.561Z';
  // doc.addImage(img, 'PNG', 91, 10, 28, 22);


  const entrada = state.entradas[index];

  doc.setFontSize(18).setFont("helvetica", "bold").text("Manifesto de Transporte de Resíduos", 105, 43, { align: "center", maxWidth: 210 });

  doc
    .setFontSize(10)
    .setFont("helvetica", "normal", 400)
    .text("Numero do MTR: "
    + entrada.id
    + "       Data: "
    + entrada.criadoEm()
    , 105, 50, { align: "center", maxWidth: 190});

  doc
    .setFillColor(131, 217, 218) // cor de fundo da caixa (secondary)
    .rect(10, 55, 190, 8, 'F'); // caixa

  doc
    .setFontSize(12)
    .setFont("helvetica", "normal", 700)
    .text("DESCRIÇÃO DE RESÍDUOS: ", 15, 60, { align: "left", maxWidth: 190});

  doc.autoTable({
    body: entrada.material_items.map(item => {
      return {tipo: item.tipo_material?.nome, quantidade: item.quantidade + "kg"}
    }),
    columns: headerTable,
      columnStyles: {
      0: { cellWidth: 99 },
      1: { cellWidth: 91 },
    },
    margin: { left: 9, top: 65, right: 10 },
    alternateRowStyles: {fillColor : [255, 255, 255]},
    didDrawCell: (data) => {
        data.cell.styles.cellWidth = 'auto';
    },
    headerStyles: {      
      fillColor: [255, 255, 255],
      textColor: [10, 10, 10],
    },
  });

  const finalY = doc.autoTable.previous.finalY - 5

  doc.setFillColor(131, 217, 218).rect(10, finalY + 10, 190, 8, 'F'); // caixa
  doc.setFontSize(12).setFont("helvetica", "normal", 700).text("GERADOR: ", 15, finalY + 15, { align: "left", maxWidth: 190});

  doc.setFontSize(10).setFont("helvetica", "normal", 400).text("Razão Social: " + "Levy PLástico Ltda - 25325000000192", 10, finalY + 25, { align: "left", maxWidth: 90 });
  doc.text("Ramo de Atividade: " + "Tipo", 10, finalY + 31, { align: "left", maxWidth: 90 });
  doc.text("Endereço: " + "Orlando Mariosa - 87 - Reta - 25870000", 10, finalY + 37, { align: "left", maxWidth: 90 });
  doc.text("Município: " + "Comendador Levy Gasparian", 10, finalY + 43, { align: "left", maxWidth: 90 });
  doc.text("Responsável: " + "Leonardo Marinho Retto - Sócio", 10, finalY + 49, { align: "left", maxWidth: 90 });
  doc.text("Assinatura: " + "_______________________________", 10, finalY + 55, { align: "left", maxWidth: 90 });

  doc.text("Licença de Operação: " + "-", 110, finalY + 25, { align: "left", maxWidth: 90 });
  doc.text("Vencimento da Licença de Operação: " + "-", 110, finalY + 31, { align: "left", maxWidth: 90 });
  doc.text("Estado: " + "Rio de Janeiro", 110, finalY + 37, { align: "left", maxWidth: 90 });
  doc.text("Telefone: " + "2422541045", 110, finalY + 43, { align: "left", maxWidth: 90 });

  doc.setFillColor(131, 217, 218).rect(10, finalY + 60, 190, 8, 'F'); // caixa
  doc.setFontSize(12).setFont("helvetica", "normal", 700).text("TRANSPORTADOR: ", 15, finalY + 65, { align: "left", maxWidth: 190});

  doc.setFontSize(10).setFont("helvetica", "normal", 400).text("Razão Social: " + "", 10, finalY + 75, { align: "left", maxWidth: 90 });
  doc.text("Endereço: " + "", 10, finalY + 81, { align: "left", maxWidth: 90 });
  doc.text("Município: " + "", 10, finalY + 87, { align: "left", maxWidth: 90 });
  doc.text("Responsável: " + "", 10, finalY + 93, { align: "left", maxWidth: 90 });
  doc.text("Condutor: " + "-- CNH:-/-", 10, finalY + 99, { align: "left", maxWidth: 90 });
  doc.text("Lacre: " + "", 10, finalY + 105, { align: "left", maxWidth: 90 });
  doc.text("Assinatura: " + "_______________________________", 10, finalY + 111, { align: "left", maxWidth: 90 });

  doc.text("Licença de Operação: " + "-", 110, finalY + 75, { align: "left", maxWidth: 90 });
  doc.text("Vencimento da Licença de Operação: " + "-", 110, finalY + 81, { align: "left", maxWidth: 90 });
  doc.text("Estado: " + "-", 110, finalY + 87, { align: "left", maxWidth: 90 });
  doc.text("Telefone: " + "-", 110, finalY + 93, { align: "left", maxWidth: 90 });
  doc.text("Veículo: " + "-", 110, finalY + 99, { align: "left", maxWidth: 90 });
  doc.text("Placa: " + "-", 110, finalY + 105, { align: "left", maxWidth: 90 });
  doc.text("Placa carreta: " + "-", 110, finalY + 111, { align: "left", maxWidth: 90 });

  doc.setFillColor(131, 217, 218).rect(10, finalY + 115, 190, 8, 'F'); // caixa
  doc.setFontSize(12).setFont("helvetica", "normal", 700).text("Destino Final: ", 15, finalY + 120, { align: "left", maxWidth: 190});

  doc.setFontSize(10).setFont("helvetica", "normal", 400).text("Razão Social: " + "Quixadá - 25325000000192", 10, finalY + 130, { align: "left", maxWidth: 90 });
  doc.text("Endereço: " + "Orlando Mariosa - 87 - Reta", 10, finalY + 136, { align: "left", maxWidth: 90 });
  doc.text("Município: " + "", 10, finalY + 142, { align: "left", maxWidth: 90 });
  doc.text("Responsável: " + "Comendador Levy Gasparian", 10, finalY + 148, { align: "left", maxWidth: 90 });
  doc.text("Assinatura: " + "_______________________________", 10, finalY + 154, { align: "left", maxWidth: 90 });

  doc.text("Licença de Operação: " + "-", 110, finalY + 130, { align: "left", maxWidth: 90 });
  doc.text("Vencimento da Licença de Operação: " + "-", 110, finalY + 136, { align: "left", maxWidth: 90 });
  doc.text("Estado: " + "Rio de Janeiro", 110, finalY + 142, { align: "left", maxWidth: 90 });
  doc.text("Telefone: " + "(24) 22541045", 110, finalY + 148, { align: "left", maxWidth: 90 });

  doc.setFillColor(131, 217, 218).rect(10, finalY + 160, 190, 8, 'F'); // caixa
  doc.setFontSize(12).setFont("helvetica", "normal", 700).text("Observação: ", 15, finalY + 165, { align: "left", maxWidth: 190});

  doc.setFontSize(14).setFont("helvetica", "normal", 400)
    .text("_________________________________________________________________________________________________________________________________________"
    +"___________________________________________________________________________________________________________________________________________"
    , 10, finalY + 175, { align: "left", maxWidth: 190 });

  doc.setFillColor(200, 200, 200).rect(10, doc.internal.pageSize.height - 10, 190, 6, 'F'); // caixa 

  doc
    .setFont("times")
    .setFontSize(11)
    .text("Emitido em: "
    + entrada.criadoEm()
    + " - MTR Gerado pelo sistema Quixadá ®"
    , 105, doc.internal.pageSize.height - 6, { align: "center", maxWidth: 210 })

  doc.output("dataurlnewwindow");
}

// RELATORIO = MRT

</script>

<template>
  <q-card flat class="quixada-bg-grey">
    <q-card-section>
      <q-dialog
        v-model="carousel"
        persistent
        :maximized="maximizedToggle"
        transition-show="slide-up"
        transition-hide="slide-down"
        >
        <q-carousel style="width: 100%;"
          transition-prev="slide-right"
          transition-next="slide-left"
          swipeable
          animated
          infinite
          v-model="slide"
          control-color="primary"
          navigation
          padding
          arrows
          class="bg-white shadow-1 rounded-borders"
        >

          <q-carousel-slide :name="media.id" class="column no-wrap flex-center" v-for="media in state.entradas[indexImages].arquivos">
            <q-bar>
              <q-space />

              <q-btn dense flat icon="o_minimize" @click="maximizedToggle = false" :disable="!maximizedToggle">
                <q-tooltip v-if="maximizedToggle" class="bg-white text-primary">Minimizar</q-tooltip>
              </q-btn>
              <q-btn dense flat icon="o_crop_square" @click="maximizedToggle = true" :disable="maximizedToggle">
                <q-tooltip v-if="!maximizedToggle" class="bg-white text-primary">Maximizar</q-tooltip>
              </q-btn>
              <q-btn dense flat icon="o_close" v-close-popup>
                <q-tooltip class="bg-white text-primary">Fechar</q-tooltip>
              </q-btn>
            </q-bar>
            <q-img :src="baseUrl+media.url" />
          </q-carousel-slide>
        </q-carousel>

      </q-dialog>
      <div class="text-h5 text-weight-medium">Entradas</div>
      <div class="row items-center q-mt-sm q-gutter-x-md">
        <div style="min-width: 200px">
          <q-input label="Inicio" outlined v-model="state.filterEntrada.dataInicial">
            <template v-slot:append>
              <q-icon name="o_event" class="cursor-pointer">
                <q-popup-proxy cover transition-show="scale" transition-hide="scale">
                  <q-date v-model="state.filterEntrada.dataInicial" mask="DD/MM/YYYY">
                    <div class="row items-center justify-end">
                      <q-btn aria-label="Fechar" v-close-popup label="Close" color="primary" flat />
                    </div>
                  </q-date>
                </q-popup-proxy>
              </q-icon>
            </template>
          </q-input>
        </div>

        <div style="min-width: 200px">
          <q-input label="Termino" outlined v-model="state.filterEntrada.dataFinal">
            <template v-slot:append>
              <q-icon name="o_event" class="cursor-pointer">
                <q-popup-proxy cover transition-show="scale" transition-hide="scale">
                  <q-date v-model="state.filterEntrada.dataFinal" mask="DD/MM/YYYY">
                    <div class="row items-center justify-end">
                      <q-btn aria-label="Fechar" v-close-popup label="Close" color="primary" flat />
                    </div>
                  </q-date>
                </q-popup-proxy>
              </q-icon>
            </template>
          </q-input>
        </div>

        <div style="min-width: 200px">
          <q-select label="Categoria" outlined @update:model-value="state.filterEntrada.tipoMaterial = ''" v-model="state.filterEntrada.categoriaMaterial" :options="state.categorias" option-label="nome" option-value="nome" emit-value/>
        </div>

        <div style="min-width: 200px">
          <q-select label="Tipo" outlined v-model="state.filterEntrada.tipoMaterial" :options="state.filterEntrada.categoria?.tipos" option-label="nome" option-value="nome" emit-value/>
        </div>

        <div style="min-width: 200px">
          <q-select label="Tipo Fornecedor" outlined v-model="state.filterEntrada.tipoFornecedor" :options="state.tiposFornecedores"/>
        </div>

        <div style="min-width: 200px">
          <q-input label="Fornecedor" outlined v-model="state.filterEntrada.nomeFornecedor"/>
        </div>

        <div class="col-shrink">
          <q-btn aria-label="Pesquisa Entradas" @click="searchEntradas()" class="q-mt-auto bg-primary text-white vertical-middle	" round flat icon="o_search"></q-btn>
        </div>

      </div>
    </q-card-section>
    <q-card-section class="q-pt-xs">
      <div class="q-pb-lg" v-for="entrada,index in state.entradas" :key="entrada.id">
        <q-expansion-item
          default-opened
          expand-icon-toggle
          class="shadow-2 overflow-hidden"
          header-class="bg-white"
          style="border-radius: 12px"
          expand-icon-class="text-primary"
        >
          <template v-slot:header>
            <q-item-section>
              #{{ entrada.id }}
            </q-item-section>
            <q-item-section>
              {{ entrada.fornecedor?.nome }}
            </q-item-section>
            <q-item-section>
              {{ entrada.destino?.id ? entrada.destino?.getEndereco() : 'Destino não definido' }}
            </q-item-section>
            <q-item-section class="text-right">
              <div>
                <span> {{ entrada.criadoEm() }} </span>
                <span class="q-mx-xs"></span>
              </div>
            </q-item-section>
          </template>
          <q-separator></q-separator>

          <q-card>
            <q-card-section>
              <q-table dense flat summary="Tabela que lista entradas" :rows="entrada.material_items" :columns="columns" hide-pagination
              table-header-class="quixada-bg-grey text-primary text-bold">
                <template v-slot:header="props">
                  
                  <q-tr :props="props" class="quixada-bg-grey">
                    <q-th
                      class="text-primary"
                      style="font-weight: bold;"
                      v-for="col in props.cols"
                      :key="col.name"
                      :props="props">
                      {{ col.label }}
                    </q-th>
                  </q-tr>
                
                </template>

                <template v-slot:body="props">
                  <q-tr :props="props">
                    <q-td key="categoriaMaterial" :props="props">
                      {{ props.row.categoria_material.nome }} 
                    </q-td>
                    <q-td key="tipoMaterial" :props="props">
                      {{ props.row.tipo_material.nome }}
                    </q-td>
                    <q-td key="quantidade" :props="props">
                      {{ props.row.quantidade }} kg
                    </q-td>
                    <q-td key="status" :props="props">
                      <span v-if="props.row.isDisponivelEstoque">
                        <q-icon name="o_radio_button_checked" color="positive"></q-icon>
                        Disponível em estoque
                      </span>
                      <span v-else>
                        <q-icon name="o_radio_button_checked" color="grey"></q-icon>
                        Saída efeuada
                      </span>
                      <br/>
                    </q-td>
                    <q-td key="dataSaida" :props="props">
                      {{ props.row.dataSaida ? props.row.dataSaida : ' - ' }}
                    </q-td>
                  </q-tr>
                </template>
              </q-table>

              <q-separator></q-separator>

              <div class="q-mt-lg q-mb-sm row">
                <div class="col-8">
                  <label class="text-primary">Observação:</label>
                  <div> {{entrada.observacao}} </div>
                </div>
                <div class="col-4 q-gutter-sm text-right">
                  <q-btn @click="verImagem(index)" outline icon="o_image" size="md" class="bg-white text-primary" v-if="entrada.arquivos?.length > 0">
                    <span class="q-ml-xs">Ver</span>
                  </q-btn>
                  <q-btn  :to="{ name: 'Entrada.anexos', params: {entradaId: entrada.id} }" outline icon="o_file_present" size="md" class="bg-white text-primary">
                    <span class="q-ml-xs">Anexos</span>
                  </q-btn>
                  <q-btn :href="`https://www.google.com.br/maps/search/${entrada.destino?.getEndereco()}`" target="_blank" outline icon="o_room" size="md" class="bg-white text-primary">
                    <span class="q-ml-xs">Maps</span>
                  </q-btn>
                  <q-btn :href="`https://www.google.com.br/maps/dir/${entrada.fornecedor?.getEndereco()}/${entrada.destino?.getEndereco()}`" target="_blank" outline icon="o_directions" size="md" class="bg-white text-primary">
                    <span class="q-ml-xs">Rota</span>
                  </q-btn>
                  <q-btn-dropdown outline color="primary" label="Baixar relatório" class="bg-white text-primary">
                    <q-list>
                      <q-item clickable v-close-popup @click="termoDescartePDF(index)">
                        <q-item-section>
                          <q-item-label>Termo de Descarte.pdf</q-item-label>
                        </q-item-section>
                      </q-item>

                      <q-item clickable v-close-popup @click="mtrPDF(index)">
                        <q-item-section>
                          <q-item-label>MTR.pdf</q-item-label>
                        </q-item-section>
                      </q-item>
                    </q-list>
                  </q-btn-dropdown>
                </div>
              </div>
            </q-card-section>
          </q-card>
        </q-expansion-item>
      </div>

      <div class="row q-py-lg justify-end">
        <q-pagination v-if="state.entradas.length" class="align-rigth" @click="loadEntradas" v-model="state.pagination.page" :max="state.pagination.pageCount" direction-links/>
      </div>
    </q-card-section>
  </q-card>
</template>

