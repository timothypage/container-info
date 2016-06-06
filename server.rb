require 'roda'
require 'tilt/erubis'


class App < Roda
  plugin :render
  @@served_requests = 0

  route do |r|
    r.root do
      @@served_requests += 1
      @served_requests = @@served_requests
      @hostname = `hostname`

      view 'index'
    end
  end
end
