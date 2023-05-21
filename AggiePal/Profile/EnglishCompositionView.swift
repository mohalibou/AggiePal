//
//  EnglishCompositionView.swift
//  AggiePal
//
//  Created by Mohamed Ali Boutaleb on 5/20/23.
//

import SwiftUI

struct EnglishCompositionView: View {
    var body: some View {
        List {
            Section {
                Text("Completed")
                    .bold()
                    .listRowBackground(Color.green.opacity(0.15))
                    .foregroundColor(.green)
            }
            Section(header: Text("Method 1")) {
                DisclosureGroup {
                    RequirementCell(title: "ENL 003", status: .complete, value: "4 units")
                } label: {
                    RequirementCell(title: "One Lower Division Course", status: .complete, value: "")
                }

                DisclosureGroup {
                    RequirementCell(title: "UWP 104C", status: .complete, value: "4 units")
                } label: {
                    RequirementCell(title: "One Upper Division Course After 84 Credits", status: .complete, value: "")
                }
            }
            Section(header: Text("Method 2")) {
                RequirementCell(title: "One Lower Division Course", status: .complete, value: "")
                RequirementCell(title: "Upper Division Composition Exam", status: .unnecessary, value: "")
            }
        }
        .navigationTitle("English Composition")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EnglishCompositionView_Previews: PreviewProvider {
    static var previews: some View {
        EnglishCompositionView()
    }
}
