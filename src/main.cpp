#include <SFML/Graphics.hpp>

void visualize() {
    sf::RenderWindow window(sf::VideoMode(800, 800), "Wind Simulation");
    while (window.isOpen()) {
        sf::Event event;
        while (window.pollEvent(event)) {
            if (event.type == sf::Event::Closed)
                window.close();
        }
        window.clear();
        // Draw wind vectors
        for (int i = 0; i < gridWidth; ++i) {
            for (int j = 0; j < gridHeight; ++j) {
                sf::Vertex line[] =
                {
                    sf::Vertex(sf::Vector2f(i * 8, j * 8)),
                    sf::Vertex(sf::Vector2f((i * 8) + u[i][j] * 10, (j * 8) + v[i][j] * 10))
                };
                window.draw(line, 2, sf::Lines);
            }
        }

        window.display();
    }
}
