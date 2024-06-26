unit Sistema.Model.Entities.Abastecimentos;

interface


type
  TAbastecimentos = class
  private
    FId: Integer;
    FData: TDate;
    FId_Bomba: Integer;
    FQuantidade_Litros: Integer;
    FValor_Abastecido: Currency;
    FPercentual_Imposto: Currency;
    FValor_Imposto: Currency;
  public
    property Id: Integer read FID write FID;
    property Data: TDate read FData write FData;
    property Id_Bomba: Integer read FId_Bomba write FId_Bomba;
    property Quantidade_Litros: Integer read FQuantidade_Litros write FQuantidade_Litros;
    property Valor_Abastecido: Currency read FValor_Abastecido write FValor_Abastecido;
    property Percentual_Imposto: Currency read FPercentual_Imposto write FPercentual_Imposto;
    property Valor_Imposto: Currency read FValor_Imposto write FValor_Imposto;
  end;


implementation

end.
