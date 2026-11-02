unit tipos;

{$mode ObjFPC}{$H+}

interface

uses
crt;

Type
  TDni=string[8];
  TFecha=record
  dia:1..31;
  mes:1..12;
  anio:word{ o 2000..2030};
  end;

implementation

end.

