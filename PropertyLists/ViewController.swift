//
//  ViewController.swift
//  PropertyLists
//
//  Created by David López on 4/2/23.
//

import UIKit

struct Alumno : Codable {
    var nombre : String
    var notas : [Float]
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for:.documentDirectory,in:.userDomainMask)[0]
        let urlPlist = documentsDirectory.appendingPathComponent("alumnos.plist")

        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml

        let a1 = Alumno(nombre: "Pepe", notas: [5, 8.5, 10])
        let a2 = Alumno(nombre: "Eva", notas: [10, 9])
        let alumnos = [a1,a2]

        do {
          let data = try encoder.encode(alumnos)
          try data.write(to: urlPlist)
        } catch {
          print(error)
        }

    }


}

