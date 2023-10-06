<<<<<<< HEAD
import React, { FC, useEffect, useState } from 'react'
import axios, { AxiosInstance } from 'axios'
import ReTraining from './ReTraining';
import ExperienceGauge from './ExperienceGauge';
import styles from './index.module.css';
import PastTraining from './PastTraining';

export default (() => {
=======
import logo from "./logo.svg";
// import "../menu.css";
import kinniku from "../筋肉.png";
import React, { FC, useEffect, useState } from "react";
import axios, { AxiosInstance } from "axios";

type Todo = {
  id: string;
  title: String;
  body: String;
};

export default (() => {
  //   const [todos, setTodo] = useState<Todo[]>([]);
  const [query, setQuery] = useState<string>("");
  const [text, setText] = useState<string>(
    "こんにちは! 私はAIジムトレーナーのマッスル木村です。" +
      "食事、サプリメント、筋力トレーニングに関してなんでも質問してくださいね！"
  );
>>>>>>> d-branch

  const handleChange = (e) => {
    setQuery(() => e.target.value);
    console.log(query);
  };

<<<<<<< HEAD
        instance = axios.create({
            baseURL: 'http://localhost:8080',
        })
    }
    return (
        <div className={styles.grid_container}>
            <div className={styles.Table}>
                <ReTraining />
            </div>
            <div className={styles.Status}>
                <ExperienceGauge level={7} n={1000} />
            </div>
            <div className={styles.Past}>
                <PastTraining />
            </div>
=======
  const getAPIData = async () => {
    let instance: AxiosInstance;

    instance = axios.create({
      // baseURL: "https://zipcloud.ibsnet.co.jp",
      baseURL: "http://localhost:8080",
    });

    try {
      // const response = await instance.get("/api/search?zipcode=" + query);
      const response = await instance.post("/api/chat/", { text: query });
      console.log(response?.data);
      const tododata = response?.data.text as string;
      // const tododata = response?.data.results[0].address1 as string;
      setText(tododata);
      console.log(text);
    } catch (error) {
      console.log(error);
    }
  };
  return (
    <>
      <header>
        <div className="menu-list">
          <img src="logo.png" alt="ロゴ" />
          <h1> AIトレーニングジム</h1>
          {/* <h1> AIトレーニングジム - In good shape - </h1> */}
          <img src="logo.png" alt="ロゴ" />
>>>>>>> d-branch
        </div>
        <nav>
          <div className="nav_btns">
            <button id="btnScreen1" className="nav_btn">
              ホーム
            </button>
            <button id="btnScreen2" className="nav_btn">
              トレーニング
            </button>
            <button id="btnScreen3" className="nav_btn">
              一覧
            </button>
          </div>
        </nav>
      </header>
      <main>
        <form action="#" method="post">
          <p className="text">テキストを入力:</p>
          <input
            onChange={handleChange}
            type="text"
            name="comment"
            size={50}
            autoComplete="off"
            placeholder="（例）野球で速球を投げれるようになりたい"
          />
          <button onClick={getAPIData}>Post</button>
        </form>

        <div className="ai">
          <div className="trainning-menu">
            <img src="筋肉.png" alt="筋肉" />
          </div>

          <div className="set">
            <div className="today">
              <p>Today's Trainning Menu ...</p>
            </div>
            <div className="arrow_box">{text}</div>
            <div className="image-trainner">
              <img src="gym_trainner.gif" alt="トレーナー" />
              <p>マッスル木村</p>
            </div>
          </div>
        </div>

        <div className="history"></div>
      </main>

      <footer>Copyright © 2023 Team-Tokumori.</footer>
    </>
  );
}) as FC;
