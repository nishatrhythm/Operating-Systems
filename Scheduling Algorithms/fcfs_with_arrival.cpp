#include <iostream>
using namespace std;

int main()
{
    int arrival_time[10], arrival_time_2[10], burst_time[100], ex[100], seq[100], re[100], waiting_time[100], turn_around_time[100];
    int n, i, j, start, pos, max = 0, min, idle = 0, k = 0;
    float av1 = 0, av2 = 0;

    cout << "Enter number of processes: ";
    cin >> n;

    cout << "Enter arrival time for processes "
         << "P"
         << ":";

    for (i = 0; i < n; i++)
    {
        cin >> arrival_time[i];
        arrival_time_2[i] = arrival_time[i];
    }

    cout << endl;

    cout << "Enter burst time for processes "
         << "P"
         << ":";
    for (i = 0; i < n; i++)
    {
        cin >> burst_time[i];
    }
    start = arrival_time[0];
    for (i = 1; i < n; i++)
    {
        if (start > arrival_time[i])
        {
            start = arrival_time[i];
        }
    }
    cout << endl;
    cout << "Sequence of execution is" << endl;
    for (i = 0; i < n; i++)
    {
        if (max < arrival_time[i])
        {
            max = arrival_time[i];
        }
    }
    max = max + 1;
    for (i = 0; i < n; i++, k++)
    {
        min = max;
        for (j = 0; j < n; j++)
        {
            if (arrival_time[j] != -1)
            {
                if (arrival_time[j] < min)
                {
                    min = arrival_time[j];
                    pos = j;
                }
            }
        }
        cout << "P" << pos << "  ";
        seq[k] = pos;
        if (start < arrival_time[pos])
        {
            re[pos] = start;
            idle += arrival_time[pos] - start;
            start = arrival_time[pos];
            start += burst_time[pos];
            arrival_time[pos] = -1;
            ex[pos] = start;
        }
        else
        {
            re[pos] = start;
            start += burst_time[pos];
            arrival_time[pos] = -1;
            ex[pos] = start;
        }
    }
    cout << endl;
    for (i = 0; i < n; i++)
    {
        turn_around_time[i] = ex[i] - arrival_time_2[i];
        waiting_time[i] = turn_around_time[i] - burst_time[i];
    }
    cout << "-------------------------------------------------------------" << endl;
    cout << "Process  | Arrival-time  |  Burst-time | Waiting-time  |  Turnaround-time" << endl;
    cout << "-------------------------------------------------------------" << endl;

    for (i = 0; i < n; i++)
    {
        cout << "P" << i << "      |      " << arrival_time_2[i] << "       |       " << burst_time[i] << "       |      " << waiting_time[i] << "        |       " << turn_around_time[i] << endl;
    }
    cout << endl;
    for (i = 0; i < n; i++)
    {
        av1 += turn_around_time[i];
        av2 += waiting_time[i];
    }
    cout << "-------------------------------------------------------------" << endl;
    cout << "Average waiting time " << av2 / n << endl
         << "Average turnaround time" << av1 / n << endl;
    cout << "-------------------------------------------------------------" << endl;

    //  << "CPU idle time(s) " << idle << endl;
}