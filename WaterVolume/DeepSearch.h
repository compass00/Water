//
//  DeepSearch.c
//  WaterVolume
//
//  Created by JiaLi on 16/4/20.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#include <stdio.h>
#define row 4
#define col 4

int maze[row][col]={
    {0,0,0,0},
    {0,1,1,1},
    {0,1,0,1},
    {0,1,1,1},
};

//int dir[row][col]={0};//记录上一步到达(x,y)的方向（上下左右）
int visit[row][col]={0};//访问标记
int top = 0;
//int ref[4] = {1, 0, 3, 2};

//char load[4]={'U','D','L','R'};//广度优先的遍历顺序
int dx[4]={-1,1,0,0};//上下左右移动时，x的变化步伐
int dy[4]={0,0,-1,1};//上下左右移动时，y的变化步伐

int stack[row*col];

void print_stack(int _top)
{
    if(_top <= 0){
        printf("......起点和终点是一样的\n");
        return ;
    }
    int flag = 0;
    while(_top > 0){
        int u = stack[--_top];
        int x = u/col;
        int y = u%col;
        printf(flag++? "->(%d,%d)":"(%d,%d)",x,y,x,y);
    }
}

void DFS(int satrt_x,int start_y,int end_x,int end_y)
{
    
    //(satrt_x,start_y)表示始点，(end_x,end_y)表示终点同时也表示出发点
    if(satrt_x == end_x && start_y == end_y){
        print_stack(top);
        printf("----------------------------------------------------------------------------------\n");
        return ;
    }
    stack[top++] = end_x * col + end_y;
    int _top = top;
    visit[end_x][end_y]=1;//把本结点标志为已经访问。
    for(int i = 0;i < 4; ++i){
        int nx = end_x + dx[i];
        int ny = end_y + dy[i];
        if(maze[nx][ny] && !visit[nx][ny]){
            //dir[end_x][end_y] = ref[i];
            DFS(satrt_x, start_y, nx, ny);
            top = _top;
        }
    }
    visit[end_x][end_y] = 0;//(end_x,end_y)点四个方向的点都遍历了一次之后，重新将该点置为未访问。
}