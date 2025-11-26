<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - @yield('title', 'Dashboard')</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap');
        body { font-family: 'Inter', sans-serif; }
    </style>
</head>
<body class="bg-gray-100">

    <div class="flex h-screen bg-gray-200">
        {{-- Sidebar --}}
        <div class="w-64 bg-gray-800 text-white flex-shrink-0 flex flex-col">
            <div class="h-16 flex items-center justify-center text-xl font-bold border-b border-gray-700">
                Admin Panel
            </div>

            <nav class="flex-grow p-4">
                <ul class="space-y-2">
                    <li>
                        <a href="{{ route('admin.berita.index') }}" class="flex items-center space-x-3 px-4 py-2 rounded-lg hover:bg-gray-700 transition duration-200 {{ request()->routeIs('admin.berita.*') ? 'bg-gray-700' : '' }}">
                            <i class="fas fa-fw fa-newspaper"></i>
                            <span>Manajemen Berita</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="{{ route('admin.photos.index') }}" class="flex items-center space-x-3 px-4 py-2 rounded-lg hover:bg-gray-700 transition duration-200 {{ request()->routeIs('admin.photos.*') ? 'bg-gray-700' : '' }}">
                            <i class="fas fa-fw fa-images"></i>
                            <span>Galeri Foto</span>
                        </a>
                    </li>

                    {{-- Menu Download --}}
                    <li>
                        <a href="{{ route('admin.downloads.index', ['kategori' => 'peraturan']) }}" class="flex items-center space-x-3 px-4 py-2 rounded-lg hover:bg-gray-700 transition duration-200 {{ request()->is('admin/downloads*') ? 'bg-gray-700' : '' }}">
                            <i class="fas fa-fw fa-gavel"></i>
                            <span>Kelola Unduhan</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="{{ route('admin.agenda.index') }}" class="flex items-center space-x-3 px-4 py-2 rounded-lg hover:bg-gray-700 transition duration-200 {{ request()->routeIs('admin.agenda.*') ? 'bg-gray-700' : '' }}">
                            <i class="fas fa-fw fa-calendar-alt"></i>
                            <span>Manajemen Agenda</span>
                        </a>
                    </li>

                    <li>
                        <a href="{{ route('admin.videos.index') }}" class="flex items-center space-x-3 px-4 py-2 rounded-lg hover:bg-gray-700 transition duration-200 {{ request()->routeIs('admin.videos.*') ? 'bg-gray-700' : '' }}">
                            <i class="fas fa-fw fa-video"></i>
                            <span>Manajemen Video</span>
                        </a>
                    </li>
                    
                    {{-- Menu Manajemen Admin --}}
                    <li>
                        <a href="{{ route('admin.users.index') }}" class="flex items-center space-x-3 px-4 py-2 rounded-lg hover:bg-gray-700 transition duration-200 {{ request()->routeIs('admin.users.*') ? 'bg-gray-700' : '' }}">
                            <i class="fas fa-fw fa-users-cog"></i>
                            <span>Manajemen Admin</span>
                        </a>
                    </li>

                    <li>
                        <a href="{{ route('admin.partners.index') }}" class="flex items-center space-x-3 px-4 py-2 rounded-lg hover:bg-gray-700 transition duration-200 {{ request()->routeIs('admin.partners.*') ? 'bg-gray-700' : '' }}">
                            <i class="fas fa-fw fa-handshake"></i>
                            <span>Tautan Terkait</span>
                        </a>
                    </li>

                    <li>
                        <a href="{{ route('admin.internal-links.index') }}" class="flex items-center space-x-3 px-4 py-2 rounded-lg hover:bg-gray-700 transition duration-200 {{ request()->routeIs('admin.internal-links.*') ? 'bg-gray-700' : '' }}">
                        <i class="fas fa-fw fa-link"></i>
                        <span>Tautan Internal</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="{{ route('admin.analysis.index') }}" class="flex items-center space-x-3 px-4 py-2 rounded-lg hover:bg-gray-700 transition duration-200 {{ request()->routeIs('admin.analysis.*') ? 'bg-gray-700' : '' }}">
                            <i class="fas fa-fw fa-chart-bar"></i>
                            <span>Analisis Data</span>
                        </a>
                    </li>

                </ul>
            </nav>

            <div class="p-4 border-t border-gray-700">
                <div class="flex items-center mb-4">
                    <div class="w-10 h-10 rounded-full mr-3 bg-gray-600 flex items-center justify-center font-bold">
                        {{-- Mengambil inisial dari nama user --}}
                        @php
                            $nameParts = explode(' ', Auth::user()->name);
                            $initials = count($nameParts) > 1 
                                ? strtoupper(substr($nameParts[0], 0, 1) . substr(end($nameParts), 0, 1))
                                : strtoupper(substr($nameParts[0], 0, 2));
                        @endphp
                        {{ $initials }}
                    </div>
                    <div>
                        <p class="font-semibold">{{ Auth::user()->name }}</p>
                        <p class="text-xs text-gray-400">Administrator</p>
                    </div>
                </div>
                <a href="{{ route('logout') }}"
                   onclick="event.preventDefault(); document.getElementById('logout-form').submit();"
                   class="flex items-center justify-center space-x-2 w-full text-center px-4 py-2 rounded bg-red-600 hover:bg-red-700 transition duration-200">
                    <i class="fas fa-fw fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="hidden">
                    @csrf
                </form>
            </div>
        </div>

        {{-- Main Content --}}
        <main class="flex-1 overflow-y-auto p-6">
            @yield('content')
        </main>
    </div>

    @stack('scripts')

</body>
</html>