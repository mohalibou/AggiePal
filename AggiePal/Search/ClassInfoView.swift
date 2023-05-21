//
//  ClassInfoView.swift
//  AggiePal
//
//  Created by Mohamed Ali Boutaleb on 5/20/23.
//

import SwiftUI

struct ClassInfoView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    @State private var addedToSchedule = false
    
    var classInfo: Class
    
    var rmpColor: Color {
        if classInfo.rmpRating < 2 && classInfo.rmpRating >= 0 {
            return .red
        } else if classInfo.rmpRating < 4 && classInfo.rmpRating >= 2 {
            return .yellow
        } else if classInfo.rmpRating <= 5 && classInfo.rmpRating >= 4 {
            return .green
        } else {
            return .gray
        }
    }
    
    var body: some View {
        VStack {
            List {
                Section {
                    Text(classInfo.courseName).bold()
                    if classInfo.warning.cantJoinClass {
                        
                        Label {
                            Text(classInfo.warning.why)
                        } icon: {
                            Image(systemName: "exclamationmark.circle.fill")
                                .foregroundColor(.yellow)
                        }
                        .listRowBackground(Color.yellow.opacity(0.15))
                    }
                }
                
                Section(header: Text("Instructor(s)").font(.title2).foregroundColor(.primary).bold().textCase(nil)) {
                    
                    NavigationLink {
                        TeacherView()
                    } label: {
                        LabeledContent {
                            Text("See More")
                        } label: {
                            Label {
                                HStack {
                                    Text(classInfo.instructor).bold()
                                    Text(String(classInfo.rmpRating))
                                        .foregroundColor(rmpColor)
                                        .bold()
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 6)
                                        .background(rmpColor.opacity(0.25))
                                        .cornerRadius(8)
                                }
                                
                            } icon: {
                                Image(systemName: "person.crop.rectangle")
                            }
                        }
                    }
                }
                
                if !classInfo.courseNotes.isEmpty {
                    Section(header: Text("Class Notes").font(.title2).foregroundColor(.primary).bold().textCase(nil)) {
                        Text(classInfo.courseNotes)
                    }
                    .listRowBackground(Color.yellow.opacity(0.15))
                }
                
                
                Section(header: Text("Class Info").font(.title2).foregroundColor(.primary).bold().textCase(nil)) {
                    Label("CRN: **\(String(classInfo.crn))**", systemImage: "number")
                    Label("Units: **\(classInfo.units)**", systemImage: "list.number")
                    Label("Open/Reserved/Waitlist: **\(classInfo.open)/\(classInfo.reserved)/\(classInfo.waitlist)**", systemImage: "person.fill")
                    Label("Subject: **\(classInfo.subject)**", systemImage: "studentdesk")
                    Label("Prerequisites: **\(classInfo.prerequisities)**", systemImage: "list.bullet.clipboard.fill")
                    Label("General Ed Courses: **\(classInfo.newGECourses)**", systemImage: "checklist")
                }
                
                Section(header: Text("Description").font(.title2).foregroundColor(.primary).bold().textCase(nil)) {
                    Text(classInfo.description)
                }
            }
            Button("Add to Schedule") {
                vm.scheduledClasses.append(classInfo)
                addedToSchedule.toggle()
            }
            .bold()
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationTitle(classInfo.courseCode)
        .alert(String("Class Added"), isPresented: $addedToSchedule) {
            Button("OK") { }
        } message: {
            Text("You have successfully added \(classInfo.courseCode) to your schedule.")
        }
    }
}

struct SearchVieww_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
