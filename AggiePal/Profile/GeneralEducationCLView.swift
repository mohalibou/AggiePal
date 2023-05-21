//
//  GeneralEducationCLView.swift
//  AggiePal
//
//  Created by Mohamed Ali Boutaleb on 5/20/23.
//

import SwiftUI

struct GeneralEducationCLView: View {
    var body: some View {
        List {
            Section {
                Text("Incomplete")
                    .bold()
                    .listRowBackground(Color.red.opacity(0.15))
                    .foregroundColor(.red)
            }
            Section(header: Text("Literacy with Words and Images")) {
                DisclosureGroup {
                    RequirementCell(title: "CMN 001", status: .complete, value: "4 Units")
                    RequirementCell(title: "Need Another Class", status: .incomplete, value: "")
                } label: {
                    RequirementCell(title: "6 Units in Writing Experience (WE)", status: .incomplete, value: "")
                }
                
                DisclosureGroup {
                    RequirementCell(title: "STS 115", status: .complete, value: "4 Units")
                } label: {
                    RequirementCell(title: "3 Units in Oral Literacy (OL) or Additional WE", status: .complete, value: "")
                }
                
                DisclosureGroup {
                    RequirementCell(title: "PLS 021V", status: .inProgress, value: "3 Units")
                } label: {
                    RequirementCell(title: "Visual Literacy (VL)", status: .inProgress, value: "")
                }
                
            }
            
            Section(header: Text("Civic and Cultural Literacy")) {
                DisclosureGroup {
                    RequirementCell(title: "HIST 017B", status: .complete, value: "4 Units")
                } label: {
                    RequirementCell(title: "Domestic Diversity (DD)", status: .complete, value: "")
                }
                
                DisclosureGroup {
                    RequirementCell(title: "HIST 017A", status: .complete, value: "4 Units")
                } label: {
                    RequirementCell(title: "American Cultures, Gov't, & Hist. (ACGH)", status: .complete, value: "")
                }
                
                DisclosureGroup {
                    RequirementCell(title: "IAD 010", status: .complete, value: "4 Units")
                } label: {
                    RequirementCell(title: "World Cultures (WC)", status: .complete, value: "")
                }
            }
            
            Section(header: Text("Quantitative Literacy")) {
                DisclosureGroup {
                    RequirementCell(title: "ECS 122B", status: .inProgress, value: "4 Units")
                } label: {
                    RequirementCell(title: "Quantitative Literacy (QL)", status: .inProgress, value: "")
                }
            }
            
            Section(header: Text("Scientific Literacy")) {
                DisclosureGroup {
                    RequirementCell(title: "MAT 021A", status: .complete, value: "4 Units")
                } label: {
                    RequirementCell(title: "Scientific Literacy (SL)", status: .complete, value: "")
                }
            }
        }
        .navigationTitle("General Education (Core Literacy)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GeneralEducationCLView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralEducationCLView()
    }
}
