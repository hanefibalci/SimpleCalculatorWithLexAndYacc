# Aritmetik İfade Hesaplayıcı

Bu proje, basit aritmetik ifadeleri hesaplayan bir hesap makinesi uygulamasıdır. Flex (lexer) ve Bison (parser) kullanılarak geliştirilmiştir.

## Özellikler

- Temel aritmetik operatörleri destekler (+, -, *, /, %)
- Parantez desteği
- Tam sayı hesaplamaları
- Sıfıra bölme kontrolü
- Sözdizimi hata kontrolü
- Geçersiz karakter kontrolü

## Tasarım Kararları

1. **Lexer (calculator.l)**:
   - Sayıları tanımak için [0-9]+ regex'i kullanıldı
   - Boşluklar ve tab karakterleri yok sayılıyor
   - Yeni satır karakteri parsing'i sonlandırıyor
   - Diğer karakterler olduğu gibi parser'a iletiyor

2. **Parser (calculator.y)**:
   - Öncelik sırası:
     - En yüksek: parantez
     - Orta: çarpma, bölme, mod
     - En düşük: toplama, çıkarma
   - Sıfıra bölme kontrolü
   - Hata durumunda flag değişkeni ile kontrol

## Uygulama Adımları

1. **Lexer Geliştirme**:
   - Sayıları tanıma
   - Boşlukları yok sayma
   - Geçersiz karakter kontrolü

2. **Parser Geliştirme**:
   - Gramer kurallarının tanımlanması
   - Operatör önceliklerinin belirlenmesi
   - Hata kontrolü mekanizması

3. **Hata Yönetimi**:
   - Sıfıra bölme kontrolü
   - Sözdizimi hata kontrolü
   - Kullanıcı dostu hata mesajları

## Kullanım

Program şu formatta aritmetik ifadeleri kabul eder:
```
5 + 3 * 2
10 / 2
(5 + 3) * 2
```

## Derleme ve Çalıştırma

1. Gerekli araçların kurulu olduğundan emin olun:
   - Flex (lexer generator)
   - Bison (parser generator)
   - GCC (C derleyici)

2. Projeyi derlemek için:
```bash
bison -d calculator.y
flex calculator.l
gcc -o calculator lex.yy.c y.tab.c
```

3. Programı çalıştırmak için:
```bash
./calculator
```

## Örnek Kullanım

```
Hesaplamak istediğiniz aritmetik operasyonu giriniz:
5 + 3 * 2
Result=11
Aritmetik söz dizimi uygun

Hesaplamak istediğiniz aritmetik operasyonu giriniz:
10 / 0
Hata: Sifira bolme hatasi!
```

## Hata Durumları

Program şu hata durumlarını kontrol eder:
1. Sıfıra bölme hatası
2. Geçersiz karakter kullanımı
3. Sözdizimi hataları
4. Eksik veya fazla parantez

## Kısıtlamalar

- Sadece tam sayılar desteklenir
- Negatif sayılar için parantez kullanılmalıdır
- Ondalıklı sayılar desteklenmez
- Üs alma operatörü desteklenmez