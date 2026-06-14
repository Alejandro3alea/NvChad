function greet(name) {
    return `Hello ${name}`;
}

const x = undefinedVariable;  // eslint should warn
greet(123, "extra arg");       // extra arg, eslint should warn
