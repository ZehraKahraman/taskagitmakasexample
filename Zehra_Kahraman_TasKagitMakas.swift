enum TasKagitMakas:Int {//taş kağıt makas için enum oluşturuldu
   case Tas = 1
   case Kagit = 2
   case Makas = 3
}

class TasKagitMakasSecimi {
    func pcninSecimi() -> TasKagitMakas {//pc bu tanımladığımız enum değerler dışında değer seçemeyecek olup random seçim yapması sağlandı.
        let secim: [TasKagitMakas] = [.Tas, .Kagit, .Makas]
        return secim.randomElement()!
    }
}

class KazananTarafKarar {
    enum Kazanan:String {//3 olasılık olduğu için oyun sonucu enum olarak tutuldu.
        case kullanici = "Bu eli Kazandınız. Tebrikler!"
        case bilgisayar = "Bu eli bilgisayar kazandı!"
        case beraber = "Bu el berabere!"
    }

    func kazananTaraf (kullanici: TasKagitMakas, pc: TasKagitMakas) -> Kazanan {//kazanan tarafa karar verebilmek için kullanıcıdan gelen değer ve pcnin random seçimine göre karşılaştırmalar yapıldı.
        switch kullanici {
        case .Tas:
            if pc == .Kagit{
                return .bilgisayar
            } else if pc == .Makas{
                return .kullanici
            } else {
                return .beraber
            }
        case .Kagit:
            if pc == .Tas{
                return .kullanici
            } else if pc == .Makas{
                return .bilgisayar
            } else {
                return .beraber
            }
        case .Makas:
            if pc == .Kagit{
                return .kullanici
            } else if pc == .Tas{
                return .bilgisayar
            } else {
                return .beraber
        }
      }
    }
}

print("Taş kağıt makas oyununa hoşgeldiniz. \n Taraflardan birinin skoru 3 olana kadar oyun devam eder. \n Başarılar!")

var rakipSkor = 0//başlangıçta rakip ve kullanıcının skorunu 0 setlendi.
var kullaniciSkor = 0

while rakipSkor != 3 && kullaniciSkor != 3 {//Daha sonra while döngüsüyle 2 kullanıcıdan birinin skoru 3 olana kadar oyunu devam ettirildi. Kazananın skoru her adımda 1 arttırıldı.
    let rakip = TasKagitMakasSecimi()
    let rakipTercih = rakip.pcninSecimi()

    let oyunAlani = KazananTarafKarar()

    print("Lütfen Taş için 1, Kağıt için 2, Makas için 3 değerlerinden birini giriniz.")//kullanıcıya 1, 2, 3 değerlerinden birini seçmesi için bilgilendirme yapıldı.
    if let kullaniciTercih = readLine(), let kullaniciTercihNumber = Int(kullaniciTercih), let kullaniciTercihEnum = TasKagitMakas(rawValue: kullaniciTercihNumber) {
        let sonuc = oyunAlani.kazananTaraf(kullanici: kullaniciTercihEnum, pc:rakipTercih)
        print("Tercihiniz: \(kullaniciTercihEnum), Rakibin Tercihi: \(rakipTercih), \(sonuc.rawValue)" )//kullanıcı inputu ve rakip(pc) seçimi ekrana bilgi amaçlı basıldı.

        switch sonuc {//o eli kim kazandıysa skoru 1 arttırıldı, berabere ise break ile işlem sonlandırıldı.
        case .kullanici:
            kullaniciSkor += 1
        case .bilgisayar:
            rakipSkor += 1
        case .beraber:
            break
        }

        print("Skorunuz: \(kullaniciSkor) , Rakibin Skoru: \(rakipSkor)") //kullanıcı ve rakip skor bilgisi ekrana basıldı.

    } else {//kullanıcı input olarak 1,2,3 değerlerinden başka bir değer girdiyse else bloğuna girilip uyarı mesajı verilmesi sağlandı.
        print("Geçersiz karakter girdiniz")
    }
}


