import React, { FC, useEffect, useState } from 'react'
import axios, { AxiosInstance } from 'axios'
import ReTraining from './ReTraining';
import ExperienceGauge from './ExperienceGauge';
import styles from './index.module.css';
import PastTraining from './PastTraining';

export default (() => {

    const getAPIData = async () => {
        let instance: AxiosInstance

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
        </div>
    )
}) as FC
