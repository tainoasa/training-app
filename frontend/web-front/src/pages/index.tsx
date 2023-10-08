import React, { FC, useEffect, useState } from 'react'
import axios, { AxiosInstance } from 'axios'
import ReTraining from './ReTraining';
import ExperienceGauge from './ExperienceGauge';
import styles from './index.module.css';
import PastTraining from './PastTraining';

export default (() => {
  // テーブルコンポーネントと，ゲージコンポーネントで共有
  const [expoint, setExpoint] = useState();
  const [level, setLevel] = useState();

  // テーブルコンポーネントと，過去トレーニングで共有
  const [past_menu, setPast_menu] = useState("");
  const [past_weight, setPast_Weight] = useState("");
  const [past_times, setPast_Times] = useState("");
  const [past_set, setPast_Set] = useState("");
  const [past_package, setPast_package] = useState([]);

  return (
    <div className={styles.grid_container}>
      <div className={styles.Table}>
        <ReTraining expoint={expoint} setExpoint={setExpoint} level={level} setLevel={setLevel}
          past_menu={past_menu} setPast_menu={setPast_menu} past_weight={past_weight} setPast_Weight={setPast_Weight}
          past_times={past_times} setPast_Times={setPast_Times} past_set={past_set} setPast_Set={setPast_Set}
          past_package={past_package} setPast_package={setPast_package} />
      </div>
      <div className={styles.Status}>
        <ExperienceGauge expoint={expoint} setExpoint={setExpoint} level={level} setLevel={setLevel} />
      </div>
      <div className={styles.Past}>
        <PastTraining
          past_menu={past_menu} setPast_menu={setPast_menu} past_weight={past_weight} setPast_Weight={setPast_Weight}
          past_times={past_times} setPast_Times={setPast_Times} past_set={past_set} setPast_Set={setPast_Set}
          past_package={past_package} setPast_package={setPast_package} />
      </div>
    </div>
  )
}) as FC