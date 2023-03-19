////
////  main.swift
////  0319
////
////  Created by Sejung on 2023/03/19.
////
//
//import Foundation
//
//class Dog {
//    var name: String
//    var weight: Double
//
//    init(name: String, weight: Double) {
//        self.name = name
//        self.weight = weight
//    }
//
//    deinit {
//        print("\(name) 메모리 해제")
//    }
//}
//
//
//var choco: Dog? = Dog(name: "초코", weight: 15.0) // retain(choco) RC: 1
//var bori: Dog? = Dog(name: "보리", weight: 10.0) // retain(bori) RC: 1
//
//choco = nil // RC: 0
////release(choco)
//
//bori = nil // RC: 0
////release(bori)
//
//var dog1: Dog?
//var dog2: Dog?
//var dog3: Dog?
//
//dog1 = Dog(name: "댕댕이", weight: 7.0) // RC 1
//dog2 = dog1 // 2
//dog3 = dog1 // 3
//
//dog3?.name = "깜둥이"
//dog2?.name
//dog1?.name
//
//dog3 = nil // 2
//dog2 = nil // 1
//dog1 = nil // 0 // 메모리 해제
//
//
////
//
//class Dog {
//    var name: String
//    var owner: Person?
//
//    /*
//    init(name: String, owner: Person? = nil) {
//        self.name = name
//        self.owner = owner
//    }
//    */
//
//    init(name: String) {
//        self.name = name
//    }
//
//    deinit {
//        print("\(name) 메모리 해제")
//    }
//}
//
//class Person {
//    var name: String
//    var pet: Dog?
//
//    init(name: String) {
//        self.name = name
//    }
//
//    deinit {
//        print("\(name) 메모리 해제")
//    }
//}
//
//var bori: Dog? = Dog(name: "보리")
//var gildong: Person? = Person(name: "홍길동")
//
//bori?.owner = gildong
//gildong?.pet = bori
//
//// 강한 참조 사이클
//
//bori = nil
//gildong = nil


//1 ) 약한 참조

class Dog {
    var name: String
    weak var owner: Person?     // weak 키워드 ==> 약한 참조
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}


class Person {
    var name: String
    weak var pet: Dog?         // weak 키워드 ==> 약한 참조
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}

var bori: Dog? = Dog(name: "보리")
var gildong: Person? = Person(name: "홍길동")

// 강한 참조 사이클이 일어나지 않음
bori?.owner = gildong // rc가 늘어나지 않음
gildong?.pet = bori // rc가 늘어나지 않음

// 메모리 해제가 잘됨 // 사실 이 경우 한쪽만 weak으로 선언해도 상관없음
bori = nil
gildong = nil


//2) 비소유 참조

class Dog1 {
    var name: String
    unowned var owner: Person1?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}

class Person1 {
    var name: String
    unowned var pet: Dog1?
    
    init(name: String) {
        self.name = name
    }
}

var bori1: Dog1? = Dog1(name: "보리1")
var gildong1: Person1? = Person1(name: "홍길동1")

// 강한 참조 사이클이 일어나지 않음
bori1?.owner = gildong1
gildong1?.pet = bori1

// 메모리 해제가 잘됨( 사실 이 경우 한쪽만 unowned로 선언해도 상관없음)

bori1 = nil
gildong1 = nil

// 비소유 참조의 경우, 참조하고 있던 인스턴스가 사라지면, nil로 초기화되지 않음

// nil로 설정하고 접근하면 --> 에러 발생

// 1) 에러발생하는 케이스

// gildong1 = nil
// bori1?.owner // nil로 초기화 되지 않음 // 에러발생

// 2) 에러가 발생하지 않게 하려면

// gildong1 = nil
// bori1?.owner = nil // nil로 재설정 필요
// bori1?.onwer

//인스턴스를 가르키기 위해
//새로운 값으로 속성 초기화 가능한 패턴 (값타입에서)
// 타입멤버에서 사용하면, 인스턴스가 아닌 타입 자체를 가르킴
// 타입 인스턴스를 가르키는 경우에 사용 (외부에서 타입을 가르키는 경우)

class SomeClass {
    static let name = "SomeClass"
}

let myClass: SomeClass.Type = SomeClass.self

SomeClass.name
SomeClass.self.name

Int.max
Int.self.max


