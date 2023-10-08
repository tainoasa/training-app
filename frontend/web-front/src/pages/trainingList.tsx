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

  ['肩', '胸'].map((part) => {
    trainingList.map((item) => {
      if (item.training_parts == part) {
        return (
          <div key={item.id} id={item.id}>
            <h1>{item.training_name}</h1>
            <p>部位：{item.training_parts}</p>
            <iframe
              width="560"
              height="315"
              src={item.training_movie.toString()}
              title="YouTube video player"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
              allowFullScreen
            ></iframe>
          </div>);
      }
    });
  })

  return (
    <>
      <div>
        {['肩', '胸', '腕', '腹', '背中', '脚'].map((part) => (
          <>
            <h1>部位: {part}</h1>
            {trainingList.map((item) => {
              if (item.training_parts == part) {
                return (
                  <div key={item.id} id={item.id}>
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
    </>
  );
};

export default TrainingList;
