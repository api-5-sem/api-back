import pandas as pd
from faker import Faker
import random
import os
from datetime import datetime, timedelta

# Inicializa o gerador de dados falsos
fake = Faker()

# Função para gerar dados para a tabela users
def gerar_users(num_linhas):
    roles = ["Admin", "User", "Manager"]
    return pd.DataFrame({
        'login': [fake.user_name() for _ in range(num_linhas)],
        'password': [fake.password() for _ in range(num_linhas)],
        'role': [random.choice(roles) for _ in range(num_linhas)],
        'grupo_id': [random.randint(1, 2) for _ in range(num_linhas)]
    })

# Função para gerar dados para a tabela config_Indicador
def gerar_config_indicador(num_linhas):
    comparadores = ["=", ">", "<", ">=", "<="]
    return pd.DataFrame({
        'indicador_nome': [fake.word() for _ in range(num_linhas)],
        'indicador_campo': [fake.word() for _ in range(num_linhas)],
        'indicador_comparador': [random.choice(comparadores) for _ in range(num_linhas)],
        'indicador_valor': [str(random.randint(1, 100)) for _ in range(num_linhas)],
        'filtro_nome': [fake.word() for _ in range(num_linhas)],
        'filtro_campo': [fake.word() for _ in range(num_linhas)],
        'filtro_comparador': [random.choice(comparadores) for _ in range(num_linhas)],
        'filtro_valor': [str(random.randint(1, 100)) for _ in range(num_linhas)],
        'usuario': [fake.user_name() for _ in range(num_linhas)],
        'descricao': [fake.sentence(nb_words=10) for _ in range(num_linhas)]
    })

# Função para gerar dados para a tabela dim_acao_seletiva
def gerar_dim_acao_seletiva(num_linhas):
    tipos = ["Tipo A", "Tipo B", "Tipo C"]
    return pd.DataFrame({
        'id_dim_acao_seletiva': range(1, num_linhas + 1),
        'tipo': [random.choice(tipos) for _ in range(num_linhas)],
        'dt_hora': [f'{fake.date_this_year()}' for _ in range(num_linhas)]
    })

# Função para gerar dados para a tabela dim_contratacao
def gerar_dim_contratacao(num_linhas):
    return pd.DataFrame({
        'id_dim_contratacao': range(1, num_linhas + 1),
        'dt_contratacao': [f'{fake.date_this_year()}' for _ in range(num_linhas)],
        'salario_inicial': [round(random.uniform(3000, 15000), 2) for _ in range(num_linhas)],
        'tipo_contrato': [random.randint(1, 3) for _ in range(num_linhas)],
        'dt_aceite_oferta': [f'{fake.date_this_year()}' for _ in range(num_linhas)]
    })

# Função para gerar dados para a tabela dim_entrevista
def gerar_dim_entrevista(num_linhas):
    resultados = ["Aprovado", "Reprovado", "Em análise"]
    return pd.DataFrame({
        'id_dim_entrevista': range(1, num_linhas + 1),
        'dt_entrevista': [f'{fake.date_this_year()}' for _ in range(num_linhas)],
        'entrevistador': [fake.name() for _ in range(num_linhas)],
        'resultado': [random.choice(resultados) for _ in range(num_linhas)]
    })

# Função para gerar dados para a tabela dim_feedback
def gerar_dim_feedback(num_linhas):
    return pd.DataFrame({
        'id_dim_feedback': range(1, num_linhas + 1),
        'descricao': [fake.sentence(nb_words=10) for _ in range(num_linhas)]
    })

# Função para gerar dados para a tabela dim_participante_rh
def gerar_dim_participante_rh(num_linhas):
    return pd.DataFrame({
        'id_dim_participante_rh': range(1, num_linhas + 1),
        'nome': [fake.name() for _ in range(num_linhas)],
        'cargo': [fake.job() for _ in range(num_linhas)]
    })

# Função para gerar dados para a tabela dim_periodo
def gerar_dim_periodo(num_linhas):
    return pd.DataFrame({
        'id_dim_periodo': range(1, num_linhas + 1),
        'dt_abertura': [f'{fake.date_this_year()}' for _ in range(num_linhas)],
        'dt_fechamento': [f'{(fake.date_this_year() + timedelta(days=random.randint(1, 30))).strftime('%Y-%m-%d')}' for _ in range(num_linhas)]
    })

# Função para gerar dados para a tabela dim_processo_seletivo
def gerar_dim_processo_seletivo(num_linhas):
    statuses = ["Ativo", "Inativo", "Concluído"]
    return pd.DataFrame({
        'id_dim_processo_seletivo': range(1, num_linhas + 1),
        'nome': [fake.word() for _ in range(num_linhas)],
        'dt_inicio': [f'{fake.date_this_year()}' for _ in range(num_linhas)],
        'dt_fim': [f'{(fake.date_this_year() + timedelta(days=random.randint(1, 30))).strftime('%Y-%m-%d')}' for _ in range(num_linhas)],
        'status': [random.choice(statuses) for _ in range(num_linhas)],
        'criador': [fake.name() for _ in range(num_linhas)],
        'descricao': [fake.text(max_nb_chars=100) for _ in range(num_linhas)]
    })

# Função para gerar dados para a tabela dim_vaga
def gerar_dim_vaga(num_linhas):
    statuses = ["Aberta", "Fechada", "Em andamento"]
    return pd.DataFrame({
        'id_dim_vaga': range(1, num_linhas + 1),
        'titulo': [fake.job() for _ in range(num_linhas)],
        'nr_posicoes': [random.randint(1, 10) for _ in range(num_linhas)],
        'requisitos': [fake.sentence(nb_words=10) for _ in range(num_linhas)],
        'status': [random.choice(statuses) for _ in range(num_linhas)],
        'localizacao': [fake.city() for _ in range(num_linhas)],
        'responsavel': [fake.name() for _ in range(num_linhas)]
    })

# Função para gerar comandos de inserção SQL compatíveis com PostgreSQL
def create_insert_statements(df, table_name):
    insert_statements = []
    for _, row in df.iterrows():
        row_values = []
        for value in row:
            if pd.isnull(value):
                row_values.append("NULL")
            elif isinstance(value, str):
                row_values.append("'" + value.replace("'", "''") + "'")
            else:
                row_values.append(str(value))
        insert_statements.append(
            f"INSERT INTO {table_name} ({', '.join(df.columns)}) VALUES ({', '.join(row_values)});"
        )
    return "\n".join(insert_statements)

# Caminho para salvar o arquivo SQL
sql_file_path = os.path.join(os.getcwd(), 'flyway--dados.sql')

# Gera o arquivo SQL com os comandos de inserção
with open(sql_file_path, 'w') as sql_file:
    # Dicionário das tabelas com as funções correspondentes
    tabelas = {
        'users': gerar_users(50),
        'config_Indicador': gerar_config_indicador(50),
        'dim_acao_seletiva': gerar_dim_acao_seletiva(50),
        'dim_contratacao': gerar_dim_contratacao(50),
        'dim_entrevista': gerar_dim_entrevista(50),
        'dim_feedback': gerar_dim_feedback(50),
        'dim_participante_rh': gerar_dim_participante_rh(50),
        'dim_periodo': gerar_dim_periodo(50),
        'dim_processo_seletivo': gerar_dim_processo_seletivo(50),
        'dim_vaga': gerar_dim_vaga(50)
    }

    # Escreve os comandos de inserção para cada tabela
    for table_name, df in tabelas.items():
        sql_file.write(f"-- Inserções para a tabela {table_name}\n")
        sql_file.write(create_insert_statements(df, table_name))
        sql_file.write("\n\n")

print(f"Arquivo SQL '{sql_file_path}' gerado com sucesso.")
