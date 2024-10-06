#include <RaFT.h>

int main(int argc, char *argv[]) {
  InitWindow(400, 224, "Your Project Title");

  while (!WindowShouldClose()) {
    BeginDrawing();
      ClearBackground(RAYWHITE);
    EndDrawing();
  }

  CloseWindow();
  return 0;
}
