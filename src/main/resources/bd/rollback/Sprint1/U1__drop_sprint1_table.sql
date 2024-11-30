-- Remover restrições da tabela fato_entrevista
ALTER TABLE fato_entrevista DROP CONSTRAINT fato_entrevista_dim_acao_seletiva_fk;
ALTER TABLE fato_entrevista DROP CONSTRAINT fato_entrevista_dim_contratacao_fk;
ALTER TABLE fato_entrevista DROP CONSTRAINT fato_entrevista_dim_entrevista_fk;
ALTER TABLE fato_entrevista DROP CONSTRAINT fato_entrevista_dim_feedback_fk;
ALTER TABLE fato_entrevista DROP CONSTRAINT fato_entrevista_dim_participante_rh_fk;
ALTER TABLE fato_entrevista DROP CONSTRAINT fato_entrevista_dim_vaga_fk;

-- Remover restrições da tabela fato_vaga
ALTER TABLE fato_vaga DROP CONSTRAINT fato_vaga_dim_periodo_fk;
ALTER TABLE fato_vaga DROP CONSTRAINT fato_vaga_dim_processo_seletivo_fk;
ALTER TABLE fato_vaga DROP CONSTRAINT fato_vaga_dim_vaga_fk;



DROP TABLE IF EXISTS public.dim_acao_seletiva;
DROP TABLE IF EXISTS public.dim_contratacao;
DROP TABLE IF EXISTS public.dim_entrevista;
DROP TABLE IF EXISTS public.dim_feedback;
DROP TABLE IF EXISTS public.dim_participante_rh;
DROP TABLE IF EXISTS public.dim_periodo;
DROP TABLE IF EXISTS public.dim_processo_seletivo;
DROP TABLE IF EXISTS public.dim_vaga;
DROP TABLE IF EXISTS public.fato_entrevista;
DROP TABLE IF EXISTS public.fato_vaga;


DELETE FROM flyway_schema_history WHERE version = '1';