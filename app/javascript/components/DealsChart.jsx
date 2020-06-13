import React, { Component } from 'react';
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
} from 'recharts';

export default class DealsChart extends Component {
  render() {
    const { data } = this.props;

    return (
      <div style={{ marginTop: '35px' }}>
        <BarChart
          width={950}
          height={450}
          data={data}
          margin={{
            top: 5, right: 30, left: 20, bottom: 5,
          }}
          barSize={20}
        >
          <XAxis dataKey="label" scale="point" padding={{ left: 10, right: 10 }} />
          <YAxis />
          <Tooltip />
          <Legend />
          <CartesianGrid strokeDasharray="3 3" />
          <Bar dataKey="amount" name="Total $" fill="#8884d8" background={{ fill: '#eee' }} />
        </BarChart>
      </div>
    );
  }
}