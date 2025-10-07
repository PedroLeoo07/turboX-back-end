const swaggerJsdoc = require("swagger-jsdoc");
const swaggerUi = require("swagger-ui-express");

const options = {
  definition: {
    openapi: "3.0.0",
    info: {
      title: "API TurboX",
      version: "1.0.0",
      description: "Documentação da API para gerenciamento de carros e upgrades",
    },
  },
  apis: ["./src/routes/*.js"],
};

const swaggerSpec = swaggerJsdoc(options);

const setupSwagger = (app) => {
  try {
    app.use("/doc", swaggerUi.serve, swaggerUi.setup(swaggerSpec));
  } catch (error) {
    console.error("Erro ao configurar o Swagger:", error);
  }
};

module.exports = setupSwagger;
