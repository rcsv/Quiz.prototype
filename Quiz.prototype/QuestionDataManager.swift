//
//  QuestionDataManager.swift
//  Quiz.prototype
//
//  Created by John Daly on 2017/08/15.
//  Copyright © 2017 Recessive Programmer. All rights reserved.
//

import UIKit

class QuestionData {
    
    var qString: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    
    var correctAnswerNumber: Int
    
    var userChoiceAnswerNumber: Int?
    var questionNo: Int = 0
    
    init(questionDataSourceArray qa: [String]) {
        qString = qa[0]
        answer1 = qa[1]
        answer2 = qa[2]
        answer3 = qa[3]
        answer4 = qa[4]
        correctAnswerNumber = Int(qa[5])!
    }
    
    func isCorrect() -> Bool {
        if correctAnswerNumber == userChoiceAnswerNumber {
            return true
        }
        return false
    }
}

class QuestionDataManager {
    static let sharedInstance = QuestionDataManager()
    
    var questionDataArray = [QuestionData]()
    
    var nowQuestionIndex: Int = 0
    
    private init() { // closed
    }
    
    func loadQuestions() {
        questionDataArray.removeAll() // clear the data
        nowQuestionIndex = 0
        
        guard let csvFilePath = Bundle.main.path(forResource: "question", ofType: "csv") else {
            // missing csv file
            print("missing csv file")
            return
        }
        
        // read csv file
        do {
            
            let csvStringData = try String(contentsOfFile: csvFilePath, encoding: String.Encoding.utf8)
            
            // read CSV file each line
            csvStringData.enumerateLines(invoking: {(line, stop) in
                // String Tokenize
                let questionSourceDataArray = line.components(separatedBy: ",")
                
                // create object
                let questionData = QuestionData(questionDataSourceArray: questionSourceDataArray)
                
                // add question
                self.questionDataArray.append(questionData)
                
                // set qiestopm number
                questionData.questionNo = self.questionDataArray.count
            })
        } catch let error {
            print("csv file error: \(error)")
            return
        }
    }
    
    func nextQuestion() -> QuestionData? {
        if nowQuestionIndex < questionDataArray.count {
            nowQuestionIndex += 1
            return questionDataArray[nowQuestionIndex-1]
        }
        return nil
    }
}
