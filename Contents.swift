import UIKit

//Helper method
func isPrimeNumber(_ number: Int) -> Bool {
    if number < 2 {
        return false
    }
    if number == 2 {
        return true
    }
    if number % 2 == 0 {
        return false
    }
    for i in stride(from: 3, through: sqrt(Double(number)) + 1, by: +2) {
        if number.isMultiple(of: Int(i)){
            return false
        }
    }
    return true
}
//**************************************************************

//Number 1
func sumOfMultiplesOf3And5(_ number: Int) -> Int {
    var temp = 0
    for i in 0..<number {
        if i.isMultiple(of: 3) || i.isMultiple(of: 5) {
            temp += i
        }
    }
    return temp
}
//print(sumOfMultiplesOf3And5(1000))

//Number 2
func evenFibonacci(_ n: Int64 = 32) -> Int64 {
    var sum: Int64 = Int64()
    var high: Int64 = 1
    var low: Int64 = 1
    
    guard n > 1 else { return high }
    
    for _ in 2...n {
        (high, low) = (high + low, high)
        if high < 4000000 {
            if high.isMultiple(of: 2) {
                sum += high
            }
        } else {
            break
        }
    }
    return sum
}
//print(evenFibonacci())

//Number 3
func largestPrimeFactor(_ number: Int) -> Int {
    if number < 2 {
        return 0
    }
    var num = number
    var temp = number
    var results = Int()
    
    for i in 2..<num {
        if num.isMultiple(of: i){
            temp = num / i
            if isPrimeNumber(temp){
                if num.isMultiple(of: temp){
                    results = temp
                }
                break
            }
        }
        num = temp
    }
    return results
}
//print(largestPrimeFactor(600851475143))

//Number 4
func isPalindrome(_ input: String) -> Bool {
    let length = input.count
    if length < 2 {
        return true
    }
    let maxIndex = length - 1
    let halfLenght = length / 2
    for i in 0..<halfLenght {
        if input[input.index(input.startIndex, offsetBy: i)] != input[input.index(input.startIndex, offsetBy: maxIndex - i)] {
            return false
        }
    }
    return true
}

func palindromicNumber () -> [Int] {
    var result = [Int]()
    var temp = Int()
    var largestPal = Int()

    for i in stride(from: 999, through: 100, by: -1) {
        for j in stride(from: 999, through: 100, by: -1) {
            temp = i * j
            if largestPal > temp {
                break
            }
            if isPalindrome("\(temp)") {
                if temp > largestPal {
                    largestPal = temp
                    result = [i, j]
                }
            }
        }
    }
    return result
}
//print(palindromicNumber())


//Number 5
func evenlyDivisibleByAllNumbersUpTo20() -> Int {
    
    var i = 2520
    
    while (i % 11 != 0 || i % 13 != 0 ||
        i % 14 != 0 || i % 16 != 0 || i % 17 != 0 ||
        i % 18 != 0 || i % 19 != 0 || i % 20 != 0) {
            
            i += 2520
    }
    return i
}
//print(evenlyDivisibleByAllNumbersUpTo20())


//Number 6
func diffSumSquaresAndSquareSum100(_ number: Int = 100) -> Int{
    
    let sum = number * (number + 1) / 2
    let squared = (number * (number + 1) * (2 * number + 1)) / 6
    
    return (sum * sum) - squared
}
//print(diffSumSquaresAndSquareSum100())

//Number 7
func primeNumber10001() -> Int {
    var primeCount = 1
    var prime10001 = Int()
    var counter = 3
    while primeCount < 10001 {
        if isPrimeNumber(counter) {
            prime10001 = counter
            primeCount += 1
        }
        counter += 2
    }
    return prime10001
}
print(primeNumber10001())

//Number 8
func productOfThirteenAdjacentdigits1000() -> Int64{
    let number = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"
    
    var result = Int64()
    var temp = Int64()
    
    for i in 0..<number.count - 13 {
        temp = 1
        for j in i..<i + 13 {
            temp *= Int64(Int(String((number[number.index(number.startIndex, offsetBy: j)])))!)
        }
        if temp > result {
            result = temp
        }
    }
    
    return result
}
//print(productOfThirteenAdjacentdigits1000())

//Number 9
func pythagoreanTriplet1000() -> Int{
    let circumference = 1000
    var c = 0
    var flag = false
    var result = 0
    
    for a in 1...circumference / 3 {
        for b in a...circumference / 2 {
            c = circumference - a - b
            result = a * b * c
            
            if a * a + b * b == c * c {
                print("a: \(a), b: \(b), c: \(c)")
                flag = true
                break
            }
        }
        if flag {
            break
        }
    }
    return result
}
//print(pythagoreanTriplet1000())

//Number 10
func  sumOfAllPrimesBelowTwoMillion() -> Int64 {
    var sum = Int64(2)
    
    for i in stride(from: 3, to: 2000000, by: +2) {
        if isPrimeNumber(i) {
            sum += Int64(i)
        }
    }
    
    return sum
}
//print(sumOfAllPrimesBelowTwoMillion())
