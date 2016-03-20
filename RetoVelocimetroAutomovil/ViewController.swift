//
//  ViewController.swift
//  RetoVelocimetroAutomovil
//
//  Created by Gonch iMac on 20/03/16.
//  Copyright © 2016 Gonzalo Valencia. All rights reserved.
//
//----------------------------Aqui empieza el playground------------------------------------------------
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        enum Velocidades: Int { //Declara la enumeración: Velocidades, sus valores serán de tipo Int.
            
            //La enumeración Velocidades cuenta con los siguientes elementos y sus respectivos valores:
            case Apagado = 0 //- Apagado = 0, representa la velocidad 0.
            case VelocidadBaja = 20 // - VelocidadBaja = 20, representa una velocidad de 20km por hora.
            case VelocidadMedia = 50 //  - VelocidadMedia = 50, representa una velocidad de 50km por hora
            case VelocidadAlta = 120 // - VelocidadAlta = 120, representa una velocidad de 50km por hora.
            
            //- Además, debes de declarar un inicializador que recibe un velocidad:
            
            init(velocidadInicial: Velocidades) { //- init( velocidadInicial : Velocidades )
                self = velocidadInicial //- El inicializador se debe asignar a self el valor de velocidadInicial
            }
        }
        
        /* Clase AUTO */
        class Auto { //Declara la clase: Auto
            
            //La clase Auto tiene los siguientes atributos:
            
            var velocidad: Velocidades //- Una variable que sea una instancia de la enumeración Velocidades, llamada: velocidad.
            
            //Las funciones o métodos que define la clase Auto son las siguientes:
            
            init() { //- init( ), agrega la función inicializadora que crea una instancia de Velocidades: velocidad, debe iniciar en Apagado. Recuerda que la enumeración tiene su función inicializadora.
                
                self.velocidad = Velocidades(velocidadInicial: .Apagado)
            }
            
            
            func cambioDeVelocidad() -> (actual : Int, velocidadEnCadena: String) { //- func cambioDeVelocidad( ) -> ( actual : Int, velocidadEnCadena: String), (...)
                
                switch velocidad {
                    
                case .Apagado : // Apagado cambia a VelocidadBaja
                    velocidad = .VelocidadBaja
                    return (velocidad.rawValue, "Velocidad-Baja")
                case .VelocidadBaja: //de VelocidadBaja cambia a VelocidadMedia
                    velocidad = .VelocidadMedia
                    return (velocidad.rawValue, "Velocidad-Media")
                case .VelocidadMedia:
                    velocidad = .VelocidadAlta
                    return (velocidad.rawValue, "Velocidad-Alta")
                case .VelocidadAlta://si llega a VelocidadAlta cambia a VelocidadMedia
                    velocidad = .VelocidadMedia
                    return (velocidad.rawValue, "Velocidad-Media")
                    
                }
            }
        }
        
        var auto:Auto = Auto() // - En el mismo playground prueba crea una instancia de la clase Auto, llamada auto.
        
        
        print("\(auto.velocidad.rawValue), \(auto.velocidad)")
        
        
        var resultado:(actual: Int, velocidadEnCadena: String)
        
        for index in 1...20 { //- Itera 20 veces usando un for,
            resultado = auto.cambioDeVelocidad() //llama a la función cambioDeVelocidad
            print("\(resultado.actual), \(resultado.velocidadEnCadena)") //imprime los valores de la tupla en la consola.
        }
        
        
        
      //-------------------Aqui termina el playground--------------------------------------
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

