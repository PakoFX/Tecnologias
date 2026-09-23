// suscripciones club deportivo

type Plan = "basico"|"intermedio"|"pro"

class Cliente{
    constructor(
        public nombre: string,
        public email: string,
        public edad: number,
        public plan: Plan
    ){}

    validarUsuario(): boolean{
        if(this.nombre.length < 2){
            console.log("nombre invalido");
            return false;
        }
        if(this.edad < 16){
            console.log("Debes ser mayor de 15");
            return false;
        }
        if (!this.email.includes('@')){
            console.log()
        }
    }