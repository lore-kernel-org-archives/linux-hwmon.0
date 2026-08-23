Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B551DE8AE;
	Sun, 23 Aug 2026 21:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787519406; cv=pass; b=tit6fFsBexYuYKqhGdTnMJoERMBP7rsFiyj/Jr3mnbVYH0D67R6n78y8OxB4PcrYxteKdfJtnhy9HPNnO5ZDR5+n9UOapi996wn2fbC8GLuWzZrchmWTFddVr7GLGpCnO0cOIwI9hPXdUYE1OAwl2UW9zIYX2KJbVfXN9aA6aK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787519406; c=relaxed/simple;
	bh=3KXeaxrRaoeXVSWrzqjnYb+z+bRAMNvWHu5ok+RC+Oo=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qSG5iBzvWQqZAtWv6aLNx36wLxRrH0xzBD+fXLF90jTgBbnM5ZS94u6BgiUnEgP0Qax0owPG5CG9Rp+9UrUYRMLKhY1j83c8XXGZgfV3STOxUCUJBLZpl4YLwx++U8E1IuzCiF8MhHhyNXfD/dd1OEdmwk+8d+qjQQX3FBv+c34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=AgUu0+g4; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="AgUu0+g4"
ARC-Seal: i=1; a=rsa-sha256; t=1787519380; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nSlxaDsFFVpOMtJ3PXWARFnX3vl+W70XNoNCoog2rcW4X+5fntGFkjdjeiwSSysD8hk788fxVulNYve8+1nNHNUQGeviTn3LighV9MMbrKWNiatm205yUrjnxv8KXBiwFN+8YvA1a+NFfFcjMck3LFuYj5ISV5y1sbS2Mg+jb1c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787519380; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4LGGvm48SEPiICv+MvUveY7Y3V0OukTrrq8WkdstY0E=; 
	b=H9QEsXneVNO+9BuzfVuu4us0uS04bp/VAcDtO9FdeKxg+gdkOUzefPv2cTzBBclP9CB4SD3XgrVdZHE06HVICzuk2v6ZZtSHWf9YsQ60VdsZKIXBMcfWdt1KPdhQFchonSGGT8hY3HkX7eMpe97rcMd3j/dwbzzI2s4VnuHAZAY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787519380;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=4LGGvm48SEPiICv+MvUveY7Y3V0OukTrrq8WkdstY0E=;
	b=AgUu0+g4NJHFWfJ2liwc+Ry6F+QMwcqzyjRig3yWOtTckiLKVAKNYTGaDbcSwlx1
	UBJ5WN86N6h2yO9XBImkqD96/siFT4pz+E2vqVnn1AdCT4rVIS6Er4qs49HhD0y/E6L
	3Z9+TkenK+Iqz52rt0FZEM/fCViAcnz8Uk5YRAlciepGlx1/tdqfYAFnCPp5lFkIwTk
	55xJsgftMmGdAQ5Q1wkvdQCop6Jvvd8MD0grl4BGIOj8SfttWB7bqcufQBtYbFOoB0J
	J4XF/DoMDgmyFH/ZX0fjuA/+nOyLXNqmSkW0Kpf8Vlc0NBgKM7kQS4iRt5j2LoUHXU5
	SV4/xNHkPQ==
Received: by mx.zohomail.com with SMTPS id 1787519377458945.3892700830614;
	Sun, 23 Aug 2026 14:09:37 -0700 (PDT)
Message-ID: <f0a05df88c4e0ea2f9b7680b24a94c227e5375e1.camel@rong.moe>
Subject: Re: [RFC PATCH 3/3] platform/x86: lenovo: Add Legion Go Fan Method
 curve driver
From: Rong Zhang <i@rong.moe>
To: Aditya Dash <mradityadash@gmail.com>, "Derek J. Clark"	
 <derekjohn.clark@gmail.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, Hans de Goede
	 <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20260821214728.87773-4-mradityadash@gmail.com>
References: <20260821214728.87773-1-mradityadash@gmail.com>
	 <20260821214728.87773-4-mradityadash@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 05:09:15 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Aditya,

On Sat, 2026-08-22 at 03:17 +0530, Aditya Dash wrote:
> Legion Go firmware keeps its custom fan curve in a separate Fan Method WM=
I
> interface. Method 5 returns ten control values and ten temperatures, whil=
e
> Method 6 replaces the complete table.
>=20
> The GUID also appears on Lenovo systems with a different table layout.

What does the different table layout look like?

> Limit the driver to Legion Go 8APU1, Legion Go 8ASP2, Legion Go 8AHP2,
> Legion Go S 8ARP1, and Legion Go S 8APU1 products. These products use the
> same ten-point layout and Method 6 request.
>=20
> The curve applies to the same fan as the existing Other Mode attributes.
> Add a separate WMI driver and attach the ten automatic-point pairs to the
> HWMON device that Other Mode already provides. Match devices from the sam=
e
> WMI provider. Other Mode continues to work without Fan Method. Probe does
> not invoke either method.
>=20
> Validate both counts, every control value, and the complete temperature
> table before using a Method 5 reply. A point write holds the mutex while
> it reads the current table, changes one control value, and submits the
> complete Method 6 request. The other values remain unchanged.
>=20
> The HWMON mapping is not clear. On the tested Legion Go 8APU1, the fan
> responds to values from 0 through 115. This is Lenovo's 0 through 115
> percent range. Lenovo software shows 0 through 100 percent to the user,
> and 115 reaches the RPM observed in Full Speed mode. Firmware accepts
> values through 255, but values above 115 caused no observed RPM increase.
>=20
> This RFC exposes the firmware values unchanged. The fixed temperatures ar=
e
> read-only.
>=20
> Assisted-by: Pi:gpt-5.6-sol
> Signed-off-by: Aditya Dash <mradityadash@gmail.com>
> ---
>  .../wmi/devices/lenovo-wmi-fan-method.rst     |  34 ++
>  .../wmi/devices/lenovo-wmi-other.rst          |   3 +
>  MAINTAINERS                                   |   1 +
>  drivers/platform/x86/lenovo/Kconfig           |  11 +
>  drivers/platform/x86/lenovo/Makefile          |   1 +
>  drivers/platform/x86/lenovo/wmi-fan-method.c  | 380 ++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-other.c       |  97 ++++-
>  7 files changed, 520 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/wmi/devices/lenovo-wmi-fan-method.rst
>  create mode 100644 drivers/platform/x86/lenovo/wmi-fan-method.c
>=20
> diff --git a/Documentation/wmi/devices/lenovo-wmi-fan-method.rst b/Docume=
ntation/wmi/devices/lenovo-wmi-fan-method.rst
> new file mode 100644
> index 000000000000..67c9a92ed992
> --- /dev/null
> +++ b/Documentation/wmi/devices/lenovo-wmi-fan-method.rst
> @@ -0,0 +1,34 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Lenovo Fan Method WMI Driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +WMI GUID ``92549549-4BDE-4F06-AC04-CE8BF898DBAA``
> +
> +The Lenovo Fan Method interface provides a ten-point firmware fan table =
on
> +Legion Go 8APU1, Legion Go 8ASP2, Legion Go 8AHP2, Legion Go S 8ARP1, an=
d
> +Legion Go S 8APU1 products.
> +
> +The driver adds ``pwm1_auto_point1_*`` through
> +``pwm1_auto_point10_*`` to the HWMON device that the Lenovo Other Mode d=
river
> +owns. The temperature attributes are fixed and read-only. They contain p=
oints
> +from 10 through 100 degrees Celsius in 10-degree steps.
> +
> +Each ``pwm1_auto_point*_pwm`` attribute is read-write and passes a firmw=
are
> +control value from 0 through 255 without scaling. On the tested Legion G=
o
> +8APU1, the hardware responds from 0 through 115, corresponding to Lenovo=
's
> +0 through 115 percent range. Lenovo software shows 0 through 100 percent=
 to
> +the user, and 115 percent reaches the RPM observed in Full Speed mode. T=
he
> +firmware accepts values through 255, but values above 115 caused no obse=
rved
> +RPM increase.
> +
> +A control-value read validates both ten-entry tables before returning da=
ta. A
> +point write reads the current table, changes one control value, and subm=
its the
> +complete request. It preserves the other nine control values and all ret=
urned
> +temperatures.
> +
> +The Fan Method and Other Mode drivers use separate modules and WMI devic=
es.
> +The component framework associates devices that belong to the same WMI
> +provider. Fan Method curve attributes are absent when either interface i=
s not
> +available.
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentati=
on/wmi/devices/lenovo-wmi-other.rst
> index c93e9e6f3fd0..34352dbd6fb9 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -60,6 +60,9 @@ Some Legion Go firmware does not advertise fan 1 RPM th=
rough Capability
>  Data. In that case, the driver reads Other Mode feature ``0x04030001`` f=
or
>  ``fan1_input``. Value ``0xffffffff`` means that RPM is unavailable.
> =20
> +When the separate Lenovo Fan Method driver binds to the same WMI provide=
r, it
> +adds ten automatic fan-curve points to this HWMON device.
> +
>  LENOVO_CAPABILITY_DATA_01
>  -------------------------
> =20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3820b286f09f..8612c2323540 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14689,6 +14689,7 @@ M:	Mark Pearson <mpearson-lenovo@squebb.ca>
>  M:	Derek J. Clark <derekjohn.clark@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/wmi/devices/lenovo-wmi-fan-method.rst
>  F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>  F:	Documentation/wmi/devices/lenovo-wmi-other.rst
>  F:	drivers/platform/x86/lenovo/*
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/l=
enovo/Kconfig
> index 4443f40ef8aa..e69942ce3093 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -276,3 +276,14 @@ config LENOVO_WMI_TUNING
> =20
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called lenovo-wmi-other.
> +
> +config LENOVO_WMI_FAN_METHOD
> +	tristate "Lenovo Fan Method WMI Driver"
> +	depends on DMI
> +	depends on LENOVO_WMI_TUNING
> +	help
> +	  Say Y here to add the firmware fan table on supported Lenovo
> +	  Legion Go products to the Lenovo Other Mode HWMON device.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called lenovo-wmi-fan-method.
> diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/=
lenovo/Makefile
> index 91a9370f11b3..171a19e01479 100644
> --- a/drivers/platform/x86/lenovo/Makefile
> +++ b/drivers/platform/x86/lenovo/Makefile
> @@ -17,6 +17,7 @@ lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+=3D wmi-even=
ts.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D wmi-helpers.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+=3D wmi-gamezone.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)	+=3D wmi-other.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_FAN_METHOD)	+=3D wmi-fan-method.o
> =20
>  # Add 'lenovo' prefix to each module listed in lenovo-target-*
>  define LENOVO_OBJ_TARGET
> diff --git a/drivers/platform/x86/lenovo/wmi-fan-method.c b/drivers/platf=
orm/x86/lenovo/wmi-fan-method.c
> new file mode 100644
> index 000000000000..4f29c4134caf
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo/wmi-fan-method.c
> @@ -0,0 +1,380 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Fan Method WMI interface driver.
> + *
> + * This driver exposes the firmware fan table through HWMON automatic-po=
int
> + * attributes on selected Lenovo Legion Go products.
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/component.h>
> +#include <linux/device.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
> +#include <linux/wmi.h>
> +
> +#define LENOVO_FAN_METHOD_GUID "92549549-4BDE-4F06-AC04-CE8BF898DBAA"
> +
> +#define LENOVO_FAN_METHOD_GET_CURVE	5
> +#define LENOVO_FAN_METHOD_SET_CURVE	6
> +#define LENOVO_FAN_CURVE_POINTS		10
> +#define LENOVO_FAN_CURVE_REPLY_SIZE	88
> +#define LENOVO_FAN_CURVE_WRITE_SIZE	64
> +
> +#define LENOVO_FAN_REPLY_SPEED_COUNT_OFFSET	0
> +#define LENOVO_FAN_REPLY_SPEED_OFFSET		4
> +#define LENOVO_FAN_REPLY_TEMP_COUNT_OFFSET	44
> +#define LENOVO_FAN_REPLY_TEMP_OFFSET		48
> +
> +#define LENOVO_FAN_WRITE_SPEED_COUNT_OFFSET	2
> +#define LENOVO_FAN_WRITE_SPEED_OFFSET		6
> +#define LENOVO_FAN_WRITE_TEMP_TYPE_OFFSET	26
> +#define LENOVO_FAN_WRITE_TEMP_COUNT_OFFSET	27
> +#define LENOVO_FAN_WRITE_TEMP_OFFSET		31
> +#define LENOVO_FAN_WRITE_TRAILER_OFFSET		51
> +#define LENOVO_FAN_WRITE_TRAILER_VALUE_OFFSET	53

I don't like defining so many offsets here.

And this just overfits LENOVO_FAN_CURVE_POINTS =3D=3D 10, doesn't it? LLMs
tend to overfit various things, sigh.

It would be super painful when adding support for devices with
LENOVO_FAN_CURVE_POINTS !=3D 10, so please don't overfit that.

> +
> +#define LENOVO_FAN_WRITE_TEMP_TYPE		1
> +#define LENOVO_FAN_WRITE_TRAILER		0x5a
> +#define LENOVO_FAN_WRITE_TRAILER_VALUE		100
> +
> +static const struct dmi_system_id lwmi_fan_dmi_table[] =3D {
> +	{
> +		.ident =3D "Lenovo Legion Go 8APU1",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"),
> +		},
> +	},
> +	{
> +		.ident =3D "Lenovo Legion Go S 8APU1",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8APU1"),
> +		},
> +	},
> +	{
> +		.ident =3D "Lenovo Legion Go S 8ARP1",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8ARP1"),
> +		},
> +	},
> +	{
> +		.ident =3D "Lenovo Legion Go 8ASP2",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8ASP2"),
> +		},
> +	},
> +	{
> +		.ident =3D "Lenovo Legion Go 8AHP2",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8AHP2"),
> +		},
> +	},
> +	{}
> +};
> +
> +static const u16 lwmi_fan_temperatures[LENOVO_FAN_CURVE_POINTS] =3D {
> +	10, 20, 30, 40, 50, 60, 70, 80, 90, 100
> +};

65535 degree Celsius is too hot. Just use u8.

> +
> +struct lwmi_fan_method_curve {
> +	u16 speed[LENOVO_FAN_CURVE_POINTS];
> +	u16 temperature[LENOVO_FAN_CURVE_POINTS];

Ditto.

> +};
> +
> +struct lwmi_fan_method_priv;
> +
> +struct lwmi_fan_method_attr {
> +	struct device_attribute dev_attr;
> +	struct lwmi_fan_method_priv *priv;
> +	u8 index;
> +};
> +
> +struct lwmi_fan_method_priv {
> +	struct wmi_device *wdev;
> +	struct mutex lock; /* Serializes all Fan Method calls. */
> +	struct lwmi_fan_method_attr point_attrs[LENOVO_FAN_CURVE_POINTS * 2];
> +	struct attribute *attrs[LENOVO_FAN_CURVE_POINTS * 2 + 1];
> +	struct attribute_group group;
> +};
> +
> +static int lwmi_fan_method_get_curve(struct lwmi_fan_method_priv *priv,
> +				     struct lwmi_fan_method_curve *curve)
> +{
> +	u8 input[] =3D { 1, 1 };
> +	struct wmi_buffer in =3D {
> +		.length =3D sizeof(input),
> +		.data =3D input,
> +	};
> +	struct wmi_buffer out =3D {};
> +	const u8 *buffer;
> +	int ret, i;
> +
> +	ret =3D wmidev_invoke_method(priv->wdev, 0,
> +				   LENOVO_FAN_METHOD_GET_CURVE, &in, &out,
> +				   LENOVO_FAN_CURVE_REPLY_SIZE);
> +	if (ret)
> +		return ret;
> +
> +	buffer =3D out.data;
> +	if (get_unaligned_le32(buffer + LENOVO_FAN_REPLY_SPEED_COUNT_OFFSET) !=
=3D
> +	    LENOVO_FAN_CURVE_POINTS ||
> +	    get_unaligned_le32(buffer + LENOVO_FAN_REPLY_TEMP_COUNT_OFFSET) !=
=3D
> +	    LENOVO_FAN_CURVE_POINTS) {
> +		ret =3D -ERANGE;
> +		goto out_free;
> +	}

Don't overfit...

> +
> +	for (i =3D 0; i < LENOVO_FAN_CURVE_POINTS; i++) {
> +		u32 speed =3D get_unaligned_le32(buffer + LENOVO_FAN_REPLY_SPEED_OFFSE=
T +
> +					       i * sizeof(u32));
> +		u32 temperature =3D
> +			get_unaligned_le32(buffer + LENOVO_FAN_REPLY_TEMP_OFFSET +
> +					   i * sizeof(u32));

Please check how lwmi_cd_fan_list_alloc_cache() gets rid of hard-coded
offsets.

> +
> +		if (speed > U8_MAX || temperature !=3D lwmi_fan_temperatures[i]) {
> +			ret =3D -ERANGE;
> +			goto out_free;
> +		}

Why would you need to enforce temperature =3D=3D lwmi_fan_temperatures[i]?
You can expose the FW temperature table to userspace via
/sys/class/hwmon/hwmonX/pwmY_auto_pointZ_temp.

> +
> +		curve->speed[i] =3D speed;

If speed is always less than or equal to U8_MAX, please convert the array
into a u8 one.

> +		curve->temperature[i] =3D temperature;
> +	}
> +
> +out_free:
> +	kfree(out.data);

Use cleanup.h __free(). See also lwmi_cd_fan_list_alloc_cache().

> +	return ret;
> +}
> +
> +static int lwmi_fan_method_set_curve(struct lwmi_fan_method_priv *priv,
> +				     const struct lwmi_fan_method_curve *curve)
> +{
> +	u8 buffer[LENOVO_FAN_CURVE_WRITE_SIZE] =3D { 0xff, 0x01 };
> +	struct wmi_buffer in =3D {
> +		.length =3D sizeof(buffer),
> +		.data =3D buffer,
> +	};
> +	int i;
> +
> +	put_unaligned_le32(LENOVO_FAN_CURVE_POINTS,
> +			   buffer + LENOVO_FAN_WRITE_SPEED_COUNT_OFFSET);
> +	for (i =3D 0; i < LENOVO_FAN_CURVE_POINTS; i++)
> +		put_unaligned_le16(curve->speed[i],
> +				   buffer + LENOVO_FAN_WRITE_SPEED_OFFSET +
> +				   i * sizeof(u16));
> +
> +	buffer[LENOVO_FAN_WRITE_TEMP_TYPE_OFFSET] =3D LENOVO_FAN_WRITE_TEMP_TYP=
E;
> +	put_unaligned_le32(LENOVO_FAN_CURVE_POINTS,
> +			   buffer + LENOVO_FAN_WRITE_TEMP_COUNT_OFFSET);
> +	for (i =3D 0; i < LENOVO_FAN_CURVE_POINTS; i++)
> +		put_unaligned_le16(curve->temperature[i],
> +				   buffer + LENOVO_FAN_WRITE_TEMP_OFFSET +
> +				   i * sizeof(u16));
> +
> +	buffer[LENOVO_FAN_WRITE_TRAILER_OFFSET] =3D LENOVO_FAN_WRITE_TRAILER;
> +	put_unaligned_le16(LENOVO_FAN_WRITE_TRAILER_VALUE,
> +			   buffer + LENOVO_FAN_WRITE_TRAILER_VALUE_OFFSET);
> +
> +	return wmidev_invoke_procedure(priv->wdev, 0,
> +				       LENOVO_FAN_METHOD_SET_CURVE, &in);
> +}

What a hard-coded offset soup...

I will continue reviewing the series when you drop hard-coded offsets and
stop overfitting specific devices in the next revision.

Thanks,
Rong

> +
> +static ssize_t lwmi_fan_method_pwm_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buf)
> +{
> +	struct lwmi_fan_method_attr *point_attr =3D
> +		container_of(attr, struct lwmi_fan_method_attr, dev_attr);
> +	struct lwmi_fan_method_priv *priv =3D point_attr->priv;
> +	struct lwmi_fan_method_curve curve;
> +	int ret;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	ret =3D lwmi_fan_method_get_curve(priv, &curve);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", curve.speed[point_attr->index]);
> +}
> +
> +static ssize_t lwmi_fan_method_pwm_store(struct device *dev,
> +					 struct device_attribute *attr,
> +					 const char *buf, size_t count)
> +{
> +	struct lwmi_fan_method_attr *point_attr =3D
> +		container_of(attr, struct lwmi_fan_method_attr, dev_attr);
> +	struct lwmi_fan_method_priv *priv =3D point_attr->priv;
> +	struct lwmi_fan_method_curve curve;
> +	unsigned long pwm;
> +	int ret;
> +
> +	ret =3D kstrtoul(buf, 10, &pwm);
> +	if (ret)
> +		return ret;
> +	if (pwm > U8_MAX)
> +		return -EINVAL;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	ret =3D lwmi_fan_method_get_curve(priv, &curve);
> +	if (ret)
> +		return ret;
> +
> +	curve.speed[point_attr->index] =3D pwm;
> +	ret =3D lwmi_fan_method_set_curve(priv, &curve);
> +
> +	return ret ? ret : count;
> +}
> +
> +static ssize_t lwmi_fan_method_temp_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buf)
> +{
> +	struct lwmi_fan_method_attr *point_attr =3D
> +		container_of(attr, struct lwmi_fan_method_attr, dev_attr);
> +
> +	return sysfs_emit(buf, "%u\n",
> +			  lwmi_fan_temperatures[point_attr->index] * 1000);
> +}
> +
> +#define LWMI_FAN_METHOD_POINT_NAMES(_point) \
> +	"pwm1_auto_point" #_point "_pwm", \
> +	"pwm1_auto_point" #_point "_temp"
> +
> +static const char * const lwmi_fan_method_attr_names[] =3D {
> +	LWMI_FAN_METHOD_POINT_NAMES(1),
> +	LWMI_FAN_METHOD_POINT_NAMES(2),
> +	LWMI_FAN_METHOD_POINT_NAMES(3),
> +	LWMI_FAN_METHOD_POINT_NAMES(4),
> +	LWMI_FAN_METHOD_POINT_NAMES(5),
> +	LWMI_FAN_METHOD_POINT_NAMES(6),
> +	LWMI_FAN_METHOD_POINT_NAMES(7),
> +	LWMI_FAN_METHOD_POINT_NAMES(8),
> +	LWMI_FAN_METHOD_POINT_NAMES(9),
> +	LWMI_FAN_METHOD_POINT_NAMES(10),
> +};
> +
> +#undef LWMI_FAN_METHOD_POINT_NAMES
> +
> +static void lwmi_fan_method_attrs_init(struct lwmi_fan_method_priv *priv=
)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < LENOVO_FAN_CURVE_POINTS; i++) {
> +		struct lwmi_fan_method_attr *pwm =3D &priv->point_attrs[i * 2];
> +		struct lwmi_fan_method_attr *temp =3D &priv->point_attrs[i * 2 + 1];
> +
> +		sysfs_attr_init(&pwm->dev_attr.attr);
> +		pwm->dev_attr.attr.name =3D lwmi_fan_method_attr_names[i * 2];
> +		pwm->dev_attr.attr.mode =3D 0644;
> +		pwm->dev_attr.show =3D lwmi_fan_method_pwm_show;
> +		pwm->dev_attr.store =3D lwmi_fan_method_pwm_store;
> +		pwm->priv =3D priv;
> +		pwm->index =3D i;
> +		priv->attrs[i * 2] =3D &pwm->dev_attr.attr;
> +
> +		sysfs_attr_init(&temp->dev_attr.attr);
> +		temp->dev_attr.attr.name =3D lwmi_fan_method_attr_names[i * 2 + 1];
> +		temp->dev_attr.attr.mode =3D 0444;
> +		temp->dev_attr.show =3D lwmi_fan_method_temp_show;
> +		temp->index =3D i;
> +		priv->attrs[i * 2 + 1] =3D &temp->dev_attr.attr;
> +	}
> +
> +	priv->group.attrs =3D priv->attrs;
> +}
> +
> +static int lwmi_fan_method_master_bind(struct device *dev)
> +{
> +	struct lwmi_fan_method_priv *priv =3D dev_get_drvdata(dev);
> +
> +	return component_bind_all(dev, &priv->group);
> +}
> +
> +static void lwmi_fan_method_master_unbind(struct device *dev)
> +{
> +	component_unbind_all(dev, NULL);
> +}
> +
> +static const struct component_master_ops lwmi_fan_method_master_ops =3D =
{
> +	.bind =3D lwmi_fan_method_master_bind,
> +	.unbind =3D lwmi_fan_method_master_unbind,
> +};
> +
> +static int lwmi_fan_method_component_compare(struct device *dev, void *d=
ata)
> +{
> +	struct device *master =3D data;
> +
> +	return dev->driver &&
> +		!strcmp(dev->driver->name, "lenovo_wmi_other") &&
> +		dev->parent =3D=3D master->parent;
> +}
> +
> +static int lwmi_fan_method_probe(struct wmi_device *wdev, const void *co=
ntext)
> +{
> +	struct component_match *master_match =3D NULL;
> +	struct lwmi_fan_method_priv *priv;
> +
> +	if (!dmi_check_system(lwmi_fan_dmi_table))
> +		return -ENODEV;
> +
> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->wdev =3D wdev;
> +	mutex_init(&priv->lock);
> +	lwmi_fan_method_attrs_init(priv);
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	component_match_add(&wdev->dev, &master_match,
> +			    lwmi_fan_method_component_compare, &wdev->dev);
> +	if (IS_ERR(master_match))
> +		return PTR_ERR(master_match);
> +
> +	return component_master_add_with_match(&wdev->dev,
> +					       &lwmi_fan_method_master_ops,
> +					       master_match);
> +}
> +
> +static void lwmi_fan_method_remove(struct wmi_device *wdev)
> +{
> +	component_master_del(&wdev->dev, &lwmi_fan_method_master_ops);
> +}
> +
> +static const struct wmi_device_id lwmi_fan_method_id_table[] =3D {
> +	{ LENOVO_FAN_METHOD_GUID, NULL },
> +	{}
> +};
> +
> +static struct wmi_driver lwmi_fan_method_driver =3D {
> +	.driver =3D {
> +		.name =3D "lenovo_wmi_fan_method",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table =3D lwmi_fan_method_id_table,
> +	.probe =3D lwmi_fan_method_probe,
> +	.remove =3D lwmi_fan_method_remove,
> +	.no_singleton =3D true,
> +};
> +
> +MODULE_DEVICE_TABLE(wmi, lwmi_fan_method_id_table);
> +module_wmi_driver(lwmi_fan_method_driver);
> +
> +MODULE_AUTHOR("Aditya Dash <mradityadash@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Fan Method WMI Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index b4be7739b243..72d3510b17b2 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -192,11 +192,13 @@ struct lwmi_om_priv {
>  	struct device *fw_attr_dev;
>  	struct kset *fw_attr_kset;
>  	struct wmi_device *wdev;
> +	const struct attribute_group *fan_method_group;
>  	int ida_id;
> =20
>  	struct lwmi_fan_info fan_info[LWMI_FAN_NR];
>  	bool fullspeed_supported;
>  	bool fan0_input_fallback;
> +	bool fan_method_group_added;
> =20
>  	struct {
>  		bool capdata00_collected : 1;
> @@ -542,6 +544,31 @@ static const struct hwmon_chip_info lwmi_om_hwmon_ch=
ip_info =3D {
>  	.info =3D lwmi_om_hwmon_info,
>  };
> =20
> +static int lwmi_om_fan_method_group_add(struct lwmi_om_priv *priv)
> +{
> +	int ret;
> +
> +	if (!priv->hwmon_dev || !priv->fan_method_group ||
> +	    priv->fan_method_group_added)
> +		return 0;
> +
> +	ret =3D sysfs_create_group(&priv->hwmon_dev->kobj,
> +				 priv->fan_method_group);
> +	if (!ret)
> +		priv->fan_method_group_added =3D true;
> +
> +	return ret;
> +}
> +
> +static void lwmi_om_fan_method_group_remove(struct lwmi_om_priv *priv)
> +{
> +	if (!priv->hwmon_dev || !priv->fan_method_group_added)
> +		return;
> +
> +	sysfs_remove_group(&priv->hwmon_dev->kobj, priv->fan_method_group);
> +	priv->fan_method_group_added =3D false;
> +}
> +
>  /**
>   * lwmi_om_hwmon_add() - Register HWMON device if all info is collected
>   * @priv: Driver private data
> @@ -550,9 +577,9 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *pr=
iv)
>  {
>  	u32 rpm;
>  	long enable;
> -	int i, valid;
> +	int i, ret, valid;
> =20
> -	if (WARN_ON(priv->hwmon_dev))
> +	if (priv->hwmon_dev)
>  		return;
> =20
>  	if (!priv->fan_flags.capdata00_collected || !priv->fan_flags.capdata_fa=
n_collected) {
> @@ -592,7 +619,8 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *pr=
iv)
>  		}
>  	}
> =20
> -	if (valid =3D=3D 0 && !priv->fullspeed_supported && !priv->fan0_input_f=
allback) {
> +	if (valid =3D=3D 0 && !priv->fullspeed_supported &&
> +	    !priv->fan0_input_fallback && !priv->fan_method_group) {
>  		dev_warn(&priv->wdev->dev,
>  			 "fan reporting/tuning is unsupported on this device\n");
>  		return;
> @@ -609,6 +637,11 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *p=
riv)
>  		return;
>  	}
> =20
> +	ret =3D lwmi_om_fan_method_group_add(priv);
> +	if (ret)
> +		dev_warn(&priv->wdev->dev,
> +			 "failed to register Fan Method attributes: %d\n", ret);
> +
>  	dev_dbg(&priv->wdev->dev, "registered HWMON device\n");
>  }
> =20
> @@ -623,6 +656,7 @@ static void lwmi_om_hwmon_remove(struct lwmi_om_priv =
*priv)
>  	if (!priv->hwmon_dev)
>  		return;
> =20
> +	lwmi_om_fan_method_group_remove(priv);
>  	hwmon_device_unregister(priv->hwmon_dev);
>  	priv->hwmon_dev =3D NULL;
>  }
> @@ -1801,10 +1835,44 @@ static const struct component_master_ops lwmi_om_=
master_ops =3D {
>  	.unbind =3D lwmi_om_master_unbind,
>  };
> =20
> +static int lwmi_om_fan_method_component_bind(struct device *component,
> +					     struct device *master, void *data)
> +{
> +	const struct attribute_group *group =3D data;
> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(component);
> +	int ret;
> +
> +	if (!group)
> +		return -EINVAL;
> +
> +	priv->fan_method_group =3D group;
> +	lwmi_om_hwmon_add(priv);
> +	ret =3D lwmi_om_fan_method_group_add(priv);
> +	if (ret)
> +		priv->fan_method_group =3D NULL;
> +
> +	return ret;
> +}
> +
> +static void lwmi_om_fan_method_component_unbind(struct device *component=
,
> +						struct device *master, void *data)
> +{
> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(component);
> +
> +	lwmi_om_fan_method_group_remove(priv);
> +	priv->fan_method_group =3D NULL;
> +}
> +
> +static const struct component_ops lwmi_om_fan_method_component_ops =3D {
> +	.bind =3D lwmi_om_fan_method_component_bind,
> +	.unbind =3D lwmi_om_fan_method_component_unbind,
> +};
> +
>  static int lwmi_other_probe(struct wmi_device *wdev, const void *context=
)
>  {
>  	struct component_match *master_match =3D NULL;
>  	struct lwmi_om_priv *priv;
> +	int ret;
> =20
>  	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
> @@ -1816,16 +1884,31 @@ static int lwmi_other_probe(struct wmi_device *wd=
ev, const void *context)
>  	priv->wdev =3D wdev;
>  	dev_set_drvdata(&wdev->dev, priv);
> =20
> +	ret =3D component_add(&wdev->dev, &lwmi_om_fan_method_component_ops);
> +	if (ret)
> +		return ret;
> +
>  	lwmi_cd_match_add_all(&wdev->dev, &master_match);
> -	if (IS_ERR(master_match))
> -		return PTR_ERR(master_match);
> +	if (IS_ERR(master_match)) {
> +		ret =3D PTR_ERR(master_match);
> +		goto err_component;
> +	}
> +
> +	ret =3D component_master_add_with_match(&wdev->dev, &lwmi_om_master_ops=
,
> +					      master_match);
> +	if (ret)
> +		goto err_component;
> +
> +	return 0;
> =20
> -	return component_master_add_with_match(&wdev->dev, &lwmi_om_master_ops,
> -					       master_match);
> +err_component:
> +	component_del(&wdev->dev, &lwmi_om_fan_method_component_ops);
> +	return ret;
>  }
> =20
>  static void lwmi_other_remove(struct wmi_device *wdev)
>  {
> +	component_del(&wdev->dev, &lwmi_om_fan_method_component_ops);
>  	component_master_del(&wdev->dev, &lwmi_om_master_ops);
>  }
> =20
