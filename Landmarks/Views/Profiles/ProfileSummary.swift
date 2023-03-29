import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    

    var body: some View {
        ScrollView {
            VStack{
                VStack(alignment: .leading, spacing: 15) {
                    Text(profile.username)
                        .bold()
                        .font(.title)

                    Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                    Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                    Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                }
                .padding(.bottom)
            }
            Divider()
            
            VStack(alignment: .leading) {
                                Text("Completed Badges")
                    .font(.headline)
                    .multilineTextAlignment(.leading)

                                ScrollView(.horizontal) {
                                    HStack(alignment: .center) {
                                        HikeBadge(name: "First Hike")
                                        HikeBadge(name: "Earth Day")
                                            .hueRotation(Angle(degrees: 90))
                                        HikeBadge(name: "Tenth Hike")
                                            .grayscale(0.5)
                                            .hueRotation(Angle(degrees: 45))
                                    }
                                    .padding(.bottom)
                                }
                                .padding([.top, .leading])
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            .padding([.top, .leading, .bottom])
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("Recent Hikes")
                    .font(.headline)

                HikeView(hike: modelData.hikes[0])
                    
            }
            .padding([.top, .leading])

        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
