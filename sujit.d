import std.stdio;
import std.conv;
import std.process;
import std.c.linux.linux;

void main(string[] args) {
    string user = to!string(getlogin());
    if (user != "jerry") {
        writeln("access denied");
        return;
    }
    if (args.length<2) {
        writef("Usage: sujit <command line>\n");
        return;
    }
    if (geteuid() != 0) {
        writeln("access denied");
        return;
    }
    setuid(0);
    setgid(0);
    char[] cmd;
    for (int i=1; i<args.length; i++) cmd ~= (" " ~ args[i]);
    system(cmd.dup);
}
