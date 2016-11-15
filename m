Return-path: <robh+dt@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20161115195232.GA24893@archie.localdomain>
References: <20161115195232.GA24893@archie.localdomain>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 15 Nov 2016 14:25:11 -0600
Message-ID: <CAL_JsqLwiHDZKd=LbeR=8NKLNZ9YPg15+HTd1g8m+Q-vE_H-aA@mail.gmail.com>
Subject: Re: ina2xx: New DT properties
To: Clemens Gruber <clemens.gruber@pqgruber.com>
Cc: linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, Nov 15, 2016 at 1:52 PM, Clemens Gruber
<clemens.gruber@pqgruber.com> wrote:
> Hi,
>
> I am preparing a patch for the ina2xx driver to allow configuring the
> PGA bits (which define the shunt voltage range) and the BRNG bit (which
> defines the bus voltage range) from the device tree.
> We have multiple INA219 with different voltage ranges, so I can't just
> change the hardcoded default in ina2xx.c
> The ADC averaging setting should also be configurable.
>
> Now I am asking myself if I should create several new DT properties or
> rather add one config-reg property to set a different default value for
> the 16-bit configuration register (instead of the driver defaults of
> 0x399F for the INA219 and 0x4527 for the INA226) ?
>
> Solution A:

Generally, this is preferred.

> ina219_foo: ina219@44 {
>         compatible = "ti,ina219";
>         reg = <0x44>;
>         shunt-resistor = <25000>;
>
>         pga = <2>; /* PGA Gain /2 instead of the default /8 */
>         /* Note: Possible PGA Gain values are /1, /2, /4 and /8 */
>
>         has-16v-brng; /* Bus voltage range of 16V instead of 32V */
>
>         averaging = <128>; /* Average 128 samples */
> };
>
> Should each of those also have a sysfs attribute?

These should probably be in DT or in sysfs, but not both. The decision
should be based on how are the settings picked: by the h/w design or
an end user will want to modify them.

> Solution B:
>
> ina219_bar: ina219@45 {
>         compatible = "ti,ina219";
>         reg = <0x45>;
>         shunt-resistor = <25000>;
>
>         config-reg = <0x019F>; /* PGA /1, BRNG = 16V, No averaging */
> };
>
> Regards,
> Clemens
