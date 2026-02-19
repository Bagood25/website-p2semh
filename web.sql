-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 16, 2025 at 11:08 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web`
--

-- --------------------------------------------------------

--
-- Table structure for table `agendas`
--

CREATE TABLE `agendas` (
  `id` bigint UNSIGNED NOT NULL,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `lokasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agendas`
--

INSERT INTO `agendas` (`id`, `judul`, `deskripsi`, `tanggal_mulai`, `tanggal_selesai`, `lokasi`, `gambar`, `created_at`, `updated_at`) VALUES
(5, 'Hari ini', 'Hari ini', '2025-09-07', '2025-09-17', 'Bogor', NULL, '2025-09-07 04:12:18', '2025-09-07 04:12:18'),
(6, 'Agenda Baru', 'agenda', '2025-09-09', '2025-09-16', 'Bogor', NULL, '2025-09-07 04:59:16', '2025-09-07 04:59:16');

-- --------------------------------------------------------

--
-- Table structure for table `analyses`
--

CREATE TABLE `analyses` (
  `id` bigint UNSIGNED NOT NULL,
  `original_filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beritas`
--

CREATE TABLE `beritas` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kutipan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beritas`
--

INSERT INTO `beritas` (`id`, `user_id`, `judul`, `slug`, `kategori`, `gambar`, `kutipan`, `isi`, `published_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Lebih Dari 350 Anak Sekolah Dasar Bicara Tentang Industri Susu, Lingkungan, dan Konservasi Air', 'lebih-dari-350-anak-sekolah-dasar-bicara-tentang-industri-susu-lingkungan-dan-konservasi-air', 'berita_utama', 'post-images/Cm43PSeXoU9tSO03Pv1QLN9PLOnH86tSYv66syxZ.png', 'ini adaldh percobaan\r\nabcd\r\nefgh\r\nijkl', 'ini adaldh percobaan\r\nabcd\r\nefgh\r\nijkl', NULL, '2025-08-12 00:15:36', '2025-11-11 00:29:11', '2025-11-11 00:29:11'),
(3, 1, 'berita baru 1', 'berita-baru-1', 'berita_utama', 'post-images/F2U3pXwWBgTDk5X5VNkC2d9CiJnyMBvlpGhjOwck.png', 'coba', 'coba', NULL, '2025-08-26 00:08:56', '2025-11-11 00:29:18', '2025-11-11 00:29:18'),
(4, 1, 'Kemenhut Gelar Kick-Off Mangrofest 2025: \"Rayakan Mangrove, Rangkai Harapan\"', 'kemenhut-gelar-kick-off-mangrofest-2025-rayakan-mangrove-rangkai-harapan', 'berita-kehutanan', 'post-images/1iIhwGFZOZSvVl4VDpm23lMOkNm0LSp3jw6qwPQo.webp', 'Kementerian Kehutanan (Kemenhut) menyelenggarakan Kick-Off Mangrove Festival 2025 (Mangrofest 2025) di Taman Nasional Alas Purwo, Banyuwangi, Jawa Tim...', 'Kementerian Kehutanan (Kemenhut) menyelenggarakan Kick-Off Mangrove Festival 2025 (Mangrofest 2025) di Taman Nasional Alas Purwo, Banyuwangi, Jawa Timur (29/07/2025), sebagai bagian dari konsolidasi nasional rehabilitasi mangrove dan peringatan Hari Mangrove Sedunia 2025. Mangrofest 2025 ini mengangkat tema “Rayakan Mangrove, Rangkai Harapan” sebagai wujud perayaan, refleksi, dan penguatan kolaborasi lintas sektor dalam menjaga dan memulihkan ekosistem pesisir Indonesia.\r\n\r\nPenyelenggaraan Kick-Off Mangrofest 2025 di Taman Nasional Alas Purwo sebagai simbol awal gerakan pemulihan pesisir secara nasional. Lokasi ini dipilih karena memiliki ekosistem mangrove yang penting, serta menjadi representasi lanskap pesisir yang perlu dijaga.\r\n\r\nAcara dibuka oleh Wakil Menteri Kehutanan (Wamenhut), Sulaiman Umar Siddiq, di Pantai Triangulasi, TN Alas Purwo (30/7/2025). Wamenhut dalam sambutannya menyampaikan bahwa Indonesia adalah negara dengan ekosistem mangrove terbesar di dunia, lebih dari 3,4 juta hektar mangrove terbentang dari Aceh hingga Papua, atau sekitar 23% dari total luasan mangrove dunia.\r\n\r\nBaca selengkapnya:\r\nhttps://kehutanan.go.id/news/mangrove-festival-2025-indonesia-perkuat-konsolidasi-nasional-rehabilitasi-ekosistem-mangrove', NULL, '2025-09-02 18:59:42', '2025-11-15 04:11:49', '2025-11-15 04:11:49'),
(5, 1, 'P2SEMH Gali Potensi Sosial Ekonomi Masyarakat di Kawasan Hutan Adat Banten', 'p2semh-gali-potensi-sosial-ekonomi-masyarakat-di-kawasan-hutan-adat-banten', 'berita-p2semh', 'berita/1756873646_Halo Sobat Hijau!Tim P2SEMH bersama Balai PS Bogor dan Penyuluh Kehutanan CDK Banten Wilayah Ta.jpg', 'Tim P2SEMH bersama Balai PS Bogor dan Penyuluh Kehutanan CDK Banten Wilayah Tangerang dan Lebak pada 21–22 Agustus 2025 lalu blusukan ke _Leuweung Ada...', 'Tim P2SEMH bersama Balai PS Bogor dan Penyuluh Kehutanan CDK Banten Wilayah Tangerang dan Lebak pada 21–22 Agustus 2025 lalu blusukan ke _Leuweung Adat_, hutan adat di Kabupaten Lebak, Banten. Tim datang untuk menggali potensi pengembangan sosial-ekonomi masyarakat di sana dengan melihat langsung bagaimana kearifan masyarakat adat mampu menjaga hutan tetap lestari.\r\n\r\nDi Kasepuhan Karang, tim disambut hangat oleh Kepala Desa Jagaraksa yang akrab dipanggil “Jaro”. Ditetapkan sejak 2016, hutan adat Kasepuhan Karang seluas 462 hektar ini menjadi benteng alam di kaki Gunung Halimun. Di sana, warga mengelola KUPS dengan produk unggulan kopi “Kobaki” yang terkenal di wilayah Lebak. Tak hanya kopi, hasil bumi seperti padi, durian, duku, hingga alpukat turut menopang ekonomi warga.\r\n\r\nBlusukan berlanjut ke Kasepuhan Pasireurih dan Kasepuhan Cirompang, dua wilayah hutan adat yang resmi ditetapkan pada 2019. Terletak di kaki Gunung Halimun dan berbatasan langsung dengan Taman Nasional Gunung Halimun-Salak, luasan hutan adat Pasireurih 580,43 hektar dan hutan adat Cirompang 306,53 hektar. Keduanya dikelola oleh masyarakat adat yang menjunjung tinggi semangat regenerasi. Para pemuda setempat ikut aktif melestarikan hutan dan mengembangkan potensi lokal.\r\n\r\nTak berhenti di situ, tim juga menyambangi Kelompok Tani Hutan (KTH) Mitra Mandala yang sejak 1989 konsisten mengembangkan usaha pengolahan aren. Hebatnya, produk gula aren mereka telah menembus pasar internasional yaitu Eropa, Korea Selatan, hingga Jepang.\r\n\r\nDari rangkaian kunjungan ini terlihat jelas bahwa kearifan lokal adalah kunci kelestarian hutan. Semangat gotong royong dan kemandirian ekonomi yang ditunjukkan masyarakat adat Banten adalah contoh nyata pengelolaan hutan berkelanjutan. Pengalaman ini tentunya menjadi masukan berharga bagi P2SEMH dalam pengembangan desa sekitar hutan sekaligus mendukung pengelolaan hutan adat.', NULL, '2025-09-02 19:23:24', '2025-11-11 00:42:44', '2025-11-11 00:42:44'),
(29, 1, 'P2SEMH Jadikan KUPS Naramos Cianjur Role Model Sukses Perhutanan Sosial', 'p2semh-jadikan-kups-naramos-cianjur-role-model-sukses-perhutanan-sosial', 'berita-p2semh', 'berita/1762847179_P2SEMH melakukan field study dalam rangka penyusunan Role Model Pengembangan Perhutanan Sosial p.jpg', 'P2SEMH melakukan field study dalam rangka penyusunan Role Model Pengembangan Perhutanan Sosial pada Kelompok Usaha Perhutanan Sosial (KUPS) Naramos di...', 'P2SEMH melakukan field study dalam rangka penyusunan Role Model Pengembangan Perhutanan Sosial pada Kelompok Usaha Perhutanan Sosial (KUPS) Naramos di Desa Ciputri, Kecamatan Pacet, Kabupaten Cianjur.\r\n\r\nDalam rangka penyusunan role model tersebut, dilakukan kunjungan, diskusi dan pendalaman untuk memotret Praktik Baik (best practices) KUPS yang nantinya dapat di replikasi dan dijadikan model pengelolaan pada KUPS yang saat ini masih berstatus Blue dan silver.\r\n\r\nBerawal dari kesulitan para petani mendapatkan lahan di desa Ciputri dan mendengar kabar tentang adanya Program Perhutanan Sosial (PS), maka dibentuklah Kelompok Tani hutan (KTH) Satria Mandiri di Kampung Tunggilis dan mengajukan izin PS melalui skema Kulin-KK. KTH tersebut kemudian membentuk KUPS dengan nama KUPS Naramos berdasarkan SK Menteri LHK nomor : SK.13121/MENLHK-PSKL/PKPS/ PSL.0/12/2023 tanggal 15 Desember 2023 seluas 21 hektar dengan komoditas usaha Gula Aren.\r\n\r\nBerkat kegigihan pengurus KUPS dan dukungan Kepala Desa Ciputri, Kementerian Kehutanan, Kementerian Pertanian, Perindag dan stakeholders lainnya, KUPS Naramos semakin berkembang dengan mendapatkan bantuan modal usaha, bangunan pengeringan dan peralatan pengolahan gula aren.\r\n\r\nProduksi aren per pohon dapat menghasilkan 16-18 liter nira dalam 2 kali penyadapan, pagi dan sore. Untuk mengolah menjadi gula semut 1 kg dapat diperoleh dari 4-7 liter Nira tergantung musim. Sehari petani dapat memperoleh 10 kg gula semut, dan menjual ke KUPS Naramos dengan harga Rp. 23.000 / kg. Sedangkan KUPS dapat menjual ke BUMDES Ciputri Gemilang sebesar Rp. 27.000/ kg. Setelah melalui pengeringan (keawetan) serta memperhitungkan biaya produksi, BUMDES dapat menjual dengan harga Rp. 40.000/kg melalui market place.\r\n\r\nPendapatan petani tersebut belum termasuk pendapatan dari kebun sayuran dengan sistem Agroforestry, yang menghasilkan pendapatan sekitar 3-4 juta per bulan. Peningkatan pendapatan tersebut tentunya diraih dengan kerja keras dan terus berinovasi.\r\n\r\n#SobatHijau\r\n#P2SEMH\r\n#kementeriankehutanan\r\n#rolemodel\r\n#sosialekonomimasyarakathutan\r\n#perhutanansosial\r\n#gulaaren\r\n#naramos\r\n#Kehutanan\r\n#KlikWebsiteKehutanan\r\nhttps://www.kehutanan.go.id/\r\ninstagram : @p2semh.kemenhut', NULL, '2025-11-11 00:46:21', '2025-11-11 00:46:21', NULL),
(30, 1, 'Kementerian Kehutanan Rumuskan \"Kerja Sama Kolaboratif\" untuk Perkuat Pengelolaan KHDTK', 'kementerian-kehutanan-rumuskan-kerja-sama-kolaboratif-untuk-perkuat-pengelolaan-khdtk', 'berita-p2semh', 'berita/1763205322_Halo Sobat Hijau!Kementerian Kehutanan terus melakukan langkah nyata pengelolaan kawasan hutan .jpg', 'Halo Sobat Hijau!\r\nKementerian Kehutanan terus melakukan langkah nyata pengelolaan kawasan hutan yang lebih solid. Kali ini dengan inisiasi P2SEMH dia...', 'Halo Sobat Hijau!\r\nKementerian Kehutanan terus melakukan langkah nyata pengelolaan kawasan hutan yang lebih solid. Kali ini dengan inisiasi P2SEMH diadakan pembahasan kerja sama internal Kementerian Kehutanan di KHDTK pada 4 November 2025 di Bogor.\r\n\r\nDiikuti oleh perwakilan Eselon I teknis terkait seperti Sekretariat BP2SDM, Inspektorat III, Biro Hukum, Biro Perencanaan, Pusat Pengembangan lingkup Setjen, BPDAS Citali hingga BPTH Wilayah III Yogyakarta, pertemuan penting ini dilaksanakan untuk memperkuat sinergi dalam pengelolaan KHDTK Litbang maupun KHDTK Diklat.\r\n\r\nFokus utama pembahasan adalah pentingnya payung hukum yang kuat dan seragam. Dengan begitu, kegiatan lintas unit dapat terlaksana tanpa menimbulkan potensi masalah administratif. Tak hanya itu, forum ini juga menyoroti perlunya kejelasan mengenai hak, kewajiban, serta kepemilikan aset antarunit pengelola.\r\n\r\nDari diskusi yang dipimpin oleh Kepala Pusat P2SEMH, disepakati bahwa bentuk kerja sama internal akan dirumuskan sebagai “Kerja Sama Kolaboratif”. Nantinya, detail pelaksanaannya akan dituangkan dalam Rencana Pelaksanaan Program (RPP) sebagai panduan operasional bersama.\r\n\r\nDengan semangat kolaborasi ini, diharapkan pengelolaan KHDTK semakin solid dan mampu mendukung pembangunan bioekonomi hutan yang berkelanjutan.\r\n\r\nSalam LESTARI!\r\n#P2SEMH\r\n#Kemenhut\r\n#SetjenKemenhut\r\n#RajaJuliAntoni\r\n#RohmatMarzuki\r\n#KHDTK\r\n#KHDTK_Litbang\r\n#KHDTK_Diklat\r\n#PengelolaanKHDTK\r\n#KerjaSamaKolaboratif\r\n#BP2SDM\r\n#PDASRH\r\n#BPTHWilayahIII\r\n#P2HB\r\n#P2MABHK\r\n#PengelolaanHutanLestari\r\n#BioekonomiHutan\r\n#KlikWebsiteKehutanan\r\nhttps://www.kehutanan.go.id/\r\nInstagram : @p2semh.kemenhut', NULL, '2025-11-15 04:15:23', '2025-11-15 04:15:23', NULL),
(31, 1, 'Perkuat Komitmen FOLU Net Sink 2030, P2SEMH Verifikasi Implementasi Program RBC di KHDTK Playen dan Wonogiri', 'perkuat-komitmen-folu-net-sink-2030-p2semh-verifikasi-implementasi-program-rbc-di-khdtk-playen-dan-wonogiri', 'berita-p2semh', 'berita/1763205455_Halo Sobat Hijau!Komitmen menuju Indonesia’s FOLU Net Sink 2030 terus diperkuat, kali ini melalu.jpg', 'Halo Sobat Hijau!\r\nKomitmen menuju Indonesia’s FOLU Net Sink 2030 terus diperkuat, kali ini melalui kegiatan Verifikasi dan Asistensi Lapangan (Verifa...', 'Halo Sobat Hijau!\r\nKomitmen menuju Indonesia’s FOLU Net Sink 2030 terus diperkuat, kali ini melalui kegiatan Verifikasi dan Asistensi Lapangan (Verifas) Program Result Based Contribution (RBC) 2&3 Periode 2. Dipimpin Kepala Pusat PSEMH, pada 24 Oktober 2025, Tim Verifas turun langsung ke dua KHDTK Litbang Kehutanan yang berlokasi di Playen dan Wonogiri untuk memastikan kesiapan implementasi program dengan kolaborasi multipihak di tingkat tapak.\r\n\r\nDi KHDTK Gunungkidul Blok Playen, asistensi teknis difokuskan pada penyempurnaan rencana pengelolaan agar searah dengan kebijakan FOLU Net Sink 2030. Terkait itu beragam langkah nyata disiapkan, mulai dari penataan blok dan petak kegiatan RBC, penguatan kelembagaan KTH, pembangunan sumur bor dan sarana pemeliharaan tanaman, hingga pengadaan alat pemadam kebakaran sederhana.\r\n\r\nTak hanya itu, pengembangan usaha berbasis HHBK seperti minyak atsiri dari sereh wangi dan daun kayu putih juga disorot. Dukungan akan diberikan terkait efisiensi produksi dan kemitraan bersama pelaku UMKM penyulingan.\r\n\r\nSementara di KHDTK Wonogiri, fokus kegiatan mencakup penguatan Kebun Benih Semai (KBS) tersertifikasi, digitalisasi data dan pemasaran benih unggul, serta pembangunan etalase informasi produk KTH dan HHBK lokal. Tim Verifas juga mendorong dokumentasi “before-after” kegiatan di lapangan untuk memperlihatkan hasil nyata dari intervensi program. Langkah-langkah ini diharapkan memperkuat peran KHDTK Wonogiri sebagai model pengelolaan sumber benih unggul dan inovasi kehutanan berkelanjutan.\r\n\r\nLebih dari sekadar verifikasi teknis, kegiatan ini menjadi momentum dalam memperkuat sinergi pusat dan daerah dalam pengelolaan KHDTK. Melalui Program RBC 2&3 Periode 2, P2SEMH berkomitmen menghadirkan model pengelolaan hutan berbasis masyarakat yang diharapkan dapat berkontribusi nyata terhadap tercapainya Indonesia’s FOLU Net Sink 2030 menuju hutan lestari, masyarakat sejahtera, dan masa depan hijau berkelanjutan.\r\n\r\nSalam LESTARI!\r\n#P2SEMH\r\n#Kemenhut\r\n#SetjenKemenhut\r\n#RajaJuliAntoni\r\n#RohmatMarzuki\r\n#FOLUNetSink2030\r\n#RBCProgram\r\n#KHDTK_Litbang\r\n#KHDTKGunungkidulBlokPlayen\r\n#KHDTKWonogiri\r\n#BioekonomiHutan\r\n#KlikWebsiteKehutanan\r\nhttps://www.kehutanan.go.id/', NULL, '2025-11-15 04:17:35', '2025-11-15 04:17:35', NULL),
(32, 1, 'Kolaborasi Menuju Bioekonomi Berkelanjutan di Palu', 'kolaborasi-menuju-bioekonomi-berkelanjutan-di-palu', 'berita-p2semh', 'berita/1763205554_Kolaborasi Menuju Bioekonomi Berkelanjutan di PaluHalo Sobat Hijau!Upaya mewujudkan bioekonomi .jpg', 'Kolaborasi Menuju Bioekonomi Berkelanjutan di Palu\r\n\r\nHalo Sobat Hijau!\r\nUpaya mewujudkan bioekonomi berkelanjutan terus digencarkan. Kali ini, P2SEMH...', 'Kolaborasi Menuju Bioekonomi Berkelanjutan di Palu\r\n\r\nHalo Sobat Hijau!\r\nUpaya mewujudkan bioekonomi berkelanjutan terus digencarkan. Kali ini, P2SEMH dalam Program FORCLIME-GiZ berkolaborasi dengan Balai Besar Taman Nasional Lore Lindu (BBTNLL) @bbtn_lorelindu menggelar kegiatan Peningkatan Kapasitas Tata Kelola Lembaga Lokal terkait Bioekonomi di Palu, Sulawesi Tengah pada 22 Oktober 2025.\r\n\r\nKegiatan ini menjadi forum penting untuk memperkuat kelembagaan lokal, terutama bagi 15 LPKD (Lembaga Pengelola Konservasi Desa) dan 1 KUPS (Kelompok Usaha Perhutanan Sosial) di sekitar kawasan TN Lore Lindu. Pendekatan teknis dalam pengembangan model bioekonomi dan 𝘦𝘯𝘢𝘣𝘭𝘪𝘯𝘨 𝘤𝘰𝘯𝘥𝘪𝘵𝘪𝘰𝘯-kondisi yang memungkinkan terwujudnya pemberdayaan ekonomi masyarakat akan dihasilkan dari forum ini.\r\n\r\nDr. Sudirman D. Massiri, narasumber dari Universitas Tadulako membuka sesi dengan menjelaskan konsep kelembagaan lokal serta pentingnya tata kelola kelembagaan yang kuat dalam mendorong pengembangan bioekonomi. Sesi dilanjutkan oleh Fandy Pondete, S.Hut, Penyuluh Kehutanan TN Lore Lindu, yang menyoroti peran penting KTH dan LPKD dalam menggerakkan ekonomi berbasis sumber daya alam lestari di tingkat tapak. Dengan rasa antusias dari peserta, sesi diskusi yang dipandu oleh Imam Budiman, S.Hut, Ph.D., tim P2SEMH ini berlangsung hangat dan interaktif.\r\n\r\nTak hanya teori, peserta juga diajak untuk praktik langsung melalui Simulasi Penyusunan Rencana Pemanfaatan Bioekonomi. Dipandu oleh Ir. Edy Wicaksono dari Karsa Institute dan tim Penyuluh BBTNLL, para peserta menggali potensi wilayahnya, menyusun rencana pemanfaatannya, serta mengidentifikasi dukungan yang dibutuhkan agar bioekonomi bisa berkembang nyata di lapangan.\r\n\r\nLangkah kolaboratif ini menjadi pondasi tumbuhnya bioekonomi di wilayah penyangga TN Lore Lindu dengan harapan akan lahir lembaga lokal yang kuat, mandiri, dan mampu menjadi motor penggerak.\r\n\r\nSalam Bioekonomi!\r\nSalam LESTARI!\r\n\r\n#P2SEMH\r\n#Kemenhut\r\n#SetjenKemenhut\r\n#RajaJuliAntoni\r\n#RohmatMarzuki\r\n#FORCLIME\r\n#BBTN_LoreLindu\r\n#UniversitasTadulako\r\n#KarsaInstitute\r\n#bioekonomi\r\n#BioekonomiDesa\r\n#LPKD\r\n#KUPS\r\n#sulawesi\r\n#KlikWebsiteKehutanan\r\nhttps://www.kehutanan.go.id', NULL, '2025-11-15 04:19:14', '2025-11-15 04:19:14', NULL),
(33, 1, 'Penguatan Peran Serta Masyarakat dalam Konservasi Sumberdaya Alam 𝘚𝘶𝘮𝘢𝘵𝘳𝘢𝘯 𝘙𝘩𝘪𝘯𝘰 𝘚𝘢𝘯𝘤𝘵𝘶𝘢𝘳𝘺 dan Pusat Latihan Gajah, TN Way Kambas', 'penguatan-peran-serta-masyarakat-dalam-konservasi-sumberdaya-alam-dan-pusat-latihan-gajah-tn-way-kambas', 'berita-p2semh', 'berita/1763205708_573072413_18375228307148253_8253475666927714967_n.jpg', 'Penguatan Peran Serta Masyarakat dalam Konservasi Sumberdaya Alam 𝘚𝘶𝘮𝘢𝘵𝘳𝘢𝘯 𝘙𝘩𝘪𝘯𝘰 𝘚𝘢𝘯𝘤𝘵𝘶𝘢𝘳𝘺 dan Pusat Latihan Gajah, TN Way Kambas\r\n\r\nHalo Sobat hijau....', 'Penguatan Peran Serta Masyarakat dalam Konservasi Sumberdaya Alam 𝘚𝘶𝘮𝘢𝘵𝘳𝘢𝘯 𝘙𝘩𝘪𝘯𝘰 𝘚𝘢𝘯𝘤𝘵𝘶𝘢𝘳𝘺 dan Pusat Latihan Gajah, TN Way Kambas\r\n\r\nHalo Sobat hijau..\r\n\r\nDalam rangka mendukung penguatan peran serta masyarakat di sekitar Kawasan konservasi, Kepala Pusat Pengembangan Sosial Ekonomi Masyarakat Hutan (P2SEMH) melakukan kunjungan kerja ke  Sumatran Rhino Sanctuary (SRS) dan Pusat Latihan Gajah (PLG) di Taman Nasional Way Kambas @btn_waykambas di Lampung.  Maksud kunjungan ini adalah untuk berdiskusi dan mengetahui  pengelolaan SRS dan PLG di Taman Nasional Way Kambas (TNWK) dan bagaimana peran serta / pelibatan masyarakat dalam Pengelolaan SRS dan PLG.\r\n\r\nSRS dibangun sebagai pusat pengembangbiakan intensif, penelitian dan program pengembangan untuk badak Sumatera yang dikelola oleh Yayasan Badak Indonesia @badak.indonesia bekerjasama dengan TNWK. Saat ini terdapat 10 ekor badak yang menempati 2 lingkaran (ring) dengan total luas 250 ha. Ada 5 badak yang lahir di SRS TNWK, mereka antara lain Andatu (2012), Delilah (2016), Sedah Mirah (2022), Anggi (2023) dan Indra (2023).\r\n\r\nPengelolaan PLG di TNWK bertujuan untuk mengurangi konflik antara gajah dan manusia serta melakukan konservasi gajah secara in-situ. Saat ini terdapat 34 gajah di PLG, termasuk bayi gajah yang baru lahir pada 15 Agustus 2025\r\nPelibatan Masyarakat dalam pengelolaan Badak umumnya adalah sebagai penyedia pakan tambahan, selain pakan alami dihabitat Badak, mengingat sensitivitas dari para Badak tersebut. \r\n\r\nSedangkan pelibatan Masyarakat di PLG selain sebagai penyedia pakan, juga menyediakan paket-paket tour dan penyediaan makan dan minuman bagi wisatawan yang berkunjung ke PLG, karena PLG ini dibuka untuk Masyarakat yang ingin berkunjung melihat gajah.\r\n\r\nSalam LESTARI!\r\n\r\n#P2SEMH\r\n#Kemenhut\r\n#SetjenKemenhut\r\n#tamannasionalwaykambas\r\n#gajah\r\n#badak\r\n#KlikWebsiteKehutanan\r\nhttps://www.kehutanan.go.id/', NULL, '2025-11-15 04:21:48', '2025-11-15 04:21:48', NULL),
(34, 1, 'Indonesia Perkuat Tata Kelola Karbon dan Aksi FOLU Net Sink 2030 pada Forum COP30', 'indonesia-perkuat-tata-kelola-karbon-dan-aksi-folu-net-sink-2030-pada-forum-cop30', 'berita-kehutanan', 'berita/1763205799_medium_DSC_00386_45290b91ab.jpeg', 'SIARAN PERS\r\nNomor: SP.303/HUMAS/PP/HMS.3/11/2025\r\n\r\nBelem, Brasil — 13 November 2025 - Pemerintah Indonesia melalui Kementerian Kehutanan menegaskan...', 'SIARAN PERS\r\nNomor: SP.303/HUMAS/PP/HMS.3/11/2025\r\n\r\nBelem, Brasil — 13 November 2025 - Pemerintah Indonesia melalui Kementerian Kehutanan menegaskan komitmennya untuk memperkuat aksi iklim berbasis hutan dalam sesi “Unlocking the Potential of Carbon Economic Value for Climate Action towards Indonesia’s FOLU Net Sink 2030” pada COP30 UNFCCC di Belem, Brasil. Dalam acara tersebut, Indonesia menyampaikan strategi percepatan pencapaian FOLU Net Sink 2030 serta peran Nilai Ekonomi Karbon (NEK) sebagai instrumen pendukung pembiayaan iklim yang efektif.\r\n\r\nStaf Ahli Menteri Kehutanan untuk Perubahan Iklim, Haruni Krisnawati menjelaskan bahwa sektor FOLU merupakan pusat strategi iklim nasional, dengan kontribusi hingga 60 persen dari total potensi penurunan emisi Indonesia. Indonesia menegaskan bahwa target FOLU Net Sink 2030 merupakan langkah penting menuju pencapaian net-zero emission pada 2060 atau lebih cepat, sejalan dengan visi pembangunan berkelanjutan.\r\n\r\nIndonesia juga memaparkan sejumlah capaian konkret, antara lain:\r\n\r\n1. Penurunan laju deforestasi lebih dari 60 persen dalam satu dekade terakhir;\r\n2. Restorasi lebih dari satu juta hektare lahan terdegradasi, termasuk gambut dan mangrove;\r\n3. Penguatan koordinasi nasional melalui Operation Management Office (OMO);\r\n4. Penyusunan rencana aksi subnasional di hampir seluruh provinsi;\r\n5. Peningkatan standar MRV untuk memperkuat integritas dan transparansi pelaporan emisi\r\n\r\nDalam forum ini, pemerintah juga menyoroti pentingnya NEK sebagai kerangka transformasional untuk mendorong pembiayaan iklim. Peraturan Presiden Nomor 110 Tahun 2025 menjadi dasar bagi pengembangan sistem pembayaran berbasis hasil, perdagangan karbon domestik dan internasional, serta mekanisme levy karbon. Pemerintah sedang menyelesaikan sejumlah regulasi turunan untuk memastikan tata kelola karbon yang transparan dan kredibel, termasuk dalam Pemanfaatan Kawasan Hutan dan Perhutanan Sosial.\r\n\r\nIndonesia turut menyampaikan keberhasilan kerja sama internasional melalui pembayaran berbasis hasil dengan Norwegia dan Green Climate Fund, serta peluang pendanaan baru melalui skema REDD+ yurisdiksional di Kalimantan Timur. Kerja sama dengan berbagai lembaga global memperkuat kesiapan Indonesia dalam implementasi pasar karbon dan kerja sama Pasal 6 perjanjian Paris.\r\n\r\nPada bagian akhir sesi, ditegaskan kembali bahwa Indonesia akan terus memperkuat integritas, inklusivitas, dan transparansi dalam tata kelola karbon. Melalui pengembangan platform digital NEK, perluasan pendekatan yurisdiksi, serta peningkatan kolaborasi internasional, Indonesia siap berperan sebagai pusat ekonomi karbon regional dan memberikan kontribusi signifikan bagi upaya dekarbonisasi global.\r\n\r\nJakarta, 15 November 2025\r\n\r\nPenanggung jawab berita:\r\nKepala Biro Hubungan Masyarakat dan Kerjasama Luar Negeri, Kementerian Kehutanan,\r\nKrisdianto, S.Hut., M.Sc., Ph.D.\r\n\r\nWebsite:\r\nwww.kehutanan.go.id\r\n\r\nYoutube:\r\nKementerian Kehutanan\r\n\r\nFacebook:\r\nKementerian Kehutanan\r\n\r\nInstagram:\r\nKemenhut\r\n\r\nTwitter:\r\n@kemenhut_ri', NULL, '2025-11-15 04:23:19', '2025-11-15 04:23:19', NULL),
(35, 1, 'Komitmen 1,4 Juta Hektare Hutan Adat Diumumkan Indonesia pada Forum LCIPP COP30', 'komitmen-14-juta-hektare-hutan-adat-diumumkan-indonesia-pada-forum-lcipp-cop30', 'berita-kehutanan', 'berita/1763205844_medium_IMG_20251115_101429_ce94e5e5fc.jpg', 'SIARAN PERS\r\nNomor: SP.302/HUMAS/PP/HMS.3/11/2025\r\n\r\nBelem, Brasil — Indonesia menegaskan kembali komitmennya untuk memperkuat peran masyarakat hukum...', 'SIARAN PERS\r\nNomor: SP.302/HUMAS/PP/HMS.3/11/2025\r\n\r\nBelem, Brasil — Indonesia menegaskan kembali komitmennya untuk memperkuat peran masyarakat hukum adat dalam pengelolaan hutan berkelanjutan dan aksi iklim global. Dalam forum LCIPP pada rangkaian COP30 UNFCCC, delegasi Indonesia menyoroti bahwa hutan adat tidak hanya penting bagi kelestarian ekosistem, tetapi juga merupakan ruang hidup masyarakat adat yang telah menjaga hutan secara turun-temurun. Hutan adat menjadi fondasi bagi wilayah kehidupan masyarakat, penjaga ekosistem hutan dan lingkungan, pelindung kearifan lokal, serta salah satu strategi penyelesaian konflik yang melibatkan masyarakat di dalam dan sekitar kawasan hutan.\r\n\r\nMasyarakat adat memiliki pengetahuan tradisional dan praktik pengelolaan yang berkelanjutan, seperti agroforestri, reboisasi, dan pengelolaan hutan berbasis kearifan lokal. Praktik-praktik ini berkontribusi besar terhadap ketahanan iklim, perlindungan keanekaragaman hayati, dan penyerapan karbon. Karena itu, pengetahuan lokal perlu diterjemahkan menjadi kebijakan publik agar dapat diakui dan dilindungi negara.\r\n\r\nIndonesia mencontohkan bagaimana konsep hutan suci seperti larangan harangan, wana ngkiki, dan kawasan keramat diterjemahkan menjadi hutan lindung dalam kerangka regulasi nasional. Perlindungan ruang hidup ini penting untuk memastikan bahwa kearifan lokal tetap dapat dijalankan masyarakat in situ dan diwariskan kepada generasi berikutnya.\r\n\r\nPemerintah menegaskan komitmen untuk memperkuat pengakuan hak masyarakat adat melalui penetapan hutan adat sebagai bagian dari Program Perhutanan Sosial. Selama COP30 UNFCCC, Menteri Kehutanan mengumumkan komitmen Indonesia untuk mengakui 1,4 juta hektare hutan adat dalam empat tahun ke depan. Komitmen ini diperkuat oleh hasil studi empiris yang menunjukkan bahwa hutan yang dikelola masyarakat mampu menurunkan laju deforestasi hingga 30–50%.\r\n\r\nSebagai langkah percepatan, pemerintah telah membentuk Satuan Tugas Percepatan Pengakuan Hutan Adat pada Maret 2025. Hingga kini, total 70.688 hektare hutan adat telah ditetapkan secara resmi di bawah pengelolaan Kementerian Kehutanan. Pemerintah menegaskan bahwa penguatan peran masyarakat adat perlu disertai dengan mekanisme pembagian manfaat yang adil agar pengelolaan hutan dapat berjalan berkelanjutan.\r\n\r\nDalam forum LCIPP ini Indonesia juga mendorong pengembangan basis data global yang memuat praktik pengelolaan lokal, tradisi, dan kearifan masyarakat adat dari berbagai negara. Indonesia menyatakan kesiapan untuk terus mendukung LCIPP, baik melalui pemerintah maupun perwakilan masyarakat adat, sebagai bagian dari kontribusi terhadap aksi iklim berbasis pengetahuan tradisional.(*)\r\n\r\nJakarta, 15 November 2025\r\n\r\nPenanggung jawab berita:\r\nKepala Biro Hubungan Masyarakat dan Kerjasama Luar Negeri, Kementerian Kehutanan,\r\nKrisdianto, S.Hut., M.Sc., Ph.D.\r\n\r\nWebsite:\r\nwww.kehutanan.go.id\r\n\r\nYoutube:\r\nKementerian Kehutanan\r\n\r\nFacebook:\r\nKementerian Kehutanan\r\n\r\nInstagram:\r\nKemenhut\r\n\r\nTwitter:\r\n@kemenhut_ri', NULL, '2025-11-15 04:24:04', '2025-11-15 04:24:04', NULL),
(36, 1, 'Operasi Merah Putih Lanskap Seblat: Kementerian Kehutanan Kembali Kuasai Areal Perambahan dan Amankan Alat Berat Perusak Hutan', 'operasi-merah-putih-lanskap-seblat-kementerian-kehutanan-kembali-kuasai-areal-perambahan-dan-amankan-alat-berat-perusak-hutan', 'berita-kehutanan', 'berita/1763205895_medium_20251115_091514_e594c21d82.png', 'SIARAN PERS\r\nNomor: SP.301/HUMAS/PP/HMS.3/11/2025\r\n\r\nJakarta, 15 November 2025. Kementerian Kehutanan melalui Direktorat Jenderal Penegakan Hukum Kehu...', 'SIARAN PERS\r\nNomor: SP.301/HUMAS/PP/HMS.3/11/2025\r\n\r\nJakarta, 15 November 2025. Kementerian Kehutanan melalui Direktorat Jenderal Penegakan Hukum Kehutanan (Ditjen Gakkum Kehutanan) terus memperkuat Operasi Merah Putih Lanskap Seblat di Bengkulu. Operasi ini merupakan tindak lanjut arahan Presiden dan Menteri Kehutanan, serta kunjungan Wakil Menteri Kehutanan yang meninjau koridor gajah Seblat dari udara pada 4 November 2025, untuk memastikan kawasan strategis ini kembali berfungsi sebagai koridor utama Gajah Sumatera dan penyangga kehidupan masyarakat sekitar.\r\n\r\nOperasi yang dilaksanakan sejak 2 November 2025, hingga saat ini tim gabungan Gakkumhut Sumatera, Balai Besar Taman Nasional Kerinci Seblat (TNKS), BKSDA Bengkulu, dan Dinas LHK Provinsi Bengkulu/KPH Bengkulu Utara mengidentifikasi kurang lebih 6.000 hektare areal terindikasi perambahan di Lanskap Seblat. Dari luasan tersebut, sekitar 2.390 hektare telah berhasil dikuasai kembali melalui rangkaian tindakan lapangan, mulai dari perobohan 59 pondok perambahan, pemusnahan sekitar 7000 batang sawit ilegal, perusakan sarana akses seperti jembatan liar, pemasangan 27 plang larangan, hingga pada hari Jumat 14 November 2025 Tim Operasi menangkap alat berat beserta 4 (empat) orang yang salah satunya berperan sebagai pemborong pembukaan lahan. Alat berat tersebut digunakan untuk membuka dan memperluas areal perambahan. Langkah ini menegaskan kembali penguasaan negara atas kawasan hutan dan memberi sinyal jelas bahwa operasi tidak berhenti pada pekerja lapangan, tetapi menyasar struktur perusakan hutan yang menggunakan modal besar dan alat berat.\r\n\r\nDi bidang penegakan hukum, penyidik Ditjen Gakkum Kehutanan telah menetapkan SM pemilik lahan ilegal sebagai tersangka. Penyidik melakukan pemeriksaan terhadap petugas operasi dan saksi-saksi kunci, menyita berbagai barang bukti yang terkait dengan pembukaan dan pengelolaan kebun sawit ilegal, melakukan olah tempat kejadian perkara, serta meminta keterangan ahli dari instansi teknis terkait. Tersangka saat ini ditahan di Rumah Tahanan Cabang Polda Bengkulu untuk kepentingan penyidikan, dan berkas perkara sedang disiapkan untuk segera diserahkan kepada Kejaksaan Tinggi Bengkulu. Pada saat yang sama, penyidik menelusuri mata rantai kepemilikan lahan, mulai dari pemilik sebelumnya, pihak yang diduga memperjualbelikan lahan hutan kepada berbagai pihak, hingga aktor yang membangun akses jalan menggunakan alat berat.\r\n\r\nSebagai bagian dari pengungkapan jaringan yang lebih luas, penyidik memeriksa para pekerja, pemilik lahan lain yang terhubung, serta pihak-pihak yang berperan mengenalkan dan menghubungkan para pelaku di lapangan. Pemeriksaan ini diarahkan untuk memetakan peran para pemilik, pemodal, dan penyedia alat berat yang sesungguhnya mengendalikan perusakan kawasan hutan. Sementara itu, proses pemanggilan terhadap dua pemilik lahan lainnya tengah dijadwalkan untuk memperkuat konstruksi perkara dan memastikan pertanggungjawaban pidana tidak berhenti di level operator kecil.\r\n\r\nDi sisi lain, Ditjen Gakkum Kehutanan mengedepankan pendekatan persuasif terhadap masyarakat yang kooperatif. Beberapa warga di desa sekitar telah dimintai keterangan dan tiga orang di antaranya menyatakan kesediaan menyerahkan kembali lahan yang mereka kuasai kepada pemerintah melalui surat pernyataan. Aparat juga meminta keterangan perangkat desa dan pemerintah desa setempat untuk memperjelas status penguasaan lahan dan alur jual beli yang terjadi. Pendekatan ini menunjukkan bahwa negara tidak sedang memburu masyarakat kecil yang bersedia bekerja sama dan mengembalikan kawasan, tetapi memfokuskan penindakan pada pemilik lahan, pemodal, dan pengguna alat berat yang menjadikan kawasan hutan sebagai komoditas ilegal.\r\n\r\nDirektur Jenderal Penegakan Hukum Kehutanan, Dwi Januanto Nugroho, menegaskan: “Operasi Merah Putih Lanskap Seblat dirancang untuk memutus rantai bisnis perambahan, bukan mengorbankan rakyat kecil. Pemerintah secara tegas menyasar pemilik lahan, pemodal, dan pengendali alat berat sebagai sasaran utama penegakan hukum, sementara masyarakat yang kooperatif diarahkan untuk menyelesaikan penguasaan lahan secara tertib dan sesuai ketentuan. Selain penegakan hukum pidana, Ditjen Gakkum Kehutanan juga sedang mendalami dan menyiapkan penerapan instrumen sanksi administratif terhadap pemegang perizinan berusaha yang melanggar ketentuan kehutanan, serta langkah penegakan hukum perdata untuk memastikan pemulihan kawasan hutan dan kerugian negara.”\r\n\r\nIa menambahkan: “Kami tidak akan mentoleransi praktik jual beli kawasan hutan negara dalam bentuk apa pun, karena koridor Seblat harus tetap terjaga sebagai habitat penting Gajah Sumatera dan benteng ekologis bagi generasi mendatang,” tegas Januanto.\r\n\r\nKementerian Kehutanan akan melanjutkan operasi pengamanan dan pemulihan Lanskap Seblat secara terpadu. Selain penindakan hukum, rehabilitasi lahan rusak, penertiban akses keluar–masuk, dan penataan batas kawasan akan dikerjakan bersama pemerintah daerah, pelaku usaha yang taat hukum, dan lembaga konservasi. Operasi Merah Putih di Lanskap Seblat menjadi bukti bahwa penegakan hukum kehutanan berjalan serius, berkelanjutan, dan berpihak pada kelestarian hutan sekaligus keadilan bagi masyarakat.(*)\r\n\r\nJakarta , Kemenhut, 15 November 2025\r\n\r\nNarahubung: Pansos Sugiharto\r\nHP. 081217979063\r\n\r\nPenanggung jawab berita:\r\nKepala Biro Hubungan Masyarakat dan Kerjasama Luar Negeri, Kemenhut\r\nKrisdianto\r\n\r\nWebsite:\r\nwww.kehutanan.go.id\r\n\r\nYoutube:\r\nKementerian Kehutanan RI\r\n\r\nFacebook:\r\nKementerian Kehutanan\r\n\r\nInstagram:\r\nkemenhut\r\n\r\nTwitter:\r\n@kemenhut_ri', NULL, '2025-11-15 04:24:55', '2025-11-15 04:24:55', NULL),
(37, 1, 'Indonesia Tekankan Pentingnya Harmonisasi Nasional dalam Proses Pembentukan TFFF dan TFIF', 'indonesia-tekankan-pentingnya-harmonisasi-nasional-dalam-proses-pembentukan-tfff-dan-tfif', 'berita-kehutanan', 'berita/1763205935_medium_DSC_00396_eb5667c598.jpeg', 'SIARAN PERS\r\nNomor: SP. 300/HUMAS/PPIP/HMS.3/11/2025\r\n\r\nStaf Ahli Menteri Bidang Perubahan Iklim Haruni Krisnawati, mewakili Kementerian Kehutanan men...', 'SIARAN PERS\r\nNomor: SP. 300/HUMAS/PPIP/HMS.3/11/2025\r\n\r\nStaf Ahli Menteri Bidang Perubahan Iklim Haruni Krisnawati, mewakili Kementerian Kehutanan menghadiri TFFF Informal Meeting: Exchange Initial Views on the Forthcoming Steps Related to the Establishment of both the TFFF and the Tropical Forest Investment Fund (TFIF) yang dilaksanakan pada 14 November 2025 di Blue Zone, Belém, Brazil.\r\n\r\nPertemuan ini membahas tindak lanjut rencana pembentukan kelembagaan Tropical Forest Finance Facility (TFFF) dan Tropical Forest Investment Fund (TFIF) pasca peluncurannya pada 6 November 2025. Pertemuan dihadiri oleh perwakilan dari Brazil, Indonesia, Jerman, Norwegia, dan Perancis.\r\n\r\nDalam pertemuan tersebut, Indonesia menyampaikan apresiasi kepada Brazil sebagai inisiator TFFF, serta menyambut baik inisiatif global ini sebagai upaya untuk menghimpun pendanaan bagi perlindungan hutan tropis. Indonesia menegaskan bahwa mekanisme yang sedang dikembangkan perlu tetap selaras dengan prioritas nasional dan arsitektur iklim yang sudah ada, agar implementasinya efektif dan berkelanjutan.\r\n\r\nIndonesia juga menyampaikan bahwa saat ini pemerintah sedang melakukan koordinasi internal lintas kementerian, dipimpin oleh Kementerian Koordinator, untuk mendiskusikan tata kelola dan struktur kelembagaan TFFF yang paling sesuai dengan kepentingan nasional. Proses ini penting untuk memastikan harmonisasi dengan kebijakan nasional, menghindari tumpang tindih dengan lembaga yang sudah ada, serta menjamin kejelasan peran dan tanggung jawab dalam pelaksanaannya.\r\n\r\nPada kesempatan yang sama, Indonesia menegaskan bahwa negara sudah memiliki Sistem Monitoring Hutan Nasional (SIMONTANA) sebagai dasar pemantauan hutan tropis. Indonesia terus melakukan penyesuaian dan harmonisasi metodologi, termasuk definisi, sumber data, pelaporan, transparansi, serta verifikasi, untuk memastikan keselarasan penuh dengan mekanisme TFFF dan memenuhi kriteria kelayakan yang ditetapkan.\r\n\r\nIndonesia menantikan dialog lanjutan dan kolaborasi erat dengan seluruh mitra dalam proses penyempurnaan desain TFFF dan TFIF. Indonesia berkomitmen untuk memastikan bahwa inisiatif ini memberikan dampak nyata bagi perlindungan hutan tropis sambil tetap mempertahankan keselarasan dengan sistem dan prioritas nasional.(*)\r\n\r\nBelem, Brasil, Kemenhut, 14 November 2025\r\n\r\nPenanggung jawab berita:\r\nKepala Biro Hubungan Masyarakat dan Kerjasama Luar Negeri, Kementerian Kehutanan,\r\nKrisdianto\r\n\r\nWebsite:\r\nwww.kehutanan.go.id\r\n\r\nYoutube:\r\nKementerian Kehutanan\r\n\r\nFacebook:\r\nKementerian Kehutanan\r\n\r\nInstagram:\r\nKemenhut\r\n\r\nTwitter:\r\n@kemenhut_ri', NULL, '2025-11-15 04:25:35', '2025-11-15 04:25:35', NULL),
(38, 1, 'Potensi Kerugian Negara Capai Rp 1 Triliun, Gakkumhut Tetapkan Aktor Utama Tambang Ilegal Tahura Bukit Soeharto', 'potensi-kerugian-negara-capai-rp-1-triliun-gakkumhut-tetapkan-aktor-utama-tambang-ilegal-tahura-bukit-soeharto', 'berita-kehutanan', 'berita/1763205985_IMG_20251112_WA_0026_89d54a9be2.jpg', 'SIARAN PERS\r\nNomor: SP.297/HUMAS/PP/HMS.3/11/2025\r\n\r\nDirektur Jenderal Penegakan Hukum Kehutanan (Gakkumhut), Dwi Januanto Nugroho, mengungkap bahwa p...', 'SIARAN PERS\r\nNomor: SP.297/HUMAS/PP/HMS.3/11/2025\r\n\r\nDirektur Jenderal Penegakan Hukum Kehutanan (Gakkumhut), Dwi Januanto Nugroho, mengungkap bahwa potential loss dari aktivitas tambang ilegal batubara di Tahura Bukit Soeharto diperkirakan mencapai sekitar Rp 1 triliun. Nilai tersebut mencerminkan hilangnya potensi penerimaan negara sekaligus rusaknya sumber daya alam di kawasan hutan konservasi yang saat ini masuk dalam delineasi Ibu Kota Nusantara (IKN).\r\n\r\n“Tambang ilegal di kawasan hutan tidak hanya menimbulkan kerugian ekonomi bagi negara, tetapi juga merusak ekosistem yang memegang peran penting bagi kehidupan manusia. Untuk kejahatan seperti ini, tidak ada ruang kompromi,” tegas Dwi Januanto dalam pernyataannya di Jakarta (13/11/2025).\r\n\r\nDwi Januanto menegaskan kembali bahwa penegakan hukum terhadap tambang ilegal di kawasan hutan konservasi, khususnya yang berada dalam delineasi IKN, akan dilakukan secara konsisten dan berkesinambungan. “Penanganan kasus ini tidak hanya soal menindak pelaku, tetapi juga bagian dari upaya penyelamatan sumber daya hutan dan pencegahan kerusakan ekologis jangka panjang.\r\nKami menyampaikan terima kasih dan apresiasi atas kerja sama dan sinergitas yang terbangun dengan baik antara Ditjen Gakkum Kehutanan dan seluruh instansi terkait dalam pengungkapan kasus ini. Saya optimis penegakan hukum kehutanan ke depan akan semakin solid dan kuat dalam menghadapi kejahatan kehutanan yang kian kompleks,” tegas Dwi.\r\n\r\nPerhitungan potential loss pada kasus ini terkait penanganan kasus tambang batubara ilegal di Tahura Bukit Soeharto yang melibatkan tersangka berinisial MH (37) yang juga merupakan Direktur CV WU. MH ditetapkan sebagai tersangka setelah penyidik Balai Penegakan Hukum Kehutanan Wilayah Kalimantan, melalui koordinasi intensif dengan Biro Korwas Bareskrim Mabes Polri dan Subdit V Bareskrim Mabes Polri, berhasil melakukan pemeriksaan terhadap MH. Ia diduga kuat bertindak sebagai pemodal dan penanggung jawab kegiatan penambangan batubara ilegal di kawasan Tahura Bukit Soeharto pada tahun 2022.\r\n\r\nKasus ini merupakan pengembangan dari operasi tangkap tangan yang dilakukan tim operasi SPORC Brigade Enggang Kalimantan Timur terhadap empat operator alat berat berinisial S (47), B (44), AM (32), dan NT (44) pada 4 Februari 2022. Saat itu, para pelaku tertangkap tangan sedang melakukan penambangan batubara ilegal di area Green Belt Waduk Samboja, yang secara administratif berada di dalam kawasan Ibu Kota Nusantara. MH sendiri telah berstatus Daftar Pencarian Orang (DPO) selama kurang lebih tiga tahun sebelum akhirnya berhasil diperiksa dan ditetapkan sebagai tersangka.\r\n\r\nAtas perbuatannya, MH dijerat Pasal 78 ayat (2) jo Pasal 50 ayat (3) huruf a Undang-Undang Republik Indonesia Nomor 41 Tahun 1999 tentang Kehutanan sebagaimana diubah pada Paragraf 4 Pasal 36 angka 19 Pasal 78 ayat (2) jo Pasal 50 ayat (2) huruf a Undang-Undang Nomor 11 Tahun 2020 tentang Cipta Kerja sebagaimana diubah dalam Paragraf 4 Pasal 36 angka 19 Pasal 78 ayat (3) jo angka 17 Pasal 50 ayat (2) huruf a Undang-Undang Nomor 6 Tahun 2023 tentang Penetapan Peraturan Pemerintah Pengganti Undang-Undang Nomor 2 Tahun 2022 tentang Cipta Kerja menjadi Undang-Undang jo Pasal 55 ayat (1) ke-1 KUHP. Ancaman pidana yang dapat dikenakan adalah penjara maksimal 10 (sepuluh) tahun dan denda hingga Rp 5 miliar.\r\n\r\nKepala Balai Gakkum Kehutanan Wilayah Kalimantan, Leonardo Gultom, menjelaskan bahwa penetapan MH sebagai tersangka merupakan hasil kerja panjang dan sinergi antarlembaga. “MH adalah target DPO yang sudah bertahun-tahun kami kejar. Berkat dukungan dan koordinasi yang kuat dengan Biro Korwas Bareskrim Mabes Polri dan Subdit V Bareskrim Mabes Polri, akhirnya kami dapat melakukan pemeriksaan dan menetapkan MH sebagai tersangka. Kami akan terus menelusuri dan membongkar jaringan lain yang terafiliasi dengan MH dalam praktik pertambangan ilegal di Tahura Bukit Soeharto,” ujar Leonardo.(*)\r\n\r\nJakarta , Kemenhut, 14 November 2025\r\n\r\nNarahubung : Anton Jumaedi\r\nHP. 085246207112\r\n\r\nPenanggung jawab berita:\r\nKepala Biro Hubungan Masyarakat dan Kerjasama Luar Negeri, Kemenhut\r\nKrisdianto\r\n\r\nWebsite:\r\nwww.kehutanan.go.id\r\n\r\nYoutube:\r\nKementerian Kehutanan RI\r\n\r\nFacebook:\r\nKementerian Kehutanan\r\n\r\nInstagram:\r\nkemenhut\r\n\r\nTwitter:\r\n@kemenhut_ri', NULL, '2025-11-15 04:26:25', '2025-11-15 04:26:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint UNSIGNED NOT NULL,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `judul`, `path_file`, `created_at`, `updated_at`) VALUES
(1, 'Laporan Contoh', 'documents/KqdG0cMR1Qv1DkjDDUDCiVEnGicXxxsLT1V1Flg5.pdf', '2025-08-12 21:14:31', '2025-08-12 21:14:31');

-- --------------------------------------------------------

--
-- Table structure for table `downloads`
--

CREATE TABLE `downloads` (
  `id` bigint UNSIGNED NOT NULL,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nama_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `downloads`
--

INSERT INTO `downloads` (`id`, `judul`, `deskripsi`, `nama_file`, `kategori`, `created_at`, `updated_at`) VALUES
(28, 'UNDANG-UNDANG REPUBLIK INDONESIA NOMOR 41 TAHUN 1999 TENTANG KEHUTANAN', 'Undang - Undang', 'uHrFvQW8CnL0OvGuuD2d8DvVkFnafmFERbmyRe6s.pdf', 'peraturan', '2025-11-26 18:24:04', '2025-11-26 18:24:04'),
(29, 'PERATURAN PEMERINTAH REPUBLIK INDONESIA NOMOR 46 TAHUN 2017 TENTANG INSTRUMEN EKONOMI LINGKUNGAN HIDUP', 'Peraturan Pemerintah', 'pYhJAQANoO273XnRQrCRWp11Q1g9Y2T1HN7vGKAR.pdf', 'peraturan', '2025-11-26 18:25:09', '2025-11-26 18:25:09'),
(30, 'PERATURAN PRESIDEN REPUBLIK INDONESIA NOMOR 175 TAHUN 2024 TENTANG KEMENTERIAN KEHUTANAN', 'Peraturan Presiden', '1WZ9T4ItkMTHYM9fLsEvTxwnMrLu0CWKdnsh2tZk.pdf', 'peraturan', '2025-11-26 18:29:14', '2025-11-26 18:29:14'),
(31, 'PERATURAN PRESIDEN REPUBLIK INDONESTA NOMOR 5 TAHUN 2025 TENTANG PENERTIBAN IGWASAN HUTAN', 'Peraturan Presiden', 'EqwAu2gdFpZzEW0uBMksmLO7uXb6IHZh9mNzcpKQ.pdf', 'peraturan', '2025-11-26 18:33:28', '2025-11-26 18:33:28'),
(32, 'PERATURAN MENTERI KEHUTANAN REPUBLIK INDONESIA NOMOR 1 TAHUN 2024 TENTANG ORGANISASI DAN TATA KERJA KEMENTERIAN KEHUTANAN', 'Peraturan Menteri', 'TGt0bKY3jGcGHQ2GfLRS0qI3xSkNrV0J4fb36prr.pdf', 'peraturan', '2025-11-26 18:37:25', '2025-11-26 18:37:25'),
(33, 'KEPUTUSAN MENTERI KEHUTANAN REPUBLIK INDONESIA NOMOR 1 TAHUN 2024 TENTANG LOGO KEMENETERIAN KEHUTANAN REPUBLIK INDONESIA', 'Keputusan Menteri', 'CCCQvCbgRaIUCHVjhrweFhpeVjfl0bF3NwfSgscC.pdf', 'peraturan', '2025-11-26 18:40:20', '2025-11-26 18:40:20'),
(34, 'PERATURAN MENTERI LINGKUNGAN HIDUP DAN KEHUTANAN REPUBLIK INDONESIA NOMOR 4 TAHUN 2023 TENTANG PENGELOLAAN PERHUTANAN SOSIAL PADA KAWASAN HUTAN DENGAN PENGELOLAAN KHUSUS', 'Peraturan Menteri', 'umK9dqd8uj4a7h20vxhk0vAj5p1sDz1mcJQRBvGR.pdf', 'peraturan', '2025-11-26 18:43:58', '2025-11-26 18:43:58'),
(35, 'PERATURAN MENTERI LINGKUNGAN HIDUP DAN KEHUTANAN REPUBLIK INDONESIA PEDOMAN UMUM PENYALURAN BANTUAN LAINNYA YANG MEMILIKI KARAKTERISTIK BANTUAN PEMERINTAH DI LINGKUNGAN KEMENTERIAN LINGKUNGAN HIDUP DAN KEHUTANAN', 'Peraturan Menteri', 'WADVWu9pfzMnoeQkZHbZ1Jps2elaUtHUNAqigMuh.pdf', 'peraturan', '2025-11-26 18:47:46', '2025-11-26 18:47:46'),
(36, 'Permen LHK: Perubahan Kedua P.12/2017 tentang Pedoman Penyaluran Bantuan.', 'Peraturan Menteri', 'eQ6FFidgTEBn1xj9uYSc8FbncPQzepQHThThcWjO.pdf', 'peraturan', '2025-11-26 18:51:17', '2025-11-26 18:51:17'),
(37, 'PERATURAN MENTERI LINGKUNGAN HIDUP DAN KEHUTANAN TENTANG PERHUTANAN SOSIAL', 'Peraturan Menteri', 'fVorQeNI0YhHjcGbO9Uyztxhtx9qMFarlfF5J3la.pdf', 'peraturan', '2025-11-26 18:53:09', '2025-11-26 18:53:09'),
(38, 'PMK 23/2025 tentang Juknis Pemberian THR dan Gaji 13 Tahun 2025 bagi Aparatur Negara, Pensiunan, dan Penerima Tunjangan.', 'Peraturan Menteri', 'GF24rdYw19ULNf0OFUoxXJ39c4dUPhNHzB9h9cfv.pdf', 'peraturan', '2025-11-26 18:55:30', '2025-11-26 18:55:30'),
(39, 'PERATURAN MENTERI KEHUTANAN REPUBLIK INDONESIA NOMOR 3 TAHUN 2025 TENTANG ORGANISASI DAN TATA KERJA BALAI PEMANTAPAN KAWASAN HUTAN', 'Peraturan Menteri', 'vDddEGO6Ucy6pSg7bBiSqzroYAZjGLQwZpc8No3L.pdf', 'peraturan', '2025-11-26 18:57:52', '2025-11-26 18:57:52'),
(40, 'PERATURAN MENTERI KEHUTANAN REPUBLIK INDONESIA NOMOR 4 TAHUN 2025 ... TENTANG ORGANISASI DAN TATA KERJA UNIT PELAKSANA TEKNIS DIREKTORAT JENDERAL KONSERVASI SUMBER DAYA ALAM DAN EKOSISTEM', 'Peraturan Menteri', 'J6HZq43ZpnzRHCAnLvgF6CQ7DhW5SbUgzFSE4uie.pdf', 'peraturan', '2025-11-26 18:58:17', '2025-11-26 18:58:17'),
(41, 'PERATURAN MENTERI KEHUTANAN REPUBLIK INDONESIA NOMOR 5 TAHUN 2025 TENTANG ORGANISASI DAN TATA KERJA UNIT PELAKSANA TEKNIS DIREKTORAT JENDERAL PENGELOLAAN DAERAH ALIRAN SUNGAI DAN REHABILITASI HUTAN', 'Peraturan Menteri', 'eWrn1k0uG1jjaDPqx9a69XvVpaO7GMapdHivVaIz.pdf', 'peraturan', '2025-11-26 18:59:40', '2025-11-26 18:59:40'),
(42, 'PERATURAN MENTERI KEHUTANAN REPUBLIK INDONESIA NOMOR 6 TAHUN 2025 ... TENTANG ORGANISASI DAN TATA KERJA BALAI PENGELOLAAN HUTAN LESTARI', 'Peraturan Menteri', 'yEDeZSvAgsW86pKM3MwXnCwB4fXRxfYcP3DsXa6Z.pdf', 'peraturan', '2025-11-26 19:02:17', '2025-11-26 19:02:17'),
(43, 'PERATURAN MENTERI KEHUTANAN REPUBLIK INDONESIA NOMOR 7 TAHUN 2025 TENTANG ORGANISASI DAN TATA KERJA BALAI PERHUTANAN SOSIAL', 'Peraturan Menteri', 'PpZDako0sl4vITkAsaQImZybpyq4Vq4BKK3tCMQS.pdf', 'peraturan', '2025-11-26 19:12:44', '2025-11-26 19:12:44'),
(44, 'PERATURAN MENTERI KEHUTANAN REPUBLIK INDONESIA NOMOR 8 TAHUN 2025 TENTANG ORGANISASI DAN TATA KERJA UNIT PELAKSANA TEKNIS DIREKTORAT JENDERAL PENEGAKAN HUKUM KEHUTANAN', 'Peraturan Menteri', 'Qhn9rNKfEOLD9enbYAhQ8KMzHFDyFyzlM6vot4HA.pdf', 'peraturan', '2025-11-26 19:13:20', '2025-11-26 19:13:20'),
(45, 'PERATURAN MENTERI KEHUTANAN REPUBLIK INDONESIA NOMOR 9 TAHUN 2025 TENTANG ORGANISASI DAN TATA KERJA UNIT PELAKSANA TEKNIS BADAN PENYULUHAN DAN PENGEMBANGAN SUMBER DAYA MANUSIA', 'Peraturan Menteri', 'nSqUiTEU4JfyOf0tnjUOdYMnBqE6jJ25DpeqtJiK.pdf', 'peraturan', '2025-11-26 19:14:27', '2025-11-26 19:14:27'),
(46, 'PERATURAN MENTERI KEHUTANAN REPUBLIK INDONESIA NOMOR 10 TAHUN 2025 TENTANG PENYALURAN BANTUAN PEMERINTAH DI LINGKUNGAN KEMENTERIAN KEHUTANAN', 'Peraturan Menteri', 'ObijnD89eib7DxIbiwatwD0uH6wY5KJPB1fPYAME.pdf', 'peraturan', '2025-11-26 19:15:09', '2025-11-26 19:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `internal_links`
--

CREATE TABLE `internal_links` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2025_08_04_020127_create_regulations_table', 1),
(7, '2025_08_04_021532_create_categories_table', 1),
(8, '2025_08_04_021535_create_work_units_table', 1),
(9, '2025_08_04_021536_create_public_services_table', 1),
(10, '2025_08_04_021538_create_events_table', 1),
(11, '2025_08_04_021540_create_partners_table', 1),
(12, '2025_08_04_021542_create_locations_table', 1),
(13, '2025_08_06_065800_add_is_admin_to_users_table', 1),
(14, '2025_08_07_062129_create_beritas_table', 1),
(15, '2025_08_13_032215_create_documents_table', 2),
(16, '2025_08_13_064801_create_downloads_table', 3),
(17, '2025_08_15_031045_create_agendas_table', 4),
(18, '2025_08_21_034956_create_videos_table', 5),
(20, '2025_08_21_042127_remove_thumbnail_column_from_videos_table', 6),
(21, '2025_09_04_042540_create_partners_table', 7),
(22, '2025_09_04_081555_modify_agendas_table_for_date_range', 8),
(23, '2025_09_15_022743_create_analyses_table', 9),
(24, '2025_10_31_031246_create_internal_links_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `name`, `url`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'Kementerian Kehutanan', 'https://kehutanan.go.id/', 'partners/6ndYdmSCCVQRudTv0ZNUpn9PMbqkAgIRDWZ77Yu9.png', '2025-09-03 21:27:29', '2025-09-03 21:27:29'),
(2, 'Badan Standardisasi Nasional', 'https://bsn.go.id/', 'partners/Bm7A1uiDMnIFzbax1nsrZUnwXZhlUGIVfcjjP8rl.png', '2025-09-03 21:42:05', '2025-09-03 21:42:05');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` bigint UNSIGNED NOT NULL,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `judul`, `gambar`, `created_at`, `updated_at`) VALUES
(4, 'Rusa Timor di KHDTK Rarung by Edy Saputra Penangkaran  - Mataram', 'gallery/3kietfxWNGoZ97abccgB3GVoMhcIdqXpIzss6sK8.jpg', '2025-09-04 00:56:06', '2025-09-04 00:56:06'),
(5, 'Penanaman Vanili sesuai SNI Agroforestri by Edy Saputra - Mataram', 'gallery/BusTdu594BA4MGQND6JtmKkd9pZ57xTlBXsWi8Em.jpg', '2025-09-04 00:58:23', '2025-09-04 00:58:23'),
(6, 'Akar Jangkar Bakau di Hutan Mangrove Sungai Manggar - Samboja by Agustina Dwi Setyowati', 'gallery/7e0JdvROtnY7IUhiOk8OFGAECQOBNPqOZGaZGbaV.jpg', '2025-09-07 21:20:03', '2025-09-07 21:20:03'),
(7, 'Anak Bekantan (Nasalis larvatus) Sarapan Daun Sonneratia caseolaris - Samboja by Agustina Dwi Setyowati', 'gallery/DoX4NyxBtucyOKXNIhpcXTjizx8XggcEBkIAvJCK.jpg', '2025-09-07 21:28:55', '2025-09-07 21:28:55'),
(8, 'Agustina Dwi Setyowati_Bulbophyllum sp. - Samboja', 'gallery/2gWwCOKI18kpHIMh3rlOdOjvsGBLv3a3wFuNoDlp.jpg', '2025-09-07 21:32:27', '2025-09-07 21:32:27'),
(9, 'Berang berang Cakar Kecil (Aonyx cinereus) - Samboja by Agustina Dwi Setyowati', 'gallery/px7Yk726zzYy12C7QsV36Wy5MXdkKX1tWalekOLN.jpg', '2025-09-07 21:34:51', '2025-09-07 21:34:51'),
(10, 'Elang brontok (Nisaetus cirrhatus) di Landscape IKN - Samboja by Agustina Dwi Setyowati', 'gallery/2w0HrjjiJSXyplr6w0dnG3YzmWqxhaxb88I5QzuC.jpg', '2025-09-07 21:36:10', '2025-09-07 21:36:10');

-- --------------------------------------------------------

--
-- Table structure for table `public_services`
--

CREATE TABLE `public_services` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `form_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regulations`
--

CREATE TABLE `regulations` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `is_admin`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin P2SEMH', 'admin@p2semh.com', 1, '2025-08-12 00:00:45', '$2y$12$OF6XZfBp4LvIyibdj0/qPehkmwdmFsfRYN865AnLIkC30cMn/c3BG', NULL, '2025-08-12 00:00:45', '2025-08-12 00:00:45');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint UNSIGNED NOT NULL,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `judul`, `youtube_url`, `created_at`, `updated_at`) VALUES
(1, 'Kaleidoskop BSILHK 2021', 'https://youtu.be/X1DEmB91Zhg?si=Hy7Jr9yFVfB0rhWO', '2025-08-20 21:23:49', '2025-08-20 21:23:49'),
(4, 'STANDARDISASI LINGKUNGAN HIDUP DAN KEHUTANAN MENJAGA KEBERLANJUTAN SUMBERDAYA ALAM', 'https://youtu.be/Ma6XQjEETKM?si=ribyiEZ2fgiff5eS', '2025-08-20 21:30:53', '2025-08-20 21:30:53'),
(5, 'Program kerja penaatan dan pengawasan lingkungan hidup, laboratorium lingkungan', 'https://youtu.be/py-vMYFJkdk?si=JfwnorRDn7pk1tP3', '2025-08-20 21:31:27', '2025-08-20 21:31:27'),
(6, 'REFLEKSI BSILHK 2023 - LANDASAN 2024, \"BUKTI BUKAN SEKEDAR JANJI\"', 'https://youtu.be/N9eIFEzRaOI?si=9VCaqCMuSNsYxbIV', '2025-08-20 21:31:55', '2025-08-20 21:31:55');

-- --------------------------------------------------------

--
-- Table structure for table `work_units`
--

CREATE TABLE `work_units` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agendas`
--
ALTER TABLE `agendas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `analyses`
--
ALTER TABLE `analyses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beritas`
--
ALTER TABLE `beritas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `beritas_slug_unique` (`slug`),
  ADD KEY `beritas_user_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `downloads`
--
ALTER TABLE `downloads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `internal_links`
--
ALTER TABLE `internal_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `public_services`
--
ALTER TABLE `public_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regulations`
--
ALTER TABLE `regulations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_units`
--
ALTER TABLE `work_units`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agendas`
--
ALTER TABLE `agendas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `analyses`
--
ALTER TABLE `analyses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `beritas`
--
ALTER TABLE `beritas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `downloads`
--
ALTER TABLE `downloads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `internal_links`
--
ALTER TABLE `internal_links`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `public_services`
--
ALTER TABLE `public_services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regulations`
--
ALTER TABLE `regulations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `work_units`
--
ALTER TABLE `work_units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `beritas`
--
ALTER TABLE `beritas`
  ADD CONSTRAINT `beritas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
