// Main View
import SwiftUI
struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            VStack{
                CityTextView(cityName: "Faridabad")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 22)
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "tue", imageName: "cloud.sun.fill", temperature: 24)
                    WeatherDayView(dayOfWeek: "wed", imageName: "wind", temperature: 18)
                    WeatherDayView(dayOfWeek: "thu", imageName: "sun.max.fill", temperature: 22)
                    WeatherDayView(dayOfWeek: "fri", imageName: "sunset.fill", temperature: 28)
                    WeatherDayView(dayOfWeek: "sat", imageName: "moon.stars.fill", temperature: 20)
                }
                Spacer()
                Button{
                    isNight.toggle()
                } label: {
                    weatherButton(title: "Change Time Of Day", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}
#Preview {
    ContentView()
}
// WeatherDayView
struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 3){
            Text(dayOfWeek.uppercased())
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temperature)°")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
    }
}
// BackgroundView
struct BackgroundView: View {
    var isNight: Bool
    var body: some View {
        LinearGradient(colors:[isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}
// CityTextView
struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding()
    }
}
// MainWeatherStatusView
struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(Color.white)
        }
        .padding(.bottom,40)
    }
}
