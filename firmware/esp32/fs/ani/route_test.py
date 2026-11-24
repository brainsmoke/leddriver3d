
import uarray

import model, cball

from .gradient import Gradient

class RouteTest(Gradient):

    def update_route(self):
        nop = self.nop
        new_table = bytes( ( packet if i<size else nop for size,route in zip(self.sliders,self.table) for i,packet in enumerate(route) ) )
        self.driver.set_route(new_table)

    def update_mask(self):
        sliders=self.sliders
        self.mask = uarray.array('H', (65535 if i<=sliders[route] else 0 for i,route in zip(self.edge, self.route)))

    def set_route_size(self, route_no, size):
        self.sliders[route_no] = size
        self.state = "need_update"

    def get_route_size(self, route_no):
        return self.sliders[route_no]
 
    def __init__(self, leds, config=None, driver=None, **kwargs):
        super().__init__(leds, config, **kwargs)

        self.driver = driver
        self.state = None

        data = model.load_json("route_debug.json")
        self.table = data['table']
        self.nop = data['nop']

        reverse_map = [ None ] * len(leds.remap)
        for i, v in enumerate(leds.remap):
            reverse_map[v] = i

        self.route = uarray.array('H', (65535 for _ in range(leds.n_leds*3)))
        self.edge = uarray.array('H', (65535 for _ in range(leds.n_leds*3)))

        n_segments = sum( len(route)+1 for route in self.table )
        leds_per_segment = leds.n_leds//n_segments
        i = 0
        for route_no, route in enumerate(self.table):
            for edge_no in range(len(route)+1):
                for _ in range(leds_per_segment):
                    for j in range(3):
                         self.route[reverse_map[i]*3+j] = route_no
                         self.edge[reverse_map[i]*3+j] = edge_no
                    i+=1

        self.sliders = [ len(route) for route in self.table ]
        self.update_mask()

        for i,route in enumerate(self.table):
             config.add_slider('route_'+str(i),0, len(route), 1, lambda   i=i: self.get_route_size(i),
                                                                 lambda n,i=i: self.set_route_size(i,n), caption="route "+str(i))

        self.state = None

    def next_frame(self, fbuf):
        if self.state == "updated":
            self.update_route()
            self.state = None
        elif self.state == "need_update":
            self.update_mask()
            self.state = "updated"
        super().next_frame(fbuf)
        cball.array_interval_multiply(fbuf, fbuf, self.mask)
