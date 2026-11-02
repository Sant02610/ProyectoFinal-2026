unit archivo_cliente;

interface
uses
  crt,SysUtils,tipos;

const
Ruta='archivocliente.dat';     //ruta temporal, crea el archivo en la misma ubicacion del programa.

type
Tarchivocliente = file of TCliente;

procedure AbrirOCrearArchivocliente(var Arch: TArchivocliente; Ruta: string);
function TamanioArchivocliente(var Arch: TArchivocliente): Integer;
procedure CerrarArchivocliente(var Arch: TArchivocliente);
procedure LeerArchivocliente(var Arch: TArchivocliente; Pos: Integer; var Value: Tcliente);
procedure EscribirArchivocliente(var Arch: TArchivocliente; Pos: Integer; var Value: Tcliente);

implementation

{ Abre el archivo si ya existe, o lo crea en caso contrario }
procedure AbrirOCrearArchivocliente(var Arch: TArchivocliente; Ruta: string);
begin
  Assign(Arch, Ruta);

  if FileExists(Ruta) then
    Reset(Arch)
  else
    Rewrite(Arch);
end;

{ Cantidad de registros físicos en el archivo }
function TamanioArchivocliente(var Arch: TArchivocliente): Integer;
begin
  TamanioArchivocliente := FileSize(Arch);
end;

{ Cierra el archivo físico en disco }
procedure CerrarArchivocliente(var Arch: TArchivocliente);
begin
  Close(Arch);
end;

procedure LeerArchivocliente(var Arch: TArchivocliente; Pos: Integer; var Value: TCliente);
begin
  Seek(Arch, Pos);
  Read(Arch, Value);
end;

procedure EscribirArchivocliente(var Arch: TArchivocliente; Pos: Integer; var Value: TCliente);
begin
  Seek(Arch, Pos);
  Write(Arch, Value);
end;

end.


