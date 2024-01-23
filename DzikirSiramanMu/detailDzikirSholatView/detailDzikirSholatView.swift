//
//  detailDzikirSholatView.swift
//  DzikirSiramanMu
//
//  Created by Muhammad Ilham Aziz on 03/01/24.
//

import UIKit

class detailDzikirSholatView: UIViewController {
    @IBOutlet weak var tableCell: UITableView!
    
    var listDoa = ["أَسْتَغْفِرُ اللّٰهَ, أَسْتَغْفِرُ اللّٰهَ‎, أَسْتَغْفِرُ اللّٰهَ‎ ","اَللّهُمَّ اَنْتَ السَّلاَمُ وَمِنْكَ السَّلاَمُ تَبَارَكْتَ يَاذَاْلجَلاَلِ وَاْلاِكْرَام","لَا إِلَهَ إِلَّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ, لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ, لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِالله","لَا إِلَهَ إِلَّا اللهُ وَلَا نَعْبُدُ إِلَّا إِيَّاهُ, وَلَهُ النَّعْمَةُ وَلَهُ الفَضْلُ وَلَهُ القَنَاءُ الْحَسَنُ","لَا إِلَهَ إِلَّا اللهُ مُخْلِصِينَ لَهُ الدِّينَ وَلَوْ كَرَة الكَافِرُوْنَ","(33x) الله أكبر , (33x) الحمد الله , (33x) سبحان الله","لَا إِلَهَ إِلَّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ, لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ","اللَّهُمَّ إنِّي أعُوذُ بِكَ مِنَ البُخْلِ وَأَعوذُ بِكَ مِنَ الجُبْنِ وَأعُوذُ بِكَ أنْ أُرَدَّ إِلَى أَرْذَلِ العُمُرِ وَأعُوذُ بِكَ مِنْ فِتْنَةِ الدُّنْيَا وَأَعُوذُ بِكَ مِنْ عَذَابِ القَبْرِ","اللَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ وَشُكْرِكَ وَحُسْنِ عِبَادَتِكَ" , "اللَّهُمَّ أَنْتَ رَبِّي لَا إِلَهَ إِلَّا أَنْتَ خَلَقْتَنِي وَأَنَا عَبْدُكَ وَأَنَا عَلَى عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ أَعُوذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ وَأَبُوءُ لَكَ بِذَنْبِي فَاغْفِرْ لِي فَإِنَّهُ لَا يَغْفِرُ الذُّنُوبَ إِلَّا أَنْتَ" , "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ عِلْمٍ لَا يَنْفَعُ وَمِنْ قَلْبٍ لَا يَخْشَعُ وَمِنْ نَفْسٍ لَا تَشْبَعُ وَمِنْ دَعْوَةٍ لَا يُسْتَجَابُ لَهَا","اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ, وَأَعُوذُ بِكَ مِنَ الْعَجْزِ وَالْكَسَلِ وَأَعُوذُ بِكَ مِنَ الْجُبْنِ وَالْبُخْلِ, وَأَعُوذُ بِكَ مِنْ غَلَبَةِ الدَّيْنِ, وَقَهْرِ الرِّجَالِ","اللَّهُمَّ إنِّي أسْألُكَ الهُدَى والتُّقَى والعَفَافَ والغِنَى","اللَّهُمَّ انْفَعْنِي بِمَا عَلَّمْتَنِي وَعَلِّمْنِي مَا يَنْفَعُنِي وَزِدْنِي عِلْمًا وَالْحَمْدُ لِلَّهِ عَلَى كُلِّ حَالٍ","رَبَّنَا آتِنَا مِنْ لَدُنْكَ رَحْمَةً وَهَيِّئْ لَنَا مِنْ أَمْرِنَا رَشَدًا","رَبَّنَا لَا تُزِغْ قُلُوْبَنَا بَعْدَ اِذْ هَدَيْتَنَا وَهَبْ لَنَا مِنْ لَّدُنْكَ رَحْمَةً اِنَّكَ اَننْتَ الْوَهَّابُ","رَّبِّ اغْفِرْلِي وَلِوَالِدَيَّ وَارْحَمْهُمَا كَمَا رَبَّيَانِي صَغِيراً","ٱللَّهُ لَآ إِلَٰهَ إِلَّا هُوَ ٱلْحَىُّ ٱلْقَيُّومُ ۚ لَا تَأْخُذُهُۥ سِنَةٌ وَلَا نَوْمٌ ۚ لَّهُۥ مَا فِى ٱلسَّمَٰوَٰتِ وَمَا فِى ٱلْأَرْضِ ۗ مَن ذَا ٱلَّذِى يَشْفَعُ عِندَهُۥٓ إِلَّا بِإِذْنِهِۦ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَىْءٍ مِّنْ عِلْمِهِۦٓ إِلَّا بِمَا شَآءَ ۚ وَسِعَ كُرْسِيُّهُ ٱلسَّمَٰوَٰتِ وَٱلْأَرْضَ ۖ وَلَا يَـُٔودُهُۥ حِفْظُهُمَا ۚ وَهُوَ ٱلْعَلِىُّ ٱلْعَظِيمُ","قُلْ هُوَ اللّٰهُ اَحَدٌ ..........                                               قُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ ..........                                                قُلْ اَعُوْذُ بِرَبِّ النَّاسِ ..........","رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ"]
    
    var textArtiIndo = ["Aku memohon ampun kepada Allah","Ya Allah, Engkaulah Pemberi keselamatan, dan dari-Mu keselamatan. Mahasuci Engkau, wahai Pemilik keagungan dan kemuliaan","Tidak ada Tuhan selain Allah, tidak ada sekutu bagi-Nya, milik-Nya segala kekuasaan dan bagi-Nya segala pujian. Dia Mahakuasa atas segala sesuatu, tiada daya dan kekuatan selain dari Allah SWT","Tiada Rabb (yang hak disembah) kecuali Allah. Kami tidak menyembah kecuali kepadaNya. Bagi-Nya nikmat, anugerah dan pujaan yang baik","Tiada Rabb (yang hak disembah) kecuali Allah, dengan memurnikan ibadah kepadaNya, sekalipun orang-orang kafir sama benci","Maha suci Allah, Segala puji bagi Allah, Allah maha besar","Tidak ada Tuhan selain Allah, tidak ada sekutu bagi-Nya, milik-Nya segala kekuasaan dan bagi-Nya segala pujian","Ya Allah, aku berlindung kepada-Mu dari kebakhilan, aku berlindung kepada-Mu dari sifat pengecut, aku berlindung kepada-Mu dari kepikunan, dan aku berlindung kepada-Mu dari fitnah dunia dan siksa kubur","Ya Allah, Bantu aku untuk berzikir, bersyukur, dan memperbaiki ibadah kepada-Mu","Ya Allah, Engkau adalah Tuhanku, tidak ada Tuhan yang berhak diibadahi selain Engkau. Engkau telah menciptakanku dan aku adalah hamba-Mu. Aku menetapi perjanjian-Mu dan janji-Mu sesuai dengan kemampuanku. Aku berlindung kepada-Mu dari keburukan perbuatanku, aku mengakui dosaku kepada-Mu dan aku akui nikmat-Mu kepadaku, maka ampunilah aku. Sebab tidak ada yang dapat mengampuni dosa selain-Mu","Ya Allah, sesungguhnya aku berlindung kepada-Mu dari ilmu yang tidak berguna, hati yang tidak khusyuk, diri yang tidak pernah puas, dan doa yang tidak terkabulkan","Ya Allah, aku berlindung kepada-Mu dari kebingungan dan kesedihan, aku berlindung kepada-Mu dari kelemahan dan kemalasan, aku berlindung kepada-Mu dari ketakutan dan kekikiran, aku berlindung kepada-Mu dari lilitan utang dan tekanan orang-orang","Ya Allah, aku meminta pada-Mu petunjuk, ketakwaan, diberikan sifat ‘afaf (dijauhkan dari yang tidak halal dan menahan diri darinya) dan ghina (kaya hati) atau qanaah","Ya Allah, berilah kemanfaatan atas segala ilmu yang Engkau ajarkan pada saya. Berilah saya ilmu yang bermanfaat dan tambahkanlah ilmu pada saya. Segala puji bagi Allah dalam setiap waktu","Wahai Tuhan kami, berikanlah rahmat kepada kami dari sisi-Mu dan sempurnakanlah bagi kami petunjuk yang lurus dalam urusan kami","Wahai Tuhan kami, janganlah Engkau palingkan hati kami dari Islam setelah Engkau beri hidayah kepada kami. Limpahkanlah keimanan kepada kami dari sisi-Mu. Engkau Maha Pemberi rahmat kepada orang-orang mukmin","Ya Tuhanku, ampunilah aku dan kedua orang tuaku, dan kasihilah mereka sebagaimana mereka merawat aku di waktu kecil","Ya Allah, tidak ada Tuhan (yang berhak disembah) melainkan Dia Yang Hidup kekal lagi terus menerus mengurus (makhluk-Nya), tidak mengantuk dan tidak tidur. Kepunyaan-Nya apa yang di langit dan di bumi. Tiada yang dapat memberi syafaat di sisi Allah tanpa izin-Nya? Allah mengetahui apa-apa yang di hadapan mereka dan di belakang mereka, dan mereka tidak mengetahui apa-apa dari ilmu Allah melainkan apa yang dikehendaki-Nya. Kursi Allah meliputi langit dan bumi. Dan Allah tidak merasa berat memelihara keduanya, dan Allah Maha Tinggi lagi Maha Besar","","Ya Tuhan kami, berikan kami kebaikan di dunia dan kebaikan di akhirat. Lindungilah kami dari siksa neraka"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView ()
        
    }
    private func setupTableView() {
        tableCell.dataSource = self
        tableCell.delegate = self
        tableCell.register(dzikirSholatCell.nib, forCellReuseIdentifier: dzikirSholatCell.identifier)
    }
}

extension detailDzikirSholatView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDoa.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: dzikirSholatCell.identifier, for: indexPath) as! dzikirSholatCell
        cell.selectionStyle = .none
        let textDoa = listDoa[indexPath.row]
        let attributedString = NSMutableAttributedString(string: textDoa)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        paragraphStyle.alignment = .right
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        cell.textDzikirSholat.attributedText = attributedString
        let textIndo = textArtiIndo[indexPath.row]
        cell.textArti.text = textIndo
        return cell
    }
    
    
}
    
