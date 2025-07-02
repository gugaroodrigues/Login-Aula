# Controle Financeiro - App Flutter

Um aplicativo de controle financeiro pessoal desenvolvido em Flutter com interface moderna e funcionalidades completas para gerenciar suas finanças.

## Funcionalidades

### 🏠 Tela Principal (Dashboard)
- **Saldo Atual**: Exibe o saldo total (positivo ou negativo)
- **Resumo Financeiro**: Cards com total de entradas e despesas
- **Gráfico por Categorias**: Visualização em pizza das despesas por categoria
- **Botão Flutuante**: Acesso rápido para adicionar transações

### ➕ Adicionar Transação
- **Tipos de Transação**: Entrada, Saída ou Despesa
- **Campos**: Descrição, valor e categoria
- **Validação**: Formulário com validação de campos obrigatórios
- **Interface Intuitiva**: Seleção fácil de categorias com ícones

### 📂 Gerenciamento de Categorias
- **Visualização**: Lista de todas as categorias com ícones coloridos
- **Adicionar Categoria**: Dialog para criar novas categorias
- **Personalização**: Escolha de ícone e cor para cada categoria
- **Categorias Padrão**: Mercado, Aluguel, Lazer, Saúde, Transporte, Educação

## Design

- **Tema**: Gradiente azul moderno
- **Interface**: Cards translúcidos com bordas arredondadas
- **Responsivo**: Adaptado para diferentes tamanhos de tela
- **Acessibilidade**: Cores contrastantes e ícones intuitivos

## Tecnologias Utilizadas

- **Flutter**: Framework principal
- **fl_chart**: Biblioteca para gráficos
- **shared_preferences**: Persistência de dados local
- **Material Design**: Componentes de interface

## Como Executar

### Pré-requisitos
- Flutter SDK instalado
- Android Studio ou VS Code
- Emulador Android ou dispositivo físico

### Passos para Execução

1. **Clone ou baixe o projeto**
   ```bash
   cd controle_financeiro
   ```

2. **Instale as dependências**
   ```bash
   flutter pub get
   ```

3. **Execute o aplicativo**
   ```bash
   flutter run
   ```

### Comandos Úteis

- **Verificar instalação do Flutter**
  ```bash
  flutter doctor
  ```

- **Limpar cache**
  ```bash
  flutter clean
  flutter pub get
  ```

- **Gerar APK**
  ```bash
  flutter build apk
  ```

## Estrutura do Projeto

```
lib/
├── main.dart                 # Ponto de entrada do app
├── models/                   # Modelos de dados
│   ├── categoria.dart        # Modelo de categoria
│   └── transacao.dart        # Modelo de transação
├── screens/                  # Telas do aplicativo
│   ├── home_screen.dart      # Tela principal
│   ├── adicionar_transacao_screen.dart  # Tela de adicionar transação
│   └── categorias_screen.dart # Tela de categorias
└── widgets/                  # Widgets reutilizáveis
    ├── screen_background.dart # Layout base das telas
    └── grafico_categorias.dart # Widget do gráfico
```

## Próximas Melhorias

- [ ] Persistência de dados com SQLite
- [ ] Filtros por data
- [ ] Relatórios mensais
- [ ] Backup e sincronização
- [ ] Notificações de gastos
- [ ] Metas financeiras
- [ ] Exportação de dados

## Capturas de Tela

As imagens de preview das telas estão incluídas no projeto:
- `preview_tela_principal.png` - Tela principal com dashboard
- `preview_tela_adicionar.png` - Tela de adicionar transação
- `preview_tela_categorias.png` - Tela de gerenciamento de categorias

---

Desenvolvido com ❤️ em Flutter

