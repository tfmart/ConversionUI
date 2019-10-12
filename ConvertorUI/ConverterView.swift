//
//  ConverterView.swift
//  ConvertorUI
//
//  Created by Tomas Martins on 11/10/19.
//  Copyright © 2019 Tomas Martins. All rights reserved.
//

import SwiftUI

struct ConverterView: View {
    var method: ConversionManager
    @State private var inputIndex = 0
    @State private var outputIndex = 0
    @State private var input = ""
    var result: String? {
//        return String(convertTemperature(value: input))
        return method.convert(inputUnit: method.units[inputIndex], outputUnit: method.units[outputIndex], value: input)
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Quantity", text: $input)
                    .keyboardType(.decimalPad)
                }
                
                Section {
                    Picker("From", selection: $inputIndex) {
                        ForEach(0..<self.method.units.count) {
                            Text(self.method.units[$0])
                        }
                    }

                    Picker("To", selection: $outputIndex) {
                        ForEach(0..<self.method.units.count) {
                            Text(self.method.units[$0])
                        }
                    }
                }
                
                Section(header: Text("Result")) {
                    if input.isEmpty {
                        Text("")
                    } else {
                        Text("\(result ?? "Invalid input")")
                    }
                }
                
            }
            .navigationBarTitle(method.rawValue)
        }
    }
}

extension ConverterView {
    func convertTemperature(value: String) -> Double {
        guard inputIndex != outputIndex else {
            return Double(value) ?? 0.0
        }
        
        guard let temperature = Double(value) else {
            return 0.0
        }
        
        switch inputIndex {
        case 0:
            if outputIndex == 1 {
                return (temperature * (9/5)) + 32
            } else {
                return temperature + 273
            }
        case 1:
            if outputIndex == 0 {
                return (temperature - 32) * (5/9)
            } else {
                return (temperature - 32) * (5/9) + 273.15
            }
        case 2:
            if outputIndex == 0 {
                return temperature - 273
            } else {
                return (temperature - 273.15) * (9/5) + 32
            }
        default:
            return Double(value) ?? 0.0
        }
    }
}

struct ConverterView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView(method: .temperature)
    }
}


