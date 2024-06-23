program SistemaCombustivelTest;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}
uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ELSE}
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  {$ENDIF }
  DUnitX.TestFramework,
  Sistema.Test.ConnectionTest in 'Test\Sistema.Test.ConnectionTest.pas',
  Sistema.Model.Connection.Factory in 'Model\Connection\Sistema.Model.Connection.Factory.pas',
  Sistema.Model.Connection.Firedac in 'Model\Connection\Sistema.Model.Connection.Firedac.pas',
  Sistema.Model.Connection.Interfaces in 'Model\Connection\Sistema.Model.Connection.Interfaces.pas',
  Sistema.Model.Connection.Query.Firedac in 'Model\Connection\Sistema.Model.Connection.Query.Firedac.pas',
  Sistema.Sitema.Model.Exception.MinhaExcecao in 'Model\Exception\Sistema.Sitema.Model.Exception.MinhaExcecao.pas',
  Sistema.Model.DAO.Factory in 'Model\DAO\Sistema.Model.DAO.Factory.pas',
  Sistema.Model.DAO.Interfaces in 'Model\DAO\Sistema.Model.DAO.Interfaces.pas',
  Sistema.Model.DAO.SQL in 'Model\DAO\Sistema.Model.DAO.SQL.pas',
  Sistema.Model.Util.Funcoes in 'Model\Util\Sistema.Model.Util.Funcoes.pas',
  Sistema.Model.Util.SQLGerador in 'Model\Util\Sistema.Model.Util.SQLGerador.pas',
  Sistema.Test.ServicesCalculosTest in 'Test\Sistema.Test.ServicesCalculosTest.pas',
  Sistema.Controller.Interfaces in 'Controller\Sistema.Controller.Interfaces.pas',
  Sistema.Controller in 'Controller\Sistema.Controller.pas',
  Sistema.Model.Entities.Abastecimentos in 'Model\Entities\Sistema.Model.Entities.Abastecimentos.pas',
  Sistema.Model.Entities.Bombas in 'Model\Entities\Sistema.Model.Entities.Bombas.pas',
  Sistema.Model.Entities.Clientes in 'Model\Entities\Sistema.Model.Entities.Clientes.pas',
  Sistema.Model.Entities.Tanques in 'Model\Entities\Sistema.Model.Entities.Tanques.pas',
  Sistema.Model.Services.Abastecimentos in 'Model\Services\Sistema.Model.Services.Abastecimentos.pas',
  Sistema.Model.Services.Bombas in 'Model\Services\Sistema.Model.Services.Bombas.pas',
  Sistema.Model.Services.Factory in 'Model\Services\Sistema.Model.Services.Factory.pas',
  Sistema.Model.Services.Interfaces in 'Model\Services\Sistema.Model.Services.Interfaces.pas',
  Sistema.Model.Services.Tanques in 'Model\Services\Sistema.Model.Services.Tanques.pas',
  Sistema.Model.Services.Calculos in 'Model\Services\Sistema.Model.Services.Calculos.pas';

{$IFNDEF TESTINSIGHT}
var
  runner: ITestRunner;
  results: IRunResults;
  logger: ITestLogger;
  nunitLogger : ITestLogger;
{$ENDIF}
begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
{$ELSE}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //When true, Assertions must be made during tests;
    runner.FailsOnNoAsserts := True;

    //tell the runner how we will log things
    //Log to the console window if desired
    if TDUnitX.Options.ConsoleMode <> TDunitXConsoleMode.Off then
    begin
      logger := TDUnitXConsoleLogger.Create(TDUnitX.Options.ConsoleMode = TDunitXConsoleMode.Quiet);
      runner.AddLogger(logger);
    end;
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Teste concluído.. pressione a tecla <Enter> para sair.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
{$ENDIF}
end.
