<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'P2SEMH')</title>
    <script src="https://cdn.tailwindcss.com"></script>
    
    {{-- 1. CSS untuk Swiper Slider --}}
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap');
        body { font-family: 'Inter', sans-serif; }
    </style>

    @stack('styles')

</head>
<body>
    @include('partials._header')

    <main>
        @yield('content')
    </main>

    @include('partials._footer')

    {{-- Script untuk Menu Mobile --}}
    <script>
        document.getElementById('mobile-menu-button').addEventListener('click', function() {
            const mobileMenu = document.getElementById('mobile-menu');
            mobileMenu.classList.toggle('hidden');
        });
    </script>

    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            
            // Inisialisasi slider untuk Galeri Foto (dengan class .photo-slider)
            const photoSwiper = new Swiper('.photo-slider', {
                loop: true,
                slidesPerView: 2,
                spaceBetween: 20,
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                breakpoints: {
                    640: { slidesPerView: 3, spaceBetween: 20 },
                    768: { slidesPerView: 4, spaceBetween: 30 },
                    1024: { slidesPerView: 5, spaceBetween: 30 }
                }
            });

            // Inisialisasi slider untuk Galeri Video (dengan class .video-slider)
            const videoSwiper = new Swiper('.video-slider', {
                loop: true,
                slidesPerView: 1, // Tampilan default untuk mobile (1 video)
                spaceBetween: 20,
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                breakpoints: {
                    // Ketika lebar layar 768px atau lebih, tampilkan 3 video
                    768: {
                      slidesPerView: 3,
                      spaceBetween: 30
                    }
                }
            });

        });
    </script>

    @stack('scripts')

</body>
</html>