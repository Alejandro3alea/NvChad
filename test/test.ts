function greet(name: string): string {
    return `Hello ${name}`;
}

greet(123);  // ts_ls should error
