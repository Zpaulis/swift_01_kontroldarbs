//
//  main.swift
//  swift_01_kontroldarbs
//
//  Created by Paulis Zabarovskis on 28/03/2022.
//

import Foundation

// MARK: EX1
/* Uzrakstīt programmu, kas izvada konsolē pāra skaitļus no dotā saraksta tādā pašā secībā kā ir dots sarakstā kamēr nav sastapts skaitlis 215. */
print ("1. uzdevums\nAtlasītie pāra skaitļi:")
let input1 = [54, 912, 13, 418, 907, 344, 236, 375, 823, 566, 597, 1026, 72, 615, 953, 735, 399, 162, 758, 219, 918, 237, 412, 46, 826, 248, 215, 950, 626, 949, 687, 217, 815, 67, 104, 58, 256, 24, 892, 894, 767, 553, 81, 379, 91, 831, 431, 742, 717, 958,743, 527]
// Funkcija atgriež patiesu vērtību, ja skaitlis ir pāra skaitlis vai 215
func even(number: Int) -> Bool{
return ((number % 2) == 0) || (number == 215)
    }

for value in input1 where even(number: value) { // Atlasa pāra skaitļus vai beigu pazīmi masīvā
if value == 215 {break} // Beidz darbu, ja sastop 215 (beigu pazīme)
print(value) // Izvada konsolē pāra skaitļus
}

//MARK: EX2
/* Uzrakstīt funkciju ar diviem parametriem: skaitlis un masīvs ar skaitļiem. Funkcijai jāatgriež true, ja pirmais parametrs ir atrodams otrā parametra masīvā un false, ja nav.
 Uzrakstīt testa kodu ar diviem dažādiem masīviem (vismaz 10 elementi) lai pārbaudītu funkcijas darbību. Funkcijas rezultātu izvadīt konsolē.*/
print("\n2. uzdevums")
let input21: Int = 5
let input22: Int = 12
let input31: [Int] = [3, 5, 8, 9, 0, 4, 89, 35, 45, 256]
let input32: [Int] = [15, 32, 3, 42, 16, 1, -5, 3456, 32, 456, -16, 412, 2022]

func include(number: Int, collection: [Int]) -> Bool{
    for value in collection{
        if value == number {
            return true // Atgriež patiesu vērtību, ja 1. parametrs atrodams masīvā
        }
    }
return false // Atgriež nepatiesu vērtību, ja 1. parametra masīvā nav
    }

print ("Vai masīvs \(input31) satur parametru \(input21)? - \(include(number: input21, collection: input31))")
print ("Vai masīvs \(input32) satur parametru \(input22)? - \(include(number: input22, collection: input32))")

//MARK: EX3
/* Uzrakstīt programmu, kas skaita cik reizes skaitlis 15.3 ir atrodams masīvā. Masīvā ievadīt vismaz 20 elementus, meklējamai vērtībai masīvā ir jābūt vismaz 2 reizes.*/
print("\n3. uzdevums")
let input4: [Double] = [134, 912, 135, 418, 907, 344, 236, 375, 13, 15.3, 597, 1026, 72, 615, 953, 735, 399, 162, 758, 219, 918, 237, 412, 46, 826, 248, 15.3, 950, 15.3, 626, 949, 687, 217, 815, 67, 104, 58, 256, 24, 892, 894, 13, 767, 553, 81, 379, 91, 831, 431, 742, 717, 958,743, 527]
var contains = 0 // Skaitītājs

   for value in input4 {
        if value == 15.3 { // Meklē vērtību masīvā
            contains += 1 // Izmaina skaitītāju
        }
    }

print ("Skaitlis 15.3 masīvā sastopams \(contains) reizes.")

//MARK: EX4
/* Uzrakstīt funkciju ar diviem parametriem – jebkura veida skaitļiem, kas atgriež true, ja abi parametri ir vienādi vai to summa vai starpība ir vienāda ar 7. Uzrakstīt testa kodu, kas izsauc funkciju ar izdomātām vērtībām lai pārbaudītu visus iespējamos gadījumus.*/
print("\n4. uzdevums")
var testaMasivs: [(a: Float, b: Float)] = [(1, 2.5), (3.14, 3.14), (-12, 5), (12, -5), (1.8, 8.8), (1.8, 8.80001), (2.5, 4.5)]
// atļāvos izveidot funkciju ar vienu parametru - skaitļu pāri, lai atvieglotu testēšanu un pārskatāmību.
func test (a: (Float, Float)) -> Bool {
if a.0 == a.1 {return true} // Katra kontole veikta atsevišķi - garāk, bet pārskatāmāk
if (a.0 + a.1) == 7 {return true}
if (a.0 - a.1) == 7 {return true}
if (a.1 - a.0) == 7 {return true}
return false
}
for pair in testaMasivs {
print ("skaitļiem \(pair.0) un \(pair.1) testa rezultāts ir: \(test(a: pair))")
}

/* 4. uzdevums praktiski neizpildāms:
 1) funkcija jāveido "jebkura veida skaitļiem". Mana funkcija darbojas skaitļiem Float robežās (modulis ~no 1.17 E - 38 līdz 3.40 E + 38) Sākumā biju domājis lietot Double, bet saskāros ar precizitātes problēmu. Skat. "Sliktais piemērs" Neesmu pārliecināts, ka līdzīgu neveiksmīgu piemēru nav iespējams izveidot ar Float. Korektu triviālu risinājumu neatradu, meklēt sarežģīto risinājumu bija slinkums, atvainojos.
 2) jāuzraksta testa kods, "lai pārbaudītu visus iespējamos gadījumus". Visu iespējamo nejaušo skaitļu kombināciju skaits ir pārāk liels, lai pilno pārlasi iekļautu kodā. */
//MARK: Sliktais piemērs
let c: Double = 1.8
let d: Double = 8.8
//let ups: Bool (d - c) == 7
print ("\nSliktais piemērs - Double gadījumā 8.8 - 1.8 = 7? - \((d - c) == 7), jo \(d - c)")

print("\nStudents Paulis Zabarovskis")

