import std.stdio, std.socket, std.process;

void main() {
    Socket sock = new TcpSocket(new InternetAddress("time.nist.gov",13));
    char[1024] xs;
    auto rc = sock.receive(xs);
    if (rc<=0) {
        writeln("receive rc = %d\n",rc);
        return;
    }
    writeln(xs[0..rc]);
    sock.close();
    //string cmd = "date --utc mon,day,hr,min,yr.sec
    char[] cmd = "date --utc " ~ xs[10..12] ~ xs[13..15] ~ xs[16..18] ~
        xs[19..21] ~ xs[7..9] ~ "." ~ xs[22..24]  ;
    writeln(cmd);
    auto rc1 = executeShell("hwclock --systohc --utc");
    auto rc2 = executeShell("hwclock --show");
    writef("hwclock rc1 = %s\n",rc1.status);
    writef("hwclock rc2 = %s\n",rc2.status);
}
