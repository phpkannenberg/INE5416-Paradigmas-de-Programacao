#include <stdio.h>
#include <iostream>
#include <vector>
 
int main() {
    while (true)
    {
        int n_samples;
        std::cin >> n_samples;
        if (n_samples == 0) break;
        
        std::vector<int> values;
        for (int i = 0; i < n_samples; ++i)
        {
            int curr;
            std::cin >> curr;
            values.push_back(curr);
        }
        
        int peaks_count{0};
        for (int i = 0; i < n_samples; ++i)
        {
            int prev =  (i == 0) ? values[n_samples - 1] : values[i - 1],
                curr = values[i],
                next = (i == n_samples - 1) ? values[0] : values[i + 1];
            if ((curr < prev && curr < next) || 
                (curr > prev && curr > next))
                ++peaks_count;
        }
        
        std::cout << peaks_count << '\n';
    }
 
    return 0;
}
