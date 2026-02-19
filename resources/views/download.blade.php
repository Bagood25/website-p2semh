@extends('layouts.app')

@section('title', 'Download Dokumen Peraturan')

@section('content')
    {{-- Hero Section / Banner --}}
    <div class="relative h-64 bg-cover bg-center flex items-center justify-center text-white" style="background-image: url('{{ asset('images/background hutan.jpg') }}');">
        <div class="absolute inset-0 bg-black opacity-50"></div>
        <div class="relative z-10 text-center p-4">
            <h1 class="text-4xl md:text-5xl font-bold tracking-tight">Download</h1>
            <p class="mt-2 text-sm md:text-base">
                <a href="/" class="hover:underline">Beranda</a> &gt; 
                <span>Download Peraturan</span>
            </p>
        </div>
    </div>

    {{-- Main Content Section --}}
    <main class="flex-grow container mx-auto max-w-7xl px-4 py-12">
        <h2 class="text-3xl font-bold text-gray-800 mb-8 text-center">Dokumen Peraturan</h2>
        
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">

            {{-- Perulangan data dari database --}}
            @forelse ($peraturans as $item)
                @php
                    // Logika untuk ikon berdasarkan ekstensi file
                    $extension = pathinfo($item->nama_file, PATHINFO_EXTENSION);
                    $iconClass = 'fa-file-alt'; // Ikon default
                    if (in_array($extension, ['pdf'])) $iconClass = 'fa-file-pdf text-red-500';
                    if (in_array($extension, ['doc', 'docx'])) $iconClass = 'fa-file-word text-blue-500';
                    if (in_array($extension, ['ppt', 'pptx'])) $iconClass = 'fa-file-powerpoint text-orange-500';
                    if (in_array($extension, ['xls', 'xlsx'])) $iconClass = 'fa-file-excel text-green-500';
                    if (in_array($extension, ['zip', 'rar'])) $iconClass = 'fa-file-archive text-yellow-500';
                @endphp

                <div class="bg-white rounded-lg shadow-lg overflow-hidden flex flex-col group transition-transform transform hover:-translate-y-2">
                    <div class="p-6 flex-grow flex flex-col">
                        {{-- Ikon dan Judul --}}
                        <div class="flex items-start mb-4">
                            <i class="fas {{ $iconClass }} text-4xl mr-4 mt-1"></i>
                            <div>
                                {{-- PERBAIKAN 1: Menggunakan $item->judul --}}
                                <h3 class="text-lg font-semibold text-gray-900 leading-tight">{{ $item->judul }}</h3>
                            </div>
                        </div>

                        {{-- Deskripsi --}}
                        <p class="text-gray-600 text-sm mb-4 flex-grow">
                            {{ $item->deskripsi ?? 'Tidak ada deskripsi untuk file ini.' }}
                        </p>

                        {{-- Tombol Download --}}
                        {{-- PERBAIKAN 2: Menggunakan path dan nama file yang benar --}}
                        <a href="{{ route('download.file', $item->nama_file) }}" 
   class="mt-auto w-full inline-block text-center bg-green-600 text-white font-semibold py-2 px-4 rounded-md hover:bg-green-700 transition duration-300">
                            <i class="fas fa-download mr-2"></i> Unduh Dokumen
                        </a>
                    </div>
                </div>
            @empty
                {{-- Pesan jika tidak ada file --}}
                <div class="col-span-full text-center py-16 bg-white rounded-lg shadow-md">
                    <i class="fas fa-box-open text-6xl text-gray-300 mb-4"></i>
                    <h3 class="text-xl font-medium text-gray-800">Dokumen Tidak Ditemukan</h3>
                    <p class="mt-2 text-gray-500">Saat ini belum ada dokumen yang tersedia dalam kategori ini.</p>
                </div>
            @endforelse

        </div>

        {{-- Pagination Links --}}
        <div class="mt-12">
            {{ $peraturans->links() }}
        </div>
    </main>
@endsection