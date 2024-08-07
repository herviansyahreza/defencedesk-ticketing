import React, { useEffect, useState } from 'react';
import classNames from 'classnames';
import { DASHBOARD_SIDEBAR_LINKS } from '../../lib/consts/navigation';
import { Link, useLocation } from 'react-router-dom';
import { HiOutlineLogout } from 'react-icons/hi';
import LogoDefenceDesk from '../../components/DefenceTicketingLogo.png';
import {jwtDecode} from 'jwt-decode'; // Perubahan disini, gunakan jwtDecode

const linkClass = 'flex items-center gap-2 font-light px-3 py-2 hover:bg-neutral-600 hover:no-underline active:bg-neutral-600 rounded-sm text-base';

const Sidebar = ({ userRole }) => {
    const [decodedToken, setDecodedToken] = useState(null); // State untuk menyimpan token yang telah didekode

    useEffect(() => {
        const token = localStorage.getItem('accessToken');
        if (token) {
            const decoded = jwtDecode(token);
            setDecodedToken(decoded);
        }
    }, []);

    const getLinksByRole = (role) => {
        switch (role) {
            case 1: // Ubah ke integer karena di filter berdasarkan integer
                // Pengguna biasa
                return DASHBOARD_SIDEBAR_LINKS.filter(item => item.roles.includes(1));
            case 2:
                // Teknisi
                return DASHBOARD_SIDEBAR_LINKS.filter(item => item.roles.includes(2));
            case 3:
                // Admin
                return DASHBOARD_SIDEBAR_LINKS.filter(item => item.roles.includes(3));
            default:
                return [];
        }
    };

    // Filter links berdasarkan peran pengguna yang telah didekode dari token
    const filteredLinks = decodedToken ? getLinksByRole(decodedToken.peran) : [];

    return (
        <div className='bg-neutral-700 w-65 flex flex-col text-white pr-8'>
            <div className='flex items-center gap-3 px-4 py-3'>
                <img className="mx-auto h-10 w-auto" src={LogoDefenceDesk} alt="LogoDefenceDesk" />
                <span className='text-neutral-100 text-lg font-bold'>DefenceDesk</span>
            </div>
            <div className='py-10 flex flex-1 flex-col gap-0.5 pt-2 border-t border-neutral-600'>
                {/* Render sidebar links */}
                {filteredLinks.map(item => (
                    <SidebarLink key={item.key} item={item} />
                ))}
            </div>
            {/* Contoh bagian bawah sidebar */}
            {/* <div className="flex flex-col gap-0.5 pt-2 border-t border-neutral-600">
                <div className="text-red-500 cursor-pointer">
                    <span className='text-xl'>
                        <HiOutlineLogout />
                    </span>
                    Logout
                </div>
            </div> */}
        </div>
    );
};

const SidebarLink = ({ item }) => {
    const { pathname } = useLocation();

    return (
        <Link to={item.path} className={classNames(
            pathname === item.path ? 'bg-neutral-700 text-white' : 'text-neutral-400',
            linkClass
        )}>
            <span className='text-xl'>{item.icon}</span>
            {item.label}
        </Link>
    );
};

export default Sidebar;
