#include <${id underscore}.h>

int main(int argc, char *argv[]) {
    SetTargetFPS(30);
    InitWindow(800, 448, "Test");
    ecs_world_t *world = ecs_init();
    ecs_entity_t ray = ecs_entity(world, { .name = "raysan5" });

    puts(ecs_get_name(world, ray));
    Texture2D logo = LoadTexture("assets/Raylib_logo.png");

    while (!WindowShouldClose()) {
        BeginDrawing();
            DrawTexture(logo, GetScreenWidth() / 2 - logo.width / 2, GetScreenHeight() / 2 - logo.height / 2, WHITE);
            DrawText(ecs_get_name(world, ray), GetScreenWidth() / 2 - 25 * 3.5f, GetScreenHeight() - 50, 50, BLACK);
            ClearBackground(RAYWHITE);
        EndDrawing();
    }

    UnloadTexture(logo);
    CloseWindow();
    return ecs_fini(world);
}
