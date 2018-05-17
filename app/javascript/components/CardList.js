import React from "react";
import Card2 from "./Card2";

const CardList = ({ options = [] }) => {
  return (
    <div> 
      {
      options.map((option) => {
          return (
            <Card2
              key={option.id}
              image={option.images[0]}
              title={option.title}
            />
          )  
        })
      }
    </div>
  );

}

export default CardList
