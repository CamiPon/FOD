program Ejercicio1;
    type
        archivo_enteros = file of integer;
    var
        enteros: archivo_enteros;
        NombreFisico: string[50];
        nro: integer;
begin
    write('Ingrese el nombre del archivo: ');
    readln(NombreFisico);
    Assign( enteros, NombreFisico);

    rewrite( enteros );

    writeln( 'Ingrese un nro: ');
    readln( nro );

    while (nro <> 30000)do
        begin
            write( enteros, nro );
            writeln( 'Ingrese un nro: ');
            readln( nro );
        end;

    close( enteros );
end.

