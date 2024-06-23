unit Sistema.Model.Entities.Clientes;

interface


type
  TClientes = class
  private
    FID: Integer;
    FNome: string;
    FIdade : Integer;
  public
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property Idade: Integer read FIdade write FIdade;
  end;

implementation

end.
