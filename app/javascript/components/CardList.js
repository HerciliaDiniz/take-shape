import React from "react";
import Card from "./Card";

const CardList = ({ arts = {}, individualArt }) => {

  return (
    <div>
      {
        arts.map((art, i) => {
          return (
            <Card
              key={art.id}
              image={art.images}
              title={art.title}
              subtitle={art.subtitle}
              price={art.price}
            />
          )  
        })
      }
    </div>
  );

}

export default CardList
