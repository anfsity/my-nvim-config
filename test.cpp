#include <iostream>
#include <vector>
#include <map>

int main () {
  std::vector<int> arr;  
  for(int i = 0; i < 100; ++i) {
    arr.emplace_back(i);
  }

  for(auto& i : arr) {
    std::cout << i << ' ';
  }
  std::cout << std::endl;


  std::map <int,int> ma;
  for(auto i : arr) {
    ma.insert({i,i});
  }

  for(auto [x , y] : ma) {
    std:: cout << x + y << std::endl;
  }

  
  auto get = [](auto&& self, int n) -> void {

  };





  return 0;
}
