#include <stdio.h>
#include <vector>
#include <cstddef>
#include <iostream>
 
int main() {
    int n;
    std::cin >> n;
    
    std::vector<int> casas;
    for (int i = 0; i < n; ++i)
    {
        int c;
        std::cin >> c;
        casas.push_back(c);
    }
    
    int target;
    std::cin >> target;
    
    std::size_t i = 0, j = casas.size() - 1;
    while (i < j)
    {
        int sum = casas[i] + casas[j];
        if (sum == target)
            break;
        else if (sum < target)
            ++i;
        else
            --j;
    }
    
    std::cout << casas[i] << " " << casas[j] << std::endl;
 
    return 0;
}
