#include<iostream>
#include<conio.h>
using namespace std;

int tree[100],n=0;

void insheap(int item)
{
	int par,ptr;
	if(n==0)
	{
		tree[++n]=item;
		return;
	}
	
	ptr=++n;
	while(ptr>1)
	{
		par=ptr/2;
		if(tree[par]>=item)
		{
			tree[ptr]=item;
			return;
		}
		tree[ptr]=tree[par];
		ptr=par;
	}
	tree[1]=item;
}

int delheap()
{
	int item,ptr,left,right,last;
	
	item=tree[1];
	last=tree[n--];
	ptr=1;
	left=2;
	right=3;
	
	while(left<=n)
	{
		if(last>=tree[left]&&last>=tree[right])
		{
			tree[ptr]=last;
			return item;
		}
		if(tree[right]<=tree[left])
		{
			tree[ptr]=tree[left];
			ptr=left;
		}
		else
		{
			tree[ptr]=tree[right];
			ptr=right;
		}
		left=2*ptr;
		right=left+1;
	}
	
	if(left==n&&last<tree[left])
	ptr=left;
	
	tree[ptr]=last;
	return item;
}

void heapsort()
{
	int stree[100],N=0;
	while(n>=1)
	{
		stree[++N]=delheap();
	}
	
	cout<<"Heapsort:";
	for(int i=1;i<=N;i++)
	{
		cout<<"|"<<stree[i];
	}
	cout<<"|";
}

main(void)
{
	int item;
	char c;
	home:
	system("cls");	
	cout<<"\t\t\tHeap\n\n1.Insert\n2.Display Heap\n3.HEAPSORT\n0.Exit";
	c=getch();
	system("cls");
	switch(c)
	{
		case'1':
			cout<<"1.Single Element\n2.Multiple Elements";
			c=getch();
			system("cls");
			switch(c)
			{
				case'1':
					cout<<"Enter Element:";
			        cin>>item;
			        insheap(item);
			        break;
			        
	            case'2':
	            	int no;
	            	cout<<"Enter no of elements:";
	            	cin>>no;
	            	cout<<"Enter elements-\n";
	            	for(int i=0;i<no;i++)
	            	{
	            		cin>>item;
	            		insheap(item);
					}
					break;
			}
			
			break;
			
		case'2':
			for(int i=1;i<=n;i++)
			cout<<"|"<<tree[i];
			cout<<"|";
			break;
		
		case'3':
         	heapsort();
			break;
		
		case'0':exit(0);	
	}
	cout<<endl<<endl;
	system("pause");
	goto home;
}
