'use strict';
/**
 * saida controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::saida.saida', ({ strapi }) => ({
    async create(ctx){
        const { data } = ctx.request.body;
        const saida = {
            observacao: data.observacao,
            veiculo: data.veiculo,
            motorista: data.motorista,
            code: data.code,
            material_items: data.material_items,
            maquina: data.maquina,
            produto: data.produto,
            quantidade_produto: data.quantidade_produto,
            tipo_saida: data.tipo_saida,
            destino: data.destino,
            fornecedor: data.fornecedor
        }

        const saidaData = await strapi.entityService.create(
            'api::saida.saida', 
            {
                data: saida,
                populate: 'deep,4'
            },
        );

        let dataHoje = new Date(new Date().toLocaleString("en-US", {timeZone: "America/Sao_Paulo"})).toISOString().slice(0, 10);
        saidaData.material_items.forEach(async (item) => {
            const itemSaida = await strapi.db.query('api::material-item.material-item').update(
                { 
                    where: { id: item.id},
                    data: {
                        isDisponivelEstoque: false,
                        dataSaida: dataHoje
                    } 
                }
            );
        })        
        
      return await strapi.entityService.findOne('api::saida.saida', saidaData.id, {});

    },
    async rastreio(ctx) {
        const { code } = await ctx.request.body.params
        const saidas = await strapi.entityService.findMany('api::saida.saida', {
            filters: {
                code: code
            },
            populate: 'deep,4'
        })
        
        const saida = {
            quantidade_produto: null,
            nome_produto: null,
            tipo_material: null,
            quantidade_material: 0.0,
            material_items: []
        }

        const saidaData = saidas[0]
        if(saidaData){
            saida.quantidade_produto = saidaData.quantidade_produto
            saida.nome_produto = saidaData.produto.nome
            saida.quantidade_material = 0.0
            for(const materialItemDataElement of saidaData.material_items) {
                const materialItem = {
                    quantidade: parseFloat(materialItemDataElement.quantidade),
                    fornecedor: materialItemDataElement.entrada.fornecedor.nome,
                }
                saida.quantidade_material += parseFloat(materialItem.quantidade)
                saida.tipo_material = materialItemDataElement.tipo_material.nome
                saida.material_items.push(materialItem)
            }
        }
        
        return {
            data: saida
        }
    },

  async createAll(ctx) {
    const { data: saidaData } = ctx.request.body;
    console.log(saidaData)

    if(saidaData.tipo_saida === 'SAIDA_PADRAO') {
      const { saidaID, dataSaida } = await this.createSaidaPadrao(saidaData)
      await this.updateMaterialItem(saidaID, dataSaida, saidaData.material_items)
    }
    else if (saidaData.tipo_saida === 'SAIDA_TRASNFORMACAO') {
      const { saidaID, dataSaida } = await this.createSaidaTransformacao(saidaData)
      await this.updateMaterialItem(saidaID, dataSaida, saidaData.material_items)
    }

    return await strapi.entityService.findOne('api::saida.saida', saidaID, {});
  },

  async createSaidaPadrao(saidaData) {
    const { id: saidaID, createdAt: dataSaida } = await strapi.entityService.create("api::saida.saida", {
      data: {
        tipo_saida: "SAIDA_PADRAO",
        observacao: saidaData.observacao,
        fornecedor: {
          id: saidaData.fornecedor.id
        },
        veiculo: {
          id: saidaData.veiculo.id
        },
        motorista: {
          id: saidaData.motorista.id
        },
      },
    });

    return { saidaID, dataSaida }
  },

  async createSaidaTransformacao(saidaData) {
    const { id: saidaID, createdAt: dataSaida } = await strapi.entityService.create("api::saida.saida", {
      data: {
        tipo_saida: "SAIDA_TRASNFORMACAO",
        observacao: saidaData.observacao,
        quantidade_produto: saidaData.quantidade_produto,
        maquina: {
          id: saidaData.maquina.id
        },
        produto: {
          id: saidaData.produto.id
        }
      },
    });

    return { saidaID, dataSaida }
  },

  async updateMaterialItem(saidaID, dataSaida, material_items_ID) {

      material_items_ID.forEach(async (materialItemID) => {
        // var materialItemID = materialItemID.id

        var materialItem = {};
        materialItem["saida"] = saidaID
        materialItem["isDisponivelEstoque"] = false
        materialItem["dataSaida"] = dataSaida

        await strapi.entityService.update("api::material-item.material-item", materialItemID, {
          data: {
            ...materialItem
          }
        });
      });

  }

}));
