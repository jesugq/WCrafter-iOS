//
//  PassengerModel.swift
//  WCrafter
//

import Foundation
 let sharedInstance = ModelManager()

class ModelManager: NSObject{
    //Insert your database
    var database: FMDatabase?
    
    class var instance: ModelManager{
        let documentsFolder = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) [0] as String
        let path = documentsFolder.appending("Database VWM")
        sharedInstance.database = FMDatabase(path: path)
        return sharedInstance
    }
    
    func saveNumberPassenger(number: Int, lat: String, lon: String){
        sharedInstance.database!.open()
        _ = sharedInstance.database!.executeQuery("INSERT INTO user (idUser, numPass, lat, long) VALUES (?,?,?,?)", withArgumentsIn:[number, lat, lon])
        sharedInstance.database!.close()
    }
}
