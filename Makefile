# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -O2

# Directories
SRC_DIR = src
HEADER_DIR = src/header
WIND_DIR = src/wind
PARTICLE_DIR = src/particle
OBJ_DIR = obj
BIN_DIR = bin
INCLUDE_DIR = includes

# Libraries (e.g., SFML if needed)
LIBS = -lsfml-graphics -lsfml-window -lsfml-system

# Files
MAIN_SRC = $(SRC_DIR)/main.cpp
WIND_SRC = $(WIND_DIR)/windsimulation.cpp
PARTICLE_SRC = $(PARTICLE_DIR)/particlesimulation.cpp
HEADERS = $(HEADER_DIR)/physics.h

SRCS = $(MAIN_SRC) $(WIND_SRC) $(PARTICLE_SRC)
OBJS = $(SRCS:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)
EXEC = $(BIN_DIR)/simulation

# Default target
all: $(EXEC)

# Create bin directory and compile the final executable
$(EXEC): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(EXEC) $(LIBS)

# Compile each source file into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp $(HEADERS)
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -I $(HEADER_DIR) -I $(INCLUDE_DIR) -c $< -o $@

# Clean up
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)

# Phony targets
.PHONY: all clean
