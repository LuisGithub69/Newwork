//
//  ViewController.swift
//  AlamoFireDetallado
//
//  Created by Jose Luis Ayala Perez on 09/05/24.
/*
 Pasos
 //0.- Al instalar el Alamofire en Build Settings  BuildOptions  en User Script Sandboxing    poner en NO
1.- Crear el Pod para eso ir a la carpeta donde esta el proyecto en la terminal del sistema y
    ejecutar la sentencia "pod init". Una vez ejecutado llenar el archivo con las dependencias y ejecutar
    la sentencia  "pod install --repo-update" y con esto ya tienes el archivo pods con las
    dependencias
2.- Analizar como esta el body del Json y empezar a crear el Objeto con la misma estructura
    Ejemplo del body de un Json es el archivo  BodyOnlyViewTrash q esta en este proy
3.- Empezar a desarrollar el Objeto ahi continua paso 4 ...

12.-Una vez que se terminaron todos los pasos para la creacion del Objeto del json, (q fueron 11),  se crea carpeta services, y se crea el archivo ServicesAlamofire
 
 
*/

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        llamadoServicio()
        
    }

    //13.- se crea la funcion donde se llamara el servicio y se mostrara el resultado
    func llamadoServicio(){
        ServicesAlamofire.getResultadoJson() { result in
             let datamodel = try! JSONDecoder().decode(ReadBodyJson.self, from: result)
             print("Todo bien ",datamodel)
            if let valorDesempaquetado = datamodel.items.item?[2].topping?[2].type {
                 // Usa valorDesempaquetado, que es ahora un valor no opcional
                 print("El resultado es   ==   ",valorDesempaquetado)
                print("Numero de item son ", datamodel.items.item?.count ?? 0)
                 //self.txtLabel.text = valorDesempaquetado
             }
         } onFailure: { error in
             print("Todo mal")
         }
    }
    
}

