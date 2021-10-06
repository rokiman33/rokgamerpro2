//
//  ContentView.swift
//  RokGamerPro
//
//  Created by Richard Diaz Orellana on 23-08-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Spacer()
                Color(red: 29/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
                VStack{
                    Image("ROKGamerSmall").resizable().aspectRatio(contentMode: .fit ).frame(width:237).padding(.bottom, 42)
                InicioYRegistroView()
                }
               
            }.navigationBarHidden(true)
        }
    }
}

struct InicioYRegistroView:View{
    
    @State var tipoInicioSesion = true
    var body: some View{
        VStack{
            HStack {
                Spacer()
                Button("INICIO SESION"){
                    tipoInicioSesion = true
                }.foregroundColor(tipoInicioSesion ? .white: .gray)
                Spacer()
                Button("REGISTRATE"){
                    tipoInicioSesion = false
                }.foregroundColor(tipoInicioSesion ? .gray: .white)
                Spacer()
            }
            Spacer(minLength: 42)
            if tipoInicioSesion == true {
                InicioSesionView()
            }else{
                RegistroView()
            }
            
            
        }
    }
    
}

struct InicioSesionView:View {
    
    @State var correo:String = ""
    @State var contraseña:String = ""
    @State var IsPantallaHomeActive:Bool = false
    
    
    var body: some View{
        ScrollView {
            VStack(alignment:.leading) {
                Text("Correo Electronico").foregroundColor(Color("Dark-Cian"))
                ZStack(alignment:.leading){
                    if correo.isEmpty{
                        Text("ejemplo@gmail.com").font(.caption).foregroundColor(Color("Light-Gray"))
                    }
                    TextField("", text: $correo).foregroundColor(.white)
                }
                Divider().frame(height:1).background(Color("Dark-Cian")).padding(.bottom)
                Text("Contraseña").foregroundColor(Color("Dark-Cian"))
                ZStack(alignment:.leading){
                    if contraseña.isEmpty{
                        Text("Escribe tu Contraseña").font(.caption).foregroundColor(Color("Light-Gray"))
                    }
                    SecureField("", text: $contraseña).foregroundColor(.white)
                }
                Divider().frame(height:1).background(Color("Dark-Cian")).padding(.bottom)
                
                Text("¿Olvidaste tu Contraseña?").font(.footnote).frame(width: 300, alignment:.trailing).foregroundColor(Color("Dark-Cian")).padding(.bottom)
                
                
                Button(action: iniciarSesion){
                    Text("Iniciar Sesion").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                              .foregroundColor(.white)
                              .frame(maxWidth:.infinity,alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"),lineWidth: 1).shadow(color: .white,radius: 1))
                }
                
                Text("Iniciar Sesion con Redes Sociales").foregroundColor(.white)
                HStack{
                    Button(action: {print("Inicio de sesion con Facebook")}, label: {
                        Text("Facebook").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .frame(maxWidth:.infinity,alignment: .center).background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    })
                    .padding()
                    Button(action: {print("Inicio de sesion con Twitter")}, label: {
                        Text("Twitter").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .frame(maxWidth:.infinity,alignment: .center).background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    })
                }
            }.padding(.horizontal,77.0)
            
            NavigationLink(
                destination: Home(),
                isActive: $IsPantallaHomeActive,
                label: { EmptyView()
                           })
        }
    }
    
    func iniciarSesion() {
        let objetoDatosUsuario = SaveData()
                
                 print("Mi correo es \(correo) y mi contraseña es \(contraseña)")
                
                if objetoDatosUsuario.validar(correo: correo, contrasena: contraseña){
                    IsPantallaHomeActive.toggle()
                }else{
                    //Comentar linea de abajo para habilitar funcionalidad de validacion de usuario.
                    IsPantallaHomeActive.toggle()
                    print("Tus datos son incorrectos")
                    
                }
    }

    
}



struct RegistroView:View {
    @State var correo = ""
     @State var contraseña = ""
    @State var confirmarcontraseña = ""
    
    var body: some View{
        ScrollView{
            VStack(alignment:.center){
                Text("Elija una Foto de Perfil").foregroundColor(.white).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("Puedes Cambiar o Elegir mas Adelante").font(.footnote).fontWeight(.light).foregroundColor(.gray).padding(.bottom)
                
                Button(action: TomarFoto, label: {
                    ZStack {
                        Image("profile").resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80)
                        Image(systemName: "camera").foregroundColor(.white)
                        
                    }
                }).padding(.bottom)
                
                
            }
            
            VStack(alignment:.leading){
            VStack(alignment:.leading) {
                Text("Correo Electronico*").foregroundColor(Color("Dark-Cian"))
                ZStack(alignment:.leading){
                    if correo.isEmpty{
                        Text("ejemplo@gmail.com").font(.caption).foregroundColor(Color("Light-Gray"))
                    }
                    TextField("", text: $correo).foregroundColor(.white)
                }
                Divider().frame(height:1).background(Color("Dark-Cian")).padding(.bottom)
                Text("Contraseña*").foregroundColor(Color("Dark-Cian"))
                ZStack(alignment:.leading){
                    if contraseña.isEmpty{
                        Text("Escribe tu Contraseña").font(.caption).foregroundColor(Color("Light-Gray"))
                    }
                    SecureField("", text: $contraseña).foregroundColor(.white)
                }
                Divider().frame(height:1).background(Color("Dark-Cian")).padding(.bottom)
                Text("Confirmar Contraseña*").foregroundColor(Color("Dark-Cian"))
                ZStack(alignment:.leading){
                    if contraseña.isEmpty{
                        Text("Confirma Contraseña").font(.caption).foregroundColor(Color("Light-Gray"))
                    }
                    SecureField("", text: $confirmarcontraseña).foregroundColor(.white)
                }
                Divider().frame(height:1).background(Color("Dark-Cian")).padding(.bottom)
            }
                Button(action: registrarse) {
                    Text("REGISTRATE").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity,alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"),lineWidth: 1).shadow(color: .white,radius: 1))
                }
                
                Text("Iniciar Sesion con Redes Sociales").foregroundColor(.white).frame(maxWidth:.infinity, alignment:.center).foregroundColor(.white)
                HStack{
                    Button(action: {print("Inicio de sesion con Facebook")}, label: {
                        Text("Facebook")
                            .font(.subheadline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .padding(.vertical,3.0)
                            .frame(maxWidth:.infinity,alignment: .center).background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    })
                    .padding()
                    Button(action: {print("Inicio de sesion con Twitter")}, label: {
                        Text("Twitter").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .frame(maxWidth:.infinity,alignment: .center).background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    })
                    
                }
                
                
            }.padding(.horizontal,77.0)
            
        }
    }
    
    func TomarFoto(){
        print("Voy a tomar fotografia de perfil")
    }

    func registrarse() {
        
        print("Me registro con el correo \(correo), la contraseña \(contraseña) y confirmación de contraseña \(confirmarcontraseña)")
            
                //validación contraseña
                if contraseña == confirmarcontraseña{
                  
                    let objetoActualizadorDatos = SaveData()
                    
                    let resultado = objetoActualizadorDatos.guardarDatos(correo: correo, contrasena: contraseña, nombre: "")
                    
                    print("Se guardaron los datos con exito?: \(resultado)")
                    
                }else{
                    
                    print("Contraseñas diferentes, vuelve a intentarlo")
                }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
