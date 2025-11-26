<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\InternalLink;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class InternalLinkController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $internalLinks = InternalLink::latest()->paginate(10);
        return view('admin.internal_links.index', compact('internalLinks'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.internal_links.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'url' => 'required|url',
            'logo' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $logoPath = $request->file('logo')->store('internal_links_logos', 'public');

        InternalLink::create([
            'name' => $request->name,
            'url' => $request->url,
            'logo' => $logoPath,
        ]);

        return redirect()->route('admin.internal-links.index')->with('success', 'Tautan internal berhasil ditambahkan.');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(InternalLink $internalLink)
    {
        return view('admin.internal_links.edit', compact('internalLink'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, InternalLink $internalLink)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'url' => 'required|url',
            'logo' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $data = $request->only('name', 'url');

        if ($request->hasFile('logo')) {
            // Hapus logo lama
            if ($internalLink->logo) {
                Storage::disk('public')->delete($internalLink->logo);
            }
            // Simpan logo baru
            $data['logo'] = $request->file('logo')->store('internal_links_logos', 'public');
        }

        $internalLink->update($data);

        return redirect()->route('admin.internal-links.index')->with('success', 'Tautan internal berhasil diperbarui.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(InternalLink $internalLink)
    {
        if ($internalLink->logo) {
            Storage::disk('public')->delete($internalLink->logo);
        }
        $internalLink->delete();

        return redirect()->route('admin.internal-links.index')->with('success', 'Tautan internal berhasil dihapus.');
    }
}