#include <iostream>
#include <memory>
#include <utility>

int main()
{
	std::unique_ptr<int> s(new int(100));

	std::cout << "s=" << s.get() << std::endl;
	std::unique_ptr<int> d = std::move(s);
	std::cout << "s=" << s.get() << std::endl;
	std::cout << "d=" << d.get() << std::endl;

	return 0;
}

