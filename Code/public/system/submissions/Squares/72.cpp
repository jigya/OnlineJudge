#include <iostream>
#include <stdlib.h>
#include <vector>
#include <algorithm>
#include <map>
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <limits.h>
#include <fstream>

using namespace std;
int fastread()
{
    int input;
    char c=0;
    while (c<33) c=getchar();
    input=0;
    while (c>33)
    {
        input=input*10+c-'0';
        c=getchar();
    }
    return input;
}

int main()
{
    int t,a,b;
    cin>>t;
    while(t--)
    {
        cin>>a;
        cout<<a*a<<endl;
    }
    return 0;
}