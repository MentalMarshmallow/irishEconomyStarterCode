/* 
Author: Vimal Jain
Student Number: C15309056
Date:8/11/16
Labtest Object Oriented Programming
*/
void setup()
{
  size(500,500);
}

ArrayList<GDP> data=new ArrayList<GDP>();

void loadData()
{
  data.clear();
  Table t=loadTable("gdp.csv");
  for (int i=0;i<t.getRowCount();i++)
  {
    TableRow row=t.getRow(i);
    GDP gdp=new GDP(row);
    data.add(gdp);
  }
}

void draw()
{
  
}