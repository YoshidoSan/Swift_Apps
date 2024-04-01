//
//  ContentView.swift
//  Mar_l3
//
//  Created by apios on 24/04/2023.
//

import SwiftUI

struct ContentView: View {
    //zmienne potrzebne
    //macierz wyswietlanych wartosci
    @State var rozwiazania : [[Int]] = Array(repeating: Array(repeating: 0, count: 5), count: 5)
    //indeksy gdzie teraz wpsiujemy
    @State var indeks_row = 0
    @State var indeks_col = 0
    //zwrotny wektor kolorow z modelu po sprawdzeniu poprawnosci
    @State var wynik = [0,0,0,0,0]
    //logika
    let model: Model = Model()
    //text do guzika
    @State var buttstr = "Check!"
    //macierz kolorow
    @State var kolorki : [[[Double]]] = Array(repeating: Array(repeating: [1.0, 1.0, 1.0], count: 5), count: 5)
    
    
    //view apki
    var body: some View {
        //pola do wpsiywania
        VStack {
        ForEach(0 ..< 5){ field in
            HStack {
                ForEach(1 ..< 6) { fieldIn in
                    TextField("myID:\(field) , \(fieldIn)", value: $rozwiazania[field][fieldIn-1], formatter: NumberFormatter())
                        .background(Color(red: kolorki[field][fieldIn-1][0], green: kolorki[field][fieldIn-1][1], blue: kolorki[field][fieldIn-1][2]))
                }
                
            }
        }
        }
        //guziki do wyboru kolumny
        
        HStack {
                Group {
                    ForEach(0 ..< 5) { column in
                        //po kliknieciu zmiana indeksu
                        Button(action:{ indeks_col = column }) {
                        Text("Column: \(column+1)")
                        }
                    }
                }
        }
        
        //guziki do cyferek
        VStack {
        ForEach(0 ..< 3){ item in
            HStack {
                ForEach(1 ..< 4) { itemIn in
                    //po kliknieciu na obecny indeks wchodzi ta wartosc
                    Button(action:{ rozwiazania[indeks_row][indeks_col] = 3*item + itemIn}) {
                    Text("\(3*item + itemIn)")
                    }
                }
            }
        }
        }
        //guzik do cyferek cd i guzik do sprawdzenia
        HStack {
                Group {
                    //po kliknieciu sprawdzenie poprawnosci i zmiana kolumny
                    Button(action: {
                        if (indeks_row >= 5) && (wynik == [1,1,1,1]){
                            buttstr = "Wygrana!"
                        }
                        if indeks_row >= 5{
                            buttstr = "Koniec Gry!"
                        }
                        if indeks_row < 5{
                            wynik = model.porownanie(rozwiazania[indeks_row])
                            for i in stride(from: 0, to: wynik.count, by: 1) {
                                //dobre miejsce
                                if wynik[i] == 1 {
                                    kolorki[indeks_row][i] = [0.0,1.0,1.0]
                                        }
                                //nie ma
                                else if wynik[i] == -1 {
                                    kolorki[indeks_row][i] = [1.0,0.0,0.0]
                                        }
                                //zle miejsce
                                else if wynik[i] == 0 {
                                    kolorki[indeks_row][i] = [1.0,1.0,1.0]
                                }
                            }
                            indeks_row += 1
                        }
                        
                    } ) {
                        Text(buttstr)
                    }}
                    //po kliknieciu na obecny indeks wchodzi ta wartosc
                    Button(action: { rozwiazania[indeks_row][indeks_col] = 0 } ) {
                        Text("0")
                    }
                }
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
