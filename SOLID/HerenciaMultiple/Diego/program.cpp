#include <iostream>
using namespace std;

class Animal{
    public:
        string nombre;

        Animal(string nombre) : nombre(nombre){
            cout << "Animal contructor" << endl;
        }

        void virtual andar(){
            cout << nombre << " está andando" << endl;
        }
};

class Perro : public Animal{
    public:
        Perro(string nombre) : Animal(nombre){}

    void ladrar(){
        cout << nombre << " Esta ladrando" << endl;
    }
};



class Volador : virtual public Animal{
    public:
        Volador(string nombre) : Animal(nombre) {
            this->nombre = nombre;
        }

        void andar() override{
            cout << nombre << " esta volando " << endl;
        }
};

class Nadador : virtual public Animal{
    public:
        Nadador(string nombre) : Animal(nombre) {
            this->nombre = nombre;
        }

        void andar() override{
            cout << nombre << " esta nadando " << endl;
        }
};

class Pato : public Volador, public Nadador{
    public:
        Pato(string nombre) : Animal(nombre), Volador(nombre), Nadador(nombre){}

        void andar() override{
            cout << nombre << " esta volando y nadando" << endl;
        }

        void graznar(){
            cout << nombre << " esta graznando" << endl;
        }
};



int main(){
    Perro perro1("Pako");
    perro1.ladrar();

    Pato pato1("Justin");
    pato1.andar();

    return 0;
};