#include "StdAfx.h"
#include<stdio.h>
#include<windows.h>
 
#define K 0//���Ƶ��0�����ǲ��죬��Ϊ���� 
 

/*
#define C4 523  
#define C#4 554
#define D4 588 
#define D#4 623
#define E4 660
#define F4 700
#define F#4 742
#define G4 786
#define G#4 833
#define A4 884
#define A#4 936
#define B4 992
 
#define C5 1046  //do
#define C#5 1108
#define D5 1176  //re
#define D#5 1246
#define E5 1320 //mi
#define F5 1400	//fa
#define F#5 1484
#define G5 1572	//so
#define G#5 1666
#define A5 1768	//la
#define A#5 1872
#define B5 1984	//xi
 
#define C6 2092 	//do~
#define C#6 2216
#define D6 2352
#define D#6 2492
#define E6 2640
#define F6 2800
#define F#6 2968
#define G6 3144
#define G#6 3332
#define A6 3536
#define A#6 3744
#define B6 3968
#define P 125  
*/

//#4#5#6��Ϊ�ں궨�����ַ���ͻ������Z4Z5Z6

//���µ����б�ʾ�����ķ��ž�����fl studio 14 ��fl keys�ı�ע�������һ����ٵı�ע��һ�� �� 
//ֻ�������˶ȵ�����Ƶ�� ����Ϊһ���������Դﵽ��Ƶ�ʴ�Ŷ���������Щ���� 
#define C4 523
#define CZ4 554
#define D4 588
#define DZ4 623
#define E4 660
#define F4 700
#define FZ4 742
#define G4 786
#define GZ4 833
#define A4 884
#define AZ4 936
#define B4 992
 
#define C5 1046
#define CZ5 1108
#define D5 1176
#define DZ5 1246
#define E5 1320
#define F5 1400
#define FZ5 1484
#define G5 1572
#define GZ5 1666
#define A5 1768
#define AZ5 1872
#define B5 1984
 
#define C6 2092
#define CZ6 2216
#define D6 2352
#define DZ6 2492
#define E6 2640
#define F6 2800
#define FZ6 2968
#define G6 3144
#define GZ6 3332
#define A6 3536
#define AZ6 3744
#define B6 3968
#define P 125   //�ۺ�bpm==120��ԭbpmΪ105���˴�ȡ�˸�����ֵ 
 


typedef struct
{	int frequency;
	int duration;
}PU;



	//�������ӣ����ǡ����ִ�ѧУ�衷��һ��C++������������
PU t[]={E6,4,C6,2,D6,1,E6,2,E6,6,
	F6,4,D6,3,E6,1,F6,2,F6,6,
	G6,2,E6,1,F6,2,G6,4,G6,2,F6,6,
	E6,8,D6,4,G6,4,
	C6,8,G5,8,
	E5,4,F5,4,G5,8,
	F5,4,D5,2,E5,2,F5,4,A5,4,
	G5,16,
	C6,6,D6,2,E6,4,C6,2,C6,2,
	G5,4,G5,2,F6,1,E5,4,G5,4,
	D5,4,D5,2,E5,2,F5,4,A5,4,
	A5,16,
	G5,4,C6,2,D6,1,E6,8,
	E6,4,D6,2,C6,2,A5,6,A5,2,
	A5,4,F6,4,F6,4,E6,2,D6,2,
	E6,16,
	A5,4,A5,4,D6,4,D6,2,D6,1,
	E6,4,F6,4,G6,4,C6,1,C6,1,
	D6,4,C6,2,C6,1,B5,4,A5,4,
	G5,16,

	G6,4,E6,2,F6,1,G6,2,G6,6,
	F6,4,D6,2,E6,1,F6,2,F6,6,
	E6,4,C6,2,D6,1,E6,2,E6,2,E6,2,A5,2,
	A5,4,B5,2,C6,2,E6,4,D6,2,D6,1,
	D6,2,E6,2,D6,16,

	G6,4,E6,2,F6,1,G6,2,G6,6,
	F6,4,D6,2,E6,1,F6,2,F6,6,
	E6,4,C6,2,D6,1,E6,2,E6,2,E6,2,A5,2,
	A5,4,B5,2,C6,2,E6,4,D6,2,D6,1,
	D6,2,D6,2,G6,16,

	G6,2,G6,2,F6,8,E6,24,
	D6,2,E6,6,E6,8,
	C6,32,
};
int main()
{
    int i;
    //�ṹ������ĳ���sizeof(t)/sizeof(PU)�õ����ܽṹ�������С / �����ṹ���С
    for (i=0; i<sizeof(t)/sizeof(PU); i++)
        Beep(t[i].frequency,t[i].duration*P);
}