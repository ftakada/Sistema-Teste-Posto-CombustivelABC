unit Sistema.Test.ConnectionTest;

interface

uses
  DUnitX.TestFramework,
  Sistema.Model.Connection.Factory,
  Sistema.Model.Connection.Interfaces,
  System.SysUtils;

type
  [TestFixture]
  TConnectionTest = class
  private
    FModelConnectionFactory: iModelConnectionFactory;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TestConfigurarConnection;
    [Test]
    procedure TestConnect;
  end;

implementation

{ TConnectionTest }

procedure TConnectionTest.Setup;
begin
  FModelConnectionFactory := TModelConnectionFactory.New;
end;

procedure TConnectionTest.TearDown;
begin

end;

procedure TConnectionTest.TestConfigurarConnection;
begin
  Assert.WillNotRaise(
    procedure
    begin
      FModelConnectionFactory.Connection.ConfigurarConnection;
    end,
  Exception);
end;

procedure TConnectionTest.TestConnect;
begin
  Assert.WillNotRaise(
    procedure
    begin
      FModelConnectionFactory.Connection.Connect;
    end,
  Exception);
end;

initialization
  TDUnitX.RegisterTestFixture(TConnectionTest);

end.
