//
//  ViewModel.swift
//  AggiePal
//
//  Created by Mohamed Ali Boutaleb on 5/20/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var scheduledClasses: [Class] = []
    @Published var passTimeHasPassed: Bool = false
}
