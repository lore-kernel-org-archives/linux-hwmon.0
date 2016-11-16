Return-path: <clemens.gruber@pqgruber.com>
Date: Wed, 16 Nov 2016 11:50:13 +0100
From: Clemens Gruber <clemens.gruber@pqgruber.com>
To: Rob Herring <robh+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: ina2xx: New DT properties
Message-ID: <20161116105012.GA11878@archie.localdomain>
References: <20161115195232.GA24893@archie.localdomain>
 <CAL_JsqLwiHDZKd=LbeR=8NKLNZ9YPg15+HTd1g8m+Q-vE_H-aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLwiHDZKd=LbeR=8NKLNZ9YPg15+HTd1g8m+Q-vE_H-aA@mail.gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, Nov 15, 2016 at 02:25:11PM -0600, Rob Herring wrote:
> On Tue, Nov 15, 2016 at 1:52 PM, Clemens Gruber
> <clemens.gruber@pqgruber.com> wrote:
> > Hi,
> >
> > I am preparing a patch for the ina2xx driver to allow configuring the
> > PGA bits (which define the shunt voltage range) and the BRNG bit (which
> > defines the bus voltage range) from the device tree.
> > We have multiple INA219 with different voltage ranges, so I can't just
> > change the hardcoded default in ina2xx.c
> > The ADC averaging setting should also be configurable.
> >
> > Now I am asking myself if I should create several new DT properties or
> > rather add one config-reg property to set a different default value for
> > the 16-bit configuration register (instead of the driver defaults of
> > 0x399F for the INA219 and 0x4527 for the INA226) ?
> >
> > Solution A:
> 
> Generally, this is preferred.
> 
> > ina219_foo: ina219@44 {
> >         compatible = "ti,ina219";
> >         reg = <0x44>;
> >         shunt-resistor = <25000>;
> >
> >         pga = <2>; /* PGA Gain /2 instead of the default /8 */
> >         /* Note: Possible PGA Gain values are /1, /2, /4 and /8 */
> >
> >         has-16v-brng; /* Bus voltage range of 16V instead of 32V */
> >
> >         averaging = <128>; /* Average 128 samples */
> > };
> >
> > Should each of those also have a sysfs attribute?
> 
> These should probably be in DT or in sysfs, but not both. The decision
> should be based on how are the settings picked: by the h/w design or
> an end user will want to modify them.

Thanks Rob and Guenter.

The settings depend on the hardware design and will probably be set
only once. I'll add them as device tree properties.

Maybe changing the averaging setting via sysfs could be useful. But we
can add that later if needed.

Regards,
Clemens
