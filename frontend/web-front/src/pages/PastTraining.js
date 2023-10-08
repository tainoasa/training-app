import React from 'react'
import styles from './PastTraining.module.css';

const PastTraining = () => {

    const test_data =
        [

            {
                "training_menu": "ベンチプレス",
                "training_weight": "30",
                "training_times": "6",
                "training_set": "3"
            },

            {
                "training_menu": "ベンチプレス",
                "training_weight": "40",
                "training_times": "4",
                "training_set": "3"
            }

        ];

    return (
        <div className={styles.Past}>
            <h2 className={styles.PastTitle}>
                過去のトレーニング
            </h2>
            <table border={1} className={styles.PastTable}>
                <thead>
                    <tr>
                        <th>トレーニングメニュー</th>
                        <th>重量［kg］</th>
                        <th>回数</th>
                        <th>セット</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>トレーニング</td>
                        <td>重さ</td>
                        <td>カウント</td>
                        <td>セット</td>
                    </tr>
                </tbody>
            </table>
        </div>
    )
}

export default PastTraining