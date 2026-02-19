<?php

namespace App\Http\Controllers;

use App\Models\Download;
use Illuminate\Http\Request;

class DownloadController extends Controller
{
    public function index($kategori)
    {
        $peraturans = Download::where('kategori', $kategori)->latest()->paginate(10);
        return view('download', compact('peraturans'));
    }

    // --- FUNGSI DOWNLOAD DENGAN DEBUGGER ---
    public function downloadFile($filename)
    {
        // 1. Tentukan lokasi folder secara manual (Absolute Path)
        // Ini mengarah ke: C:\Users\hp\website\website-p2semh\storage\app\public\downloads
        $folderPath = storage_path('app/public/downloads');
        $fullPath = $folderPath . '/' . $filename;

        // 2. Cek apakah file fisik ada di harddisk
        if (!file_exists($fullPath)) {
            
            // === AREA DEBUG (Hapus nanti kalau sudah fix) ===
            // Kode ini akan menampilkan daftar file yang BENAR-BENAR ADA di folder itu
            // Supaya Anda bisa mencocokkan nama file yang dicari vs yang tersedia.
            
            $filesInFolder = glob($folderPath . '/*'); 
            $fileNames = array_map('basename', $filesInFolder);

            dd([
                'STATUS' => 'ERROR 404 - FILE TIDAK KETEMU',
                'Dicari di Lokasi' => $fullPath,
                'Nama File yang Dicari' => $filename,
                'Daftar File yang ADA di folder tersebut' => empty($fileNames) ? 'FOLDER KOSONG!' : $fileNames
            ]);
            // ===============================================
        }

        // 3. Jika file ketemu, langsung download
        return response()->download($fullPath);
    }
}