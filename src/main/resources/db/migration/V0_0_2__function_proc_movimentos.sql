-- FUNCTION: select * from testebnp.proc_movimentos()

-- DROP FUNCTION testebnp.proc_movimentos();

CREATE OR REPLACE FUNCTION testebnp.proc_movimentos()
    RETURNS TABLE(dat_mes integer, dat_ano integer, cod_produto character(4), des_produto character varying(30),num_lancamento bigint,des_descricao character varying(50),val_valor numeric(18,2))
    LANGUAGE 'sql'

    COST 100
    VOLATILE 
AS $BODY$
	select dat_mes, dat_ano, p.cod_produto, des_produto,num_lancamento,des_descricao,val_valor
		from testebnp.produto p
		left join testebnp.movimento_manual m on m.cod_produto = p.cod_produto
		order by dat_mes,dat_ano,num_lancamento; 
		
$BODY$;
