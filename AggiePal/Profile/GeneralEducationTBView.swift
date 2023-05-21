//
//  GeneralEducationTBView.swift
//  AggiePal
//
//  Created by Mohamed Ali Boutaleb on 5/20/23.
//

import SwiftUI

struct GeneralEducationTBView: View {
    var body: some View {
        List {
            Section {
                Text("See Advisor")
                    .bold()
                    .listRowBackground(Color.yellow.opacity(0.15))
                    .foregroundColor(.yellow)
            }
            Section {
                RequirementCell(title: "Must Complete 52 Units Minimum", status: .incomplete, value: "")
            }
            Section(header: Text("Arts & Humanities — 12-20 Units")) {
                DisclosureGroup {
                    RequirementCell(title: "CMN 001", status: .complete, value: "4 Units")
                    RequirementCell(title: "HIST 017A", status: .complete, value: "4 Units")
                    RequirementCell(title: "HIST 017B", status: .complete, value: "4 Units")
                } label: {
                    RequirementCell(title: "Arts & Humanities (AH)", status: .complete, value: "")
                }
            }
            Section(header: Text("Science & Engineering — 12-20 Units")) {
                DisclosureGroup {
                    RequirementCell(title: "ECS 122A", status: .complete, value: "4 Units")
                    RequirementCell(title: "ECS 122B", status: .inProgress, value: "4 Units")
                    RequirementCell(title: "ECS 154A", status: .complete, value: "4 Units")
                    RequirementCell(title: "ECS 170", status: .inProgress, value: "4 Units")
                    RequirementCell(title: "ECS 189L", status: .inProgress, value: "4 Units")
                } label: {
                    RequirementCell(title: "Science & Engineering (SE)", status: .inProgress, value: "")
                }
            }
            Section(header: Text("Social Sciences — 12-20 Units")) {
                DisclosureGroup {
                    RequirementCell(title: "IAD 010", status: .complete, value: "4 Units")
                    RequirementCell(title: "MGT 151", status: .complete, value: "4 Units")
                    RequirementCell(title: "PSC 001", status: .complete, value: "4 Units")
                } label: {
                    RequirementCell(title: "Social Sciences (SS)", status: .complete, value: "")
                }
            }
        }
        .navigationTitle("General Education (Topical Breadth)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GeneralEducationTBView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralEducationTBView()
    }
}
