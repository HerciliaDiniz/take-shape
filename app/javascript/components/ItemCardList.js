import React from "react";
import ItemCard from "./ItemCard";

const ItemCardList = ({ options = [] }) => {
  return (
    <div> 
      {
      options.map((option) => {
          return (
            <ItemCard
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

export default ItemCardList
