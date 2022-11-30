import Foundation

// XCode Version => 13.4.1
// Swift Version => 5.6.1

//================== 1. Question =================

func checkPalindrome(word: String) {
    var isPalindrome = false
    let lowerCaseWord = word.lowercased()
    let charSet = Array(lowerCaseWord)
    let filteredCharArray = charSet.filter { (characterExample) -> Bool in
        characterExample.isLetter || characterExample.isNumber
    }
    let wordLength = filteredCharArray.count
    for i in 0..<wordLength {
        if filteredCharArray[i] != filteredCharArray[wordLength - 1 - i] {
            isPalindrome = false
            break
        } else {
            isPalindrome = true
        }
    }
    print(isPalindrome ? ("\(word) is palindrome") : "\(word) isn't palindrome" )
}

//================== 2. Question =================

func calculateItemCount<T>(items: [T]) {
    var countOfItems: [String: Int] = [:]
    for item in items {
        countOfItems[String(describing: item)] = (countOfItems[String(describing: item)] ?? 0) + 1
    }
    print(countOfItems)
}

//=============== 3 - 4 Question ====================

func createTree(rowCount: Int) {
    var space = rowCount
    for i in 1...rowCount {
        for _ in 1...space {
            print(" ", terminator: "")
        }
        for _ in 1...i {
            print("*", terminator: " ")
        }
        space -= 1
        print("\r")
    }
}

// ============== 5.Question =================

// 5.1 Question
func sumOfAllMultiples(numberExample: Int) {
    let number = numberExample - 1
    let sumOfThree = 3 * ((number / 3) * ((number / 3) + 1)) / 2
    let sumOfFive = 5 * ((number / 5) * ((number / 5) + 1)) / 2
    let sumOfFifteen = 15 * ((number / 15) * ((number / 15) + 1)) / 2
    print(sumOfThree + sumOfFive - sumOfFifteen)
}

// 5.2 Question
func sumOfEvenFibonacciNumbers(numberExample: Int) {
    var sumOfNumbers = 0
    var firstNumber = 1
    var secondNumber = 2
    while secondNumber <= numberExample {
        if secondNumber % 2 == 0 {
            sumOfNumbers += secondNumber
        }
        let newNumber = firstNumber + secondNumber
        firstNumber = secondNumber
        secondNumber = newNumber
    }
    print(sumOfNumbers)
    
}
// 5.3 Question
func findLargestPrimeFactor(numberExample: Int) {
    var resultNumber = numberExample
    for i in 2...resultNumber {
        if (i * i) <= resultNumber {
            while (resultNumber % i == 0) && (resultNumber != i) {
                resultNumber /= i
            }
        } else {
            break
        }
    }
    print(resultNumber)
}
//Qestion 1 =>
checkPalindrome(word: "İmrensem adama madam esner mİ?")
//Qestion 2 => */
calculateItemCount(items: [12.4, false, 1, "false"])
//Qestion 3 - 4 =>
createTree(rowCount: 8)
//Qestion 5.1 =>
sumOfAllMultiples(numberExample: 1000)
//Qestion 5.2 =>
sumOfEvenFibonacciNumbers(numberExample: 4_000_000)
//Qestion 5.3 =>
findLargestPrimeFactor(numberExample: 13195)

