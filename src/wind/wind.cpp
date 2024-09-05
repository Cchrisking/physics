void updateVelocity(double dt) {
    for (int i = 1; i < gridWidth - 1; ++i) {
        for (int j = 1; j < gridHeight - 1; ++j) {
            // Update velocity u and v using discretized equations
        }
    }
}
void applyBoundaryConditions() {
    for (int i = 0; i < gridWidth; ++i) {
        u[i][0] = u[i][gridHeight-1] = 0.0;
        v[i][0] = v[i][gridHeight-1] = 0.0;
    }
    for (int j = 0; j < gridHeight; ++j) {
        u[0][j] = u[gridWidth-1][j] = 0.0;
        v[0][j] = v[gridWidth-1][j] = 0.0;
    }
}
void simulate(double totalTime, double dt) {
    double currentTime = 0.0;
    while (currentTime < totalTime) {
        updateVelocity(dt);
        applyBoundaryConditions();
        currentTime += dt;
    }
}
