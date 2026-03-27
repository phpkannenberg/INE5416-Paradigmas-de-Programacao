#include <stdio.h>
#include <deque>
#include <iostream>
#include <vector>
 
int main() {
    while (true)
    {
        int n;
        std::cin >> n;
        if (n == 0) break;
        
        std::deque<int> deck;
        for (int i = 1; i <= n; ++i)
            deck.push_back(i);
        
        std::vector<int> discarded;
        while (deck.size() > 1)
        {
            discarded.push_back(deck.front());
            deck.pop_front();
            deck.push_back(deck.front());
            deck.pop_front();
        }
        
        std::cout << "Discarded cards: ";
        for (const auto card : discarded)
        {
            if (card == discarded.back())
                std::cout << card << '\n';
            else
                std::cout << card << ", ";
        }
        std::cout << "Remaining card: " << deck.front() << '\n';
    }
 
    return 0;
}
