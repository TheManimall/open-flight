import React, { useState, useEffect } from 'react'
import axios from 'axios'
import styled from 'styled-components'
import BarChart from 'react-easy-bar-chart';

const StatisticsContainer = styled.div`
 width: 100%;
 margin: 0 10%
 display: flex;
 justify-content: center;
`
const COUNTRY_COLOR = {
  0: '#00008b',
  1: '#fcc201',
  2: '#f00'
}

const Statistics = () => {
  const [result, setResult] = useState([])

  useEffect(() => {
    axios.get('/api/v1/airlines/by_country')
      .then(res => {
        const data = Object.entries(res.data).map(([key, item], index) => ({
          title: key,
          value: item,
          color: COUNTRY_COLOR[index]
        }))
        
        setResult(data)
      })
  }, [])

  useEffect(() => {})

  return (
    <StatisticsContainer>
      <h2>Statistics by country</h2>
      {!!result.length && (
        <BarChart 
        xAxis='Country'
        yAxis="Airlines count"
        height={400}
        width={1200}
        data={result}
      />
      )}
    </StatisticsContainer>
  )
}

export default Statistics