import React from 'react'
import { useEffect, useState, useRef } from "react";
import axios, { AxiosInstance } from "axios";
import { v4 as uuidv4 } from "uuid";
import styles from './ReTraining.module.css';
import LastTrainingDay from './LastTrainingDay';
import ExperienceGauge from './ExperienceGauge';


const ReTraining = ({ expoint, setExpoint, level, setLevel, past_menu, setPast_menu, past_weight, setPast_Weight, past_times, setPast_Times,
    past_set, setPast_Set, past_package, setPast_package }) => {
    const [training_menu, setTraining_menu] = useState("");
    const [training_weight, setWeight] = useState("");
    const [training_times, setCount] = useState("");
    const [training_set, setSet] = useState("");
    const [training_package, setTraining_package] = useState([]);
    const button1Ref = useRef(null);
    const button2Ref = useRef(null);

    // training_packageをJSON文字列に変換
    // const jsonData = JSON.stringify(training_package);

    // 本日の成果に追加
    const currentTraining = () => {
        setTraining_package([...training_package, { training_menu: training_menu, training_weight: training_weight, training_times: training_times, training_set: training_set }])
    };

    // calcとの通信
    const getAPIData = async () => {
        // エンドポイントを指定
        const endPoint: string = 'http://localhost:8080/api/calc/'
        // axios.post で POST メソッドを実行することを指示。
        // 第一引数にエンドポイント, 第二引数にリクエストボディを指定。
        axios.post(
            endPoint, training_package
        ).then(
            // then 以下で問題なくレスポンスが返ってきた際の挙動を記述
            (response) => {
                // TypeScriptの型指定は後ろに as をこのように付けることでも可能。
                const JSON = response.data;
                const fields = JSON.fields;
                setExpoint(fields.ex_parameter);
                setLevel(fields.user_level);
            }
        ).catch(
            // catch 以下では問題があった際の挙動を記述
            () => {
                alert('エラーが発生しました。')
            }
        )
    };

    const [trainingList, setTrainingList] = useState([]);
    useEffect(() => {
        getHistoryData();
    }, []);

    // トレーニング履歴apiとの通信
    const getHistoryData = async () => {
        // エンドポイントを指定
        const endPoint: string = 'http://localhost:8080/api/add_training_history/'
        // axios.post で POST メソッドを実行することを指示。
        // 第一引数にエンドポイント, 第二引数にリクエストボディを指定。
        axios.post(
            endPoint, training_package
        ).then(
            // then 以下で問題なくレスポンスが返ってきた際の挙動を記述
            (response) => {
                // TypeScriptの型指定は後ろに as をこのように付けることでも可能。
                const JSON_LIST = response.data;
                JSON_LIST.forEach(item => {
                    setPast_menu(item.fields.training_menu)
                    setPast_Weight(item.fields.training_weight)
                    setPast_Times(item.fields.training_times)
                    setPast_Set(item.fields.training_set)
                })
            }
        ).catch(
            // catch 以下では問題があった際の挙動を記述
            () => {
                alert('エラーが発生しました。')
            }
        )
    };

    useEffect(() => {
        // ページが読み込まれた瞬間にボタンをクリックする
        if (button1Ref.current) {
            button1Ref.current.click();
        }
        if (button2Ref.current) {
            button2Ref.current.click();
        }

    }, []);

    return (
        <div className={styles.TrainingTabeleContainer}>
            <button onClick={getHistoryData}>テストAPI</button>
            <h1 className={styles.message}>
                今日のトレーニングを記録！
            </h1>
            <div className={styles.item1}>
                <h2 className={styles.TableName1}>トレーニングを入力</h2>
                <table border={1} className={styles.Table1}>
                    <thead>
                        <tr>
                            <th className={styles.th}>トレーニングメニュー</th>
                            <th className={styles.th} colSpan={3}>回数情報を入力</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <input type="text" size={25} value={training_menu} onChange={(e) => setTraining_menu(e.target.value)} className={styles.input1} />
                            </td>
                            <td>
                                <input type="number" size={3} value={training_weight} onChange={(e) => setWeight(e.target.value)} className={styles.input2} /> [kg]
                            </td>
                            <td>
                                <input type="number" size={2} value={training_times} onChange={(e) => setCount(e.target.value)} className={styles.input3} /> ［回］
                            </td>
                            <td>
                                <input type="number" size={2} value={training_set} onChange={(e) => setSet(e.target.value)} className={styles.input4} />［セット］
                            </td>
                        </tr>
                    </tbody>
                </table>
                <button onClick={currentTraining} className={styles.TableButton}>リストに追加</button>
            </div>

            <div className={styles.item2}>
                <h2 className={styles.TableName2}>本日の成果</h2>
                <table border={1} className={styles.Table2}>
                    <thead>
                        <tr>
                            <th>トレーニングメニュー</th>
                            <th>重量［kg］</th>
                            <th>回数</th>
                            <th>セット</th>
                            <th>　　</th>
                        </tr>
                    </thead>
                    <tbody>
                        {training_package.map((menu) => (
                            <tr key={menu.id}>
                                <td>{menu.training_menu}</td>
                                <td>{menu.training_weight}</td>
                                <td>{menu.training_times}</td>
                                <td>{menu.training_set}</td>
                                <td>{<button id="obj_delete_btn" ref={button1Ref} onClick={() => setTraining_package(training_package.filter((n) => (n !== menu)))}>削除</button>}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
                <button ref={button2Ref} onClick={getAPIData} className={styles.TableButton}>登録</button>
            </div>
        </div>
    )
}

export default ReTraining