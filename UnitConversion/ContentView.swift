import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Fahrenheit"

    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]

    var convertedValue: Double {
        let celsius: Double
        switch inputUnit {
        case "Celsius":
            celsius = inputValue
        case "Fahrenheit":
            celsius = (inputValue - 32) * 5 / 9
        case "Kelvin":
            celsius = inputValue - 273.15
        default:
            celsius = 0
        }

        switch outputUnit {
        case "Celsius":
            return celsius
        case "Fahrenheit":
            return celsius * 9 / 5 + 32
        case "Kelvin":
            return celsius + 273.15
        default:
            return 0
        }
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Input") {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)

                    TextField("Enter value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                }

                Section("Output Unit") {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section("Converted Result") {
                    Text(convertedValue.formatted())
                }
            }
            .navigationTitle("Temp Converter")
        }
    }
}

#Preview {
    ContentView()
}
