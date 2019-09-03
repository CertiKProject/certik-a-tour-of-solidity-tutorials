pragma solidity ^0.5.10;

contract ForecastStorage {


  struct ForecastEntry {
    uint time;
    uint percipitation;
    uint temperature;
  }

  ForecastEntry[] public data;
  uint longitude = 123123123;
  uint latitude = 321321321;
  ForecastOracle oracle = new ForecastOracle();

  function update() public {
    uint tim;
    uint perc;
    uint temp;
    (tim,perc,temp) = oracle.getForecast(longitude,latitude);
    data.push(ForecastEntry(tim,perc,temp));
  }
}

contract ForecastOracle {
  function getForecast(uint _longitude, uint _latitude) public returns (uint,uint,uint){
    return (now,_longitude * _latitude * now % 100, (_longitude + _latitude * now) % 100);
  }
}
