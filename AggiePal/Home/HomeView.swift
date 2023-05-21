//
//  HomeView.swift
//  AggiePal
//
//  Created by Mohamed Ali Boutaleb on 5/20/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    @State private var registered: [Bool] = [false, false, false]
    
    @State private var registeredForAllClasses = false
    
    @State private var attemptedToRegister = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Pass 1:")
                            Text("5/20/23 12:00 PM")
                                .bold()
                        }
                        .frame(maxWidth: .infinity)
                        
                        Divider()
                        
                        VStack(alignment: .leading) {
                            Text("Pass 2:")
                            Text("8/23/23 4:00 PM")
                                .bold()
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                
                Section {
                    if vm.scheduledClasses.isEmpty {
                        Text("You haven't added any classes to your schedule!")
                    } else {
                        ForEach(Array(vm.scheduledClasses.enumerated()), id: \.element.id) { index, classInfo in
                            NavigationLink {
                                ClassInfoHomeView(classInfo: classInfo, registered: $registered[index])
                            } label: {
                                ClassCell(classInfo: classInfo, registered: registered[index])
                            }
                            .buttonStyle(.plain)
                        }
                    }
                } header: {
                    HStack {
                        Text("Class Info")
                            .font(.title2)
                            .foregroundColor(.primary)
                            .bold()
                            .textCase(nil)
                        Spacer()
                        Menu {
                            Button {
                                if vm.passTimeHasPassed {
                                    registeredForAllClasses.toggle()
                                    registered = registered.map { _ in true }
                                } else {
                                    attemptedToRegister.toggle()
                                }
                                
                            } label: {
                                Label("Register All Classes", systemImage: "checkmark.circle").textCase(nil)
                            }
                            
                            Menu {
                                Label("Fall Quarter 2023", systemImage: "checkmark").textCase(nil)
                                Text("Fall Semester 2023").textCase(nil)
                                Text("Summer Quarter 2023").textCase(nil)
                                Text("Summer Session 2 2023").textCase(nil)
                                Text("Summer Special Session 2023").textCase(nil)
                                Text("Summer Session 1 2023").textCase(nil)
                                Text("Spring Quarter 2023").textCase(nil)
                                Text("Spring Semester 2023").textCase(nil)
                            } label: {
                                Label("Change Quarter/Semester", systemImage: "graduationcap").textCase(nil)
                            }
                        } label: {
                            Image(systemName: "ellipsis")
                                .font(.title2)
                                .foregroundColor(.white)
                                .buttonStyle(.plain)
                        }
                    }
                } footer: {
                    VStack(alignment: .leading) {
                        Text("Total Scheduled Units: \(vm.scheduledClasses.count * 4)")
                        Text("Current Registered Units: \(registered.filter { $0 == true }.count * 4)")
                        Text("Current Waitlisted Units: \(0)")
                        Text("Current Workload Units: \(registered.filter { $0 == true }.count * 4)")
                    }
                }
            }
            .navigationTitle("Home")
            .alert(String("Successfully Registered"), isPresented: $registeredForAllClasses) {
                Button("OK") { }
            } message: {
                Text("You have successfully registered for all classes.")
            }
            .alert(String("Can't Register Yet"), isPresented: $attemptedToRegister) {
                Button("OK") { }
            } message: {
                Text("Your pass time hasn't arrived yet.")
            }
        }
    }
}

struct ClassCell: View {
    
    var classInfo: Class
    var registered: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(classInfo.courseCode) - \(classInfo.courseName)")
                .bold()
                .font(.title3)
                .padding(.bottom, 4)
            Text("Open/Reserved/Waitlist: \(classInfo.open)/\(classInfo.reserved)/\(classInfo.reserved)")
            Text("CRN: \(String(classInfo.crn))")
            Text("Units: \(classInfo.units)")
            Label {
                Text("\(registered ? "Registered" : "Not Registered")  ")
            } icon: {
                Image(systemName: registered ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(registered ? .green : .red)
            }
            .padding(4)
            .overlay(
                Capsule()
                    .stroke(registered ? .green : .red, lineWidth: 1)
            )
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView().environmentObject(ViewModel())
    }
}
