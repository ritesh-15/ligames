import SwiftUI

struct LaunchPadView: View {
    
    @State private var isShowingCrossClimbView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                VStack(spacing: 18) {
                    Image("crossclimb")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: .init(12)))
                    
                    Text("Crossclimb")
                        .fontWeight(.bold)
                        .font(.title)
                }
                
                Spacer()

                Button {
                    isShowingCrossClimbView = true
                } label: {
                    Text("Let's play")
                        .frame(maxWidth: .infinity, minHeight: 54)
                        .padding(.horizontal)
                        .foregroundStyle(.white)
                        .background(.brandPrimary)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }

            }
            .padding()
            .navigationDestination(isPresented: $isShowingCrossClimbView) {
                CrossclimbView()
            }
        }
    }
}

#Preview {
    LaunchPadView()
}
