unit Sistema.Model.Util.SQLGerador;

interface

uses
  System.SysUtils,
  System.Rtti, 
  Data.DB;

type

  // Classe que usa RTTI para gerar comandos SQL lendo um objeto
  TSQLGerador = class
  public
    class function GerarInsertSQL(AEntity: TObject): string; // Fun��o para gerar o comando SQL de INSERT.
    class function GerarUpdateSQL(AEntity: TObject): string; // Fun��o para gerar o comando SQL de UPDATE.
    class function GerarDeleteSQL(AEntity: TObject): string; // Fun��o para gerar o comando SQL de DELETE.
    class function GerarSelectSQL(AEntity: TObject): string; // Fun��o para gerar o comando SQL de SELeECT.
    class procedure PreencherObjeto(DataSet: TDataSet; Objeto: TObject); // Fun��o para ler o DataSet e Preencher o Objeto
    class function FormataValor(ARttiProp: TRttiProperty; AEntity: TObject) : string;
  end;

implementation

const cID = 'ID';

class function TSQLGerador.GerarInsertSQL(AEntity: TObject): string;
var
  LRttiContext: TRttiContext; // Contexto RTTI para acessar as informa��es de tempo de execu��o.
  LRttiType: TRttiType;       // Tipo RTTI do objeto.
  LRttiProp: TRttiProperty;   // Propriedades RTTI do objeto.
  LTableName: string;         // Nome da tabela, que ser� o nome da classe.
  LFields, LValues: string;   // Strings para armazenar os campos e valores do comando SQL.
begin
  LRttiContext := TRttiContext.Create; // Cria o contexto RTTI.
  try
    LRttiType := LRttiContext.GetType(AEntity.ClassType); // Obt�m o tipo RTTI da classe do objeto.
    LTableName := LRttiType.Name.Substring(1).ToUpper; // Define o nome da tabela como o nome da classe.
    LFields := '';
    LValues := '';

    // Itera sobre todas as propriedades do objeto.
    for LRttiProp in LRttiType.GetProperties do
    begin
      if LFields <> '' then
      begin
        LFields := LFields + ', ';
        LValues := LValues + ', ';
      end;

      if LRttiProp.Name.ToUpper <> cID then // Ignora a propriedade Id.
      begin
        LFields := LFields + LRttiProp.Name.ToUpper;
        LValues := LValues + FormataValor(LRttiProp,AEntity);    //QuotedStr(LRttiProp.GetValue(AEntity).ToString);
      end;


    end;

    // Formata a string SQL de INSERT.
    Result := Format('INSERT INTO %s (%s) VALUES (%s)', [LTableName, LFields, LValues]);
  finally
    LRttiContext.Free; // Libera o contexto RTTI.
  end;
end;


class function TSQLGerador.GerarUpdateSQL(AEntity: TObject): string;
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiProp: TRttiProperty;
  LTableName, LSetClause: string; // Nome da tabela e cl�usula SET do comando SQL.
  LID: Integer; //ID da tabela
begin
  LRttiContext := TRttiContext.Create; 
  try
    LRttiType := LRttiContext.GetType(AEntity.ClassType); 
    LTableName := LRttiType.Name.Substring(1).ToUpper;
    LID := -1; 
    LSetClause := ''; 

    // Percorre as propriedades do objeto.
    for LRttiProp in LRttiType.GetProperties do
    begin
      if LRttiProp.Name.ToUpper = cID  then // Pega o Id da tabela
        LID := LRttiProp.GetValue(AEntity).AsInteger;

      if LRttiProp.Name.ToUpper <> cID then // Ignora a propriedade Id.
      begin
        if LSetClause <> '' then
          LSetClause := LSetClause + ', ';

        // Adiciona o nome da propriedade e seu valor � cl�usula SET.
        LSetClause := LSetClause + Format('%s = %s', [LRttiProp.Name.ToUpper, FormataValor(LRttiProp,AEntity)]);
      end;
    end;

    // Formata a string SQL de UPDATE.
    Result := Format('UPDATE %s SET %s WHERE Id = %d', [LTableName, LSetClause, LID]);
  finally
    LRttiContext.Free; // Libera o contexto RTTI.
  end;
end;

class procedure TSQLGerador.PreencherObjeto(DataSet: TDataSet; Objeto: TObject);
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiProp: TRttiProperty;
  LValue: TValue;
  FieldValue: Variant;
begin
  LRttiContext := TRttiContext.Create;
  try
    LRttiType := LRttiContext.GetType(Objeto.ClassType);
    for LRttiProp in LRttiType.GetProperties do
    begin
      // Verifica se a propriedade tem um correspondente no DataSet
      if DataSet.FindField(LRttiProp.Name.ToUpper) <> nil then
      begin
        // Obt�m o valor do campo do DataSet
        FieldValue := DataSet.FieldByName(LRttiProp.Name.ToUpper).Value;
        // Verifica se a propriedade � do tipo Currency - Quando � currency TypeKind = tkFloat
        if LRttiProp.PropertyType.TypeKind = tkFloat then
        begin
          // Converte o valor do campo para Currency
          LValue := TValue.From<Currency>(DataSet.FieldByName(LRttiProp.Name.ToUpper).AsCurrency);
        end
        else
        begin
          // Caso geral: converte o valor do campo para TValue
          LValue := TValue.FromVariant(FieldValue);
        end;
        // Define o valor da propriedade do objeto
        LRttiProp.SetValue(Objeto, LValue);
      end;
    end;
  finally
    LRttiContext.Free;
  end;
end;

class function TSQLGerador.FormataValor(ARttiProp: TRttiProperty; AEntity: TObject): string;
var
  LValorFormatado: string;
begin
  case ARttiProp.PropertyType.TypeKind of
    tkInteger, tkInt64, tkEnumeration :
      LValorFormatado := ARttiProp.GetValue(AEntity).ToString;
    tkString, tkUString, tkWString, tkLString :
      LValorFormatado := QuotedStr(ARttiProp.GetValue(AEntity).ToString);
    tkFloat  :
      begin
        if ARttiProp.PropertyType.QualifiedName = 'System.TDate' then
          LValorFormatado := QuotedStr(FormatDateTime('dd.mm.yyyy', ARttiProp.GetValue(aEntity).AsExtended))
        else
          LValorFormatado := StringReplace(ARttiProp.GetValue(AEntity).ToString, ',', '.', []);
      end;
  end;
  Result := LValorFormatado;
end;

class function TSQLGerador.GerarDeleteSQL(AEntity: TObject): string;
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiProp: TRttiProperty;
  LTableName: string;
  LID: Integer;
begin
  LRttiContext := TRttiContext.Create;
  try
    LRttiType := LRttiContext.GetType(AEntity.ClassType);
    LTableName := LRttiType.Name.Substring(1).ToUpper;
    LID := -1;

    for LRttiProp in LRttiType.GetProperties do
    begin
      if LRttiProp.Name.ToUpper = cID then // Pega o Id da tabela
      begin
        LID := LRttiProp.GetValue(AEntity).AsInteger;
        Break;
      end;
    end;

    // Formata a string SQL de DELETE.
    Result := Format('DELETE FROM %s WHERE Id = %d', [LTableName, LID]);
  finally
    LRttiContext.Free;
  end;
end;

class function TSQLGerador.GerarSelectSQL(AEntity: TObject): string;
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiProp: TRttiProperty;
  LTableName: string;
  LFieldList: string;
begin
  LRttiContext := TRttiContext.Create;
  try
    LRttiType := LRttiContext.GetType(AEntity.ClassType);
    LTableName := LRttiType.Name.Substring(1).ToUpper;

    LFieldList := '';

    for LRttiProp in LRttiType.GetProperties do
    begin
      if LFieldList <> '' then
        LFieldList := LFieldList + ', ';

      LFieldList := LFieldList + LRttiProp.Name;
    end;

    // Formata a string SQL de SELECT
    Result := Format('SELECT %s FROM %s', [LFieldList, LTableName]);
  finally
    LRttiContext.Free;
  end;
end;


end.

