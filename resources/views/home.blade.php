@extends('layouts.app')

@section('title', 'Beranda')

@section('content')

<div class="container mx-auto px-6">
        <h2 class="text-3xl font-bold text-center text-gray-800 mb-12">
            Tautan Internal
        </h2>
        <div class="flex flex-wrap justify-center items-center gap-8">
            @forelse($internalLinks as $link)
                <a href="{{ $link->url }}" target="_blank" rel="noopener noreferrer" title="{{ $link->name }}"
                   class="block bg-white p-6 rounded-lg shadow-md hover:shadow-xl transition-all duration-300 transform hover:-translate-y-1 w-64">
                    <div class="flex items-center justify-center h-40">
                        <img src="{{ asset('storage/' . $link->logo) }}" alt="{{ $link->name }}" class="max-h-full max-w-full object-contain">
                    </div>
                    <p class="text-center text-gray-700 font-semibold mt-4 truncate">{{ $link->name }}</p>
                </a>
            @empty
                <p class="text-center text-gray-500">
                    Belum ada tautan internal yang ditambahkan.
                </p>
            @endforelse
        </div>
    </div>

    {{-- Slider Berita Utama (P2SEMH) --}}
    <section id="berita-slider" class="my-16 container mx-auto px-6">
        <div class="relative w-full overflow-hidden rounded-lg shadow-lg">
            <div id="hero-slider" class="flex transition-transform duration-500 ease-in-out">
                @foreach($beritaUtama as $berita)
                <div class="w-full flex-shrink-0">
                    <div class="relative bg-cover bg-center h-[500px] flex items-center justify-center" 
                         style="background-image: url('{{ asset('storage/' . $berita->gambar) }}');">
                        <div class="absolute inset-0 bg-black opacity-50"></div>
                        <div class="relative text-center text-white px-4">
                            <h2 class="text-4xl font-bold mb-2">{{ $berita->judul }}</h2>
                            <p class="text-lg">{{ \Illuminate\Support\Str::limit(strip_tags($berita->isi), 100) }}</p>
                            
                            {{-- ====================================================== --}}
                            {{-- == PERBAIKAN 1: Mengganti nama rute --}}
                            {{-- ====================================================== --}}
                            <a href="{{ route('news.detail', $berita->slug) }}" class="text-green-600 font-medium hover:underline inline-block mt-4">Baca Selengkapnya →</a>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
            {{-- Tombol Navigasi Slider (Tidak ada perubahan) --}}
            <button id="prev-slide" class="absolute top-1/2 left-4 transform -translate-y-1/2 text-white p-2 rounded-full bg-black bg-opacity-50 hover:bg-opacity-75">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path></svg>
            </button>
            <button id="next-slide" class="absolute top-1/2 right-4 transform -translate-y-1/2 text-white p-2 rounded-full bg-black bg-opacity-50 hover:bg-opacity-75">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path></svg>
            </button>
        </div>
    </section>

    {{-- Grid Berita P2SEMH --}}
    <section id="berita-fokus" class="py-16 bg-gray-50">
    <div class="container mx-auto px-6 text-center">
        <h2 class="text-3xl font-bold text-gray-800 mb-2">Berita P2SEMH</h2>
        <p class="text-gray-600 mb-8">Informasi terkini seputar P2SEMH.</p>

        <div class="relative w-full overflow-hidden">
            <button id="prev-fokus-slide" class="absolute top-1/2 left-0 transform -translate-y-1/2 bg-white bg-opacity-50 hover:bg-opacity-75 rounded-full p-2 z-10">
                <svg class="w-6 h-6 text-gray-800" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path></svg>
            </button>
            
            <div id="berita-fokus-slider" class="flex transition-transform duration-500 ease-in-out">
                @foreach($beritaFokus as $berita)
                <div class="w-full md:w-1/3 flex-shrink-0 px-4">
                    <div class="bg-white rounded-lg shadow-lg overflow-hidden hover:shadow-xl transition-shadow duration-300 flex flex-col h-full text-left">
                        <img src="{{ asset('storage/' . $berita->gambar) }}" alt="Gambar berita" class="w-full h-48 object-cover">
                        <div class="p-6 flex-grow flex flex-col">
                            <p class="text-sm text-gray-500 mb-2">{{ $berita->created_at->format('d M Y') }}</p>
                            <a href="{{ route('news.detail', $berita->slug) }}" class="hover:text-green-600">
                                <h3 class="text-lg font-semibold text-gray-900 mb-2">{{ $berita->judul }}</h3>
                            </a>
                            <div class="mt-auto pt-4">
                                <a href="{{ route('news.detail', $berita->slug) }}" class="text-green-600 hover:text-green-800 font-semibold text-sm">Baca Selengkapnya &rarr;</a>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>

            <button id="next-fokus-slide" class="absolute top-1/2 right-0 transform -translate-y-1/2 bg-white bg-opacity-50 hover:bg-opacity-75 rounded-full p-2 z-10">
                <svg class="w-6 h-6 text-gray-800" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path></svg>
            </button>
        </div>
    </div>
</section>

<section id="galeri-foto" class="my-16 container mx-auto px-6">
    <h2 class="text-3xl font-bold text-center mb-12 text-gray-800">Galeri Foto</h2>

    @if($latestPhotos->isNotEmpty())
        <div class="swiper photo-slider relative">
            <div class="swiper-wrapper">

                @foreach($latestPhotos as $photo)
                <div class="swiper-slide">
                    <div class="bg-white rounded-lg shadow-lg overflow-hidden group">
                        <div class="aspect-w-4 aspect-h-3">
                            <img src="{{ asset('storage/' . $photo->gambar) }}" alt="{{ $photo->judul }}" class="w-full h-full object-cover">
                        </div>
                        <div class="p-3 bg-white text-center">
                            <h3 class="font-semibold text-gray-900 text-sm truncate" title="{{ $photo->judul }}">{{ $photo->judul }}</h3>
                        </div>
                    </div>
                </div>
                @endforeach

            </div>

            <div class="swiper-button-prev text-green-600"></div>
            <div class="swiper-button-next text-green-600"></div>
        </div>

        <div class="text-center mt-12">
            <a href="{{ route('gallery.index') }}" class="bg-green-600 text-white font-semibold py-3 px-8 rounded-full hover:bg-green-700 transition duration-300">
                Lihat Semua Foto
            </a>
        </div>
    @else
        <div class="text-center py-8">
            <p class="text-gray-500">Galeri foto akan segera tersedia.</p>
        </div>
    @endif
</section>

   {{-- Slider Berita Kehutanan --}}
    <section id="berita-kehutanan-slider" class="my-16 bg-gray-900 text-white py-16">
        <div class="container mx-auto px-6">
            <h2 class="text-3xl font-bold text-center mb-12">Berita Kehutanan</h2>
            <div class="relative w-full overflow-hidden">
                <div id="kabar-bsi-slider" class="flex transition-transform duration-500 ease-in-out">
                    @if($beritaStandar->count() > 0)
                        <div class="w-full flex-shrink-0 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 p-4">
                            @foreach($beritaStandar->take(3) as $berita)
                            <div class="bg-gray-800 text-white rounded-lg shadow-lg overflow-hidden flex flex-col">
                                <a href="{{ route('news.detail', $berita->slug) }}">
                                    <img src="{{ asset('storage/' . $berita->gambar) }}" alt="{{ $berita->judul }}" class="w-full h-40 object-cover">
                                </a>
                                <div class="p-4 flex flex-col flex-grow">
                                    <a href="{{ route('news.detail', $berita->slug) }}" class="hover:text-green-400">
                                        <h4 class="font-semibold text-lg">{{ $berita->judul }}</h4>
                                    </a>
                                    <p class="text-sm text-gray-400 line-clamp-3 mt-2 flex-grow">
                                        {{ $berita->kutipan }}
                                    </p>
                                    <a href="{{ route('news.detail', $berita->slug) }}" class="text-green-400 font-semibold text-sm mt-auto self-start">
                                        Baca Selengkapnya &rarr;
                                    </a>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    @endif
                    
                    @if($beritaStandar->count() > 3)
                        <div class="w-full flex-shrink-0 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 p-4">
                             @foreach($beritaStandar->skip(3)->take(3) as $berita)
                             <div class="bg-gray-800 text-white rounded-lg shadow-lg overflow-hidden flex flex-col">
                                 <a href="{{ route('news.detail', $berita->slug) }}">
                                     <img src="{{ asset('storage/' . $berita->gambar) }}" alt="{{ $berita->judul }}" class="w-full h-40 object-cover">>
                                 </a>
                                 <div class="p-4 flex flex-col flex-grow">
                                     <a href="{{ route('news.detail', $berita->slug) }}" class="hover:text-green-400">
                                         <h4 class="font-semibold text-lg">{{ $berita->judul }}</h4>
                                     </a>
                                     <p class="text-sm text-gray-400 line-clamp-3 mt-2 flex-grow">
                                         {{ $berita->kutipan }}
                                     </p>
                                     <a href="{{ route('news.detail', $berita->slug) }}" class="text-green-400 font-semibold text-sm mt-auto self-start">
                                         Baca Selengkapnya &rarr;
                                     </a>
                                 </div>
                             </div>
                             @endforeach
                        </div>
                    @endif
                </div>
                @if($beritaStandar->count() > 3)
                <button id="prev-kabar-bsi-slide" class="absolute top-1/2 left-0 md:left-4 transform -translate-y-1/2 text-white p-2 rounded-full bg-black bg-opacity-50 hover:bg-opacity-75 z-10">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path></svg>
                </button>
                <button id="next-kabar-bsi-slide" class="absolute top-1/2 right-0 md:right-4 transform -translate-y-1/2 text-white p-2 rounded-full bg-black bg-opacity-50 hover:bg-opacity-75 z-10">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path></svg>
                </button>
                @endif
            </div>
        </div>
    </section>

<section id="testimoni-video" class="my-16 relative bg-cover bg-center py-24" style="background-image: url('{{ asset('images/background indonesia.png') }}');">
    <div class="absolute inset-0 bg-black opacity-60"></div>
    <div class="container mx-auto px-6 relative z-10 text-white">
        
        <h2 class="text-3xl font-bold text-center mb-12 mt-16">Galeri Video</h2>
        
        @if($latestVideos->isNotEmpty())
        <div class="swiper video-slider relative">
            <div class="swiper-wrapper">
                @foreach($latestVideos as $video)
                    @php
                        preg_match('/(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/', $video->youtube_url, $matches);
                        $youtubeId = $matches[1] ?? null;
                    @endphp
                    @if($youtubeId)
                    <div class="swiper-slide">
                        {{-- ====================================================== --}}
                        {{-- ==           PERUBAHAN UTAMA ADA DI SINI            == --}}
                        {{-- ====================================================== --}}
                        <a href="{{ $video->youtube_url }}" target="_blank" rel="noopener noreferrer" 
                           class="block group relative overflow-hidden rounded-lg shadow-lg h-full aspect-video">
                            {{-- Class 'h-48' dihapus dan diganti 'h-full' agar mengisi wadah --}}
                            <img src="https://img.youtube.com/vi/{{ $youtubeId }}/hqdefault.jpg" alt="{{ $video->judul }}" 
                                 class="w-full h-full object-cover transform group-hover:scale-110 transition-transform duration-300">
                        {{-- ====================================================== --}}
                            
                            <div class="absolute inset-0 bg-black bg-opacity-50 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                                <svg class="w-16 h-16 text-white" fill="currentColor" viewBox="0 0 24 24"><path d="M8 5v14l11-7z"></path></svg>
                            </div>
                            <div class="absolute bottom-0 left-0 bg-gradient-to-t from-black via-black/70 to-transparent w-full p-4">
                                <h4 class="text-white font-semibold text-lg">{{ $video->judul }}</h4>
                            </div>
                        </a>
                    </div>
                    @endif
                @endforeach
            </div>
            <div class="swiper-button-prev text-white"></div>
            <div class="swiper-button-next text-white"></div>
        </div>
        @else
        <div class="text-center text-gray-200">
            <p>Belum ada video yang ditambahkan.</p>
        </div>
        @endif

    </div>
</section>

    <section id="footer-menu" class="my-16">
        

        <section id="agenda-bsilhk" class="bg-gray-900 text-white py-16 mb-16">
    <div class="container mx-auto px-6">
        <h2 class="text-3xl font-bold text-center mb-12">Agenda</h2>
        
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-12">

            <div class="lg:col-span-1">
                <div class="static-calendar">
                    <div class="month">
                        <h2 id="month-year"></h2>
                    </div>
                    <div class="weekdays">
                        <div>Min</div>
                        <div>Sen</div>
                        <div>Sel</div>
                        <div>Rab</div>
                        <div>Kam</div>
                        <div>Jum</div>
                        <div>Sab</div>
                    </div>
                    <div class="days" id="calendar-days"></div>
                </div>
            </div>

            <div class="lg:col-span-2">
                <h3 class="text-2xl font-bold text-white mb-6">Agenda Mendatang</h3>
                <div class="space-y-6">
                    @forelse ($latestAgendas as $agenda)
                    <div class="bg-gray-800 p-5 rounded-lg shadow-md border-l-4 border-green-500 hover:shadow-lg transition-shadow duration-200">
                        <p class="text-sm text-gray-400 mb-1 font-semibold">
                            {{ $agenda->tanggal_mulai->isoFormat('D MMMM YYYY') }}
                            @if($agenda->tanggal_selesai && $agenda->tanggal_selesai->ne($agenda->tanggal_mulai))
                                - {{ $agenda->tanggal_selesai->isoFormat('D MMMM YYYY') }}
                            @endif
                        </p>
                        <h4 class="font-bold text-white">{{ $agenda->judul }}</h4>
                        @if($agenda->lokasi)
                        <p class="text-xs text-gray-300 mt-1 flex items-center">
                            <svg class="inline-block w-3 h-3 mr-1.5" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd"></path></svg>
                            {{ $agenda->lokasi }}
                        </p>
                        @endif
                    </div>
                    @empty
                    <div class="bg-gray-800 p-5 rounded-lg text-center text-gray-400">
                        <p>Tidak ada agenda mendatang.</p>
                    </div>
                    @endforelse
                </div>

                {{-- ======================================================= --}}
                {{-- == BAGIAN YANG DITAMBAHKAN ADA DI BAWAH INI           == --}}
                {{-- ======================================================= --}}
                <div class="mt-8 text-right">
                    <a href="{{ route('agenda.index') }}" class="text-green-400 hover:text-green-300 font-semibold transition-colors duration-200 inline-flex items-center">
                        Lihat Semua Agenda
                        <svg class="w-4 h-4 ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"></path></svg>
                    </a>
                </div>
                {{-- ======================================================= --}}

            </div>

        </div>
    </div>
</section>


        {{-- KODE PENGGANTI DENGAN BINGKAI PERSEGI YANG LEBIH BESAR --}}

    <div class="container mx-auto px-6">
        <h2 class="text-3xl font-bold text-center text-gray-800 mb-12">Tautan Eksternal Terkait</h2>

        {{-- Menggunakan flexbox untuk menampilkan logo secara berjajar dan wrapping --}}
        <div class="flex flex-wrap justify-center items-center gap-8">

            @forelse($partners as $partner)
                <a href="{{ $partner->url }}" target="_blank" rel="noopener noreferrer" title="{{ $partner->name }}"
                   class="block bg-white p-6 rounded-lg shadow-md hover:shadow-xl transition-all duration-300 transform hover:-translate-y-1 w-64">
                    <div class="flex items-center justify-center h-40">
                        <img src="{{ asset('storage/' . $partner->logo) }}" alt="{{ $partner->name }}" class="max-h-full max-w-full object-contain">
                    </div>
                    <p class="text-center text-gray-700 font-semibold mt-4">{{ $partner->name }}</p>
                </a>
            @empty
                <p class="text-center text-gray-500">
                    Belum ada tautan terkait yang ditambahkan.
                </p>
            @endforelse

        </div>
    </div>

    </section>

    @push('styles')
<style>
    .static-calendar {
        font-family: sans-serif;
        border-radius: 0.5rem;
        background-color: #374151; /* Warna abu-abu gelap */
        color: #d1d5db; /* Warna teks abu-abu terang */
        padding: 1.5rem;
    }
    .static-calendar .month {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 1.25rem;
    }
    .static-calendar .month h2 {
        font-size: 1.25rem;
        font-weight: 700;
        color: #fff;
    }
    .static-calendar .weekdays {
        display: grid;
        grid-template-columns: repeat(7, 1fr);
        color: #9ca3af;
        font-size: 0.75rem;
        font-weight: 600;
        margin-bottom: 0.75rem;
        text-align: center;
    }
    .static-calendar .days {
        display: grid;
        grid-template-columns: repeat(7, 1fr);
        gap: 0.5rem;
        text-align: center;
    }
    .static-calendar .days div {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        aspect-ratio: 1 / 1; /* Membuat sel menjadi kotak */
        border-radius: 9999px;
    }
    .static-calendar .days .today {
        border: 2px solid #3B82F6;
        color: #fff;
    }
    /* Style untuk tanggal yang memiliki agenda */
    .static-calendar .days .has-event {
        background-color: #10B981; /* Warna hijau */
        color: white;
        font-weight: bold;
    }
</style>
@endpush

    <footer class="bg-gray-800 text-gray-300 py-8">
        <div class="container mx-auto text-center px-4">
            &copy; {{ date('Y') }} P2SEMH. Hak Cipta Dilindungi.
        </div>
    </footer>

    <script>
     document.addEventListener('DOMContentLoaded', function() {
        // ======================================================
        // == SCRIPT LAMA ANDA UNTUK HERO SLIDER (TIDAK DIUBAH) ==
        // ======================================================
        const heroSlider = document.getElementById('hero-slider');
        const prevHeroSlideButton = document.getElementById('prev-slide');
        const nextHeroSlideButton = document.getElementById('next-slide');
        if (heroSlider && prevHeroSlideButton && nextHeroSlideButton) {
            let currentHeroIndex = 0;
            const heroSlides = heroSlider.children.length;
            function updateHeroSlider() {
                heroSlider.style.transform = `translateX(-${currentHeroIndex * 100}%)`;
            }
            prevHeroSlideButton.addEventListener('click', () => {
                currentHeroIndex = (currentHeroIndex - 1 + heroSlides) % heroSlides;
                updateHeroSlider();
            });
            nextHeroSlideButton.addEventListener('click', () => {
                currentHeroIndex = (currentHeroIndex + 1) % heroSlides;
                updateHeroSlider();
            });
        }

        // =================================================================
        // == SCRIPT BARU UNTUK BERITA P2SEMH (TIDAK DIUBAH) ==
        // =================================================================
        const beritaFokusSlider = document.getElementById('berita-fokus-slider');
        const prevFokusButton = document.getElementById('prev-fokus-slide');
        const nextFokusButton = document.getElementById('next-fokus-slide');
        if (beritaFokusSlider && prevFokusButton && nextFokusButton) {
            let currentFokusIndex = 0;
            const fokusSlidesCount = Math.ceil(beritaFokusSlider.children.length / 3); 
            
            function updateFokusSlider() {
                beritaFokusSlider.style.transform = `translateX(-${currentFokusIndex * 100}%)`;
            }

            prevFokusButton.addEventListener('click', () => {
                currentFokusIndex = (currentFokusIndex - 1 + fokusSlidesCount) % fokusSlidesCount;
                updateFokusSlider();
            });

            nextFokusButton.addEventListener('click', () => {
                currentFokusIndex = (currentFokusIndex + 1) % fokusSlidesCount;
                updateFokusSlider();
            });
        }

        // ======================================================
        // == SCRIPT LAMA LAINNYA (TIDAK DIUBAH) ==
        // ======================================================
        const beritaStandarSlider = document.getElementById('berita-standar-slider');
        const prevBeritaStandarSlideButton = document.getElementById('prev-berita-standar-slide');
        const nextBeritaStandarSlideButton = document.getElementById('next-berita-standar-slide');
        if (beritaStandarSlider && prevBeritaStandarSlideButton && nextBeritaStandarSlideButton) {
            let currentBeritaStandarIndex = 0;
            const beritaStandarSlides = beritaStandarSlider.children.length;
            function updateBeritaStandarSlider() {
                beritaStandarSlider.style.transform = `translateX(-${currentBeritaStandarIndex * 100}%)`;
            }
            prevBeritaStandarSlideButton.addEventListener('click', () => {
                currentBeritaStandarIndex = (currentBeritaStandarIndex - 1 + beritaStandarSlides) % beritaStandarSlides;
                updateBeritaStandarSlider();
            });
            nextBeritaStandarSlideButton.addEventListener('click', () => {
                currentBeritaStandarIndex = (currentBeritaStandarIndex + 1) % beritaStandarSlides;
                updateBeritaStandarSlider();
            });
        }
        
        const kabarBsiSlider = document.getElementById('kabar-bsi-slider');
        const prevKabarBsiSlideButton = document.getElementById('prev-kabar-bsi-slide');
        const nextKabarBsiSlideButton = document.getElementById('next-kabar-bsi-slide');
        if (kabarBsiSlider && prevKabarBsiSlideButton && nextKabarBsiSlideButton) {
            let currentKabarBsiIndex = 0;
            const kabarBsiSlides = kabarBsiSlider.children.length;
            function updateKabarBsiSlider() {
                kabarBsiSlider.style.transform = `translateX(-${currentKabarBsiIndex * 100}%)`;
            }
            prevKabarBsiSlideButton.addEventListener('click', () => {
                currentKabarBsiIndex = (currentKabarBsiIndex - 1 + kabarBsiSlides) % kabarBsiSlides;
                updateKabarBsiSlider();
            });
            nextKabarBsiSlideButton.addEventListener('click', () => {
                currentKabarBsiIndex = (currentKabarBsiIndex + 1) % kabarBsiSlides;
                updateKabarBsiSlider();
            });
        }

        // ===================================================================
        // == SCRIPT BARU UNTUK KALENDER STATIS AGENDA (DITAMBAHKAN DI SINI) ==
        // ===================================================================
        if (document.getElementById('calendar-days')) {
            renderStaticCalendar();
        }
    });

    // Fungsi render kalender diletakkan di luar agar bisa dipanggil
    function renderStaticCalendar() {
        // Ambil data tanggal dari controller
        const eventDates = {!! $eventDatesJson ?? '[]' !!};

        const monthYearElement = document.getElementById('month-year');
        const calendarDaysElement = document.getElementById('calendar-days');
        
        const monthNames = ["Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember"];
        
        const now = new Date();
        const year = now.getFullYear();
        const month = now.getMonth();
        const today = now.getDate();

        monthYearElement.textContent = `${monthNames[month]} ${year}`;

        const firstDayOfMonth = new Date(year, month, 1).getDay();
        const daysInMonth = new Date(year, month + 1, 0).getDate();

        calendarDaysElement.innerHTML = ''; 

        for (let i = 0; i < firstDayOfMonth; i++) {
            calendarDaysElement.innerHTML += `<div></div>`;
        }

        for (let i = 1; i <= daysInMonth; i++) {
            let dayCell = document.createElement('div');
            dayCell.textContent = i;
            
            // Tandai hari ini
            if (i === today && year === new Date().getFullYear() && month === new Date().getMonth()) {
                dayCell.classList.add('today');
            }

            // Buat string tanggal YYYY-MM-DD
            const currentDateString = `${year}-${String(month + 1).padStart(2, '0')}-${String(i).padStart(2, '0')}`;
            
            // Tandai jika tanggal ini ada di daftar agenda
            if (eventDates.includes(currentDateString)) {
                dayCell.classList.add('has-event');
            }
            
            calendarDaysElement.appendChild(dayCell);
        }
    }

    
</script>
@endsection