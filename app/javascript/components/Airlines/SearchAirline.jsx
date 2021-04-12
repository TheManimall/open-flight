import React, { useState, useEffect } from 'react'
import axios from 'axios'
import Airline from './Airline'
import styled from 'styled-components'

const SearchBar = styled.div`
 width: 100%;
 margin: 0 10%
 display: flex;
 justify-content: center;
`


const SearchAirline = () => {
  const [search, setSearch] = useState('')
  const [result, setResult] = useState([])
  const [isSearched, setIsSearched] = useState(false)

  const handleChange = e => setSearch(e.target.value)

  const handleSubmit = () => {
    axios.get(`api/v1/airlines/search/${search}`)
      .then(res => {
        setResult(res.data.data)
        setIsSearched(prevState => !prevState)
      })
      
  }

  const renderSearchAirlines = result.map((airline, index) => (
    <Airline 
      key={index}
      name={airline.attributes.name}
      image_url={airline.attributes.image_url}
      slug={airline.attributes.slug}
      average_score={airline.attributes.averageScore}
      popularity={airline.attributes.popularity}
    />
  ))


  return (
    <SearchBar>
      <h2>Search</h2>
      <input onChange={handleChange} value={search} />
      <button className="submit-search" onClick={handleSubmit}>find</button>
        {isSearched && 
        !result.length 
        ? <h2>Can't find airline</h2> 
        : renderSearchAirlines}
    </SearchBar>
  )
}

export default SearchAirline