import React from "react";
import ArtCard from "./ArtCard";

const ArtCardList = ({ options = [] }) => {
  return (
    <div> 
      {
      options.map((option) => {
          return (
            <ArtCard
              key={option.id}
              id={option.id}
              image={option.images[0]}
              title={option.title}
            />
          )  
        })
      }
    </div>
  );

}

export default ArtCardList