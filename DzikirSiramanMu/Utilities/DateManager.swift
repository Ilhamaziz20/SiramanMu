//
//  DateManager.swift
//  DzikirSiramanMu
//
//  Created by Muhammad Ilham Aziz on 01/02/24.
//

import Foundation

class DateManager {
    class func convertDateFormat(inputDateString: String) -> String {
        let dateFormatterInput = DateFormatter()
        dateFormatterInput.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let inputDate = dateFormatterInput.date(from: inputDateString) {
            let dateFormatterOutput = DateFormatter()
            dateFormatterOutput.locale = Locale(identifier: "id_ID")
            dateFormatterOutput.dateFormat = "EEEE, dd/MM/yyyy HH:mm"
            let outputDateString = dateFormatterOutput.string(from: inputDate)
            return outputDateString
        }
        return ""
    }
}
