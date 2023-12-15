import SwiftUI


struct QuantityEditView: View {
    @Binding var quantity: Int
    @State private var quantityString: String
    var onSave: (Int) -> Void

    init(quantity: Binding<Int>, onSave: @escaping (Int) -> Void) {
        self._quantity = quantity
        self._quantityString = State(initialValue: String(quantity.wrappedValue))
        self.onSave = onSave
    }

    var body: some View {
        VStack(spacing: 20) {
            TextField("Quantity", text: $quantityString)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .padding()

            Button("Save") {
                if let newQuantity = Int(quantityString) {
                    onSave(newQuantity)
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

