unit menu;
{$codepage UTF8}
interface

uses
  crt,manejo_menu,Gestioncliente, archivo_cliente;

type
  archivocliente=Tarchivocliente;

var
  arch:tarchivocliente;

procedure menu_principal();

implementation
  procedure menu_principal();
  var
    menu_pr:T_menu;
    menu_op:t_menu_op;
    begin
    //AbrirOCrearArchivocliente(archivocliente,ruta);   //dejar con / hasta que se agregue una ruta
    inicializarmenu(menu_pr);
    menu_pr[1]:=  'Gestion Clientes';
    menu_pr[2]:=  'Gestion Polizas';
    menu_pr[3]:=  'Listados';
    menu_pr[4]:=  'Estadisticas';
    menu_pr[5]:=  'Salir';

    repeat ;
    menu_op:=seleccionaropcionMenuinteractivo('Menu Principal', menu_pr, 5);
    WriteLn(' --opcion seleccionada:',menu_op,'--');
    case menu_op of
    1:Menu_cliente(arch);

    end;
    readkey;
    until menu_op=5;
    end;

end.
