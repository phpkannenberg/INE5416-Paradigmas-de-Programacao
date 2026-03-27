#include <stdio.h>
#include <stack>
#include <iostream>
#include <string>
 
int main() {
    int t;
    std::cin >> t;
    for ( ; t > 0; --t)
    {
        std::stack<char> aux;
        std::string cadeia;
        std::cin >> cadeia;
        bool valida = true;
        for (auto c : cadeia)
        {
            if (c == '(' || c == '{' || c == '[')
                aux.push(c);
            else
            {
                if (aux.empty() ||
                    (c == ')' && aux.top() != '(') ||
                    (c == '}' && aux.top() != '{') ||
                    (c == ']' && aux.top() != '['))
                {
                    valida = false;
                    break;
                }
                aux.pop();
            }
        }
        std::cout << (valida && aux.empty() ? "S\n" : "N\n");
    }
 
    return 0;
}
