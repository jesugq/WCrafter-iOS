//
//  Destination.swift
//  WCrafter
//
//  Created by Hugo Cruz on 01/05/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit
import MapKit

class Destination: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var origin: UILabel!
    @IBOutlet weak var dest: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var timLeft: UILabel!
    @IBOutlet weak var cond: UILabel!
    
    var manager = CLLocationManager()
    var timer = Timer()
    var isTimer = false
    var minLeft = 10
    // true represents that the crafters if going to NSO
    var guide = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        if manager.responds(to: #selector(CLLocationManager.requestWhenInUseAuthorization)){
            manager.requestWhenInUseAuthorization()
        }
        manager.startUpdatingLocation()
        
    }
    @objc func updateTimer(){
        minLeft -= 1
        timLeft.text = "\(minLeft) min"
        if minLeft > 4{
            cond.text = "A tiempo."
        } else if minLeft < 5 {
            cond.text = "Te queda poco tiempo."
        } else if minLeft < 1 {
            cond.text = "Retrasado."
            minLeft = 0
            timer.invalidate()
        }
    }
    func stopTimer(){
        minLeft = 0
        timer.invalidate()
    }
    func timeLeft(t: Int){
        minLeft = t
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
  
    func changeRoute(){
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        let locValue: CLLocationCoordinate2D = (manager.location?.coordinate)!
        let nave31 = MKCoordinateSpanMake(19.13121, -98.26557)
        let nave82 = MKCoordinateSpanMake(19.12938, -98.26251)
        let nave80 = MKCoordinateSpanMake(19.13089, -98.25923)
        let nave84 = MKCoordinateSpanMake(19.12908, -98.25746)
        let nave83 = MKCoordinateSpanMake(19.12671, -98.25849)
        let est9 = MKCoordinateSpanMake(19.12574, -98.25937)
        let pue5 = MKCoordinateSpanMake(19.12398, -98.25773)
        let pue4 = MKCoordinateSpanMake(19.12253, -98.25631)
        let cubo8 = MKCoordinateSpanMake(19.12151, -98.25527)
        let cubo6 = MKCoordinateSpanMake(19.12077, -98.25453)
        let cubo3 = MKCoordinateSpanMake(19.11952, -98.25327)
        let pue2 = MKCoordinateSpanMake(19.1185, -98.25227)
        let nave53 = MKCoordinateSpanMake(19.11735, -98.25114)
        let pue8 = MKCoordinateSpanMake(19.11592, -98.24975)
        let academy = MKCoordinateSpanMake(19.11477, -98.24848)
        let nso = MKCoordinateSpanMake(19.11335, -98.24882)
        
        
        if fabs(locValue.latitude - nave31.latitudeDelta) <= Double.ulpOfOne && fabs(locValue.longitude - nave31.longitudeDelta) <= Double.ulpOfOne {
            switch hour{
            case 7:
                if minutes == 45 || minutes == 55{
                    origin.text = "Nave 31"
                    dest.text = "Nave 82"
                    timeLeft(t: 10)
                    guide = true
                }
            case 8:
                if minutes == 5 || minutes == 15 || minutes == 25 || minutes == 35 || minutes == 45 || minutes == 55 {
                    origin.text = "Nave 31"
                    dest.text = "Nave 82"
                    timeLeft(t: 10)
                    guide = true
                }
            case 9:
                if minutes == 5 || minutes == 10 || minutes == 20 || minutes == 30 || minutes == 40 || minutes == 50 {
                    origin.text = "Nave 31"
                    dest.text = "Nave 82"
                    timeLeft(t: 10)
                    guide = true
                }
            case 10:
                if minutes == 0 || minutes == 10 || minutes == 20 || minutes == 30 || minutes == 40 || minutes == 50 {
                    origin.text = "Nave 31"
                    dest.text = "Nave 82"
                    timeLeft(t: 10)
                    guide = true
                }
            case 11:
                if minutes == 0 || minutes == 10 || minutes == 20 || minutes == 30 || minutes == 40 || minutes == 50 {
                    origin.text = "Nave 31"
                    dest.text = "Nave 82"
                    self.timeLeft(t: 10)
                    guide = true
                }
            case 12:
                if minutes == 0 || minutes == 10 || minutes == 20 || minutes == 30 || minutes == 40 || minutes == 50 {
                    origin.text = "Nave 31"
                    dest.text = "Nave 82"
                    timeLeft(t: 10)
                    guide = true
                }
            case 13:
                if minutes == 0 || minutes == 10 || minutes == 20 || minutes == 30 || minutes == 40 || minutes == 50 {
                    origin.text = "Nave 31"
                    dest.text = "Nave 82"
                    timeLeft(t: 10)
                    guide = true
                }
            case 14:
                if minutes == 0 || minutes == 10 || minutes == 20 || minutes == 30 || minutes == 40 || minutes == 50 {
                    origin.text = "Nave 31"
                    dest.text = "Nave 82"
                    timeLeft(t: 10)
                    guide = true
                }
            case 15:
                if minutes == 0 || minutes == 10 || minutes == 20 || minutes == 30 || minutes == 40 || minutes == 50 {
                    origin.text = "Nave 31"
                    dest.text = "Nave 82"
                    timeLeft(t: 10)
                    guide = true
                }
            case 16:
                if minutes == 0 || minutes == 10 || minutes == 20 || minutes == 30 || minutes == 40 || minutes == 50 {
                    origin.text = "Nave 31"
                    dest.text = "Nave 82"
                    timeLeft(t: 10)
                    guide = true
                }
            case 17:
                if minutes == 0 || minutes == 10 {
                    origin.text = "Nave 31"
                    dest.text = "Nave 82"
                    timeLeft(t: 10)
                    guide = true
                }
            default:
                origin.text = " - "
                dest.text = " - "
                cond.text = "No hay rutas"
                timLeft.text = "por el momento."
            }
        } else if fabs(locValue.latitude - nave82.latitudeDelta) <= Double.ulpOfOne && fabs(locValue.longitude - nave82.longitudeDelta) <= Double.ulpOfOne {
            if guide {
                origin.text = "Nave 82"
                dest.text = "Nave 80"
            } else {
                origin.text = "Nave 82"
                dest.text = "Nave 31"
            }
        } else if fabs(locValue.latitude - nave80.latitudeDelta) <= Double.ulpOfOne && fabs(locValue.longitude - nave80.longitudeDelta) <= Double.ulpOfOne {
            if guide {
                origin.text = "Nave 80"
                dest.text = "Nave 84"
            } else {
                origin.text = "Nave 80"
                dest.text = "Nave 82"
            }
        } else if fabs(locValue.latitude - nave84.latitudeDelta) <= Double.ulpOfOne && fabs(locValue.longitude - nave84.longitudeDelta) <= Double.ulpOfOne {
            if guide {
                origin.text = "Nave 84"
                dest.text = "Nave 83"
            } else {
                origin.text = "Nave 84"
                dest.text = "Nave 80"
            }
        } else if fabs(locValue.latitude - nave83.latitudeDelta) <= Double.ulpOfOne && fabs(locValue.longitude - nave83.longitudeDelta) <= Double.ulpOfOne {
            if guide {
                origin.text = "Nave 83"
                dest.text = "Estacion 9"
            } else {
                origin.text = "Nave 83"
                dest.text = "Nave 84"
            }
        } else if fabs(locValue.latitude - est9.latitudeDelta) <= Double.ulpOfOne && fabs(locValue.longitude - est9.longitudeDelta) <= Double.ulpOfOne {
            if guide {
                origin.text = "Estacion 9"
                dest.text = "Puerta 5"
            } else {
                origin.text = "Estacion 9"
                dest.text = "Nave 83"
            }
        } else if fabs(locValue.latitude - pue5.latitudeDelta) <= Double.ulpOfOne && fabs(locValue.longitude - pue5.longitudeDelta) <= Double.ulpOfOne {
            if guide {
                origin.text = "Puerta 5"
                dest.text = "Puerta 4"
            } else {
                origin.text = "Puerta 5"
                dest.text = "Estacion 9"
            }
        } else if fabs(locValue.latitude - pue4.latitudeDelta) <= Double.ulpOfOne && fabs(locValue.longitude - pue4.longitudeDelta) <= Double.ulpOfOne {
            if guide {
                origin.text = "Puerta 4"
                dest.text = "Cubo 8"
            } else {
                origin.text = "Puerta 4"
                dest.text = "Puerta 5"
            }
        } else if fabs(locValue.latitude - cubo8.latitudeDelta) <= Double.ulpOfOne && fabs(locValue.longitude - cubo8.longitudeDelta) <= Double.ulpOfOne {
            if guide {
                origin.text = "Cubo 8"
                dest.text = "Cubo 6"
            } else {
                origin.text = "Cubo 8"
                dest.text = "Puerta 4"
            }
        } else if fabs(locValue.latitude - cubo6.latitudeDelta) <= Double.ulpOfOne && fabs(locValue.longitude - cubo6.longitudeDelta) <= Double.ulpOfOne {
            if guide {
                origin.text = "Cubo 6"
                dest.text = "Cubo 3"
            } else {
                origin.text = "Cubo 6"
                dest.text = "Cubo 8"
            }
        } else if fabs(locValue.latitude - cubo3.latitudeDelta) <= Double.ulpOfOne && fabs(locValue.longitude - cubo3.longitudeDelta) <= Double.ulpOfOne {
            if guide {
                origin.text = "Cubo 3"
                dest.text = "Puerta 2"
            } else {
                origin.text = "Cubo 3"
                dest.text = "Cubo 6"
            }
        } else if fabs(locValue.latitude - pue2.latitudeDelta) <= Double.ulpOfOne && fabs(locValue.longitude - pue2.longitudeDelta) <= Double.ulpOfOne {
            if guide {
                origin.text = "Puerta 2"
                dest.text = "Nave 53"
            } else {
                origin.text = "Puerta 2"
                dest.text = "Cubo 3"
            }
        } else if fabs(locValue.latitude - nave53.latitudeDelta) <= Double.ulpOfOne && fabs(locValue.longitude - nave53.longitudeDelta) <= Double.ulpOfOne {
            if guide {
                origin.text = "Nave 53"
                dest.text = "Puerta 8"
            } else {
                origin.text = "Nave 53"
                dest.text = "Puerta 2"
            }

        } else if fabs(locValue.latitude - pue8.latitudeDelta) <= Double.ulpOfOne && fabs(locValue.longitude - pue8.longitudeDelta) <= Double.ulpOfOne {
            if guide {
                origin.text = "Puerta 8"
                dest.text = "NSO"
            } else {
                origin.text = "Puerta 8"
                dest.text = "Nave 53"
            }

        } else if fabs(locValue.latitude - academy.latitudeDelta) <= Double.ulpOfOne && fabs(locValue.longitude - academy.longitudeDelta) <= Double.ulpOfOne {
            if guide {
                origin.text = "Puerta 8"
                dest.text = "NSO"
            } else {
                origin.text = "Academy"
                dest.text = "Puerta 8"
            }
        } else if fabs(locValue.latitude - nso.latitudeDelta) <= Double.ulpOfOne && fabs(locValue.longitude - nso.longitudeDelta) <= Double.ulpOfOne {
            if guide {
                origin.text = "Puerta 8"
                dest.text = "NSO"
                stopTimer()
                timLeft.text = (" - ")
                cond.text = ("Ruta terminada.")
            } else {
                switch hour{
                case 7:
                    if minutes == 40 || minutes == 50{
                        origin.text = "NSO"
                        dest.text = "Academy"
                        timeLeft(t: 15)
                        guide = false
                    }
                case 8:
                    if minutes == 0 || minutes == 20 || minutes == 30 || minutes == 40 || minutes == 50 {
                        origin.text = "NSO"
                        dest.text = "Academy"
                        timeLeft(t: 15)
                        guide = false
                    }
                case 9:
                    if minutes == 0 || minutes == 10 || minutes == 20 || minutes == 30 || minutes == 45 || minutes == 50 {
                        origin.text = "NSO"
                        dest.text = "Academy"
                        timeLeft(t: 15)
                    }
                case 10:
                    if minutes == 0 || minutes == 10 || minutes == 20 || minutes == 30 || minutes == 45 || minutes == 50 {
                        origin.text = "NSO"
                        dest.text = "Academy"
                        timeLeft(t: 15)
                        guide = false
                    }
                case 11:
                    if minutes == 0 || minutes == 10 || minutes == 20 || minutes == 30 || minutes == 45 || minutes == 50 {
                        origin.text = "NSO"
                        dest.text = "Puerta 8"
                        timeLeft(t: 15)
                        guide = false
                    }
                case 12:
                    if minutes == 0 || minutes == 10 || minutes == 20 || minutes == 30 || minutes == 45 || minutes == 50 {
                        origin.text = "NSO"
                        dest.text = "Academy"
                        timeLeft(t: 15)
                        guide = false
                    }
                case 13:
                    if minutes == 0 || minutes == 10 || minutes == 20 || minutes == 30 || minutes == 45 || minutes == 50 {
                        origin.text = "NSO"
                        dest.text = "Academy"
                        timeLeft(t: 15)
                        guide = false
                    }
                case 14:
                    if minutes == 0 || minutes == 10 || minutes == 20 || minutes == 30 || minutes == 45 || minutes == 50 {
                        origin.text = "NSO"
                        dest.text = "Academy"
                        timeLeft(t: 15)
                        guide = false
                    }
                case 15:
                    if minutes == 0 || minutes == 10 || minutes == 20 || minutes == 30 || minutes == 45 || minutes == 50 {
                        origin.text = "NSO"
                        dest.text = "Academy"
                        timeLeft(t: 15)
                        guide = false
                    }
                case 16:
                    if minutes == 0 || minutes == 10 || minutes == 20 || minutes == 30 || minutes == 45 {
                        origin.text = "NSO"
                        dest.text = "Academy"
                        timeLeft(t: 15)
                        guide = false
                    }
                case 17:
                    if minutes == 0 || minutes == 10 || minutes == 20 {
                        origin.text = "NSO"
                        dest.text = "Academy"
                        timeLeft(t: 15)
                        guide = false
                    }
                default:
                    origin.text = " - "
                    dest.text = " - "
                    cond.text = "No hay rutas"
                    timLeft.text = "por el momento."
                }
            }
        } else {
            origin.text = " - "
            dest.text = " - "
            timLeft.text = "No tienes rutas"
            cond.text = "en este momento."
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
