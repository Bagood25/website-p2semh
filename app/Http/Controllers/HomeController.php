<?php

namespace App\Http\Controllers;

// Gunakan semua model yang diperlukan
use App\Models\News;
use App\Models\Photo;
use App\Models\Agenda;
use App\Models\Video;
use App\Models\Partner;
use Illuminate\Http\Request;
use Carbon\CarbonPeriod;
use App\Models\InternalLink; // Model untuk Tautan Internal

class HomeController extends Controller
{
    /**
     * Menampilkan halaman utama dengan data yang diperlukan.
     */
    public function index()
    {
        // Mengambil data berita
        $beritaUtama = News::where('kategori', 'berita-p2semh')->latest()->take(5)->get();
        $beritaFokus = News::where('kategori', 'berita-p2semh')->latest()->take(15)->get();
        $beritaStandar = News::where('kategori', 'berita-kehutanan')->latest()->take(6)->get();

        // Mengambil data galeri, video, dan tautan terkait
        $latestPhotos = Photo::latest()->take(12)->get();
        $latestVideos = Video::latest()->take(15)->get();
        $partners = Partner::latest()->get();
        
        // ======================================================
        $internalLinks = InternalLink::latest()->get();
        // ======================================================


        // Logika pengambilan agenda
        $latestAgendas = Agenda::where('tanggal_selesai', '>=', now()->today())
                               ->orderBy('tanggal_mulai', 'asc')
                               ->get();

        // Mengambil semua tanggal agenda untuk ditandai di kalender
        $allAgendas = Agenda::all();
        $eventDates = [];
        foreach ($allAgendas as $agenda) {
            $period = CarbonPeriod::create($agenda->tanggal_mulai, $agenda->tanggal_selesai ?? $agenda->tanggal_mulai);
            foreach ($period as $date) {
                $eventDates[] = $date->toDateString();
            }
        }
        $eventDatesJson = json_encode(array_values(array_unique($eventDates)));

        // Mengirim semua data ke view 'home'
        return view('home', compact(
            'beritaUtama',
            'beritaFokus',
            'beritaStandar',
            'latestPhotos',
            'latestVideos',
            'partners',
            'internalLinks', // <-- Variabel baru ditambahkan di sini
            'latestAgendas',
            'eventDatesJson'
        ));
    }
    
    public function p2semh()
    {
        $title = 'Tautan Terkait P2SEMH';
        $partners = Partner::latest()->get();
        return view('p2semh', compact('title', 'partners'));
    }
}