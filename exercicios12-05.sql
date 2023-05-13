Use IMOVEIS
go



-- 1. Liste todas as linhas e os campos cd_Vendedor, nm_Vendedor e ds_Email da tabela VENDEDOR em ordem alfabética decrescente.select cd_Vendedor, nm_Vendedor, ds_Emailfrom Vendedororder by nm_Vendedor desc-- asc ordem alfabetica--desc ordem alfabetica invertida

-- 2. Liste as colunas cd_Imovel, cd_Vendedor e vl_Imovel de todos os imóveis do vendedor 2

select cd_Vendedor, cd_Imovel  , vl_Imovel
	from Imovel
	where cd_Vendedor = 2

--3 Liste as colunas cd_Imovel, cd_Vendedor, vl_Imovel e sg_Estado dos imóveis cujo preço de venda seja inferior a 150 mil e sejam do Estado do RJ.select cd_Imovel, cd_Vendedor, vl_Imovel , sg_Estadofrom Imovelwhere vl_Imovel < 150000-- 4 Liste as colunas cd_Imovel, cd_Vendedor, vl_Imovel e sg_Estado dos imóveis cujo preço de venda seja inferior a 150 mil e o vendedor não seja 2.select cd_Imovel, cd_Vendedor, vl_Imovel , sg_Estadofrom Imovelwhere cd_Vendedor != 2-- 5. Liste as colunas cd_Comprador, nm_Comprador, ds_Endereco e sg_Estado da tabela COMPRADOR em que o Estado seja nulo.select cd_Comprador, nm_Comprador, ds_Endereco , sg_Estadofrom Compradorwhere sg_Estado is null-- 6 Liste todas as ofertas cujo valor esteja entre 100 mil e 150 mil.select cd_Comprador, cd_Imovel,  vl_Oferta,  dt_Oferta from Ofertawhere  vl_oferta < 150000 and vl_Oferta > 100000-- 7. Liste todos os vendedores que tenham a letra A na segunda posição do nomeselect nm_Vendedorfrom Vendedorwhere nm_Vendedor like '_A%'--8 liste o total de ofertas por comprador de 2008 a 2009

select cd_comprador, Sum(vl_oferta)
	from Oferta
	Where Year (dt_Oferta) between 2008 and 2009
	group by cd_Comprador with rollup--9. Liste o valor médio de todos os Imóveis por bairro, somente do estado de São Paulo e coloque o resultado em ordem decrescente de valor.select  cd_bairro, cd_cidade, sg_Estado, avg(vl_imovel)from Imovelwhere sg_Estado = 'sp'group by cd_bairro, cd_cidade, sg_Estadoorder by cd_bairro desc-- 10. Liste o maior valor de imóvel por vendedor, somente para os vendedores 1 e 2.select  max(vl_imovel), cd_vendedorfrom Imovelwhere cd_vendedor in (1, 2)group by cd_Vendedor-- where ** in (1,2,3,4,5)--11. Mostre a quantidade de imóveis cujo preço de venda seja inferior a 150 mil por Estado e a área total inferior a 300.select sg_estado, count(vl_Imovel)from imovelwhere vl_imovel < 150000 and qt_AreaTotal < 300group by sg_Estado