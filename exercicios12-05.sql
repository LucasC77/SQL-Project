Use IMOVEIS
go



-- 1. Liste todas as linhas e os campos cd_Vendedor, nm_Vendedor e ds_Email da tabela VENDEDOR em ordem alfab�tica decrescente.

-- 2. Liste as colunas cd_Imovel, cd_Vendedor e vl_Imovel de todos os im�veis do vendedor 2

select cd_Vendedor, cd_Imovel  , vl_Imovel
	from Imovel
	where cd_Vendedor = 2



select cd_comprador, Sum(vl_oferta)
	from Oferta
	Where Year (dt_Oferta) between 2008 and 2009
	group by cd_Comprador with rollup