
import SwiftUI

struct CustomTab: View {
    let text: String
    @Binding var isSelected: Bool
    
    var body: some View {
        Text(text)
                   .fontWeight(isSelected ? .heavy : .regular)
                   .font(.custom("SF Pro Display", size: 12))
                   .padding(.bottom, 10)
                   .foregroundColor(isSelected ? Color.black : Color(red: 0.557, green: 0.557, blue: 0.557))
    }
}


struct CustomTopTabBar: View {
    @Binding var tabIndex: Int
    
    var body: some View {
        HStack {
            CustomTab(text: "2023年10月", isSelected: .constant(tabIndex == 0))
                .onTapGesture { onButtonTapped(index: 0) }.frame(maxWidth: .infinity)

            CustomTab(text: "2023年11月", isSelected: .constant(tabIndex == 1))
                .onTapGesture { onButtonTapped(index: 1) }.frame(maxWidth: .infinity)

            CustomTab(text: "2023年12月", isSelected: .constant(tabIndex == 2))
                .onTapGesture { onButtonTapped(index: 2) }.frame(maxWidth: .infinity)
        }
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
}

