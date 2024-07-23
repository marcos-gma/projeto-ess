import cucumberPreprocessor from '@badeball/cypress-cucumber-preprocessor'
import { createEsbuildPlugin } from '@badeball/cypress-cucumber-preprocessor/esbuild'
import createBundler from '@bahmutov/cypress-esbuild-preprocessor'
import { defineConfig } from 'cypress'
import { addCucumberPreprocessorPlugin } from '@badeball/cypress-cucumber-preprocessor';


export default defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      // Adiciona o plugin do pré-processador Cucumber
      addCucumberPreprocessorPlugin(on, config);
      return config;
    },
    specPattern: 'cypress/e2e/features/busca/buscaGUI.feature', // Padrão para localizar arquivos .feature
    baseUrl: 'http://localhost:3000/', // URL base para os testes
    video: false, // Desativa a gravação de vídeo
    viewportWidth: 1280, // Largura da viewport
    viewportHeight: 720, // Altura da viewport
    defaultCommandTimeout: 5000, // Tempo limite padrão para comandos
  },
});