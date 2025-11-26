{{-- resources/views/admin/internal_links/edit.blade.php --}}
@extends('layouts.admin')

@section('content')
<div class="container mx-auto px-4 py-8">
    <h1 class="text-3xl font-bold mb-6 text-gray-800">Edit Tautan Internal</h1>

    <div class="bg-white shadow-lg rounded-lg p-8">
        <form action="{{ route('admin.internal-links.update', $internalLink->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            @include('admin.internal_links._form')
        </form>
    </div>
</div>
@endsection