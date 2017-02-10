Return-path: <joel.stan@gmail.com>
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <1486509056-25838-6-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486509056-25838-1-git-send-email-eajames@linux.vnet.ibm.com> <1486509056-25838-6-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Feb 2017 16:01:51 +1030
Message-ID: <CACPK8XenXd7z6kb0N3pG4WRGD0QG5q+Rv9duo6HYhJpG58v2hQ@mail.gmail.com>
Subject: Re: [PATCH linux v7 5/6] hwmon: occ: Add hwmon implementation for the
 P8 OCC
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
> Add code to tie the hwmon sysfs code and the POWER8 OCC code together, as
> well as probe the entire driver from the I2C bus. I2C is the communication
> method between the BMC and the P8 OCC.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/hwmon/occ.txt |  13 +++
>  drivers/hwmon/occ/Kconfig                       |  14 ++++
>  drivers/hwmon/occ/Makefile                      |   1 +
>  drivers/hwmon/occ/p8_occ_i2c.c                  | 104 ++++++++++++++++++++++++

For consistency, how about we call this occ_p8_i2c.c? The other files
have the machine name second.


>  4 files changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/occ.txt
>  create mode 100644 drivers/hwmon/occ/p8_occ_i2c.c
>

> diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
> index cdb64a7..3a5188f 100644
> --- a/drivers/hwmon/occ/Kconfig
> +++ b/drivers/hwmon/occ/Kconfig
> @@ -13,3 +13,17 @@ menuconfig SENSORS_PPC_OCC
>
>           This driver can also be built as a module. If so, the module
>           will be called occ.
> +
> +if SENSORS_PPC_OCC
> +
> +config SENSORS_PPC_OCC_P8_I2C
> +       tristate "POWER8 OCC hwmon support"
> +       depends on I2C
> +       help
> +        Provide a hwmon sysfs interface for the POWER8 On-Chip Controller,
> +        exposing temperature, frequency and power measurements.
> +
> +        This driver can also be built as a module. If so, the module will be
> +        called p8-occ-i2c.

Mention that this driver is for the BMC (or just "service processor"),
and is not useful in the Power8 kernel.

I'm trying to think of a better prefix than PPC. PPC means much more
than Power8 and Power9, which is what we mean. It's also confusing as
we don't run this on any PowerPC machine - it's for an ARM chip.

> +
> +int p8_i2c_getscom(void *bus, u32 address, u64 *data)
> +{
> +       /* P8 i2c slave requires address to be shifted by 1 */
> +       address = address << 1;

I think these are scom addresses? Please indicate that so we don't get
them confused with i2c.

Or are they scom operations?

> +
> +       return occ_i2c_getscom(bus, address, data);
> +}
> +
> +int p8_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1)

The functions can be static.

> +{
> +       /* P8 i2c slave requires address to be shifted by 1 */
> +       address = address << 1;
> +
> +       return occ_i2c_putscom(bus, address, data0, data1);
> +}
