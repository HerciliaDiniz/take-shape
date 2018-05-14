import React from 'react'

const Card = (props) => {
  const { arts = [] } = props;
  return (
    <div className='Card bg-light-gray dib br3 pa3 ma2 grow'> 
      <img src='arts[100].images[0]' />
      <div>
        <h2>Jane Doe</h2>
        <p>jane@doe.com</p>
      </div>
    </div>
  )
}

export default Card
