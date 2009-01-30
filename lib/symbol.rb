class Symbol
  # Altered version of to_proc. As efficient as using the block form,
  # but only works for forms that take a single argument. In other
  # words, foos.map(&:to_i) works as fast as foos.map {|i| i.to_i},
  # but foos.inject(&:+) will crash.
  # 
  # The standard version of to_proc takes about 1.76s to map a
  # million-element array from integer to float with &:to_f (on my
  # machine). Most of this time (75%) is spent collecting and
  # expanding *args (even though there aren't any). Another 5% or so
  # is spent in double dispatch (using send instead of actually
  # compiling the function dispatch as code). By using eval to create
  # a Proc object that calls the symbol directly, and by sacrificing
  # arbitrary arguments, the resulting to_proc is 400% faster than the
  # original generic version.
  def to_proc
    # This is the standard to_proc method. It is quite slow. ~2.1s on ruby 1.8 for a million ops; 0.89s on ruby 1.9. About 
    # proc { |obj, *args| obj.send(self, *args) }

    # Faster still is to avoid double dispatch: 0.74s on 1.8, 0.52 on 1.9
    eval "proc {|obj| obj.#{self}}"
  end
end

