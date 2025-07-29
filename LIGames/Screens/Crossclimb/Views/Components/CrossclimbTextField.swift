import SwiftUI

struct CrossclimbTextField: View {

    @ObservedObject var viewModel: CrosslimbViewViewModel
    @Binding var text: String
    @Binding var currentRow: Int
    @FocusState.Binding var focusedIndex: Int?

    let currentTextFieldIndex: Int
    
    private func isCurrentRowFocused() -> Bool {
        return currentRow == viewModel.activeRowIndex
    }

    var body: some View {
        HStack {
            Spacer()

            TextField("", text: $text)
                .fontWeight(.bold)
                .frame(width: 34)
                .focused($focusedIndex, equals: currentTextFieldIndex)
                .textCase(.uppercase)
                .multilineTextAlignment(.center)
                .onChange(of: text, { _, newValue in
                    if newValue.count > 1 {
                        text = String(newValue.prefix(1))
                    } else {
                        text = newValue
                    }
                    
                    // Move to next field
                    if newValue.count == 1 {
                        focusedIndex = currentTextFieldIndex + 1
                    }
                })
                .overlay(alignment: .bottom) {
                    Rectangle()
                        .frame(height: 1)
                        .background(.black)
                        .scaleEffect(x: isCurrentRowFocused() ? 1 : 0, y: 1, anchor: .center)
                        .animation(.easeInOut(duration: 0.2), value: viewModel.activeRowIndex)
                }
            
            Spacer()
        }
    }
}
