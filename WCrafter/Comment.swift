//
//  Comment.swift
//  WCrafter
//
import UIKit

class Comment {
    // Attributes
    var grade : String
    var desc : String
    
    // Constructor
    init?(grade: String, desc: String){
        // No description given.
        guard !grade.isEmpty else {
            return nil
        }
        
        // No code given, use the alternative constructor.
        guard !desc.isEmpty else {
            return nil
        }
        
        self.grade = grade
        self.desc = desc
    }


    

}
