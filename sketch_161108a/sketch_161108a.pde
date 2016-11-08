/* 
Author: Vimal Jain
Student Number: C15309056
Date:8/11/16
Labtest Object Oriented Programming
*/
void setup()
{
  size(500,500);
  border=width*0.1f;
  loadData();
  calcMinMax();
}

ArrayList<GDP> data=new ArrayList<GDP>();
float border;
float min,max;

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

void calcMinMax()
{
  max=data.get(0).amount;
  min=data.get(0).amount;
  
  for(GDP gdp:data)
  {
    if(gdp.amount<min)
    {
      min=gdp.amount;
    }
    if(gdp.amount>max)
    {
      max=gdp.amount;
    }
  }
}

void drawLineGraph()
{
  stroke(255);
  
  line(border -5,height-border,width-border,height-border);
  line(border,border,border,height-border+5);
  
  for(int i=1;i<data.size();i++)
  {
    stroke(0,255,255);
    
    float x1=map(i-1, 0, data.size()-1, border, width-border);
    float y1=map(data.get(i-1).amount, min, max, height-border, border);
    float x2=map(i, 0, data.size()-1, border, width-border);
    float y2=map(data.get(i).amount, min, max, height-border, border);
    
    line(x1,y1,x2,y2);
    
    if(mouseX>=x1 && mouseX<=x2)
    {
      stroke(255,0,0);
      fill(255,0,0);
      line(x1,border,x1,height-border);
      ellipse(x1,y1,5,5);
      fill(255);
      text("Year: " +data.get(i-1).year,x1+10,y1);
      text("GDP (Mill$):"+data.get(i-1).amount, x1+10,y1+10);
    }
    
  }
}
  

void draw()
{
  background(0);
  drawLineGraph();
}