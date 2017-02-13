Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38196 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752073AbdBMRBL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Feb 2017 12:01:11 -0500
Date: Mon, 13 Feb 2017 09:01:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>,
        eajames <eajames@linux.vnet.ibm.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH linux v7 4/6] hwmon: occ: Add callbacks for parsing P8
 OCC datastructures
Message-ID: <20170213170106.GA14665@roeck-us.net>
References: <1486509056-25838-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1486509056-25838-5-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8Xf+YFuGydAMxcqD3eTYkgfgHtg743kkd-J_EshnYZ1J=Q@mail.gmail.com>
 <1486948642.3661.3.camel@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1486948642.3661.3.camel@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Feb 13, 2017 at 11:47:22AM +1030, Andrew Jeffery wrote:
> On Fri, 2017-02-10 at 16:01 +1030, Joel Stanley wrote:
> > > On Wed, Feb 8, 2017 at 9:40 AM,  <eajames@linux.vnet.ibm.com> wrote:
> > > > > From: "Edward A. James" <eajames@us.ibm.com>
> > > 
> > > Add functions to parse the data structures that are specific to the OCC on
> > > the POWER8 processor. These are the sensor data structures, including
> > > temperature, frequency, power, and "caps."
> > > 
> > > > > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > >  Documentation/hwmon/occ    |   9 ++
> > >  drivers/hwmon/occ/occ_p8.c | 248 +++++++++++++++++++++++++++++++++++++++++++++
> > >  drivers/hwmon/occ/occ_p8.h |  30 ++++++
> > >  3 files changed, 287 insertions(+)
> > >  create mode 100644 drivers/hwmon/occ/occ_p8.c
> > >  create mode 100644 drivers/hwmon/occ/occ_p8.h
> > > 
> > > diff --git a/drivers/hwmon/occ/occ_p8.c b/drivers/hwmon/occ/occ_p8.c
> > > new file mode 100644
> > > index 0000000..5c61fc4
> > > --- /dev/null
> > > +++ b/drivers/hwmon/occ/occ_p8.c
> > > +void p8_parse_sensor(u8 *data, void *sensor, int sensor_type, int off,
> > > +                    int snum)
> > > +{
> > > +       switch (sensor_type) {
> > > +       case FREQ:
> > > +       case TEMP:
> > > +       {
> > > +               struct p8_occ_sensor *os =
> > > +                       &(((struct p8_occ_sensor *)sensor)[snum]);
> > > +
> > > +               os->sensor_id = be16_to_cpu(get_unaligned((u16 *)&data[off]));
> > > +               os->value = be16_to_cpu(get_unaligned((u16 *)&data[off + 2]));
> > > +       }
> > > +               break;
> > > +       case POWER:
> > > +       {
> > > +               struct p8_power_sensor *ps =
> > > +                       &(((struct p8_power_sensor *)sensor)[snum]);
> > > +
> > > +               ps->sensor_id = be16_to_cpu(get_unaligned((u16 *)&data[off]));
> > > +               ps->update_tag =
> > > +                       be32_to_cpu(get_unaligned((u32 *)&data[off + 2]));
> > 
> > This might be more readable if you wrote a
> > cast_get_unaliged_be32_to_cpu() macro.
> > 
> > > +               ps->accumulator =
> > > +                       be32_to_cpu(get_unaligned((u32 *)&data[off + 6]));
> > > +               ps->value = be16_to_cpu(get_unaligned((u16 *)&data[off + 10]));
> > > +       }
> > > +               break;
> > > +       case CAPS:
> > > +       {
> > > +const u32 *p8_get_sensor_hwmon_configs()
> > > +{
> > > +       return p8_sensor_hwmon_configs;
> > > +}
> > > +EXPORT_SYMBOL(p8_get_sensor_hwmon_configs);
> > > +
> > > +struct occ *p8_occ_start(struct device *dev, void *bus,
> > > +                        struct occ_bus_ops *bus_ops)
> > > +{
> > > +       return occ_start(dev, bus, bus_ops, &p8_ops, &p8_config);
> > > +}
> > > +EXPORT_SYMBOL(p8_occ_start);
> > 
> > We don't need to export these symbols; they're not used outside of the
> > OCC module. The same goes for all of the exports you've made in this
> > series.
> 
> Sorry, this was my doing in an attempt to get everything to build as
> modules rather than just built-in. I should have studied
> Documentation/kbuild/modules.txt a bit more.
> 
> > 
> > I suggest we re-architect the drivers so we build all of the objects
> > and link them into one module for each platform, instead of having an
> > occ module and occ-p8/occ-p9 modules and i2c modules that all depend
> > on each other. The Makefile could look like this:
> > 
> > obj-$(CONFIG_SENSORS_PPC_OCC_P8_I2C) += hwmon_occ_p8.o
> > obj-$(CONFIG_SENSORS_PPC_OCC_P9) += hwmon_occ_p9.o
> > 
> > hwmon_occ_p8-$(CONFIG_SENSORS_PPC_OCC_P8_I2C) += occ_scom_i2c.o
> > occ_p8.o p8_occ_i2c.o occ_sysfs.o occ.o
> > hwmon_occ_p9-$(CONFIG_SENSORS_PPC_OCC_P9) += occ_p9.o occ_sysfs.o occ.o
> > 
Please note that the above will still result in separate modules,
one per object file. Is this really what you want ? I don't even
know what happens if an object file is specified twice, so
you may also have to make sure that CONFIG_SENSORS_PPC_OCC_P8_I2C
and CONFIG_SENSORS_PPC_OCC_P9 are either-or configurations.
Again, I am not really sure if that is what you want.

> > And the Kbuild like this:
> > 
> > menuconfig SENSORS_PPC_OCC
> >         bool "PPC On-Chip Controller"
> > 
> > if SENSORS_PPC_OCC
> > 
> > config SENSORS_PPC_OCC_P8_I2C
> >         bool "POWER8 OCC hwmon support"
> >         depends on I2C
> > 
> > config SENSORS_PPC_OCC_P9
> >         bool "POWER9 OCC hwmon support"
> > 
If both are bool, ie there won't be any module support,
I don't really see the point of specifying occ_sysfs.o and
occ.o twice above.

> > endif
> 
> Given we can drop the exports that's a much more sensible idea.
> 
Please make sure that both "allmodconfig" and "allyesconfig"
still build after this change.

Thanks,
Guenter
