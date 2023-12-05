unit Cli_Windows.Model.Interfaces;

interface

uses
  Cli_Windows.model.Grupo.Interfaces;

type
  iModel = interface
    ['{A4E14987-147F-4BB1-9E8E-6D4F95828292}']
    function Grupo: iModelGrupo;
  end;

implementation

end.
