import React, { Component } from 'react';
import styles from './ExperienceGauge.module.css';

class ExperienceGauge extends Component {
    render() {
        // プログレスバーの最大値を計算
        const maxProgressValue = 3000 * Math.pow(1.5, this.props.level);

        // 進行値を計算
        const progressValue = (this.props.n / maxProgressValue) * 100;

        // レベルを表示
        const showlevel = this.props.level;

        return (
            <div className={styles.progressBarContainer}>
                <img src="level8.png" alt="カンガルー" className={styles.kangaroo} />
                <h2 className={styles.Status_h2}>経験値</h2>
                <div className={`progress ${styles.progressBar}`}>
                    <div
                        className={`progress-bar ${styles.progressBarValue}`}
                        role="progressbar"
                        style={{ width: `${progressValue}%` }}
                        aria-valuenow={progressValue}
                        aria-valuemin="0"
                        aria-valuemax="100"
                    >
                        {progressValue.toFixed(2)}%
                    </div>
                    <h3 className={styles.showlevel}>
                        レベル：{showlevel}
                    </h3>
                </div>
            </div>
        );
    }
}

export default ExperienceGauge;
