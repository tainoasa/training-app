import React from 'react'
import styles from './PastTraining.module.css';

const PastTraining = ({ past_menu, setPast_menu, past_weight, setPast_Weight, past_times, setPast_Times,
    past_set, setPast_Set, past_package, setPast_package }) => {

    return (
        <div className={styles.Past}>
            {/* <h2 className={styles.PastTitle}>
                過去のトレーニング
            </h2> */}
            {/* <table border={1} className={styles.Table2}>
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
                    {past_package.map((menu) => (
                        <tr key={menu.id}>
                            <td>{menu.training_menu}</td>
                            <td>{menu.training_weight}</td>
                            <td>{menu.training_times}</td>
                            <td>{menu.training_set}</td>
                        </tr>
                    ))}
                </tbody>
            </table> */}
        </div >
    )
}

export default PastTraining