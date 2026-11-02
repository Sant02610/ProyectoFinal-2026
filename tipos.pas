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

TCliente=record
dni:TDni;
nombrecompleto:string[75];
direccion:string[150];
fechanac:TFecha;
celular:Cardinal;
email:string[150];
activo:boolean;
end;

implementation

end.

