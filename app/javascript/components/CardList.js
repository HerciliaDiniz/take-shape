import React from "react";
import Card from "./Card";

const CardList = ({ options = {} }) => {
  return (
    <div> 
      {
      options.map((option, i) => {
          return (
            <Card
              key={option.id}
              image={option.images[0]}
              title={option.title}
              subtitle={option.subtitle}
              price={option.price}
            />
          )  
        })
      }
    </div>
  );

}

export default CardList
