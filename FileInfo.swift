import Foundation
//
//  FileInfo.swift
//
//  Created by Val I on 2025-04-06.
//  Version 1.0
//  Copyright (c) 2025 Val I. All rights reserved.
//
// The FileInfo program reads a file
// and computes basic statistics,
// such as the total number of lines, words,
// and characters in the file.
// Store these values in an array or list and output them.
//

// Prompt the user for input
print("Do you want to get the info from")
print("File1(A)")
print("File2(B)")
print("File3(C)")
print("Please select A, B, or C: ")

// Read user input
if let input = readLine()?.lowercased() {
    // Determine the file based on user input
    var fileName: String
    if input == "a" {
        fileName = "./input.txt"
    } else if input == "b" {
        fileName = "./input2.txt"
    } else if input == "c" {
        fileName = "./input3.txt"
    } else {
        print("Invalid option. Please select A, B, or C.")
        exit(0)
    }

    // Read the input file
    guard let input = FileHandle(forReadingAtPath: fileName) else {
        print("Error: can't find input file")
        exit(1)
    }
    // Read the contents of the input file
    let inputData = input.readDataToEndOfFile()

    // Convert the data to a string
    guard let inputString = String(data: inputData, encoding: .utf8) else {
    print("Error: can't convert input data to string")
    exit(1)
    }
    
    // Split the string into lines
    let lines = inputString.components(separatedBy: .newlines)

    // Initialize counters and lists
    var lineCount = 0
    var wordCount = 0
    var charCount = 0
    var words: [String] = []
    var characters: [Character] = []

    // Process each line
    for line in lines {
        // Count lines
        lineCount += 1

        // Count words
        let lineWords = line.split(separator: " ")
        wordCount += lineWords.count
        words.append(contentsOf: lineWords.map { String($0) })

        // Count characters
        charCount += line.count
        characters.append(contentsOf: line)
    }

    // Print results
    print("Lines: \(lines)")
    print("Total lines: \(lineCount)")
    print("Words: \(words)")
    print("Total words: \(wordCount)")
    print("Characters: \(characters)")
    print("Total characters: \(charCount)")

}