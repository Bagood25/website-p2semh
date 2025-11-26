<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        
        Schema::create('beritas', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->string('judul');
            $table->string('slug')->unique();
            $table->string('kategori');
            $table->string('gambar')->nullable();
            $table->text('kutipan');
            $table->text('isi');
            $table->timestamp('published_at')->nullable();
            $table->timestamps(); // Menambahkan created_at dan updated_at
            $table->softDeletes(); // Menambahkan deleted_at
        });

        Schema::create('photos', function (Blueprint $table) {
            $table->id();
            $table->string('judul');
            $table->string('gambar');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Perintah untuk menghapus tabel 'beritas'
        Schema::dropIfExists('beritas');

        // TAMBAHAN: Perintah untuk menghapus tabel 'photos'
        Schema::dropIfExists('photos');
    }
};