unit Sistema.Test.ServicesCalculosTest;

interface

uses
  DUnitX.TestFramework,
  Sistema.Model.Services.Interfaces,
  Sistema.Model.Services.Calculos;

type
  [TestFixture]
  TServicesCalculosTest = class
  private
    FModelServicesCalculos : iModelServicesCalculos;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure CalcularImposto;
  end;

implementation

procedure TServicesCalculosTest.CalcularImposto;
var
  LResultado: Currency;
begin
  LResultado := FModelServicesCalculos.CalcularImposto(50.00,13.00);
  Assert.AreEqual<Currency>(6.50, LResultado);
end;

procedure TServicesCalculosTest.Setup;
begin
  FModelServicesCalculos := TModelServicesCalculos.New;
end;

procedure TServicesCalculosTest.TearDown;
begin
end;

initialization
  TDUnitX.RegisterTestFixture(TServicesCalculosTest);

end.
