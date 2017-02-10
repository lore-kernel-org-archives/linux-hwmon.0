Return-path: <joel.stan@gmail.com>
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <1486509056-25838-5-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486509056-25838-1-git-send-email-eajames@linux.vnet.ibm.com> <1486509056-25838-5-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Feb 2017 16:01:32 +1030
Message-ID: <CACPK8Xf+YFuGydAMxcqD3eTYkgfgHtg743kkd-J_EshnYZ1J=Q@mail.gmail.com>
Subject: Re: [PATCH linux v7 4/6] hwmon: occ: Add callbacks for parsing P8 OCC datastructures
To: eajames <eajames@linux.vnet.ibm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
	Wolfram Sang <wsa@the-dreams.de>, Andrew Jeffery <andrew@aj.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Feb 8, 2017 at 9:40 AM,  <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Add functions to parse the data structures that are specific to the OCC on
> the POWER8 processor. These are the sensor data structures, including
> temperature, frequency, power, and "caps."
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/hwmon/occ    |   9 ++
>  drivers/hwmon/occ/occ_p8.c | 248 +++++++++++++++++++++++++++++++++++++++++++++
>  drivers/hwmon/occ/occ_p8.h |  30 ++++++
>  3 files changed, 287 insertions(+)
>  create mode 100644 drivers/hwmon/occ/occ_p8.c
>  create mode 100644 drivers/hwmon/occ/occ_p8.h

>
> diff --git a/drivers/hwmon/occ/occ_p8.c b/drivers/hwmon/occ/occ_p8.c
> new file mode 100644
> index 0000000..5c61fc4
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_p8.c

> +void p8_parse_sensor(u8 *data, void *sensor, int sensor_type, int off,
> +                    int snum)
> +{
> +       switch (sensor_type) {
> +       case FREQ:
> +       case TEMP:
> +       {
> +               struct p8_occ_sensor *os =
> +                       &(((struct p8_occ_sensor *)sensor)[snum]);
> +
> +               os->sensor_id = be16_to_cpu(get_unaligned((u16 *)&data[off]));
> +               os->value = be16_to_cpu(get_unaligned((u16 *)&data[off + 2]));
> +       }
> +               break;
> +       case POWER:
> +       {
> +               struct p8_power_sensor *ps =
> +                       &(((struct p8_power_sensor *)sensor)[snum]);
> +
> +               ps->sensor_id = be16_to_cpu(get_unaligned((u16 *)&data[off]));
> +               ps->update_tag =
> +                       be32_to_cpu(get_unaligned((u32 *)&data[off + 2]));

This might be more readable if you wrote a
cast_get_unaliged_be32_to_cpu() macro.

> +               ps->accumulator =
> +                       be32_to_cpu(get_unaligned((u32 *)&data[off + 6]));
> +               ps->value = be16_to_cpu(get_unaligned((u16 *)&data[off + 10]));
> +       }
> +               break;
> +       case CAPS:
> +       {

> +const u32 *p8_get_sensor_hwmon_configs()
> +{
> +       return p8_sensor_hwmon_configs;
> +}
> +EXPORT_SYMBOL(p8_get_sensor_hwmon_configs);
> +
> +struct occ *p8_occ_start(struct device *dev, void *bus,
> +                        struct occ_bus_ops *bus_ops)
> +{
> +       return occ_start(dev, bus, bus_ops, &p8_ops, &p8_config);
> +}
> +EXPORT_SYMBOL(p8_occ_start);

We don't need to export these symbols; they're not used outside of the
OCC module. The same goes for all of the exports you've made in this
series.

I suggest we re-architect the drivers so we build all of the objects
and link them into one module for each platform, instead of having an
occ module and occ-p8/occ-p9 modules and i2c modules that all depend
on each other. The Makefile could look like this:

obj-$(CONFIG_SENSORS_PPC_OCC_P8_I2C) += hwmon_occ_p8.o
obj-$(CONFIG_SENSORS_PPC_OCC_P9) += hwmon_occ_p9.o

hwmon_occ_p8-$(CONFIG_SENSORS_PPC_OCC_P8_I2C) += occ_scom_i2c.o
occ_p8.o p8_occ_i2c.o occ_sysfs.o occ.o
hwmon_occ_p9-$(CONFIG_SENSORS_PPC_OCC_P9) += occ_p9.o occ_sysfs.o occ.o

And the Kbuild like this:

menuconfig SENSORS_PPC_OCC
        bool "PPC On-Chip Controller"

if SENSORS_PPC_OCC

config SENSORS_PPC_OCC_P8_I2C
        bool "POWER8 OCC hwmon support"
        depends on I2C

config SENSORS_PPC_OCC_P9
        bool "POWER9 OCC hwmon support"

endif
