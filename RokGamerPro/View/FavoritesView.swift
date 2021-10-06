//
//  FavoritesView.swift
//  RokGamerPro
//
//  Created by Richard Diaz Orellana on 06-10-21.
//

import SwiftUI
import AVKit

struct FavoritesView: View {
    
    @ObservedObject var todosLosVideojuegos = ViewModel()

    var body: some View{
            
            
            ZStack{
                
                Color("Marine").ignoresSafeArea()
                
                VStack() {
                    
                    
                    Text("FAVORITOS")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 9.0)
                    
                    ScrollView{

                            ForEach(todosLosVideojuegos.gamesInfo, id: \.self) { juego in
                                
                               
                             
                                VStack(spacing: 0){
                                    
                                    //Bug con VideoPlayer previene esconder barra de navegacion
                                    VideoPlayer(player: AVPlayer(url: URL(string:  juego.videosUrls.mobile)!)).frame( height: 300)
                                        
                                        
                                        Text("\(juego.title)").foregroundColor(Color.white)
                                            .padding()
                                            .frame( maxWidth: .infinity,alignment: .leading)
                                            .background(Color("Blue-Gray"))
                                            .clipShape(RoundedRectangle(cornerRadius: 3.0))
                                    
                                }

                            }

                    }.padding(.bottom,8)

                }.padding(.horizontal,6)
            }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)

        }
 
    }

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
