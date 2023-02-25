#include <stdio.h>
#define max 10

int t, i, val;
int stack[max];

void stack_init(void);
bool empty(void);
void push(int);
void pop(void);
int top(void);

int main()
{
    stack_init();
    scanf("%d", &val);
    while(val != -999)
    {
        if(val>0) push(val);
        else if(empty()) printf("\n    Error - stack is empty.\n");
        else if (val == 0) pop();
        else printf("%10d \n", top());
        scanf("%d", &val);   //why scanf again?
    }
}

void stack_init(void)
{
    t = -1;
}

bool empty(void)
{
    return (t==-1);
}

void push(int value)
{
    t=t+1;
    stack[t]=value;
}

void pop(void)
{
    t=t-1;
}

int top()
{
    return stack[t];
}

/*stack_init(){
    t=-1;
}

empty(){
   return t==-1;
}*/
