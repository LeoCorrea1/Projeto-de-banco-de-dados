---------- FEITO NO QUADRO -------------

Fornecedor(*IdForncedor,nome)

Lote(IdLote,descriçao,fornecedor)
    fornecedor referencia fornecedor;

Fabricante(*IdFabricante,nome)

Fabricante_Fornecedor(*Fabribricante,*Fornecedor)
    Fabricante referencia fabricante
    fornecedor referencia fornecedor

TipoProduto(*IdTipoProduto,Nome)
    tipo referencia TipoProduto

Produto(*IdProduto, nome , dataF, dataV, Tipo, Preço,PrecisaReceita)
    tipo refetencia TipoProduto
    
Receita(*IdReceita,data,Medico)

Venda(NotaFiscal, data)

Produto_Venda(*IdProduto_Venda , Produto, receita)
    Prodturo referencia Produto
    Receita referencia Receita