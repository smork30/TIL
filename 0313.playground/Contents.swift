import UIKit

var greeting = "Hello, playground"

let closureType = { (param: String) -> String in
    return param + "!"
}

closure("스티븐")

func add(a: Int, b: Int) -> Int {
    let result = a + b
    return result
}

/*
let _ = { (a: Int, b: Int) -> Int in
    let result = a + b
    return result
}
*/

let _: (Int, Int) -> Int = {(a,b) in
    let result = a + b
    return result
}

//가장 많이 = 리턴형에 대한 표기 생략

let aClosure1 = { (str: String) in
    return "Hello, \(str)"
}

let aClsoure12 = { (str: String) in
    return "Hello, \(str)"
    
}

let aClosure2: (String) -> String = { (str) in
    return "Hello, \(str)"
}

let aClsoure22: (String) -> String = { (str) in
    return "Hello,\(str)"
}

let aClosure3 = {
    print("This is a closure.")
}

let aClosure32 = {
    print("This ")
}

//파라미터 타입의 생략도 대부분 가능
let aClosureType4 = { str in
    return str + "!"
}

