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
