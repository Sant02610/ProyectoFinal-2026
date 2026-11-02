unit Gestioncliente;

{$codepage UTF8}

interface

uses
  crt, validaciones,archivo_cliente,tipos;
procedure Menu_cliente(var arch:Tarchivocliente);
procedure buscarclientepordni(var arch:Tarchivocliente; dni:TDni; out pos:integer);

implementation

procedure Menu_cliente(var arch:Tarchivocliente);
var
  dni:TDni;
  s:integer; //necesita estar declarado como integer para la verificacion
begin
  ClrScr;
dni:=cargardni();
WriteLn('DNI leido: ', dni);
s:=-1;
buscarclientepordni (arch,dni,s);
if (s <> -1) then
WriteLn('existe, mostrar menu de modificar o desactivar/activar')
else
WriteLn('no existe');

ReadKey;
end;

procedure buscarclientepordni(var arch:Tarchivocliente; dni:TDni; out pos:integer);
var
  i:integer;
  cliente:TCliente;
  begin
  i:=0;
  pos:=-1;
  cliente := Default(TCliente);
  AbrirOCrearArchivocliente(arch,ruta);     //no va aca agregado temporalmente para pruebas
  while not (eof(arch)) and (pos=-1) do
   begin
    LeerArchivocliente(arch,i,cliente);
    if cliente.dni=dni then
    begin
    pos:=i;
    end;
    Inc(i);
   end;
  end;

end.
