import SwiftUI

struct LinkParser {
    static func parse(link: String) -> String {
        // Проверяем подстроки
        if link.contains("mos-sud.ru") {
            return parseMosSud(link: link)
        } else if link.contains("mos-gorsud.ru") {
            return parseMosGorsud(link: link)
        } else if link.contains("msudrf.ru") {
            return parseMsudrf(link: link)
        } else if link.contains("mirsud.spb.ru") {
            return parseMirsudSpb(link: link)
        } else if link.contains("kas.sudrf.ru") {
            return parseKasSudrf(link: link)
        } else if link.contains("sudrf.ru") {
            return parseOtherSudrf(link: link)
        } else {
            return "Ссылка не содержит известных доменов."
        }
    }
    
    private static func parseMosSud(link: String) -> String {
        if let range = link.range(of: "mos-sud.ru/") {
            let afterDomain = link[range.upperBound...]
            if let endIndex = afterDomain.firstIndex(of: "/") {
                return "Номер участка: \(afterDomain[..<endIndex])"
            }
        }
        return "Номер участка не найден."
    }
    
    private static func parseMosGorsud(link: String) -> String {
        if let range = link.range(of: "rs/") {
            let afterRs = link[range.upperBound...]
            if let endIndex = afterRs.firstIndex(of: "/") {
                return "Название суда: \(afterRs[..<endIndex])"
            }
        }
        return "Название суда не найдено."
    }
    
    private static func parseMsudrf(link: String) -> String {
        if let range = link.range(of: ".msudrf.ru") {
            let beforeDomain = link[..<range.lowerBound]
            if let startIndex = beforeDomain.lastIndex(of: "/") {
                return "Обозначение мирового судьи: \(beforeDomain[startIndex...])"
            }
        }
        return "Обозначение мирового судьи не найдено."
    }
    
    private static func parseMirsudSpb(link: String) -> String {
        if let range = link.range(of: "court_site_id=") {
            let afterParam = link[range.upperBound...]
            return "Номер участка: \(afterParam)"
        }
        return "Номер участка не найден."
    }
    
    private static func parseKasSudrf(link: String) -> String {
        if let range = link.range(of: "kas.sudrf.ru") {
            let beforeKas = link[..<range.lowerBound]
            if let lastNumberIndex = beforeKas.lastIndex(where: { $0.isNumber }) {
                let courtNumber = beforeKas[lastNumberIndex]
                return mapKasCourt(number: courtNumber)
            }
        }
        return "Кассационный суд не найден."
    }
    
    private static func mapKasCourt(number: Character) -> String {
        switch number {
        case "1": return "Первый кассационный суд общей юрисдикции"
        case "2": return "Второй кассационный суд общей юрисдикции"
        case "3": return "Третий кассационный суд общей юрисдикции"
        case "4": return "Четвертый кассационный суд общей юрисдикции"
        case "5": return "Пятый кассационный суд общей юрисдикции"
        case "6": return "Шестой кассационный суд общей юрисдикции"
        case "7": return "Седьмой кассационный суд общей юрисдикции"
        case "8": return "Восьмой кассационный суд общей юрисдикции"
        case "9": return "Девятый кассационный суд общей юрисдикции"
        default: return "Неизвестный кассационный суд"
        }
    }
    
    private static func parseOtherSudrf(link: String) -> String {
        if let range = link.range(of: "sudrf.ru") {
            let beforeDomain = link[..<range.lowerBound]
            if let lastSlashIndex = beforeDomain.lastIndex(of: "/") {
                return "Обозначение суда: \(beforeDomain[lastSlashIndex...])"
            }
        }
        return "Обозначение суда не найдено."
    }
}

struct ContentView: View {
    @State private var linksInput: String = UserDefaults.standard.string(forKey: "SavedLinks") ?? ""
    @State private var results = ""

    var body: some View {
        VStack {
            Text("Введите список ссылок (каждая с новой строки):")
                .font(.headline)
            //    .padding(.bottom)
            
            TextEditor(text: $linksInput)
                .frame(height: 200)
                .border(Color.gray, width: 1)
        //        .padding()
            
            Button("Разобрать ссылки") {
                let links = linksInput.split(separator: "\n").map { String($0) }
                results = links.map { link in
                    "\(link): \(LinkParser.parse(link: link))"
                }.joined(separator: "\n")
                
                // Сохраняем ссылки
                UserDefaults.standard.set(linksInput, forKey: "SavedLinks")
            }
         //   .padding()
            
            ScrollView {
                Text(results)
                //    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .border(Color.gray, width: 1)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
