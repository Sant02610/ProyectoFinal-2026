unit validaciones;

{$codepage UTF8}

interface

uses
  crt,tipos;


function cargardni():TDni;

function dnivalido(dni:TDni): boolean;

implementation

function dnivalido(dni:TDni): boolean;
begin
  dnivalido := (Length(dni) >= 7) and (Length(dni) <= 8);
end;

function cargardni():TDni;
var
  dni:TDni;
begin
  ClrScr;
  repeat
  Write('dni del cliente: ');
  ReadLn(dni);
  if dnivalido(dni) = false then
  begin
  dni:='';
  WriteLn('DNI invalido: solo digitos entre 7 y 8 de longitud');
  end;
  until dni <> '';
  cargardni:=dni
end;

end.
