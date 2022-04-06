//
//  ContentView.swift
//  Mind Game
//
//  Created by Aryan Vahabpour on 05/04/2022.
//

import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}



let screenSize: CGRect = UIScreen.main.bounds
var banana = cards(founded: false, name: "banana")
var apple = cards(founded: false, name: "apple")
var cherry = cards(founded: false, name: "cherry")
var peach = cards(founded: false, name: "peach")
var strawberry = cards(founded: false, name: "strawberry")
var watermelon = cards(founded: false, name: "watermelon")
var kewi = cards(founded: false, name: "kewi")
var pineapple = cards(founded: false, name: "pineapple")
var temporary = cards(founded: false, name: "background")


struct Brain: View {
    @State var signInSuccess = false
    @State var finded = 0
    var body: some View {
            return Group {
                if signInSuccess {
                    if finded == 8
                    {
                        EndPoint(finded: $finded)
                    }
                    else
                    {
                        game(finded: $finded)
                    }
                }
                else {
                    StartPoint(signInSuccess: $signInSuccess)
                }
            }
        }
}

struct EndPoint: View {
    @Binding var finded: Int
    var body: some View {
        ZStack
        {
            Image("back").ignoresSafeArea()
            VStack
            {
                Spacer()
                Spacer()
                Text ("Congratulations, you WIN!!")
                    .font(.system(size: 24, weight: .light, design: .serif))
                    .italic()
                Spacer()
                Button {
                    finded = 0
                } label: {
                    Image("replay")
                        .resizable()
                        .frame(width: UIScreen.screenWidth / 3, height: UIScreen.screenWidth / 3)
                }
                Spacer()
                Spacer()
            }
            
        }
    }
}

struct StartPoint: View {
    @Binding var signInSuccess: Bool
    var body: some View {
        ZStack
        {
            Image("back").ignoresSafeArea()
            VStack {
                Spacer()
                Spacer()
                Text ("SAV Gaming Studio Presents")
                    .font(.system(size: 24, weight: .light, design: .serif))
                    .italic()
                Spacer()
                Button {
                    signInSuccess = true
                } label: {
                    Image("play")
                        .resizable()
                        .frame(width: UIScreen.screenWidth / 3, height: UIScreen.screenWidth / 3)
                }
                Spacer()
                Spacer()
            }
        }
    }
}

struct game: View {
    @State private var images: [cards] = [banana, apple, cherry, peach, strawberry, watermelon, kewi, pineapple, banana, apple, cherry, peach, strawberry, watermelon, kewi, pineapple].shuffled()
    @State var numberOfShown = 0
    @State var firstImage = temporary
    @State var secondImage = temporary
    @State var cnt = 0
    @State var numberOfMoves = 0
    @Binding var finded: Int
    var body: some View {
        //Text("Hello, world!")
        //    .padding()
        //Text("Welcome To Aryan Games").padding().background(Color.cyan)
        ZStack
        {
            Image("back").ignoresSafeArea()
            VStack {
                HStack(spacing: 3.0){
                    Button {
                        if (numberOfShown == 2) {
                            cnt = 0
                            if (firstImage.name != secondImage.name)
                            {
                                for i in images{
                                    if (firstImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    if (secondImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    cnt = cnt + 1
                                }
                            }
                            numberOfShown = 0
                        }
                        if images[0].founded == false {
                            images[0].founded = true
                            numberOfShown = numberOfShown + 1
                            if (numberOfShown == 1)
                            {
                                numberOfMoves += 1
                                firstImage = images[0]
                            }
                            else
                            {
                                secondImage = images[0]
                                if (firstImage.name == secondImage.name)
                                {
                                    finded += 1
                                }
                                if finded == 8
                                {
                                    for i in 0...15 {
                                        images[i].founded = false
                                    }
                                    images = images.shuffled()
                                    numberOfMoves = 0
                                    print(finded)
                                }
                            }
                        }
                    } label: {
                        images[0]
                    }
                    Button {
                        if (numberOfShown == 2) {
                            cnt = 0
                            if (firstImage.name != secondImage.name)
                            {
                                for i in images{
                                    if (firstImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    if (secondImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    cnt = cnt + 1
                                }
                            }
                            numberOfShown = 0
                        }
                        if images[1].founded == false {
                            images[1].founded = true
                            numberOfShown = numberOfShown + 1
                            if (numberOfShown == 1)
                            {
                                numberOfMoves += 1
                                firstImage = images[1]
                            }
                            else
                            {
                                secondImage = images[1]
                                if (firstImage.name == secondImage.name)
                                {
                                    finded += 1
                                }
                                if finded == 8
                                {
                                    for i in 0...15 {
                                        images[i].founded = false
                                    }
                                    images = images.shuffled()
                                    numberOfMoves = 0
                                }
                            }
                        }
                    } label: {
                        images[1]
                    }
                    Button {
                        if (numberOfShown == 2) {
                            cnt = 0
                            if (firstImage.name != secondImage.name)
                            {
                                for i in images{
                                    if (firstImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    if (secondImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    cnt = cnt + 1
                                }
                            }
                            numberOfShown = 0
                        }
                        if images[2].founded == false {
                            images[2].founded = true
                            numberOfShown = numberOfShown + 1
                            if (numberOfShown == 1)
                            {
                                numberOfMoves += 1
                                firstImage = images[2]
                            }
                            else
                            {
                                secondImage = images[2]
                                if (firstImage.name == secondImage.name)
                                {
                                    finded += 1
                                }
                                if finded == 8
                                {
                                    for i in 0...15 {
                                        images[i].founded = false
                                    }
                                    images = images.shuffled()
                                    numberOfMoves = 0
                                }
                            }
                        }
                    } label: {
                        images[2]
                    }
                    Button {
                        if (numberOfShown == 2) {
                            cnt = 0
                            if (firstImage.name != secondImage.name)
                            {
                                for i in images{
                                    if (firstImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    if (secondImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    cnt = cnt + 1
                                }
                            }
                            numberOfShown = 0
                        }
                        if images[3].founded == false {
                            images[3].founded = true
                            numberOfShown = numberOfShown + 1
                            if (numberOfShown == 1)
                            {
                                numberOfMoves += 1
                                firstImage = images[3]
                            }
                            else
                            {
                                secondImage = images[3]
                                if (firstImage.name == secondImage.name)
                                {
                                    finded += 1
                                }
                                if finded == 8
                                {
                                    for i in 0...15 {
                                        images[i].founded = false
                                    }
                                    images = images.shuffled()
                                    numberOfMoves = 0
                                }
                            }
                        }
       
                    } label: {
                        images[3]
                    }
                }
                HStack(spacing: 3.0){
                    Button {
                        if (numberOfShown == 2) {
                            cnt = 0
                            if (firstImage.name != secondImage.name)
                            {
                                for i in images{
                                    if (firstImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    if (secondImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    cnt = cnt + 1
                                }
                            }
                            numberOfShown = 0
                        }
                        if images[4].founded == false {
                            images[4].founded = true
                            numberOfShown = numberOfShown + 1
                            if (numberOfShown == 1)
                            {
                                numberOfMoves += 1
                                firstImage = images[4]
                            }
                            else
                            {
                                secondImage = images[4]
                                if (firstImage.name == secondImage.name)
                                {
                                    finded += 1
                                }
                                if finded == 8
                                {
                                    for i in 0...15 {
                                        images[i].founded = false
                                    }
                                    images = images.shuffled()
                                    numberOfMoves = 0
                                }
                            }
                        }

                    } label: {
                        images[4]
                    }
                    Button {
                        if (numberOfShown == 2) {
                            cnt = 0
                            if (firstImage.name != secondImage.name)
                            {
                                for i in images{
                                    if (firstImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    if (secondImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    cnt = cnt + 1
                                }
                            }
                            numberOfShown = 0
                        }
                        if images[5].founded == false {
                            images[5].founded = true
                            numberOfShown = numberOfShown + 1
                            if (numberOfShown == 1)
                            {
                                numberOfMoves += 1
                                firstImage = images[5]
                            }
                            else
                            {
                                secondImage = images[5]
                                if (firstImage.name == secondImage.name)
                                {
                                    finded += 1
                                }
                                if finded == 8
                                {
                                    for i in 0...15 {
                                        images[i].founded = false
                                    }
                                    images = images.shuffled()
                                    numberOfMoves = 0
                                }
                            }
                        }
                    } label: {
                        images[5]
                    }
                    Button {
                        if (numberOfShown == 2) {
                            cnt = 0
                            if (firstImage.name != secondImage.name)
                            {
                                for i in images{
                                    if (firstImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    if (secondImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    cnt = cnt + 1
                                }
                            }
                            numberOfShown = 0
                        }
                        if images[6].founded == false {
                            images[6].founded = true
                            numberOfShown = numberOfShown + 1
                            if (numberOfShown == 1)
                            {
                                numberOfMoves += 1
                                firstImage = images[6]
                            }
                            else
                            {
                                secondImage = images[6]
                                if (firstImage.name == secondImage.name)
                                {
                                    finded += 1
                                }
                                if finded == 8
                                {
                                    for i in 0...15 {
                                        images[i].founded = false
                                    }
                                    images = images.shuffled()
                                    numberOfMoves = 0
                                }
                            }
                        }
                    } label: {
                        images[6]
                    }
                    Button {
                        if (numberOfShown == 2) {
                            cnt = 0
                            if (firstImage.name != secondImage.name)
                            {
                                for i in images{
                                    if (firstImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    if (secondImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    cnt = cnt + 1
                                }
                            }
                            numberOfShown = 0
                        }
                        if images[7].founded == false {
                            images[7].founded = true
                            numberOfShown = numberOfShown + 1
                            if (numberOfShown == 1)
                            {
                                numberOfMoves += 1
                                firstImage = images[7]
                            }
                            else
                            {
                                secondImage = images[7]
                                if (firstImage.name == secondImage.name)
                                {
                                    finded += 1
                                }
                                if finded == 8
                                {
                                    for i in 0...15 {
                                        images[i].founded = false
                                    }
                                    images = images.shuffled()
                                    numberOfMoves = 0
                                }
                            }
                        }
                    } label: {
                        images[7]
                    }
                }
                HStack(spacing: 3.0){
                    Button {
                        if (numberOfShown == 2) {
                            cnt = 0
                            if (firstImage.name != secondImage.name)
                            {
                                for i in images{
                                    if (firstImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    if (secondImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    cnt = cnt + 1
                                }
                            }
                            numberOfShown = 0
                        }
                        if images[8].founded == false {
                            images[8].founded = true
                            numberOfShown = numberOfShown + 1
                            if (numberOfShown == 1)
                            {
                                numberOfMoves += 1
                                firstImage = images[8]
                            }
                            else
                            {
                                secondImage = images[8]
                                if (firstImage.name == secondImage.name)
                                {
                                    finded += 1
                                }
                                if finded == 8
                                {
                                    for i in 0...15 {
                                        images[i].founded = false
                                    }
                                    images = images.shuffled()
                                    numberOfMoves = 0
                                }
                            }
                        }
                    } label: {
                        images[8]
                    }
                    Button {
                        if (numberOfShown == 2) {
                            cnt = 0
                            if (firstImage.name != secondImage.name)
                            {
                                for i in images{
                                    if (firstImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    if (secondImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    cnt = cnt + 1
                                }
                            }
                            numberOfShown = 0
                        }
                        if images[9].founded == false {
                            images[9].founded = true
                            numberOfShown = numberOfShown + 1
                            if (numberOfShown == 1)
                            {
                                numberOfMoves += 1
                                firstImage = images[9]
                            }
                            else
                            {
                                secondImage = images[9]
                                if (firstImage.name == secondImage.name)
                                {
                                    finded += 1
                                }
                                if finded == 8
                                {
                                    for i in 0...15 {
                                        images[i].founded = false
                                    }
                                    images = images.shuffled()
                                    numberOfMoves = 0
                                }
                            }
                        }

                    } label: {
                        images[9]
                    }
                    Button {
                        if (numberOfShown == 2) {
                            cnt = 0
                            if (firstImage.name != secondImage.name)
                            {
                                for i in images{
                                    if (firstImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    if (secondImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    cnt = cnt + 1
                                }
                            }
                            numberOfShown = 0
                        }
                        if images[10].founded == false {
                            images[10].founded = true
                            numberOfShown = numberOfShown + 1
                            if (numberOfShown == 1)
                            {
                                numberOfMoves += 1
                                firstImage = images[10]
                            }
                            else
                            {
                                secondImage = images[10]
                                if (firstImage.name == secondImage.name)
                                {
                                    finded += 1
                                }
                                if finded == 8
                                {
                                    for i in 0...15 {
                                        images[i].founded = false
                                    }
                                    images = images.shuffled()
                                    numberOfMoves = 0
                                }
                            }
                        }
                    } label: {
                        images[10]
                    }
                    Button {
                        if (numberOfShown == 2) {
                            cnt = 0
                            if (firstImage.name != secondImage.name)
                            {
                                for i in images{
                                    if (firstImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    if (secondImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    cnt = cnt + 1
                                }
                            }
                            numberOfShown = 0
                        }
                        if images[11].founded == false {
                            images[11].founded = true
                            numberOfShown = numberOfShown + 1
                            if (numberOfShown == 1)
                            {
                                numberOfMoves += 1
                                firstImage = images[11]
                            }
                            else
                            {
                                secondImage = images[11]
                                if (firstImage.name == secondImage.name)
                                {
                                    finded += 1
                                }
                                if finded == 8
                                {
                                    for i in 0...15 {
                                        images[i].founded = false
                                    }
                                    images = images.shuffled()
                                    numberOfMoves = 0
                                }
                            }
                        }
                        
                    } label: {
                        images[11]
                    }
                }
                HStack(spacing: 3.0){
                    Button {
                        if (numberOfShown == 2) {
                            cnt = 0
                            if (firstImage.name != secondImage.name)
                            {
                                for i in images{
                                    if (firstImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    if (secondImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    cnt = cnt + 1
                                }
                            }
                            numberOfShown = 0
                        }
                        if images[12].founded == false {
                            images[12].founded = true
                            numberOfShown = numberOfShown + 1
                            if (numberOfShown == 1)
                            {
                                numberOfMoves += 1
                                firstImage = images[12]
                            }
                            else
                            {
                                secondImage = images[12]
                                if (firstImage.name == secondImage.name)
                                {
                                    finded += 1
                                }
                                if finded == 8
                                {
                                    for i in 0...15 {
                                        images[i].founded = false
                                    }
                                    images = images.shuffled()
                                    numberOfMoves = 0
                                }
                            }
                        }
                        
                    } label: {
                        images[12]
                    }
                    Button {
                        if (numberOfShown == 2) {
                            cnt = 0
                            if (firstImage.name != secondImage.name)
                            {
                                for i in images{
                                    if (firstImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    if (secondImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    cnt = cnt + 1
                                }
                            }
                            numberOfShown = 0
                        }
                        if images[13].founded == false {
                            images[13].founded = true
                            numberOfShown = numberOfShown + 1
                            if (numberOfShown == 1)
                            {
                                numberOfMoves += 1
                                firstImage = images[13]
                            }
                            else
                            {
                                secondImage = images[13]
                                if (firstImage.name == secondImage.name)
                                {
                                    finded += 1
                                }
                                if finded == 8
                                {
                                    for i in 0...15 {
                                        images[i].founded = false
                                    }
                                    images = images.shuffled()
                                    numberOfMoves = 0
                                }
                            }
                        }
                        
                    } label: {
                        images[13]
                    }
                    Button {
                        if (numberOfShown == 2) {
                            cnt = 0
                            if (firstImage.name != secondImage.name)
                            {
                                for i in images{
                                    if (firstImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    if (secondImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    cnt = cnt + 1
                                }
                            }
                            numberOfShown = 0
                        }
                        if images[14].founded == false {
                            images[14].founded = true
                            numberOfShown = numberOfShown + 1
                            if (numberOfShown == 1)
                            {
                                numberOfMoves += 1
                                firstImage = images[14]
                            }
                            else
                            {
                                secondImage = images[14]
                                if (firstImage.name == secondImage.name)
                                {
                                    finded += 1
                                }
                                if finded == 8
                                {
                                    for i in 0...15 {
                                        images[i].founded = false
                                    }
                                    images = images.shuffled()
                                    numberOfMoves = 0
                                }
                            }
                        }
                    } label: {
                        images[14]
                    }
                    Button {
                        if (numberOfShown == 2) {
                            cnt = 0
                            if (firstImage.name != secondImage.name)
                            {
                                for i in images{
                                    if (firstImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    if (secondImage.name == i.name){
                                        images[cnt].founded = false
                                    }
                                    cnt = cnt + 1
                                }
                            }
                            numberOfShown = 0
                        }
                        if images[15].founded == false {
                            images[15].founded = true
                            numberOfShown = numberOfShown + 1
                            if (numberOfShown == 1)
                            {
                                numberOfMoves += 1
                                firstImage = images[15]
                            }
                            else
                            {
                                secondImage = images[15]
                                if (firstImage.name == secondImage.name)
                                {
                                    finded += 1
                                }
                                if finded == 8
                                {
                                    for i in 0...15 {
                                        images[i].founded = false
                                    }
                                    images = images.shuffled()
                                    numberOfMoves = 0
                                }
                            }
                        }
                        
                    } label: {
                        images[15]
                    }
                }
                HStack
                {
                    Text ("Number Of Moves:")
                        .font(.system(size: 24, weight: .light, design: .serif))
                        .italic()
                    Text (String (numberOfMoves)).padding()
                        .font(.system(size: 24, weight: .light, design: .serif))
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Brain()
    }
}


struct cards: View {
    var founded = false
    var name = "name"
    var body: some View {
        if founded {
            Image(name)
                .resizable()
                .frame(width: UIScreen.screenWidth / 5, height: UIScreen.screenWidth / 5)
        }
        else {
            Image("background")
                .resizable()
                .frame(width: UIScreen.screenWidth / 5, height: UIScreen.screenWidth / 5)
        }
        
    }
}
