import React, { useEffect, useState } from "react";
import axios, { AxiosInstance } from "axios";

type Training = {
  id: string;
  training_name: String;
  training_parts: String;
  training_movie: String;
};

const TrainingList = () => {
  const [trainingList, setTrainingList] = useState<Training[]>([]);

  // let instance: AxiosInstance;

  useEffect(() => {
    getAPIData();
  }, []);

  const getAPIData = async () => {
    let instance: AxiosInstance;

    instance = axios.create({
      baseURL: "http://localhost:8080",
    });

    try {
      const response = await instance.get("/api/training_list/");
      console.log(response?.data);
      const data = response?.data as Training[];
      for (let i = 0; i < data.length; i++) {
        // data[i].id = i.toString();
        let url: string = data[i].training_movie.toString();
        data[i].training_movie = url.replace("youtu.be", "youtube.com/embed");
      }
      setTrainingList(data);
    } catch (error) {
      console.log(error);
    }
  };

  const style = {
    width: "560px",
    margin: "0 auto",
    // marginTop: "100px"
  }

  // getAPIData();

  return (
    <div className="wrapper">
      <div id="training-parts-list" style={{
        position: "fixed",
        background: "#eee",
        width: "300px",
        height: "100%",
        marginTop: "-200px",
        paddingTop: "200px",
        paddingLeft: "20px",
        // top: "-00px",
        // boxSizing: "border-box",
        // marginLeft: "220px",
        // padding: "20px 40px",
      }}>
        <h3>部位別メニュー</h3>
        <ul>
          <li><a href="#肩">肩</a></li>
          <li><a href="#胸">胸</a></li>
          <li><a href="#腕">腕</a></li>
          <li><a href="#腹">腹</a></li>
          <li><a href="#背中">背中</a></li>
          <li><a href="#脚">脚</a></li>
        </ul>
      </div>
      <div style={style}>
        {['肩', '胸', '腕', '腹', '背中', '脚'].map((part) => (
          <>
            <h1 id={part} style={{ marginTop: "100px" }}>{part}のトレーニング</h1>
            {trainingList.map((item) => {
              if (item.training_parts == part) {
                return (
                  <div key={item.id} id={item.id} style={{ marginTop: "20px" }}>
                    <h2>{item.training_name}</h2>
                    {/* <p>部位：{item.training_parts}</p> */}
                    <iframe
                      width="560"
                      height="315"
                      src={item.training_movie.toString()}
                      title="YouTube video player"
                      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                      allowFullScreen
                    ></iframe>
                  </div>)
              }
            })}
          </>
        ))}
      </div>
      {/* <div>
      {trainingList.map((item) => (
        <div key={item.id} id={item.id}>
        <h1>{item.training_name}</h1>
        <p>部位：{item.training_parts}</p>
        <iframe
          width="560"
          height="315"
          src={item.training_movie.toString()}
          title="YouTube video player"
          frameBorder="0"
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
          allowFullScreen
        ></iframe>
      </div>
      ))}
    </div> */}
    </div>
  );
};

export default TrainingList;
