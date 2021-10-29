unit Cli_Windows.Model.ProdutoVO;

interface

uses
    orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('PRODUTO', 'P', 'Produto', 'Produtos')]
  [TTabelaEstrangeira('CFOP', 'CF', 'ID', 'IDCFOP', 'LeftJoin')]
  [TTabelaEstrangeira('NCM', 'N', 'ID', 'IDNCM', 'LeftJoin')]
  [TTabelaEstrangeira('CEST', 'C', 'ID', 'IDCEST', 'LeftJoin')]
  [TTabelaEstrangeira('FORNEC_PRODUTO', 'FP', 'IDPRODUTO', 'ID', 'LeftJoin')]
  [TTabelaEstrangeira('FORNECEDOR', 'F', 'ID', 'IDFORNECEDOR', 'LeftJoin')]
  [TTabelaEstrangeira('PESSOA', 'PES', 'ID', 'IDPESSOA', 'LeftJoin')]
  [TTabelaEstrangeira('PESSOA_JURIDICA', 'PJ', 'ID', 'IDPESSOA', 'LeftJoin')]
  TProdutoVO = class(TInterfacedObject, IBaseVO<TProdutoVO>)
    private
      FId: integer;
      FDescricao: string;
      FBarras: string;
      FQuantidade: double;
      FEstoque: double;
      FCritico: double;
      FPreco_Custo: currency;
      FPreco_Venda: currency;
      FMarkup: double;
      FNum_Lote: string;
      FUnidade: string;
      FMarca: string;
      FIdCfop: integer;
      FIdNcm: integer;
      FIdCest: integer;
      FCfopCfop: string;
      FDescricaoCfop: string;
      FNcmNcm: string;
      FDescricaoNcm: string;
      FCestCest: string;
      FDescricaoCest: string;
      FNomeFornecedor: string;
    public
      [TChavePrimaria('ID', 'C�digo', 'C�digos')]
      property Id: integer read FId write FId;
      [TCampoTexto('DESCRICAO', 'Descri��o', 'Descri��es', '', 100, False)]
      property Descricao: string read FDescricao write FDescricao;
      [TCampoTexto('BARRAS', 'C�d. Barras', 'C�d. Barras', '', 13, False)]
      property Barras: string read FBarras write FBarras;
      [TCampoInteiro('QUANTIDADE', 'Quantidade', 'Quantidades')]
      property Quantidade: double read FQuantidade write FQuantidade;
      [TCampoExtended('ESTOQUE', 'Estoque', 'Estoques', '#000.00000,000', 15, 3)]
      property Estoque: double read FEstoque write FEstoque;
      [TCampoExtended('CRITICO', 'Cr�tico', 'Cr�ticos', '#000.00000,000', 15, 3)]
      property Critico: double read FCritico write FCritico;
      [TCampoExtended('PRECO_CUSTO', 'Pre�o Custo', 'Pre�os Custos', 'R$#00.0000,00', 15, 2)]
      [TCampoMonetario(True)]
      property PrecoCusto: currency read FPreco_Custo write FPreco_Custo;
      [TCampoExtended('PRECO_VENDA', 'Pre�o Venda', 'Pre�os Vendas', 'R$#00.0000,00', 15, 2)]
      [TCampoMonetario(True)]
      property PrecoVenda: currency read FPreco_Venda write FPreco_Venda;
      [TCampoExtended('MARKUP', 'Markup', 'Markups', '#000.00000,000', 15,3)]
      property Markup: double read FMarkup write FMarkup;
      [TCampoTexto('UNIDADE', 'Unidade', 'Unidades', '', 2, False)]
      property Unidade: string read FUnidade write FUnidade;
      [TCampoTexto('NUM_LOTE', 'N�mero Lote', 'N�meros Lotes', '', 20, False)]
      property NumLote: string read FNum_Lote write FNum_Lote;
      [TCampoTexto('MARCA', 'Marca', 'Marcas', '', 100, False)]
      property Marca: string read FMarca write FMarca;
      [TChaveEstrangeira('IDCFOP', 'CFOP')]
      property IdCfop: integer read FIdCfop write FIdCfop;
      [TChaveEstrangeira('IDNCM', 'NCM')]
      property IdNcm: integer read FIdNcm write FIdNcm;
      [TChaveEstrangeira('IDCEST', 'CEST')]
      property IdCest: integer read FIdCest write FIdCest;
      [TCampoEstrangeiro('CFOP', 'CFOP', 'CF')]
      property CfopCfop: string read FCfopCfop write FCfopCfop;
      [TCampoEstrangeiro('DESCRICAO', 'CFOP', 'CF')]
      property DescricaoCfop: string read FDescricaoCfop write FDescricaoCfop;
      [TCampoEstrangeiro('NCM', 'NCM', 'N')]
      property NcmNcm: string read FNcmNcm write FNcmNcm;
      [TCampoEstrangeiro('DESCRICAO', 'NCM', 'N')]
      property DescricaoNcm: string read FDescricaoNcm write FDescricaoNcm;
      [TCampoEstrangeiro('CEST', 'CEST', 'C')]
      property CestCest: string read FCestCest write FCestCest;
      [TCampoEstrangeiro('DESCRICAO', 'CEST', 'C')]
      property DescricaoCest: string read FDescricaoCest write FDescricaoCest;
      constructor Create;
      destructor Destroy;override;
      class function New: IBaseVO<TProdutoVO>;
      function toJson: string;
      function fromJson(json: string): TProdutoVO;
  end;

implementation

{ TProdutoVO }

constructor TProdutoVO.Create;
begin
  //
end;

destructor TProdutoVO.Destroy;
begin
  //
  inherited;
end;

function TProdutoVO.fromJson(json: string): TProdutoVO;
begin
  Result := TJson.JsonToObject<TProdutoVO>(json);
end;

class function TProdutoVO.New: IBaseVO<TProdutoVO>;
begin
   Result := Self.Create;
end;

function TProdutoVO.toJson: string;
begin
   Result := TJson.ObjectToJsonString(Self);
end;

end.