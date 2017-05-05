#include <stdio.h>

__attribute__((constructor))
static void init(int argc, char **argv, char **envp)
{
    puts("Loading C plugin!");
}

__attribute__((destructor))
static void fini(void)
{
    puts("Unloading C plugin!");
}

const char* run_probe()
{
    return "Hello C plugin!";
}

