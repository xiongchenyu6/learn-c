#include <stdio.h>
#define SIZE 10

int f, r, val;
int queue[SIZE];

void queue_init(void);
bool empty(void);
void enqueue(int);
void dequeue(void);
int front(void);
int rear(void);

int main()
{
    queue_init();
    scanf("%d", &val);
    while(val != -999)
    {
        if(val>0) enqueue(val);
        else if(empty()) printf("\n    Error - queue is empty.\n");
        else if (val == 0) dequeue();
        else printf("%10d \n", front());
        scanf("%d", &val);   //why scanf again??
    }
}

void queue_init()
{
    r=f=-1;
}

bool empty()
{
    return r==-1; //???
}

void enqueue(int val)
{
    if(empty())
        r=f=0;
    else{
        r=r+1;
        if(r== SIZE) //???
        r=0;
    }
    queue[r]=val;
}

void dequeue()
{
    if(r==f)
        r=f=-1;
    else{
        f=f+1;
        if(f==SIZE)
        f=0;
    }
}

int front(void)
{
    return queue[r];
}
