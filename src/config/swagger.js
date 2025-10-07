const swaggerJsdoc = require("swagger-jsdoc");
const swaggerUi = require("swagger-ui-express");

const options = {
  definition: {
    openapi: "3.0.0",
    info: {
      title: "API TurboX",
      version: "1.0.0",
      description: "Documentação da API para gerenciamento de carros, usuários, upgrades e builds",
      contact: {
        name: "API Support",
        email: "suporte@turbox.com"
      }
    },
    servers: [
      {
        url: "http://localhost:3001",
        description: "Servidor de desenvolvimento"
      }
    ],
    components: {
      securitySchemes: {
        bearerAuth: {
          type: "http",
          scheme: "bearer",
          bearerFormat: "JWT",
          description: "Token JWT para autenticação"
        }
      },
      schemas: {
        Car: {
          type: "object",
          properties: {
            id: { type: "integer", example: 1 },
            imagem: { type: "string", example: "https://exemplo.com/carro.jpg" },
            marca: { type: "string", example: "BMW" },
            modelo: { type: "string", example: "M3" },
            ano: { type: "integer", example: 2023 },
            potencia: { type: "integer", example: 510 },
            torque: { type: "integer", example: 650 },
            peso: { type: "integer", example: 1650 },
            zero_cem: { type: "number", example: 3.9 },
            preco: { type: "number", example: 550000.00 },
            data_criacao: { type: "string", format: "date-time" }
          }
        },
        User: {
          type: "object",
          properties: {
            id: { type: "integer", example: 1 },
            nome: { type: "string", example: "João Silva" },
            email: { type: "string", example: "joao@email.com" },
            data_criacao: { type: "string", format: "date-time" }
          }
        },
        Upgrade: {
          type: "object",
          properties: {
            id: { type: "integer", example: 1 },
            nome: { type: "string", example: "Turbo Stage 2" },
            tipo: { type: "string", example: "turbo" },
            descricao: { type: "string", example: "Turbo de alta performance" },
            preco: { type: "number", example: 15000.00 },
            potencia_adicional: { type: "integer", example: 100 },
            torque_adicional: { type: "integer", example: 150 },
            peso_adicional: { type: "integer", example: 5 },
            data_criacao: { type: "string", format: "date-time" }
          }
        },
        Build: {
          type: "object",
          properties: {
            id: { type: "integer", example: 1 },
            id_usuario: { type: "integer", example: 1 },
            id_carro: { type: "integer", example: 1 },
            potencia_final: { type: "integer", example: 610 },
            torque_final: { type: "integer", example: 800 },
            zero_cem_final: { type: "number", example: 3.2 },
            custo_total: { type: "number", example: 50000.00 },
            data_criacao: { type: "string", format: "date-time" }
          }
        },
        Error: {
          type: "object",
          properties: {
            error: { type: "string", example: "Mensagem de erro" }
          }
        }
      },
      responses: {
        UnauthorizedError: {
          description: "Token de autenticação ausente ou inválido",
          content: {
            "application/json": {
              schema: { $ref: "#/components/schemas/Error" }
            }
          }
        },
        NotFoundError: {
          description: "Recurso não encontrado",
          content: {
            "application/json": {
              schema: { $ref: "#/components/schemas/Error" }
            }
          }
        },
        ValidationError: {
          description: "Erro de validação nos dados enviados",
          content: {
            "application/json": {
              schema: { $ref: "#/components/schemas/Error" }
            }
          }
        }
      }
    },
    tags: [
      { name: "Auth", description: "Endpoints de autenticação" },
      { name: "Users", description: "Gerenciamento de usuários" },
      { name: "Cars", description: "Gerenciamento de carros" },
      { name: "Upgrades", description: "Gerenciamento de upgrades" },
      { name: "Builds", description: "Gerenciamento de builds" },
      { name: "BuildUpgrades", description: "Associações entre builds e upgrades" }
    ]
  },
  apis: ["./src/routes/*.js"],
};

const swaggerSpec = swaggerJsdoc(options);

const setupSwagger = (app) => {
  try {
    app.use("/doc", swaggerUi.serve, swaggerUi.setup(swaggerSpec, {
      customCss: '.swagger-ui .topbar { display: none }',
      customSiteTitle: "TurboX API Documentation"
    }));
    console.log("📚 Documentação Swagger disponível em http://localhost:3001/doc");
  } catch (error) {
    console.error("Erro ao configurar o Swagger:", error);
  }
};

module.exports = setupSwagger;
