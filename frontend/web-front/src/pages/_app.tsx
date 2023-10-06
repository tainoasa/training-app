import { AppProps } from 'next/app';
import Layout from './Layout';
import './app.css';
import "../menu.css";

function TrainingApp({ Component, pageProps }: AppProps) {
  // 共通のレイアウトやコンポーネントをここで設定
  return (
    <Layout>
      <Component {...pageProps} />
    </Layout>
  );
}
export default TrainingApp;