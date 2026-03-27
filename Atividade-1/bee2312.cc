#include <stdio.h>
#include <vector>
#include <string>
#include <algorithm>
#include <iostream>

struct Country
{
    std::string name;
    int gold;
    int silver;
    int bronze;
};

int main() {
    int n;
    std::cin >> n;
    
    std::vector<Country> v(n);
    for(int i = 0; i < n; ++i)
        std::cin >> v[i].name >> v[i].gold >> v[i].silver >> v[i].bronze;
        
    auto cpr = [] (const Country &a, const Country &b) 
                  { if (a.gold != b.gold) return a.gold > b.gold;
                    if (a.silver != b.silver) return a.silver > b.silver;
                    if (a.bronze != b.bronze) return a.bronze > b.bronze;
                    return a.name < b.name; };
    
    std::sort(v.begin(), v.end(), cpr);
    std::for_each(v.cbegin(), v.cend(), 
                  [] (const Country &a) -> void { std::cout << a.name << " "
                                                            << a.gold << " "
                                                            << a.silver << " "
                                                            << a.bronze << '\n'; });
 
    return 0;
}
