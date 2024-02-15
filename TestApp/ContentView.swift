
import SwiftUI

struct ContentView: View {
    @State var tabIndex = 0

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                VStack(alignment: .leading, spacing: 0.0) {
                    VStack {
                        CustomLabel(text: "可処分所得の可視化")
                    }
                    VStack(alignment: .leading) {
                        CustomTopTabBar(tabIndex: $tabIndex)
                        if tabIndex == 0 {
                            SelectedMonthView(index: 0, lblmonth: "2023年10月")
                        }
                        else if tabIndex == 1 {
                            SelectedMonthView(index: 1, lblmonth: "2023年11月")
                        }
                        else {
                            SelectedMonthView(index: 2, lblmonth: "2023年12月")
                        }
                        
                    }
                    .padding(.top, 10)
                    .background(Color.white)
                }
                bottomView()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            .background(Color(red: 0.968, green: 0.973, blue: 0.981))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct btmNestedView: View {
    let iconName: String
    let title: String
    
    var body: some View {
        VStack{
            Image(iconName)
            Text(title)
                .foregroundColor(Color.init(red: 165.0/255.0, green: 165.0/255.0, blue: 165.0/255.0))
                .fontWeight(.bold)
                .font(.custom("SF Pro Display", size: 14))
        }
        .padding(12)
        .background(.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray, lineWidth: 1)
        )

    }
}

struct bottomView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10){
                btmNestedView(iconName: "grayhexagon", title: "必要不可欠")
                btmNestedView(iconName: "grayminimize", title: "置を換え可能")
                btmNestedView(iconName: "graywheel", title: "趣味自由用途")
            }
        }
        .padding(10)
        
        VStack{
            HStack(spacing: 25){
                Text("必要不可欠")
                    .foregroundColor(customdarkgrey)
                    .font(.system(size: 14))

                Text("置を換え可能")
                    .foregroundColor(customdarkgrey)
                    .font(.system(size: 14))

                Text("趣味自由用途")
                    .foregroundColor(.black)
                    .font(.system(size: 14))
                    .padding(10)
                    .background(Color.init(red: 243.0/255.0, green: 243.0/255.0, blue: 243.0/255.0))
                    .cornerRadius(20)
            }
            .padding(10)
            .background(.white)
            .cornerRadius(25)
        }
        .padding(.bottom, 20)
        
        HStack {
                Image("icon")
                Text("分類詳細を再度見る")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, opacity: 0.5))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.white, lineWidth: 1)
                    )
        }
        .padding(10)
        .background(customBlue)
        .cornerRadius(10)
            
    }
}
