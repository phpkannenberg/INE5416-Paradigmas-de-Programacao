#include <stdio.h>
#include <stack>
#include <iostream>
#include <string>
 
int main() {
    std::string line;
    while (std::cin >> line)
    {
        std::stack<char> pars;
        bool correct = true;
        for (const auto c : line)
        {
            if (c == '(')
                pars.push(c);
            if (c == ')')
            {
                if (pars.empty())
                {
                    correct = false;
                    break;
                }
                pars.pop();
            }
        }
        std::cout << ((!correct || !pars.empty()) ? "incorrect" : "correct") << '\n';
    }
 
    return 0;
}
