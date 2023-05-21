//
//  SearchView.swift
//  AggiePal
//
//  Created by Mohamed Ali Boutaleb on 5/20/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var searched = false
    
    @State private var isShowingFilterOptions = false
    @State private var filterPassedClasses = false
    @State private var filterScheduleConflictClasses = false
    @State private var filterClassesWithoutFulfilledPrereqs = false
    
    var classes = ["ECS 012", "ECS 020", "ECS 032A", "ECS 032B", "ECS 032C", "ECS 036A", "ECS 036B", "ECS 036C", "ECS 050", "ECS 092", "ECS 099", "ECS 120", "ECS 122A", "ECS 130", "ECS 132", "ECS 140A", "ECS 150", "ECS 152A", "ECS 154A", "ECS 160", "ECS 171", "ECS 175", "ECS 188", "ECS 189F", "ECS 198", "ECS 198F", "ECS 199", "ECS 230", "ECS 232", "ECS 235A", "ECS 251", "ECS 256", "ECS 265", "ECS 271", "ECS 272", "ECS 289G", "ECS 289H", "ECS 293A", "ECS 298", "ECS 299", "ECS 390", "ECS 396"]
    
    var searchAutocomplete: [String] {
        if !searchText.isEmpty {
            return classes.filter { $0.contains(searchText) }
        } else {
            return []
        }
    }
    
    var body: some View {
        NavigationView {
            RecommendedSearchView(searchText: $searchText)
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search by CRN, subject, instructor, etc.") {
                    if searched {
                        ForEach(Classes.ecs) { classInfo in
                            if !filterPassedClasses || (filterPassedClasses && classInfo.warning != (true, "Already passed the class.")) {
                                NavigationLink {
                                    ClassInfoView(classInfo: classInfo)
                                } label: {
                                    SearchResultView(classInfo: classInfo)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    } else {
                        ForEach(searchAutocomplete, id: \.self) { result in
                            Button {
                                searchText = result
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                    searched = true
                                }
                                
                            } label: {
                                Label(result, systemImage: "magnifyingglass")
                            }
                        }
                    }
                    
                }
                .navigationTitle("Search")
                .onSubmit(of: .search) {
                    searched = true
                    print("searched")
                }
                .onChange(of: searchText) { _ in
                    searched = false
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isShowingFilterOptions.toggle()
                        } label: {
                            Image(systemName: "gearshape.fill")
                        }
                        
                    }
                }
                .sheet(isPresented: $isShowingFilterOptions) {
                    NavigationView {
                        List {
                            Toggle(isOn: $filterPassedClasses) {
                                Text("Hide Passed Classes")
                            }
                            Toggle(isOn: $filterScheduleConflictClasses) {
                                Text("Hide Classes with Schedule Conflicts")
                            }
                            Toggle(isOn: $filterClassesWithoutFulfilledPrereqs) {
                                Text("Hide Classes with Missing Prerequisites")
                            }
                        }
                        .navigationTitle("Filter Options")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button("Done") {
                                    isShowingFilterOptions.toggle()
                                }
                            }
                        }
                    }
                }
        }
    }
}

struct RecommendedSearchView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        
        ScrollView {
            VStack {
                HStack {
                    Text("Recommended Classes")
                        .padding()
                        .font(.title2)
                        .foregroundColor(.primary)
                        .bold()
                    Spacer()
                }
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 20) {
                    VStack(alignment: .leading) {
                        Button {
                            withAnimation {
                                searchText = "ECS 132"
                            }
                            
                        } label: {
                            Label("ECS 132", systemImage: "magnifyingglass")
                        }
                        Divider()
                        Button {
                            withAnimation {
                                searchText = "ECS 140A"
                            }
                            
                        } label: {
                            Label("ECS 140A", systemImage: "magnifyingglass")
                        }
                        Divider()
                        Button {
                            withAnimation {
                                searchText = "ECS 171"
                            }
                            
                        } label: {
                            Label("ECS 171", systemImage: "magnifyingglass")
                        }
                    }
                    VStack(alignment: .leading) {
                        Button {
                            withAnimation {
                                searchText = "ECS 175"
                            }
                            
                        } label: {
                            Label("ECS 175", systemImage: "magnifyingglass")
                        }
                        Divider()
                        Button {
                            withAnimation {
                                searchText = "ECS 120"
                            }
                            
                        } label: {
                            Label("ECS 120", systemImage: "magnifyingglass")
                        }
                        Divider()
                        Button {
                            withAnimation {
                                searchText = "ECS 188"
                            }
                            
                        } label: {
                            Label("ECS 188", systemImage: "magnifyingglass")
                        }
                    }
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct SearchResultView: View {
    
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
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(classInfo.courseCode)
                        .bold()
                    Text(classInfo.courseName)
                }
                
                Spacer()
                VStack(alignment: .trailing, spacing: 2) {
                    Text(classInfo.instructor)
                    Text(String(classInfo.rmpRating))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(rmpColor.opacity(0.25))
                        .cornerRadius(8)
                }
                
            }
            
            if classInfo.warning.cantJoinClass {
                Label {
                    Text("\(classInfo.warning.why)  ")
                } icon: {
                    Image(systemName: "exclamationmark.circle.fill")
                        .foregroundColor(.yellow)
                }
                .padding(2)
                .overlay(
                    Capsule()
                        .stroke(.yellow, lineWidth: 1)
                )
                
                
            }
            
        }
    }
}
