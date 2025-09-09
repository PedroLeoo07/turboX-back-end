<div align="center">

# 🏎️ TurboX Back-end

### *A API definitiva para builds automotivas!*

[![Node.js](https://img.shields.io/badge/Node.js-16+-green.svg)](https://nodejs.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-13+-blue.svg)](https://postgresql.org/)
[![Express](https://img.shields.io/badge/Express-4.x-lightgrey.svg)](https://expressjs.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

*Transforme sua paixão por carros em dados!* 🚗💨

</div>

---

## 🎯 **O que é o TurboX?**

TurboX é uma **API REST moderna e robusta** para gerenciamento completo de carros, upgrades e builds automotivas. Crie, visualize e gerencie configurações personalizadas de veículos com diferentes tipos de melhorias de performance de forma simples e intuitiva!

### ✨ **Principais Recursos**
- 🔧 **Gerenciamento completo** de carros e upgrades
- 🏗️ **Sistema de builds** personalizadas
- 📊 **Estatísticas avançadas** de performance
- 🔍 **Filtros inteligentes** para busca
- 📱 **API RESTful** totalmente documentada
- 🔐 **Sistema de autenticação** seguro

---

## 🚀 **Tecnologias de Ponta**

<div align="center">

| Tecnologia | Descrição |
|:----------:|:---------:|
| ![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white) | Runtime JavaScript ultrarrápido |
| ![Express](https://img.shields.io/badge/Express-000000?style=for-the-badge&logo=express&logoColor=white) | Framework web minimalista |
| ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white) | Banco de dados relacional robusto |
| ![Swagger](https://img.shields.io/badge/Swagger-85EA2D?style=for-the-badge&logo=swagger&logoColor=black) | Documentação interativa da API |

</div>

---

## ⚡ **Início Rápido**

### 🔧 **Pré-requisitos**
```bash
✅ Node.js 14+
✅ PostgreSQL 13+
✅ npm ou yarn
```

### 📦 **Instalação Express**

1. **Clone e entre no projeto:**
```bash
git clone https://github.com/PedroLeoo07/turboX-back-end
cd turboX-back-end
```

2. **Instale as dependências:**
```bash
npm install
```

3. **Configure o ambiente:**
```bash
cp .env.example .env
```

4. **Configure suas variáveis (.env):**
```env
PORT=3000
DB_HOST=localhost
DB_PORT=5432
DB_NAME=turbox
DB_USER=seu_usuario
DB_PASSWORD=sua_senha
API_KEY=sua_chave_super_secreta
```

5. **Prepare o banco de dados:**
```bash
psql -U seu_usuario -h localhost -d postgres -f src/database/schema.sql
```

6. **🚀 DECOLE!**
```bash
npm run dev
```

---

## 🎮 **Scripts Disponíveis**

| Comando | Descrição | Emoji |
|---------|-----------|-------|
| `npm run dev` | Modo desenvolvimento com hot reload | 🔥 |
| `npm start` | Produção | 🚀 |
| `npm run setup-db` | Configurar banco de dados | 🗄️ |

---

## 🛣️ **Rotas da API**

### 👥 **Usuários**
```http
GET    /api/users              # 📋 Listar todos
GET    /api/users/:id          # 🔍 Buscar por ID
POST   /api/users              # ➕ Criar novo
PUT    /api/users/:id          # ✏️ Atualizar
DELETE /api/users/:id          # 🗑️ Deletar
```

### 🚗 **Carros**
```http
GET    /api/cars               # 📋 Listar (com filtros)
GET    /api/cars/:id           # 🔍 Buscar por ID
GET    /api/cars/marca/:marca  # 🏷️ Buscar por marca
POST   /api/cars               # ➕ Adicionar carro
PUT    /api/cars/:id           # ✏️ Atualizar
DELETE /api/cars/:id           # 🗑️ Remover
```

### ⚙️ **Upgrades**
```http
GET    /api/upgrades           # 📋 Listar (com filtros)
GET    /api/upgrades/:id       # 🔍 Buscar por ID
GET    /api/upgrades/tipo/:tipo # 🎯 Buscar por tipo
POST   /api/upgrades           # ➕ Criar upgrade
PUT    /api/upgrades/:id       # ✏️ Atualizar
DELETE /api/upgrades/:id       # 🗑️ Deletar
```

### 🏗️ **Builds**
```http
GET    /api/builds                    # 📋 Listar todas
GET    /api/builds/:id                # 🔍 Detalhes completos
GET    /api/builds/user/:userId       # 👤 Por usuário
GET    /api/builds/car/:carId         # 🚗 Por carro
POST   /api/builds                    # ➕ Nova build
PUT    /api/builds/:id                # ✏️ Atualizar
DELETE /api/builds/:id                # 🗑️ Deletar
```

### 🔗 **Build-Upgrades**
```http
GET    /api/build-upgrades/stats      # 📊 Estatísticas
GET    /api/build-upgrades/popular    # 🔥 Mais populares
POST   /api/build-upgrades            # ➕ Adicionar upgrade
DELETE /api/build-upgrades/...        # 🗑️ Remover associação
```

---



### 🚗 **Carros**
```bash
GET /api/cars?marca=Honda&minPotencia=200&maxPotencia=400&minPreco=50000&maxPreco=200000
```

### ⚙️ **Upgrades**
```bash
GET /api/upgrades?tipo=Turbo&minCusto=1000&maxCusto=5000&minPotencia=20&maxPotencia=100
```

---

## 📁 **Arquitetura do Projeto**

```
🏎️ turboX-back-end/
├── 📁 src/
│   ├── ⚙️ config/
│   │   ├── 🔐 apiKey.js          # Middleware de autenticação
│   │   ├── 🗄️ database.js        # Configuração PostgreSQL
│   │   ├── 📚 swagger.js         # Documentação Swagger
│   │   └── 📤 upload.js          # Upload de arquivos
│   ├── 🎮 controllers/
│   │   ├── 🏗️ buildsController.js
│   │   ├── 🔗 buildUpgradesController.js
│   │   ├── 🚗 carsController.js
│   │   ├── ⚙️ upgradesController.js
│   │   └── 👥 usersController.js
│   ├── 📦 models/
│   │   ├── 🏗️ buildModel.js
│   │   ├── 🔗 buildUpgradesModel.js
│   │   ├── 🚗 carModel.js
│   │   ├── ⚙️ upgradeModel.js
│   │   └── 👤 userModel.js
│   ├── 🛣️ routes/
│   │   └── ... (todas as rotas)
│   └── 🗄️ database/
│       └── 📄 schema.sql
├── 🚀 server.js
├── 📦 package.json
└── 📖 README.md
```

---

## 🗄️ **Banco de Dados**

### **Tabelas Principais:**
- 👥 **users** - Dados dos usuários
- 🚗 **cars** - Catálogo completo de veículos  
- ⚙️ **upgrades** - Biblioteca de melhorias
- 🏗️ **builds** - Projetos personalizados
- 🔗 **build_upgrades** - Relacionamentos

---

## 🔐 **Autenticação**

A API utiliza autenticação via **API Key** no header:
```http
x-api-key: sua_chave_super_secreta
```

---

## 📚 **Documentação Interativa**

Acesse **`/doc`** para explorar a documentação completa via Swagger! 🎯

---

## 💡 **Exemplos Práticos**

### 👤 **Criar Usuário**
```json
POST /api/users
{
  "nome": "João Velocidade",
  "email": "joao@turbox.com",
  "senha": "123456"
}
```

### 🏗️ **Criar Build Épica**
```json
POST /api/builds
{
  "id_usuario": 1,
  "id_carro": 1,
  "potencia_final": 350,
  "torque_final": 450,
  "zero_cem_final": 4.2,
  "custo_total": 25000.00
}
```

---

## 🤝 **Contribua com o Projeto**

1. 🍴 **Fork** o projeto
2. 🌿 Crie sua branch (`git checkout -b feature/NovaFeature`)
3. 💾 **Commit** suas mudanças (`git commit -m 'Add: Nova feature incrível'`)
4. 📤 **Push** para a branch (`git push origin feature/NovaFeature`)
5. 🔄 Abra um **Pull Request**

---

<div align="center">

## 📞 **Contato & Suporte**


[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/PedroLeoo07)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/leonardo-oliveira-38aab7321/)

### ⭐ **Se este projeto te ajudou, deixe uma estrela!** ⭐

</div>

---

<div align="center">

**© 2025 TurboX - Transformando dados em velocidade** 🏎️💨

</div>