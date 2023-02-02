//
//  ContentView.swift
//  emmaKadai5
//
//  Created by Emma on 2023/01/12.
//

import SwiftUI

struct ContentView: View {
    //課題名
    let kadaiTitleText:String = "課題5\n割り算アプリ(アラート表示あり)"
    //入力
    @State var inputText1: String = ""
    @State var inputText2: String = ""
    //計算結果初期値
    @State var resultText: String = "0.0"
    //アラート
    @State var isAlert: Bool = false
    @State var alertText: String = ""
    //アラートと計算処理
    func AlertCalc() {
        // 計算結果を0に戻す
        resultText = "0.0"
        // 割られる数がDoubleに変換できない時（数字じゃない、文字が入っていない場合）
        guard let inputNumber1 = Double(inputText1) else {
            isAlert = true
            alertText = "割られる数を入力してください"
            return
        }
        // 割る数がDoubleに変換できない時（数字じゃない、文字が入っていない場合）
        guard let inputNumber2 = Double(inputText2) else {
            isAlert = true
            alertText = "割る数を入力してください"
            return
        }
        // 割る数が0に等しい時
        guard Double(inputText2) != 0.0 else {
            isAlert = true
            alertText = "割る数には0を入力しないでください。"
            return
        }
        // 割り算してStringに変換
        resultText = String(inputNumber1 / inputNumber2)
    }

//スタイル定義
    //課題カラー
    let kadaiColor:Color = Color.mint
    //タイトル
    var kadaiTitle: some View {
        Text(kadaiTitleText)
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(kadaiColor)
    }

    var body: some View {
        VStack(spacing: 20) {
            //タイトル
            kadaiTitle
            //入力
            HStack {
                InputTextView(inputTextLabel: "割られる数", inputTextNumber: $inputText1)
                Text("÷").foregroundColor(kadaiColor)
                InputTextView(inputTextLabel: "割る数", inputTextNumber: $inputText2)
            }
            .frame(width: 260)
            //処理
            Button(action: AlertCalc){
                Text("計算する")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(kadaiColor)
                    .cornerRadius(20)
            }
            .alert("課題5", isPresented: $isAlert) {
                Button("OK", action: {})
            } message: { Text(alertText) }
            //出力
            Text(resultText)
                .font(.title)
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(kadaiColor .opacity(0.2))
            Spacer()
        }
    }
}

//入力用TextFieldの定義
struct InputTextView: View {
    var inputTextLabel: String = ""
    @Binding var inputTextNumber: String

    var body: some View {
        TextField(inputTextLabel, text: $inputTextNumber)
            .padding(8)
            .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(.mint, lineWidth: 1))
            .keyboardType(.numberPad)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
