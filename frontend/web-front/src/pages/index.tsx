import React, { FC, useEffect, useState } from 'react'
import axios, { AxiosInstance } from 'axios'
import ReTraining from './ReTraining';
import ExperienceGauge from './ExperienceGauge';
import styles from './index.module.css';
import PastTraining from './PastTraining';

export default (() => {
  const [expoint, setExpoint] = useState();
  const [level, setLevel] = useState();

  return (
    <div className={styles.grid_container}>
      <div className={styles.Table}>
        <ReTraining expoint={expoint} setExpoint={setExpoint} level={level} setLevel={setLevel} />
      </div>
      <div className={styles.Status}>
        <ExperienceGauge expoint={expoint} setExpoint={setExpoint} level={level} setLevel={setLevel} />
      </div>
      <div className={styles.Past}>
        <PastTraining />
      </div>
    </div>
  )
}) as FC