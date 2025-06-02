typedef struct{
    int dni;
    char nombre[21];
    char carrera[21];
} persona;

void main(){
    int i;
    char* nombre="Ariel De Brito";
    char* carrera="Ing. Informatica"; 
    persona Ariel;
    Ariel.dni=44396739;
    for(i=0;nombre[i]!='\0';i++){
        Ariel.nombre[i]=nombre[i];
    }
    Ariel.nombre[i]='\0';
    for(i=0;carrera[i]!='\0';i++){
        Ariel.carrera[i]=carrera[i];
    }
    Ariel.carrera[i]='\0';
}