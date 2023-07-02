module.exports = {
    routes: [
      {
        method: "POST",
        path: "/saidas/rastreio",
        handler: "saida.rastreio",
      },
      {
        method: "POST",
        path: "/saidas/create-all",
        handler: "saida.createAll",
      },
    ],
  };
