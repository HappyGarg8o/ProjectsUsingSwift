import SwiftUI
struct weatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 300, height: 50)
            .background(backgroundColor)
            .foregroundStyle(textColor)
            .font(.title2)
            .clipShape(.buttonBorder)
    }
}
#Preview {
    weatherButton(title: "Test Title", textColor: .white, backgroundColor: .blue)
}
