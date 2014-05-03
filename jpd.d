import std.stdio;
import std.file;
import std.string;
import std.process;

void doit(char[] fn) {
    writeln("doing it");
    string xxx="xxx.d";
    if (exists(xxx)) remove(xxx);
    system(format("ln -s %s.d %s", fn, xxx));
}

int main(string[] args) {
    string s;
    if (args.length != 2) {
        writeln("Usage: new <fn[.d]>");
        return 1;
    }
    char[] fn = cast(char[])args[1];
    if (fn.length>2 && fn[fn.length-2 .. fn.length]==".d") fn.length-=2;
    if (exists(fn~".d")) {
        writef("%s already exists - do you want to relink (y/n)? ",fn~".d");
        s=readln();
        if (s[0]=='y') doit(fn);
    } else {
         system(format("echo 'import std.stdio;\n\nvoid main() {\n}' >>%s.d",fn));
        doit(fn);
    }
    return 0;
}
