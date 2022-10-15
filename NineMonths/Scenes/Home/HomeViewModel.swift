//
//  HomeViewModel.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

class HomeViewModel: NSObject, ObservableObject {
    @Published var monthByMonthPregnancy: [MonthByMonth?] = []
    @Published var weekByWeekPregnancy: [WeekByWeek?] = []
    let photoWeek = [
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F01-haftalik-hamilelik.jpeg?alt=media&token=6a9f1871-9abf-4c5f-bd89-b45153b0208a",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F02-haftalik-hamilelik.jpeg?alt=media&token=0c100218-acb6-4895-a0e7-d4511146ce6c",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F03-haftalik-hamilelik.jpeg?alt=media&token=9f7e0e97-d870-419f-844f-2a66fb1284b3",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F04-haftalik-hamilelik.jpeg?alt=media&token=b97bdb5d-fedd-42d6-8e9c-d9ada65d1e43",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F05-haftalik-hamilelik.jpeg?alt=media&token=1800f3fe-0412-497e-adf2-00b2f10b0d99",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F06-haftalik-hamilelik.jpeg?alt=media&token=6a361237-2835-4c1c-8d45-c20978f01ad1",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F07-haftalik-hamilelik.jpeg?alt=media&token=fa0ccc4a-bf42-40a0-93e4-053c7849b453",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F08-haftalik-hamilelik.jpeg?alt=media&token=032ad739-b5b9-4592-b981-70bee38b9da0",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F09-haftalik-hamilelik.jpeg?alt=media&token=12834da0-eff8-41b8-9115-785bd83b4481",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F10-haftalik-hamilelik.jpeg?alt=media&token=348db67c-02dc-4d8d-8e1b-3d65f17d98e7",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F11-haftalik-hamilelik.jpeg?alt=media&token=ceb35c0b-ba8b-451d-887c-a0824d07c945",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F12-haftalik-hamilelik.jpeg?alt=media&token=da005c1b-d7c0-405a-8541-585a7c96a16b",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F13-haftalik-hamilelik.jpeg?alt=media&token=54388278-011b-4d10-a1a6-fac3ac3a65dc",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F14-haftalik-hamilelik.jpeg?alt=media&token=4ddf9114-472e-4eef-820a-bf1a332b4a85",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F15-haftalik-hamilelik.jpeg?alt=media&token=5a2abe52-ef99-4451-8de8-67b31a823808",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F16-haftalik-hamilelik.jpeg?alt=media&token=60b0b0e6-245f-41cb-bd4e-e9278371dda0",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F17-haftalik-hamilelik.jpeg?alt=media&token=33ff8f81-31a8-49c7-aff0-2da391d3f617",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F18-haftalik-hamilelik.jpeg?alt=media&token=a455b11c-e4f8-4f21-acd5-30457ab4ed58",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F19-haftalik-hamilelik.jpeg?alt=media&token=5c1c3670-8498-4a02-87c9-bbe6980fb16a",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F20-haftalik-hamilelik.jpeg?alt=media&token=cbf6f897-ea6e-4972-a51a-45bef60e9281",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F21-haftalik-hamilelik.jpeg?alt=media&token=4acb3b5c-199b-4271-bef0-dcf9ec9948f0",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F22-haftalik-hamilelik.jpeg?alt=media&token=be244cb0-c0be-4ce9-8a48-8a02747ab443",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F23-haftalik-hamilelik.jpeg?alt=media&token=f361988c-5f77-4b28-aa3b-335029662845",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F24-haftalik-hamilelik.jpeg?alt=media&token=edd8a63a-03ab-41fe-a165-7434ed3fca66",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F25-haftalik-hamilelik.jpeg?alt=media&token=63394509-544f-4e64-9793-914a3b9c4950",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F26-haftalik-hamilelik.jpeg?alt=media&token=3df4443a-d1a3-46d4-915e-134ccd62d305",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F27-haftalik-hamilelik.jpeg?alt=media&token=69492533-e239-4caf-9b2d-f186bb8213fc",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F28-haftalik-hamilelik.jpeg?alt=media&token=6f0cb788-7859-45df-bc73-73cba192ecd6",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F29-haftalik-hamilelik.jpeg?alt=media&token=7b5e3fbc-d25e-4769-82f8-0dc79184393c",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F30-haftalik-hamilelik.jpeg?alt=media&token=3cf55568-38de-4abb-a648-7782a9a305ec",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F31-haftalik-hamilelik.jpeg?alt=media&token=b8ba059f-14d0-4437-ba26-98422ce6f217",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F32-haftalik-hamilelik.jpeg?alt=media&token=79dff7d9-3a2b-496f-a154-e1e1d30e191a",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F33-haftalik-hamilelik.jpeg?alt=media&token=f543b73d-c333-4597-9193-381e20ed4334",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F34-haftalik-hamilelik.jpeg?alt=media&token=ba67b0e2-238c-450a-9fcb-aeddeb10189b",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F35-haftalik-hamilelik.jpeg?alt=media&token=4fa8ee04-0802-4c14-a7af-38ae931889d4",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F36-haftalik-hamilelik.jpeg?alt=media&token=d8aea9c2-dfdd-4c56-85e3-63059699d2e8",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F37-haftalik-hamilelik.jpeg?alt=media&token=51a9a81e-a110-4ba2-88c1-47cf8cb808b0",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F38-haftalik-hamilelik.jpeg?alt=media&token=42a70867-e0f5-4d4b-b43e-1ccc48f032ad",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F39-haftalik-hamilelik.jpeg?alt=media&token=7e4593d1-f05d-46f6-8103-012baa820e3d",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F40-haftalik-hamilelik.jpeg?alt=media&token=4dcdcda0-9b1c-4a06-908b-00683805395b",
        "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F41-haftalik-hamilelik.jpeg?alt=media&token=0b33d2c3-f4c4-4fa0-9900-d9a5add1ff54",
    ]
    let descWeek = [
        "Gebelik ortalama 40 hafta, yani 9 AY 10 GÜN devam eden bir süreçtir. Tıbbi olarak gebelik başlangıcınızı hamile kaldığınız adet döngünüzde (adet döngüsü üreme çağında olan bir kadının bir adet kanamasının ilk gününden diğer adet kanamasının ilk gününe kadar olan süreci tanımlar) gördüğünüz adetin ilk günü belirler. Bu nedenle gebeliğinizin birinci haftası aslında henüz hamile olmadığınız bir dönemdir.",
        "Geçen hafta içerisinde bebeğinizin oluşumuna katkıda bulunacak ve ona sizin genetik yapınızı verecek yumurta hücresinin gelişimi hakkında bilgiler verdik. Bu hafta ise bebeğinizin genetik yapısının kalan yarısını oluşturacak eşinize ait sperm hücresi hakkında bilgiler edineceksiniz.",
        "Yumurtalıkta gelişen folikül çatladıktan sonra serbestleşen yumurta hücresi sıklıkla aynı taraftaki Fallop tüpünün saçakları tarafından içeriye alınır ve tüpün iç boşluğunda ilerlemeye başlar. Gebelik oluşabilmesi için yumurtlama gerçekleştikten sonraki ilk saatlerde yumurta hücresinin spermlerle karşılaşması gerekir. Bir yumurta hücresinin etrafını çok sayıda sperm hücresi kuşatmasına karşın bunlardan normalde yanlızca bir tanesi yumurta hücresi içine girmeyi başarabilir.",
        "Sizden ve eşinizden gelen hücrelerin “tek vücutta birleşmesi” sonucu oluşan yeni canlı, yani bebeğiniz sizin ve eşinizin genlerinin harmanlanmasıyla oluşmuş, yani hem sizden hem de eşinizden esinlenerek tasarlanmış size benzeyen ancak sizden apayrı bir genetik yapıya sahip bir birey olarak aramıza katılmıştır.",
        "Bu hafta adetiniz gecikti ve bu gecikmenin bir gebeliğe bağlı olduğundan ciddi bir şekilde şüphelenmeye başladınız. Hamile olduğunuzu öğrenmek için gebelik testi yaptırmaya karar verdiniz.",
        "Gebelikte östrojen ve progesteron hormonlarının salgısında önemli değişiklikler meydana gelir ve hormonların günlük salgılanma miktarı ve hatta gün içindeki salgılanma hızı değişir.Bu değişikliklerin amacı sizi bedenen ve ruhen gebelik ve doğuma hazırlamaktır.",
        "",
        "Hamile olduğunuzu eşiniz ve en yakınlarınız dışında kimler biliyor? Anne adaylarının çoğu \"test doğru değildir .. \" veya \"düşük olur ... \" gibi kaygılarla gebe olduklarını hemen söylemekten çekinirler. Ancak çalışıyorsanız üstünüzdeki kişiye, yani \"patronunuza\" gebe olduğunuzu söylemenizde fayda var.",
        "Bu haftada rahiminiz artık bir portakal büyüklüğüne erişmiş durumda. Yandaki resimde rahim ile çevre organlarınız arasındaki komşuluğu görüyorsunuz. Rahiminiz gördüğünüz gibi mesanenin üzerine yatmış durumda ve bu nedenle sık idrar çıkma şikayeti yaşamaya devam ediyorsunuz.",
        "İş yerinizde bilgisayar kullanıyorsanız, \"bilgisayar ışınlarının\" bebeğiniz üzerinde olumsuz etkiler yaratmasından endişe duyuyor olabilirsiniz. Korkmayın, bilgisayarlar ve monitörlerin iyonize edici (\"canlı dokuya zarar verici\") özellikleri bulunmaz.",
        "İşiniz masabaşı işiyse veya uzun süre ayakta kalınmasını gerektiriyorsa dikkat etmeniz gereken önemli birkaç nokta var: Uzun süreli oturmak ve uzun süreli ayakta durmak dolaşım sisteminizi yavaşlatır.",
        "Bel ağrısı şikayetleri yaşıyormusunuz? Gebelikte bel ağrısının en önemli nedenlerinden biri belinizi yanlış kullanmanızdır. Büyüyen rahiminiz ile birlikte ağırlık merkeziniz de öne doğru yer değiştirir ve siz gerekli tedbirleri almazsanız bu \"yer değiştirme\" ağrıya neden olur.",
        "Gebeliğinizin inanılmaz bir hızla ilerlediğini düşünüyor olabilirsiniz. Bazı anne adayları daha bu haftalarda bir an önce bebeklerine kavuşmanın hayalini kurarlar. Bebeğinizin çoktan sizinle birlikte var olduğunu unutmayın ve gebeliğinizin keyfini çıkarmaya devam edin.",
        "Bu dönemde karnınızda ve özellikle de sağ kasığınızda ağrılar ortaya çıkabilir. Bu ağrılar büyümekte olan rahiminizin, rahimi yerinde tutan bağları ve özellikle de ligamentum rotundum (\"yuvarlak bağ\") adlı yapıyı germesinden kaynaklanan ağrılardır.",
        "İkinci trimester (ikinci üç aylık dönem) hamilelik döneminizde en çok rahat edeceğiniz dönemdir. Gebeliğin erken dönemlerinde ortaya çıkan şikayetlerin önemli bir kısmı kaybolmuş ve vücut gebeliğe uyum sağlamıştır. Yorgunluğunuz devam ediyorsa istirahat etmeye devam etmelisiniz.",
        "Rahiminizi artık dışarıdan elle hissedebilirsiniz. Elinizi karnınıza koyduğunuzda elinize top gibi, yumuşak bir kitle gelecektir. İşte bebeğiniz buradadır. Birkaç hafta içinde varlığını yeterince belli edecektir merak etmeyin. İlk gebeliğinizi yaşıyorsanız bebeğinizin hareketlerini hissetmek için birkaç hafta daha beklemelisiniz.",
        "Bu haftalardan itibaren yüzünüzde ve vücudunuzun güneşe maruz kalan bölgelerinde lekelenmeler oluşmaya başlayabilir. Kanda artan östrojen hormonunun cilt rengini sağlayan pigment üretici hücreler üzerindeki etkisi nedeniyle oluşan bu lekelenmeler genellikle kalıcı değildirler.",
        "Rahiminiz göbek deliği seviyesine ulaşmak üzere ve bunu elinizle hissedebilirsiniz. Bebeğiniz bu haftadan itibaren önceki haftalara göre daha hızlı kilo almaya ve gelişmeye başladığından muhtemelen siz de biraz daha hızlı kilo almaya başlayacaksınız.",
        "İkinci trimester, tansiyonunuzda muhtemelen hayat boyu en düşük değerlerle karşılaşacağınız dönemdir. Bebeğe giden kan akımının artması ve kan damarlarında genel bir gevşeme hali olması nedeniyle ortaya çıkan bu durum sizde çeşitli şikayetlere neden olabilir.",
        "Bu gebelik haftasından itibaren cildinizdeki değişiklikler belirginleşebilir. Bu değişiklikler gebelik hormonları ve gebeliğin mekanik etkileri (rahimin büyümesi) sonucu oluşurlar.Kloazma (gebelik maskesi) adı verilen alın, yanak, burun ve çenede yama tarzında kızarıklıklar özellikle güneşe aşırı maruz kalmanız durumunda belirginleşebilir",
        "Gebeliğin ilk yarısını geride bırakmak üzeresiniz. Artık \"karnınız\" da yavaş yavaş çıkmaya başladı. Rahiminizi şu anda tam göbek deliğiniz hizasında hissedebilirsiniz. Bundan sonra da her hafta yaklaşık bir santimetre yukarı çıkmaya devam edecek.",
        "Bebek haraketleriniz bir iki hafta önce başladı ve bu haftadan itibaren bebeğinizin oynama sıklığı ve hareketlerin hissedilebilirliği artacak. Bu süreçte siz zaman zaman bebeğinizin \"daha az oynadığını\" hissederek endişeye kapılabilirsiniz.",
        "Rahiminizi artık göbeğinizin iki parmak üstünde rahatlıkla hissedebilirsiniz. Gebelikte vücudunuzun ağırlık merkezi sürekli olarak değişir ve bu yüzden bel kemikleri de buna uyum sağlamak için biraz zorlanırlar. Kamburunuzu çıkarmadan karnınızı rahatça taşıyabileceğiniz en iyi duruş pozisyonunu belirlemelisiniz.",
        "Bu ve ilerleyen haftalarda bebeğinizin alanı bol olduğundan tekmeleme, yumruklama, omuz atma gibi değişik hareketleri birbirinden ayırt edebilir duruma geleceksiniz. Hatta karnınızdan da hareketleri takip edebilirsiniz. Her bebek kendine özgü bir hareket etme alışkanlığı geliştirir. Bazı bebekler yaradılışları gereği daha az hareket ederlerken bazıları daha aktiftir.",
        "Doktorunuz size bu haftalarda \"şeker yükleme\" ya da \"şeker tarama testi\" şeklinde bir test yapılmasını önerebilir. Hiçbir belirti vermeden de gelişebilen gestasyonel diyabet (gebelikte görülen şeker hastalığı, \"gebelik şekeri\") 24-28. gebelik haftaları arasında yapılan iki farklı testle araştırılır.",
        "Rahiminiz şu anda yaklaşık olarak bir futbol topu büyüklüğünde. Büyüme hızlı bir şekilde devam ediyor. Bu büyüme sürecinde rahiminiz belinizde bulunan sinirlere hafifçe baskı yaptığında bile bel ve bacaklarınızda zonklama tarzında ağrılar hissedebilirsiniz.",
        "Rahiminizde bu haftalardan itibaren zaman zaman ortaya çıkan ani kasılma ve gevşemeler hissederseniz korkmayın. Bunlar Braxton-Hicks kasılmaları adı verilen ağrısız, adet krampları gibi ve düzensiz aralıklarla gelen kasılmalardır. Rahiminiz gerçek doğum sancıları için antrenman yapmaktadır.",
        "Rahiminiz göğüs kafesinize yakınlaştıkça diyafragma da (karın boşluğu ile göğüs kafesini ayıran kas yapısı) yukarıya doğru yer değiştireceğinden, özellikle derin nefes alma esnasında zorluk çekebilirsiniz. Bu, akciğerlerinizin tam olarak şişememesinden kaynaklanan bir durumdur.",
        "Üçüncü trimesterde ikinci trimesterde olduğunuz kadar rahat olamayabilirsiniz. Bacak krampları, basur, varisler, kaşıntılı cilt çatlakları, bel ağrıları, ayağınızda şişmeler, mide yanması, hazımsızlık bu trimesterde nispeten daha sıktır. Bu belirtilerin hemen tümü çeşitli şekillerde tedavi edilebilir. Doktorunuza danışın.",
        "Bir anne adayı için en iyi yatış pozisyonu sol yandır. Vücuttaki kanı kalbe geri taşıyan ana toplardamarlar karnınızda sağ tarafta bulunduklarından sola dönük yatış pozisyonu bu büyük damarlara en az bası olmasını ve böylece organlardan kalbe kan dönüşünün mükemmel bir şekilde devam etmesini sağlar. Bu şekilde uyumakta zorlanırsanız karnınızın altına bir yastık koyun.",
        "Rüyalarınızın değiştiğini farkettiniz mi? Anne adayları bu gebelik haftalarında garip rüyalar görebilirler. Kısa bir uykuya dalsanız bile hemen rüya görmeye başlayabilirsiniz. Belki de gebelik döneminiz yaşamınız boyunca en sık rüya gördüğünüz dönem olacak. Bunları eşinizle ve arkadaşlarınızla paylaşın.",
        "Çalışan bir anne adayıysanız, ister SSK, ister 657 numaralı devlet memuru kanunu, ister diğer bir çalışma kanununa tabi olun (hepsi SGK adı altında birleştirilmiştir) , bu haftanın sonunda yasal doğum önü iznine ayrılma hakkına kavuşacaksınız. Doktorunuzun onayıyla 37. gebelik haftasına kadar çalışabilir ve bu süreyi doğum sonrası izninize ekleyebilirsiniz.",
        "Bazı anne adaylarının ileri gebelik haftalarına kadar \"karınları çıkmayabilir\". Bu, doktorunuz ultrasonda bebeğinizin ölçülerini normal bulmuş olmak şartıyla bebeğin gelişmesinde bir problem olmasından değil, anne adayının yapısal özelliklerinden kaynaklanan bir durumdur.",
        "Dikkat: Braxton-Hicks kasılmaları (hazırlayıcı kasılmalar) bu haftadan itibaren biraz sıklaşabilir. Bu kasılmalar gerçek doğum sancılarının aksine kısa sürerler, düzensizdirler ve genellikle sizde büyük bir rahatsızlığa neden olmazlar. Rahim kasları bu şekilde antrenman yapmakta ve bebeğiniz miyadına geldiğinde 10 dakikada üç kez gelen ve yaklaşık 50 saniye süren gerçek doğum kasılmalarına dönüşmektedirler.",
        "Ne kadar vurgulansa az: \"Bebek hareketlerine dikkat...\" Bebek hareketleri bebeğinizin sağlıklı olduğunu gösteren en önemli bulgulardan biridir. Sağlıklı bebek, fazla enerjisini hareket ederek harcar.",
        "Bu haftadan itibaren gebelik muayenelerine muhtemelen haftalık olarak çağırılacaksınız. Gebelik sürenizin tamamlanmasına yaklaşık dört hafta kaldı ve içinizi bir heyecan kaplamaya başladı bile. İlk gebeliğinizse sürekli olarak aklınızda \"nasıl olacak acaba?\" düşüncesi olabilir. Doğum yapacağınız yeri ve yatacağınız odayı görmek, rahatlamak açısından oldukça faydalı olabilir.",
        "Bu haftadan itibaren ev işlerinden de izne ayrılın. Eşiniz ve yakınlarınız tüm ev işi görevlerini seve seve sizin yerinize yaparlar. Ne de olsa ailenin odak noktası sizsiniz. Çocuğunuz veya çocuklarınız yeni gelecek bir kardeş için hem sevinirler, hem de kendilerine bugüne kadar gösterilen yoğun ilginin azalmasından korkarlar.",
        "Evet, artık sınıra girdiniz. Doğumların %75'i 38-42. gebelik haftaları arasında gerçekleşir. Yaklaşık %5 anne adayında doğum eylemi 42. hafta dolmasına rağmen başlamaz. Geri kalan %20 anne adayı ise bebeğini 38. haftadan önce dünyaya getirir.",
        "Bu ve takipeden hafta içinde doğum yapma olasılığınız oldukça yüksek. Geçen haftalardaki önerilerimiz aynen devam etmektedir: doğum sabır işidir ve bu sabrın sonunda bebeğinizi kucağınıza alıp onu emzirmeye başladığınızda ne kadar mükemmel bir iş başardığınızı göreceksiniz.",
        "Evet, işte sihirli rakam: 40. Bu haftanın sonunda doğum yapmış olma olasılığınız yüksek. Belki de biraz daha bekleyeceksiniz. Panik olmayın. Olağan doktor kontrollerinize gitmeye devam edin. Doktorunuzun, hastanenin ve gerekli olan diğer telefonların yazılı olduğu kağıdı tetkiklerinizin bulunduğu doğum dosyasına yerleştirin ve bu dosyayı görünür bir yerde bulundurun.",
        "Burada dikkat edilmesi gereken en önemli nokta, sizin son adet tarihinizin ilk gününü doğru olarak hatırlamanız ve bu son adet tarihinin gebeliğin ilk haftalarında yapılan bir ultrasonla teyid edilmiş olmasıdır. Tıbbi inceleme ve önceki ultrason incelemelerinizin dikkatli bir şekilde gözden geçirilmesi sonrasında gebeliğin gerçekten 42. haftaya girdiği belirlendiğinde (bu haftanın bitiminde) doğum gerçekleştirilmelidir.",
    ]
    override init() {
        super.init()
        getMonthByMonthInfos()
        getWeekByWeekInfos()
    }

    private func getMonthByMonthInfos() {
        FirestoreManager<MonthByMonth>().get(by: "month") { monthResult, _ in
            if let monthResult = monthResult {
                self.monthByMonthPregnancy = monthResult

            } else {
                fatalError("Unable to retrieve the saved monthArray object")
            }
        }
    }

    private func getWeekByWeekInfos() {
        FirestoreManager<WeekByWeek>().get(by: "week") { weekResult, _ in
            if let weekResult = weekResult {
                self.weekByWeekPregnancy = weekResult

            } else {
                fatalError("Unable to retrieve the saved weekArray object")
            }
        }
    }
}
