//
//  ProfileView.swift
//  AggiePal
//
//  Created by Mohamed Ali Boutaleb on 5/20/23.
//

import SwiftUI
import UserNotifications
import PassKit

struct ProfileView: View {
    
    @EnvironmentObject var vm: ViewModel
    @Environment(\.colorScheme) var colorScheme
    @State private var pressedAddToAppleWallet = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack(spacing: 16) {
                        Image("profile-picture")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Mohamed Ali Boutaleb")
                                .bold()
                            Text("968335123")
                                .foregroundColor(.secondary)
                                .font(.footnote)
                            Text(verbatim: "maboutaleb@ucdavis.edu")
                                .foregroundColor(.secondary)
                                .font(.footnote)
                        }
                    }
                    .alignmentGuide(.listRowSeparatorLeading) { $0[.leading] - 20 }
                    HStack {
                        degreeProgress
                            .onTapGesture {
                                vm.passTimeHasPassed = true
                                
                                let content = UNMutableNotificationContent()
                                content.title = "AggiePal"
                                content.body = "Your Pass 1 appointment has started!"
                                content.sound = UNNotificationSound.default
                                
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                                
                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                
                                UNUserNotificationCenter.current().add(request)
                            }
                        Divider()
                            .padding(.vertical, -4)
                        ucGPA
                            .onTapGesture {
                                let content = UNMutableNotificationContent()
                                content.title = "AggiePal"
                                content.body = "Pass times for Fall 2023 are out! Open the app to see your pass times."
                                content.sound = UNNotificationSound.default
                                
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                                
                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                
                                UNUserNotificationCenter.current().add(request)
                            }
                    }
                }
                
                Section(header: Text("Degree Requirements"), footer: Text("**Disclaimer:** This is not a replacement for academic advising from your department and Deans' Office.")) {
                    RequirementCell(title: "Above 2.0 GPA", status: .complete, value: "")
                    RequirementCell(title: "Residence Requirement", status: .complete, value: "")
                    NavigationLink(destination: EnglishCompositionView()) {
                        RequirementCell(title: "English Composition", status: .complete, value: "")
                    }
                    NavigationLink(destination: GeneralEducationTBView()) {
                        RequirementCell(title: "General Education (Topical Breadth)", status: .seeAdvisor, value: "")
                    }
                    NavigationLink(destination: GeneralEducationCLView()) {
                        RequirementCell(title: "General Education (Core Literacy)", status: .incomplete, value: "")
                    }
                    NavigationLink(destination: CompSciMajorView()) {
                        RequirementCell(title: "Major in Computer Science", status: .incomplete, value: "")
                    }
                    NavigationLink(destination: NaturalSciencesView()) {
                        RequirementCell(title: "Natural Sciences & Mathematics", status: .inProgress, value: "")
                    }
                }
                
                Section {
                    AddPassToWalletButton { pressedAddToAppleWallet.toggle() }
                        .listRowBackground(Color(colorScheme == .light ? UIColor.secondarySystemBackground : .black))
                        .cornerRadius(12)
                }
            }
            .navigationTitle("Profile")
            .alert(String("Student ID Added"), isPresented: $pressedAddToAppleWallet) {
                Button("OK") { }
            } message: {
                Text("You have successfully added your Student ID to your Apple Wallet.")
            }
        }
    }
    
    var degreeProgress: some View {
        VStack {
            Text("Degree Progress")
            Gauge(value: 0.85) {
                Text("85%")
            }
            .tint(.green)
            .gaugeStyle(.accessoryCircularCapacity)
        }
        .frame(maxWidth: .infinity)
    }
    
    var ucGPA: some View {
        VStack {
            Text("UC GPA")
            Gauge(value: 3.556/4) {
                Text("3.556")
            }
            .tint(.green)
            .gaugeStyle(.accessoryCircularCapacity)
        }
        .frame(maxWidth: .infinity)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
