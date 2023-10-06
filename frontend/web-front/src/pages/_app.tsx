<<<<<<< HEAD
import { AppProps } from 'next/app';
import Layout from './Layout';
import './app.css';

function TrainingApp({ Component, pageProps }: AppProps) {
  // 共通のレイアウトやコンポーネントをここで設定
  return (
    <Layout>
      <Component {...pageProps} />
    </Layout>
  );
}
export default TrainingApp;
=======
import React from "react";
import "../menu.css";
// import LayoutMain from '../layouts/LayoutMain'

function App({ Component, pageProps }) {
  return (
    <div>
      <Component {...pageProps} />
    </div>
  );
}
export default App;
>>>>>>> d-branch
