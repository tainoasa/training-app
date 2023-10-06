import React from 'react'
import { useRouter } from "next/router";
import Link from 'next/link';

const Navigation = () => {
    return (
        <div>
            <header>
                <div className="menu-list">
                    <img src="logo.png" alt="ロゴ" />
                    <h1> AIトレーニングジム</h1>
                    <img src="logo.png" alt="ロゴ" />
                </div>

                <nav className="nav_btns">
                    <Link href="/">
                        <button id="btnScreen1" className="nav_btn">ホーム</button>
                    </Link>

                    <Link href="Screen2">
                        <button id="btnScreen2" className="nav_btn">トレーニング</button>
                    </Link>

                    <Link href="Screen3">
                        <button id="btnScreen3" className="nav_btn">一覧</button>
                    </Link>
                </nav>
            </header>
        </div>
    )
}

export default Navigation