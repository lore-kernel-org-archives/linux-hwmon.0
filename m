Return-path: <clemens.gruber@pqgruber.com>
Date: Tue, 15 Nov 2016 20:52:33 +0100
From: Clemens Gruber <clemens.gruber@pqgruber.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>
Subject: ina2xx: New DT properties
Message-ID: <20161115195232.GA24893@archie.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <linux-hwmon@vger.kernel.org>

Hi,

I am preparing a patch for the ina2xx driver to allow configuring the
PGA bits (which define the shunt voltage range) and the BRNG bit (which
defines the bus voltage range) from the device tree.
We have multiple INA219 with different voltage ranges, so I can't just
change the hardcoded default in ina2xx.c
The ADC averaging setting should also be configurable.

Now I am asking myself if I should create several new DT properties or
rather add one config-reg property to set a different default value for
the 16-bit configuration register (instead of the driver defaults of
0x399F for the INA219 and 0x4527 for the INA226) ?

Solution A:

ina219_foo: ina219@44 {
	compatible = "ti,ina219";
	reg = <0x44>;
	shunt-resistor = <25000>;

	pga = <2>; /* PGA Gain /2 instead of the default /8 */
	/* Note: Possible PGA Gain values are /1, /2, /4 and /8 */

	has-16v-brng; /* Bus voltage range of 16V instead of 32V */

	averaging = <128>; /* Average 128 samples */
};

Should each of those also have a sysfs attribute?


Solution B:

ina219_bar: ina219@45 {
	compatible = "ti,ina219";
	reg = <0x45>;
	shunt-resistor = <25000>;

	config-reg = <0x019F>; /* PGA /1, BRNG = 16V, No averaging */
};

Regards,
Clemens
