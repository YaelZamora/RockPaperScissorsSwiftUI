//
//  ContentView.swift
//  music
//
//  Created by Yael Javier Zamora Moreno on 15/03/23.
//

import SwiftUI

struct ContentView: View {
    let juego = ["🖐🏻", "👊🏻", "✌🏻"]
    @State private var puntosJugador = 0
    @State private var puntosIA = 0
    @State private var randomInt = 0
    @State private var juegoJugador = 0
    @State private var showAlert = false
    @State private var ganador = ""
    
    var body: some View {
        VStack {
            Text("\(juego[randomInt])").font(Font.custom("", size: 100))
            HStack{
                Text("\(puntosJugador)").font(Font.custom("", size: 100))
                Text("🆚").font(Font.custom("", size: 100))
                Text("\(puntosIA)").font(Font.custom("", size: 100))
            }.padding()
            Text("\(juego[juegoJugador])").font(Font.custom("", size: 100))
            HStack{
                Text("🖐🏻").font(Font.custom("", size: 50))
                    .padding()
                    .background(.yellow)
                    .cornerRadius(20)
                    .onTapGesture {
                        getRespuesta()
                        juegoJugador = 0
                        if(randomInt == 0){
                            //Es empate
                        }else if(randomInt == 1){
                            puntosJugador+=1
                        } else{
                            puntosIA+=1
                        }
                        
                        if(puntosJugador == 10){
                            ganador = "Felicidades!! Ganaste"
                            showAlert = true
                        } else if(puntosIA == 10){
                            ganador = "La IA te venció"
                            showAlert = true
                        }
                    }.alert("\(ganador)", isPresented: $showAlert){
                        Button("OK", role: .cancel){
                            puntosIA = 0
                            puntosJugador = 0
                            juegoJugador = 0
                            randomInt = 0
                        }
                    }
                Text("👊🏻").font(Font.custom("", size: 50))
                    .padding()
                    .background(.yellow)
                    .cornerRadius(20)
                    .onTapGesture {
                        getRespuesta()
                        juegoJugador = 1
                        if(randomInt == 0){
                            puntosIA+=1
                        } else if(randomInt == 1){
                            //Es empate
                        }else{
                            puntosJugador+=1
                        }
                        if(puntosJugador == 10){
                            ganador = "Felicidades!! Ganaste"
                            showAlert = true
                        } else if(puntosIA == 10){
                            ganador = "La IA te venció"
                            showAlert = true
                        }
                    }.alert("\(ganador)", isPresented: $showAlert){
                        Button("OK", role: .cancel){
                            puntosIA = 0
                            puntosJugador = 0
                            juegoJugador = 0
                            randomInt = 0
                        }
                    }
                Text("✌🏻").font(Font.custom("", size: 50))
                    .padding()
                    .background(.yellow)
                    .cornerRadius(20)
                    .onTapGesture {
                        getRespuesta()
                        juegoJugador = 2
                        if(randomInt == 0){
                            puntosJugador+=1
                        } else if(randomInt == 1){
                            puntosIA+=1
                        } else{
                            //Es empate
                        }
                        if(puntosJugador == 10){
                            ganador = "Felicidades!! Ganaste"
                            showAlert = true
                        } else if(puntosIA == 10){
                            ganador = "La IA te venció"
                            showAlert = true
                        }
                    }.alert("\(ganador)", isPresented: $showAlert){
                        Button("OK", role: .cancel){
                            puntosIA = 0
                            puntosJugador = 0
                            juegoJugador = 0
                            randomInt = 0
                        }
                    }
            }
            .padding()
        }
    }
    func getRespuesta() -> Int{
        randomInt = Int.random(in: 0...2)
        
        return randomInt
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
