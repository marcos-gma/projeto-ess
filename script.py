import subprocess
import os

# Caminhos dos diretórios
backend_dir = os.path.join(os.getcwd(), 'backend')
frontend_dir = os.path.join(os.getcwd(), 'frontend')

# Comandos para abrir terminais e executar 'npm start'
backend_command = f'start cmd /k "cd /d {backend_dir} && npm start"'
frontend_command = f'start cmd /k "cd /d {frontend_dir} && npm start"'

# Executando os comandos e abrindo em diferentes terminais
subprocess.Popen(backend_command, shell=True)
subprocess.Popen(frontend_command, shell=True)