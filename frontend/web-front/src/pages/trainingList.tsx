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
        let url: string = data[i].training_movie.toString();
        data[i].training_movie = url.replace("youtu.be", "youtube.com/embed");
      }
      setTrainingList(data);
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <div>
      {trainingList.map((item) => (
        <div key={item.id} id="hoge">
          <h1>{item.training_name}</h1>
          {/* <h1>{item.training_name}</h1> */}
          <p>{item.training_parts}</p>
          {/* <p>{item.training_movie}</p> */}
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
    </div>
  );
};

export default TrainingList;
