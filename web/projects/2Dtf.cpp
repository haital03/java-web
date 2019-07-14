#include<iostream>
#include<graphics.h>
#include<conio.h>
#include<math.h>
using namespace std;
class figure
{
	private:
	int x[10][10],y[10][10],result[10][10];
	public: 
	int enterfig(int[][10]);
	void drawfig(int[][10],int);
    void drawfigf(float[][10],int);
	void mm(int[][10],int[][10],int,int,int,int[][10]);
	void mmf(float[][10],int[][10],int,int,int,float[][10]);
	void translation(int[][10],int);
	void scaling(int[][10],int);
	void reflection(int[][10],int);
	void rotation(int[][10],int);
};
int figure :: enterfig(int x[][10])
{
	int n;
	cout<<"\nEnter no. of vertices of figure : ";
	cin>>n;
	for(int i=0;i<n;i++)
	{
		cout<<"\nEnter coordinates(x,y) of pt "<<i<<"- ";
		cin>>x[0][i]>>x[1][i];
		x[2][i]=1;
	}	
	for(int i=0;i<n;i++)
	{
		for(int j=0;j<n;j++)
		{
			cout<<x[i][j];
		}
		cout<<"\n";
	}
	return n;
}
void figure :: drawfig(int x[][10],int n)
{
	for(int i=0;i<n;i++)
	{
		if(i!=n-1)
		{
			line(x[0][i]+400,-x[1][i]+400,x[0][i+1]+400,-x[1][i+1]+400);
		}
		else
		{
			line(x[0][i]+400,-x[1][i]+400,x[0][0]+400,-x[1][0]+400);
		}
	}
}
void figure :: drawfigf(float x[][10],int n)
{
	for(int i=0;i<n;i++)
	{
		if(i!=n-1)
		{
			line(int(x[0][i])+400,-int(x[1][i])+400,int(x[0][i+1])+400,-int(x[1][i+1])+400);
		}
		else
		{
			line(int(x[0][i])+400,-int(x[1][i])+400,int(x[0][0])+400,-int(x[1][0])+400);
		}
	}
}
void figure :: mmf(float m1[][10],int m2[][10],int r1,int c1,int c2,float m3[][10])
{
	for(int i=0;i<10;i++)
	{
		for(int j=0;j<10;j++)
		{
			m3[i][j]=0;
		}
	}
	
	for(int i=0;i<r1;i++)
	{
		for(int j=0;j<c2;j++)
		{
			for(int k=0;k<c1;k++)
			{
				m3[i][j]=m3[i][j]+(m1[i][k]*m2[k][j]);
		    }
		}
	}
	m3[c2][0]=m3[0][0];
	m3[c2][1]=m3[0][1];
	m3[c2][2]=m3[0][2];	
}
void figure :: mm(int m1[][10],int m2[][10],int r1,int c1,int c2,int m3[][10])
{
	for(int i=0;i<10;i++)
	{
		for(int j=0;j<10;j++)
		{
			m3[i][j]=0;
		}
	}
	
	for(int i=0;i<r1;i++)
	{
		for(int j=0;j<c2;j++)
		{
			for(int k=0;k<c1;k++)
			{
				m3[i][j]=m3[i][j]+(m1[i][k]*m2[k][j]);
		    }
		}
	}
	m3[c2][0]=m3[0][0];
	m3[c2][1]=m3[0][1];
	m3[c2][2]=m3[0][2];	
}

void figure :: translation(int x[10][10],int n)
{
	int dx,dy;
	cout<<"\nEnter x-translation dx : ";
	cin>>dx;
	cout<<"\nEnter y-translation dy : ";
	cin>>dy;
	for(int i=0;i<3;i++)
	{
		for(int j=0;j<3;j++)
		{
			y[i][j]=0;
			y[0][0]=y[1][1]=y[2][2]=1;
			y[0][2]=dx;
			y[1][2]=dy;
		}
	}
	mm(y,x,3,3,n,result);
    cout<<"\n\ntranslation...";
    setcolor(5);
    drawfig(result,n);
}
void figure :: reflection(int x[][10],int n)
{
	int choice;
	cout<<"\t\t----Reflection types----\n";
	cout<<"\t\t1.About x-axis\n\t\t2.About y-axis\n\t\t3.About origin\n";
	cout<"\n\nEnter your choice(1-3) ";
	cin>>choice;
	for(int i=0;i<3;i++)
	{
		for(int j=0;j<3;j++)
		{
			if(i==j)
			y[i][j]=1;
			else
			y[i][j]=0;
		}
	}	
	switch(choice)
	{
		case 1:
			y[1][1]=-1;
			break;
		case 2:
		    y[0][0]=-1;
			break;
		case 3:
		    y[1][1]=-1;
			y[0][0]=-1;
			break;		
	}
	mm(y,x,3,3,n,result);
	cout<<"\n\nreflection....";
	setcolor(5);
	drawfig(result,n);
}
void figure :: scaling(int x[][10],int n)
{
	float sx,sy,res[10][10],scale[10][10],i,j;
	cout<<"\n\nEnter x-scaling sx : ";
	cin>>sx;
	cout<<"\n\nEnter y-scaling sy : ";
	cin>>sy;
	for(int i=0;i<3;i++)
	{
		for(int j=0;j<3;j++)
		{
			scale[i][j]=0;
			scale[0][0]=sx;
			scale[1][1]=sy;
			scale[2][2]=1;
		}
	}
	mmf(scale,x,3,3,n,res);
	cout<<"\n\nScaling....";
	setcolor(5);
	drawfigf(res,n);
}
void figure :: rotation(int x[][10],int n)
{
	float type,rotate[10][10],res[10][10],ang,sinang,cosang;
	cout<<"\n\nEnter the angle of rotation : ";
	cin>>ang;
	cout<<"\n\nEnter type of rotation : ";
	cout<<"\n\t\t1.Clockwise Rotation\n\n\t\t2.Anti-clockwise Rotation\n\nEnter choice(1-2) ";
	cin>>type;
	ang=(ang*3.142)/180;
	sinang=sin(ang);
	cosang=cos(ang);
	for(int i=0;i<3;i++)
	{
		for(int j=0;j<3;j++)
		{
			rotate[i][j]=0;
		}
	}
	rotate[0][0]=rotate[1][1]=cosang;
	rotate[0][1]=rotate[1][0]=sinang;
	rotate[2][2]=1;
	if(type==1)
	 rotate[1][0]=-sinang;
	else
	 rotate[0][1]=sinang;
	
	mmf(rotate,x,3,3,n,res);
	cout<<"\nRotation...";
	setcolor(5);
	drawfigf(res,n);  
}
main(void)
{
	int ch,n,x[10][10];
	initwindow(800,800,"transformation",0,0,false,true);
	line(0,400,800,400);
	line(400,0,400,800);
	figure f1;
	n=f1.enterfig(x);
	cout<<"figure...";
	f1.drawfig(x,n);
	cout<<"\n\n****2-D TRANSFORMATION****";
	cout<<"\n\n\t\t1.TRANSLATION\n\n\t\t2.SCALING\n\n\t\t3.ROTATION\n\n";
	cout<<"\t\t4.REFLECTION\n\n\t\t5.EXIT\n\n";
	cout<<"\n\nEnter your choice(1-5) ";
	cin>>ch;
	switch(ch)
	{
		case 1:	f1.translation(x,n); break;
		case 2:	f1.scaling(x,n);     break;	
		case 3: f1.rotation(x,n);    break;
		case 4: f1.reflection(x,n);  break;
		case 5: break;	 	    
	}
    getch();
    closegraph();
}
