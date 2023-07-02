'use strict';

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::entrada.entrada', ({ strapi }) => ({
  async createAll(ctx) {
    const { data: entradaData } = ctx.request.body;

    const { id: entradaID } = await strapi.entityService.create("api::entrada.entrada", {
      data: {
        observacao: entradaData.observacao,
        fornecedor: {
          id: entradaData.fornecedor.id
        },
        destino: {
          id: entradaData.destino.id
        }
      },
    });

    entradaData.material_items.forEach(async (materialItem) => {
      materialItem["entrada"] = { id: entradaID }

      await strapi.entityService.create("api::material-item.material-item", {
        data: {
          ...materialItem,
          isDisponivelEstoque: true,
        }
      }
      );
    });

    return await strapi.entityService.findOne('api::entrada.entrada', entradaID, {});
  },
}));
