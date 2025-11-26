{{-- resources/views/admin/internal_links/_form.blade.php --}}
@if ($errors->any())
    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">
        <strong class="font-bold">Oops!</strong>
        <span class="block sm:inline">Ada beberapa masalah dengan input Anda.</span>
        <ul class="mt-3 list-disc list-inside">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<div class="mb-6">
    <label for="name" class="block text-gray-700 text-sm font-bold mb-2">Nama Tautan:</label>
    <input type="text" name="name" id="name" value="{{ old('name', $internalLink->name ?? '') }}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" required>
</div>

<div class="mb-6">
    <label for="url" class="block text-gray-700 text-sm font-bold mb-2">URL (Alamat Situs):</label>
    <input type="url" name="url" id="url" value="{{ old('url', $internalLink->url ?? '') }}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" required placeholder="https://example.com">
</div>

<div class="mb-6">
    <label for="logo" class="block text-gray-700 text-sm font-bold mb-2">Logo:</label>
    <input type="file" name="logo" id="logo" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
    @if(isset($internalLink) && $internalLink->logo)
        <div class="mt-4">
            <p class="text-gray-600">Logo Saat Ini:</p>
            <img src="{{ asset('storage/' . $internalLink->logo) }}" alt="Logo saat ini" class="mt-2 w-32 h-32 object-contain border p-2 rounded">
        </div>
    @endif
</div>

<div class="flex items-center justify-start mt-8">
    <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-6 rounded focus:outline-none focus:shadow-outline">
        Simpan
    </button>
    <a href="{{ route('admin.internal-links.index') }}" class="ml-4 inline-block align-baseline font-bold text-sm text-gray-600 hover:text-gray-800">
        Batal
    </a>
</div>