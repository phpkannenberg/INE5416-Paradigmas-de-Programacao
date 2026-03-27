#include <stdio.h>
#include <stack>
#include <iostream>
#include <string>
 
int main() {
    int n;
    std::cin >> n;
    
    for (int i = 0; i < n; ++i)
    {
        std::stack<char> stck;
        int count{0};
        std::string line;
        std::cin >> line;
        
        for (auto c : line)
        {
            if (c == '<')
                stck.push(c);
            else if (c == '>' && !stck.empty())
            {
                ++count;
                stck.pop();
            }
        }
        
        std::cout << count << '\n';
    }
 
    return 0;
}
