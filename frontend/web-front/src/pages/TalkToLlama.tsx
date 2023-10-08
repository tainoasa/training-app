import React, { FC, useEffect, useState } from "react";
import axios, { AxiosInstance } from "axios";
import Link from 'next/link';

type Menu = {
    id: string;
    training_name: String;
};

const TalkToLlma = () => {
    const [menuList, setMenuList] = useState<Menu[]>([]);
    const [query, setQuery] = useState<string>("");

    const [text, setText] = useState<string>(
        "こんにちは! 私はAIジムトレーナーのマッスル木村です。" +
        "スポーツやフィットネスに関することは何でもお答えしますので、お気軽にご相談くださいね！"
    );

    const handleChange = (e) => {
        setQuery(() => e.target.value);
        console.log(query);
    };

    const getAPIData = async () => {
        let instance: AxiosInstance;

        instance = axios.create({
            // baseURL: "https://zipcloud.ibsnet.co.jp",
            baseURL: "http://localhost:8080",
        });

        try {
            setText("考え中です...");
            // const response = await instance.get("/api/search?zipcode=" + query);
            const response = await instance.post("/api/chat/", { text: query });
            console.log(response?.data);
            const textdata = response?.data.text as string;
            const menuListData = response?.data.menu as Menu[];
            // const tododata = response?.data.results[0].address1 as string;
            setText(textdata);
            setMenuList(menuListData);
            console.log(text);
        } catch (error) {
            console.log(error);
        }
    };

    return (
        <div className="wrapper">
            <main>
                <div className="post">
                    <p className="text">テキストを入力:</p>
                    <input
                        onChange={handleChange}
                        type="text"
                        name="comment"
                        size={50}
                        autoComplete="off"
                        placeholder="（例）野球で速球を投げれるようになりたい"
                    />
                    <button className="post" type="submit" onClick={getAPIData}>
                        post
                    </button>
                </div>

                <div className="ai">
                    <div className="trainning-menu">
                        <img src="筋肉.png" alt="筋肉" />
                    </div>

                    <div className="set">
                        <div className="today">
                            <p>アドバイス</p>
                        </div>
                        <div className="arrow_box">{text}</div>
                        <div className="image-trainner">
                            <img src="gym_trainner.gif" alt="トレーナー" />
                            <p>マッスル木村</p>
                        </div>
                    </div>
                </div>
                {/* <div className="recommend">
                    <p>目標</p>
                    <table>
                        <thead>
                            <tr>
                                <th>おすすめメニュー</th>
                                <th>内容</th>
                            </tr>
                        </thead>
                        <tbody>
                            {menuList.map((item) => (
                                <tr key={item.id}>
                                    <td><Link href={"/Screen3#" + item.id}>{item.training_name}</Link></td>
                                    <td>メニューを追加</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div> */}

                {/* </div>
          <table>
            <thead>
              <tr>
                <th>input_txt</th>
                <th>recommned menu</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              {recommned_list.map((item) => (
                <tr>
                  <td></td>
                  <div key={item.id}>
                    <td>{item.training_name}</td>
                  </div>
                  <td>メニューを追加</td>
                  <td>詳しくはココ</td>
                </tr>
              ))}
            </tbody>
              </table> */}
            </main >
        </div>
    )
}

export default TalkToLlma