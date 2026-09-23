import Foundation

protocol CostDisplayable {
    var id: String { get }
    var planName: String { get }
    var deductible: Double { get }
    var premium: Double { get }
}