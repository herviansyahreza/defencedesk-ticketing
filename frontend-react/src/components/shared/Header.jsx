import React, { Fragment } from 'react'
import { Menu, Popover, Transition } from '@headlessui/react'
import { HiOutlineBell } from 'react-icons/hi'
import { useNavigate, useLocation } from 'react-router-dom'
import classNames from 'classnames'
import axios from 'axios'

export default function Header() {
	const navigate = useNavigate()

	const location = useLocation();

    const handleLogout = async () => {
        try {
            // Kirim permintaan ke endpoint logout
            const token = localStorage.getItem('accessToken');
            const response = await axios.post('http://172.16.1.251:5001/logout', null,{
				headers: {
					Authorization: `Bearer ${token}`
				}
			});

            // Handle respons dari server jika diperlukan
            if (response.status === 200) {
            // Hapus token dari local storage atau lakukan operasi logout lainnya
            localStorage.removeItem('refreshToken');
			localStorage.removeItem('accessToken');
            }
			alert('Logout Succesfully');
            // Redirect pengguna ke halaman login atau halaman lainnya jika diperlukan
            window.location.href = '/login';
        } catch (error) {
            // Tangani kesalahan jika terjadi
            console.error('Error during logout:', error);
            alert('Failed to logout. Please try again.');
        }
    };

	const handleProfile = () => {
		navigate('/profile')
	}

	const getPageTitle = (pathname) => {
        switch (pathname) {
            case '/':
                return 'Dashboard';
            case '/tiket':
                return 'Tiket';
			case '/tiket_byUser':
                return 'Tiket Saya';
            case '/form-tiket':
                return 'Buat Tiket';
            case '/edit-tiket/:id':
                return 'Edit Tiket';
            case '/aset':
                return 'Aset';
            case '/form-aset':
                return 'Buat Aset';
            case '/edit-aset/:id':
                return 'Edit Aset';
            case '/profile':
                return 'Profile';
            case '/users':
                return 'Users';
            case '/form-user':
                return 'Buat User';
            case '/edit-user/:id':
                return 'Edit User';
            case '/login':
                return 'Login';
            case '/register':
                return 'Register';
			case '/teknisi':
                return 'Teknisi';
			case '/history':
                return 'History';
			case '/report':
                return 'Summary Report';
			case '/solusi-populer':
				return 'Solusi Populer';
			case '/edit-tiket-user/:id':
				return 'Feedback Tiket';
			case '/form-tiket-user':
				return 'Buat Tiket';
            default:
                return '';
        }
    };

	return (
		<div className="bg-white h-16 px-4 flex items-center border-b border-gray-200 justify-between">
            <div className=" relative bg-white h-16 px-4 flex items-center border-b border-gray-200 justify-between">
                <h1 className="text-xl font-semibold text-gray-900">{getPageTitle(location.pathname)}</h1>
            </div>

			<div className="flex items-center gap-2 mr-2">
				{/* <Popover className="relative">
					{({ open }) => (
						<>
							<Popover.Button
								className={classNames(
									open && 'bg-gray-100',
									'group inline-flex items-center rounded-sm p-1.5 text-gray-700 hover:text-opacity-100 focus:outline-none active:bg-gray-100'
								)}
							>
								<HiOutlineChatAlt fontSize={24} />
							</Popover.Button>
							<Transition
								as={Fragment}
								enter="transition ease-out duration-200"
								enterFrom="opacity-0 translate-y-1"
								enterTo="opacity-100 translate-y-0"
								leave="transition ease-in duration-150"
								leaveFrom="opacity-100 translate-y-0"
								leaveTo="opacity-0 translate-y-1"
							>
								<Popover.Panel className="absolute right-0 z-10 mt-2.5 transform w-80">
									<div className="bg-white rounded-sm shadow-md ring-1 ring-black ring-opacity-5 px-2 py-2.5">
										<strong className="text-gray-700 font-medium">Messages</strong>
										<div className="mt-2 py-1 text-sm">This is messages panel.</div>
									</div>
								</Popover.Panel>
							</Transition>
						</>
					)}
				</Popover> */}
				{/* <Popover className="relative">
					{({ open }) => (
						<>
							<Popover.Button
								className={classNames(
									open && 'bg-gray-100',
									'group inline-flex items-center rounded-sm p-1.5 text-gray-700 hover:text-opacity-100 focus:outline-none active:bg-gray-100'
								)}
							>
								<HiOutlineBell fontSize={24} />
							</Popover.Button>
							<Transition
								as={Fragment}
								enter="transition ease-out duration-200"
								enterFrom="opacity-0 translate-y-1"
								enterTo="opacity-100 translate-y-0"
								leave="transition ease-in duration-150"
								leaveFrom="opacity-100 translate-y-0"
								leaveTo="opacity-0 translate-y-1"
							>
								<Popover.Panel className="absolute right-0 z-10 mt-2.5 transform w-80">
									<div className="bg-white rounded-sm shadow-md ring-1 ring-black ring-opacity-5 px-2 py-2.5">
										<strong className="text-gray-700 font-medium">Notifications</strong>
										<div className="mt-2 py-1 text-sm">This is notification panel.</div>
									</div>
								</Popover.Panel>
							</Transition>
						</>
					)}
				</Popover> */}
				<Menu as="div" className="relative">
					<div>
						<Menu.Button className="ml-2 bg-gray-800 flex text-sm rounded-full focus:outline-none focus:ring-2 focus:ring-neutral-400">
							<span className="sr-only">Open user menu</span>
							<div
								className="h-10 w-10 rounded-full bg-sky-500 bg-cover bg-no-repeat bg-center"
								style={{ backgroundImage: 'url("https://source.unsplash.com/80x80?face")' }}
							>
								<span className="sr-only"></span>
							</div>
						</Menu.Button>
					</div>
					<Transition
						as={Fragment}
						enter="transition ease-out duration-100"
						enterFrom="transform opacity-0 scale-95"
						enterTo="transform opacity-100 scale-100"
						leave="transition ease-in duration-75"
						leaveFrom="transform opacity-100 scale-100"
						leaveTo="transform opacity-0 scale-95"
					>
						<Menu.Items className="origin-top-right z-10 absolute right-0 mt-2 w-48 rounded-sm shadow-md p-1 bg-white ring-1 ring-black ring-opacity-5 focus:outline-none">
							<Menu.Item>
								{({ active }) => (
									<div
										onClick={handleProfile}
										className={classNames(
											active && 'bg-gray-100',
											'active:bg-gray-200 rounded-sm px-4 py-2 text-gray-700 cursor-pointer focus:bg-gray-200'
										)}
									>
										Your Profile
									</div>
								)}
							</Menu.Item>
							{/* <Menu.Item>
								{({ active }) => (
									<div
										onClick={() => navigate('/settings')}
										className={classNames(
											active && 'bg-gray-100',
											'active:bg-gray-200 rounded-sm px-4 py-2 text-gray-700 cursor-pointer focus:bg-gray-200'
										)}
									>
										Settings
									</div>
								)}
							</Menu.Item> */}
							<Menu.Item>
								{({ active }) => (
									<div onClick={handleLogout}
										className={classNames(
											active && 'bg-gray-100',
											'active:bg-gray-200 rounded-sm px-4 py-2 text-gray-700 cursor-pointer focus:bg-gray-200'
										)}
									>
										Sign out
									</div>
								)}
							</Menu.Item>
						</Menu.Items>
					</Transition>
				</Menu>
			</div>
		</div>
	)
}
