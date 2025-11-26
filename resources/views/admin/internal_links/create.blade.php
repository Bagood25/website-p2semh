{{-- resources/views/admin/internal_links/create.blade.php --}}
@extends('layouts.admin')

@section('content')
<div class="container mx-auto px-4 py-8">
    <h1 class="text-3xl font-bold mb-6 text-gray-800">Tambah Tautan Internal Baru</h1>

    <div class="bg-white shadow-lg rounded-lg p-8">
        <form action="{{ route('admin.internal-links.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            @include('admin.internal_links._form', ['internalLink' => new \App\Models\InternalLink()])
        </form>
    </div>
</div>
@endsection