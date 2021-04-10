program Ejercicio4;
type
    Persona = record
        nroEmpleado: integer;
        apellido: string[50];
        nombre: string[50];
        edad: integer;
        DNI: integer;
    end;
    archivo_persona: file of Persona;

Procedure CrearArchivo(var archivo_binario: archivo_persona);
var persona: Persona;
    arhc_carga: Text;
    nom_arch_carga: String;
begin
    writeln('Escriba nombre de archivo de carga: ');
    readln(arch_carga);
    Assign(arch_carga,nom_arch_carga);
    Reset(arch_carga);
    Rewrite(archivo_binario);
    while (not eof(arch_carga) do begin
        with persona do readln(arch_carga,nroEmpleado,edad,DNI,apellido,nombre);
        Write(archivo_binario,persona);
    end;
    writeln('Archivo cargado');
    readln;
    Close(archivo_binario);
    Close(arch_carga);
    end;

Procedure Listar(persona: Persona);
begin
    writeln('Nombre: ', persona.nombre);
    writeln('Apellido: ', persona.apellido);
    writeln('Nro empleado: ', persona.nroEmpleado);
    writeln('Edad: ', persona.edad);
    writeln('DNI: ', persona.DNI);
end;

Procedure ListarConNombreOApellido(archivo_binario: archivo_persona);
var persona: Persona;
    nombre_o_apellido: string[50];
begin
    Reset(archivo_binario);
    while (not eof(archivo_binario) do begin
        Read(archivo_binario, persona);
        if(persona.nombre = nombre_o_apellido or persona.apellido = nombre_o_apellido) then
            Listar(persona);
    end;
    Close(archivo_binario);
end;

Procedure ListarEmpleados(archivo_binario: archivo_persona);
var persona: Persona;
begin
    Reset(archivo_binario);
    while(not eof(archivo_binario) do begin
        Read(archivo_binario, persona);
        Listar(persona);
    end;
    Close(archivo_binario);
end;

Procedure ListarMayoresDe70(archivo_binario: archivo_persona);
var persona: Persona;
begin
    Reset(archivo_binario);
    while(not eof(archivo_binario) do begin
        Read(archivo_binario, persona);
        if(persona.edad > 70)then
            Listar(persona);
    end;
    Close(archivo_binario);
end;

var Archivo_Binario: archivo_persona;
    nombre_arch: String;
begin
    writeln('Escriba nombre de archivo binario');
    readln(nombre_arch);
    Assing(Archivo_Binario,nombre_arch);
    CrearArchivo(Archivo_Binario);
    ListarConNombreOApellido(Archivo_Binario);
    ListarEmpleados(Archivo_Binario);
    ListarMayoresA70(Archivo_Binario);
end.

