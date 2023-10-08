import React from 'react'
import { useEffect, useState, useRef } from "react";
import { v4 as uuidv4 } from "uuid";
import LastTrainingDay from './LastTrainingDay';

const ReTraining = (props) => {
    const [training_name, setTraining_name] = useState();
    const [weight, setWeight] = useState();
    const [count, setCount] = useState();
    const [set, setSet] = useState();
    const [training_menu, setTraining_menu] = useState([{ id: uuidv4() }]);
    const [clonedTableData, setClonedTableData] = useState([]);
    const buttonRef = useRef(null);

    // 本日の成果に追加
    const currentTraining = () => {
        setTraining_menu([...training_menu, { training_name: training_name, weight: weight, count: count, set: set }])
    };
    // ボタンをクリックしたときにテーブルを複製
    const handleCloneTable = () => {
        setClonedTableData([...training_menu]); // データを単純に複製
    };
    // クローンテーブルを一括削除する関数
    const handleDeleteClonedTable = () => {
        setClonedTableData([]); // 空の配列に設定して削除
    };

    useEffect(() => {
        // ページが読み込まれた瞬間にボタンをクリックする
        if (buttonRef.current) {
            buttonRef.current.click();
        }
    }, []);
    return (
        <div>
            <div>
                <h2>トレーニングを入力</h2>
                <table border="1">
                    <thead>
                        <tr>
                            <th>トレーニングメニュー</th>
                            <th colSpan={3}>回数情報を入力</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <input type="text" size={25} value={training_name} onChange={(e) => setTraining_name(e.target.value)} />
                            </td>
                            <td>
                                <input type="text" size={3} value={weight} onChange={(e) => setWeight(e.target.value)} /> [kg]
                            </td>
                            <td>
                                <input type="text" size={2} value={count} onChange={(e) => setCount(e.target.value)} /> ［回］
                            </td>
                            <td>
                                <input type="text" size={2} value={set} onChange={(e) => setSet(e.target.value)} />［セット］
                            </td>
                        </tr>
                    </tbody>
                </table>
                <button onClick={currentTraining}>リストに追加</button>
            </div>

            <div>
                <h2>本日の成果</h2>
                <table border={1}>
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
                        {training_menu.map((menu) => (
                            <tr key={menu.id}>
                                <td>{menu.training_name}</td>
                                <td>{menu.weight}</td>
                                <td>{menu.count}</td>
                                <td>{menu.set}</td>
                                <td>{<button id="obj_delete_btn" ref={buttonRef} onClick={() => setTraining_menu(training_menu.filter((n) => (n !== menu)))}>削除</button>}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
                <button onClick={handleCloneTable} className={styles.TableButton}>登録</button>
            </div>

            {/* <div className={styles.item3}>
        <h2 className={styles.TableName}>過去のトレーニング</h2>
        <table border={1} className={styles.Table}>
          <thead>
            <tr>
              <th>トレーニングメニュー</th>
              <th>重さ［kg］</th>
              <th>回数</th>
              <th>セット</th>
            </tr>
          </thead>
          <tbody>
            {clonedTableData.map((item) => (
              <tr key={item.id}>
                <td>{item.training_name}</td>
                <td>{item.weight}</td>
                <td>{item.count}</td>
                <td>{item.set}</td>
              </tr>
            ))}
          </tbody>
        </table>
        <button onClick={handleDeleteClonedTable} className={styles.TableButton}>削除</button>
      </div> */}
        </div>
    )
}

export default ReTraining