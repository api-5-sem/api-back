DELETE FROM public.users
WHERE login = 'admin';

DROP TABLE IF EXISTS public.users;

DELETE FROM flyway_schema_history WHERE version = '5';


DELETE FROM public.grupo_permissao
WHERE grupo_id = 1;

DROP TABLE IF EXISTS public.grupo_permissao;

DELETE FROM public.grupo
WHERE nome = 'ADMIN';

DELETE FROM public.grupo
WHERE nome = 'USER';

DROP TABLE IF EXISTS public.grupo;

DELETE FROM flyway_schema_history WHERE version = '4';




DROP TABLE IF EXISTS public.permissao;


DELETE FROM flyway_schema_history WHERE version = '3';