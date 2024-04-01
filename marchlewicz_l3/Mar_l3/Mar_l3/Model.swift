//
//  Model.swift
//  Mar_l3
//
//  Created by apios on 24/04/2023.
//

import Foundation
class Model{
    
    var rozmiar: Int
    var password: [Int]
    
    init(){
        self.rozmiar = 5
        var haslo = [Int](repeating: 0, count: rozmiar)
        for i in stride(from: 0, to: rozmiar, by: 1){
            haslo[i] = Int.random(in: 0...9)
        }
        self.password = haslo
    }

    //dostaje wpisane prez gracza i porownuje z haslem - zwraca jakie kolorki
    func porownanie(_ letters: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: password.count)
        for i in stride(from: 0, to: password.count, by: 1){
            if letters[i] == password[i]{
                result[i] = 1
            }
            else{
                for j in stride(from: 0, to: password.count, by: 1){
                    if letters[i] == password[j]{
                        result[i] = -1
                    }
                }
            }
        }
        return result
    }

}
