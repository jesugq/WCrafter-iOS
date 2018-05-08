import UIKit

class Stat {
    
    // Attributes
    var photo : UIImage
    var value : String
    var descr : String
    
    // Constructor
    init?(type: String, value: String) {
        // No image given.
        guard !type.isEmpty else {
            return nil
        }
        
        // No value given.
        guard !value.isEmpty else {
            return nil
        }
        
        self.photo = UIImage(named: "card")!
        self.value = value
        self.descr = type
        
        self.photo = createPhoto(image: type)
        self.descr = createDescription(descr: descr)
    }
    
    //
    // Functions
    //
    func createPhoto(image: String) -> UIImage {
        switch image {
        case "card" :
            return UIImage(named: "card")!
        case "engine" :
            return UIImage(named: "engine")!
        case "battery" :
            return UIImage(named: "battery")!
        case "odometer" :
            return UIImage(named: "odometer")!
        case "speed" :
            return UIImage(named: "speed")!
        case "road" :
            return UIImage(named: "road")!
            
        case "odometerdelta" :
            return UIImage(named: "card")!
        case "enginetime" :
            return UIImage(named: "engine")!
        case "speedbreak" :
            return UIImage(named: "speed")!
        default:
            return UIImage(named: "card")!
        }
    }
    
    func createDescription(descr: String) -> String {
        switch descr {
        case "card" :
            return "Número VIN"
        case "engine" :
            return "Estado del motor"
        case "battery" :
            return "Estado de la batería"
        case "odometer" :
            return "RP"
        case "speed" :
            return "Velocidad promedio"
        case "road" :
            return "Distancia recorrida"
        
        case "odometerdelta" :
            return "Delta del odómetro"
        case "enginetime" :
            return "Tiempo de motor encendido"
        case "speedbreak" :
            return "Frenados en seco"
        default:
            return "Desconocido"
        }
    }
    
}
