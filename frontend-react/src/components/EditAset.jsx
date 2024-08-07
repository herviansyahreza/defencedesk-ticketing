import React, { useState, useEffect}from 'react'
import { PhotoIcon } from '@heroicons/react/20/solid'
import { useNavigate, useParams} from 'react-router-dom'
import axios from 'axios'
import {jwtDecode} from 'jwt-decode'

export default function EditAset() {
    const navigate = useNavigate();
    const { id } = useParams();
    const [formData, setFormData] = useState({
        id: '', 
        nama: '',
        kategori: '',
        lokasi: '',
    });

    const [lokasi, setLokasi] = useState([]);
    const [kategori, setKategori] = useState([]);
    useEffect(() => {
        // Mengambil daftar lokasi dari backend
        const fetchLokasi = async () => {
            try {
                const response = await axios.get('http://172.16.1.251:5001/getLokasi');
                setLokasi(response.data);
            } catch (error) {
                console.error('Error fetching lokasi:', error);
            }
        };

        // Mengambil daftar kategori dari backend
        const fetchKategori = async () => {
            try {
                const response = await axios.get('http://172.16.1.251:5001/getKategori');
                setKategori(response.data);
            } catch (error) {
                console.error('Error fetching kategori:', error);
            }
        };

        fetchLokasi();
        fetchKategori();
    }, []);

    useEffect(() => {
        const token = localStorage.getItem('accessToken');
        if (!token) {
            navigate('/login');
            return;
        }

        try {
            const decodedToken = jwtDecode(token);
            const role = decodedToken.peran;
            if (role !== 1) {
                alert('Hanya admin yang bisa mengakses halaman ini.');
                navigate('/unauthorized');
                return;
            }

            // Mengambil data aset yang akan diubah berdasarkan ID
            axios.get(`http://172.16.1.251:5001/get_aset/${id}`)
                .then(response => {
                    setFormData(response.data);
                })
                .catch(error => {
                    console.error('Error fetching aset data:', error);
                    alert('Terjadi kesalahan saat mengambil data aset yang akan diubah');
                });

        } catch (error) {
            console.error('Error decoding token:', error);
            navigate('/login');
        }
    }, [id, navigate]);

    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    const handleSubmit = async (event) => {
        event.preventDefault();
        const newData = {
            id: id,
            nama: formData.nama,
            kategori: formData.kategori,
            lokasi: formData.lokasi,
        };

        try {
            const response = await axios.put(`http://172.16.1.251:5001/edit_aset/${id}`, newData);
            console.log(response);
            if (response.status === 200 || response.status === 201) {
                // Edit berhasil
                navigate('/aset');
                alert('Edit aset berhasil');
            } else {
                // Edit gagal
                alert('Edit aset gagal');
            }
        } catch (error) {
            // Menangani kesalahan dengan lebih rinci
            if (error.response) {
                console.error('Error response:', error.response.data);
                alert('Submit form gagal: ' + error.response.data.message);
            } else if (error.request) {
                console.error('Error request:', error.request);
                alert('Terjadi kesalahan saat mengirimkan permintaan');
            } else {
                console.error('Error:', error.message);
                alert('Terjadi kesalahan: ' + error.message);
            }
        }
    };

    return (
        <form onSubmit={handleSubmit}>
        <div className="space-y-12">
            <div className="border-b border-gray-900/10 pb-12">
            <h2 className="text-base font-semibold leading-7 text-gray-900">Formulir Aset</h2>
            <p className="mt-1 text-sm leading-6 text-gray-600">
                Isi sesuai dengan aset yang akan diubah.
            </p>

            <div className="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                <div className="sm:col-span-4">
                <label htmlFor="aset" className="block text-sm font-medium leading-6 text-gray-900">
                    Nama Aset
                </label>
                <div className="mt-2">
                    <div className="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                    <input
                        type="text"
                        name="nama"
                        id="nama"
                        autoComplete="nama"
                        value={formData.nama}
                        onChange={handleChange}
                        className="block flex-1 border-0 bg-transparent py-2 px-3 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                        placeholder="Nama Aset..."
                        required
                    />
                    </div>
                </div>
                </div>

                <div className="sm:col-span-4">
                <label htmlFor="lokasi" className="block text-sm font-medium leading-6 text-gray-900">
                    Kategori
                </label>
                <div className="mt-2">
                    <div className="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                    <select 
                        name="kategori" 
                        id="kategori" 
                        value={formData.kategori} 
                        onChange={handleChange} 
                        className="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        required
                    >
                        <option value="">Pilih Kategori Aset</option>
                            {kategori.map(kategori => (
                                <option key={kategori.id} value={kategori.nama}>
                                    {kategori.nama}
                                </option>
                            ))}
                    </select>
                    </div>
                </div>
                </div>

                <div className="sm:col-span-4">
                <label htmlFor="lokasi" className="block text-sm font-medium leading-6 text-gray-900">
                    Lokasi
                </label>
                <div className="mt-2">
                    <div className="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                    <select 
                        name="lokasi" 
                        id="lokasi" 
                        value={formData.lokasi} 
                        onChange={handleChange} 
                        className="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        required
                    >
                        <option value="">Pilih Lokasi Aset</option>
                            {lokasi.map(lokasi => (
                                <option key={lokasi.id} value={lokasi.nama}>
                                    {lokasi.nama}
                                </option>
                            ))}
                    </select>
                    </div>
                </div>
                </div>
                
                {/* <div className="col-span-full">
                <label htmlFor="about" className="block text-sm font-medium leading-6 text-gray-900">
                    Deskripsi Laporan
                </label>
                <div className="mt-2">
                    <textarea
                    id="laporan"
                    name="laporan"
                    rows={5}
                    className="block w-full rounded-md border-0 py-2 px-3 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                    defaultValue={''}
                    required
                    />
                </div>
                <p className="mt-3 text-sm leading-6 text-gray-600">Tulis laporan dengan lengkap.</p>
                </div> */}

                {/* <div className="col-span-full">
                <label htmlFor="photo" className="block text-sm font-medium leading-6 text-gray-900">
                    Photo
                </label>
                <div className="mt-2 flex items-center gap-x-3">
                    <UserCircleIcon className="h-12 w-12 text-gray-300" aria-hidden="true" />
                    <button
                    type="button"
                    className="rounded-md bg-white px-2.5 py-1.5 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
                    >
                    Change
                    </button>
                </div>
                </div> */}

                {/* <div className="col-span-full">
                <label htmlFor="cover-photo" className="block text-sm font-medium leading-6 text-gray-900">
                    Lampiran Foto
                </label>
                <div className="mt-2 flex justify-center rounded-lg border border-dashed border-gray-900/25 px-6 py-10">
                    <div className="text-center">
                    <PhotoIcon className="mx-auto h-12 w-12 text-gray-300" aria-hidden="true" />
                    <div className="mt-4 flex text-sm leading-6 text-gray-600">
                        <label
                        htmlFor="file-upload"
                        className="relative cursor-pointer rounded-md bg-white font-semibold text-indigo-600 focus-within:outline-none focus-within:ring-2 focus-within:ring-indigo-600 focus-within:ring-offset-2 hover:text-indigo-500"
                        >
                        <span>Upload a file</span>
                        <input id="file-upload" name="file-upload" type="file" className="sr-only" />
                        </label>
                        <p className="pl-1">or drag and drop</p>
                    </div>
                    <p className="text-xs leading-5 text-gray-600">PNG, JPG, GIF up to 10MB</p>
                    </div>
                </div>
                <p className="mt-3 text-sm leading-6 text-gray-600">Lampirkan foto aset yang akan ditambahkan (jika ada).</p>
                </div> */}
            </div>

            <div className="flex justify-end items-center">
                <button
                type="submit"
                className="flex justify-center items-center m-8 rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-700 cursor-pointer"
                >
                Submit Edit Form
                </button>
                </div>
            </div>
        </div>
    </form>
    );
}
