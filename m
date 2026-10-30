Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345879;
	b=eYdkiIN5XB3JWHmyiuFtrCEAGm15St3xLzDAqk3hMC1f3g44CnP4Ty2hmSDA2mMC94M8
	 SA3AQy8EfqOMzGQaatrzNIg0I8hcyTm+0aIzzi386U4dCzMnxuc1TSEF3X4iOe68kNr9l
	 zYch2+Ta11rYVcTh8A7wnyCoAqOL2/Q5cwyv7Fh4D2iNmDETewAMVyNEtb1cPoLDbDrno
	 fsSptprTIQnhCobwUa/ms/k3CzfoSMANdjh3UyqXhQnqcWdptlOEswLzXEMg24fNKYWCO
	 GosusY4oUPYeOA1xYI4cZfH8p8IMjtivOGZYgV3FbWrorvxypFNUz4f8qfqskoygL/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345879;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=lZIwDP1QFZrQU3tkU1tq87kEo6IIR/FtvoStAD/TGmg=;
	b=Tsmi7nmmfNdvWi2FDKZ7CuUEZXx73MGXQngUiB24YLaxlcioghosMNAHYPdQh7KO0A/S
	 5tiQqVGazXx/C//k0xCUB8vazwRuOp8S0thMmMOn2ltn82XGM1nShRnGuuZLlNd12Pbqr
	 /VVAsbiUSCKeSH1i5yOrYXzvufbeka08XCYP/qt1XKJxagPO5deF54UEEH9vOdAvMNIC3
	 lvjz5ANQRgSXfNzHxwSOrJb3ENpfhVU4ZaIeBCoXIpOzro3uywx0SEjR1IPQENviUKq2F
	 CJzjIaFePQSbYCjSd7MCdOUQnQRWML2Dybzhg4TJtzlbPflfs3M0ygD7KDhztohAxow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Lo6XkWHy;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC77606A31A
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 07:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBC77606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Lo6XkWHy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793345864; x=1793950664; i=w_armin@gmx.de;
	bh=lZIwDP1QFZrQU3tkU1tq87kEo6IIR/FtvoStAD/TGmg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Lo6XkWHyY2qlbIfRy+Q1vr8x9a4e1Ey7bX02x7RhaUo/UQ6zQUzf8FcEdN7aGWnl
	 RfI5vuwpnJcZmebiKko4tF0rJvi7q/hiA3joG51ByUt96qbOUlmR5wZo4G1RqKfW3
	 HntMRO33ECki6O3r7hBnawfEB4G3DXGQU6Mj8K55sBkPtPPOc+dFkoWY7986QiGqk
	 BXirfV+D1zGRvZDuyOSKQLMIpjs0lTIyDSv27n+Xqw05Kf30UuaJnRAF+qjxNuP1F
	 7XpPMw1AuNJbQKfXuAv2lWWahQc2M008uHPdnkcEXSwX1xBr5CrvBcSkx5GqBlGrK
	 gt7Mj0b5xRpfdhW6iA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWRVh-1x3hGl0TOt-00J8zT; Fri, 30
 Oct 2026 08:37:44 +0100
Message-ID: <de2db474-969d-4999-9b7b-1e5dc5f81ac2@gmx.de>
Date: Fri, 30 Oct 2026 08:37:43 +0100
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: add read-only MECHREVO GM6PX0X sensor driver
To: LIght JUNction <lightjunction.me@gmail.com>, linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net
References: <CAOD9jOPXYG=n1BL+OjyLBz-zjy8RXnN3h9OTyapTFZwOvD1Rsg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAOD9jOPXYG=n1BL+OjyLBz-zjy8RXnN3h9OTyapTFZwOvD1Rsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2I6ZzIMC/KyJ7ds8Yzra7X+t/I4jULgEV3shY8yWULeGSMHP7nq
 inmwLqJ7vYbHi99Eg/AF/hyxvzIH0OEzQa1mq/I1WKJxexswYHz5z7K1PK9tfvj9RhaiIBK
 ESh+z/NB+Kaga/PK8TqJPJs9+jRB6XT0UhjddKbKJmq2rLZRapsjFZ7+86ZgyhqX0syk6bw
 U2oX8hT0V1fJLTaKYgKXA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LTkyjwv22gk=;XnMYSVQQlt2/mtLQ2SVRdTKQh2K
 +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
 36AAopG9cVTH56HIy1iFx1XJZaA==

Am 29.10.26 um 21:35 schrieb LIght JUNction:
> From: LIghtJUNction <lightjunction.me@gmail.com>
>=20
> The GM6PX0X firmware exposes CPU and GPU temperatures and fan speeds
> through the INOU.ECRR ACPI method. Add a read-only hwmon driver for
> these sensors, scoped to the verified MECHREVO Kuangshi16Pro GM6PX0X,
> board GM6PX0X, and BIOS N.1.09MRO07.
>=20
> The driver checks the firmware project ID and fan capability before
> registering the device. It uses only ECRR reads and exposes standard
> hwmon temperature and fan input attributes. It does not write EC
> registers or expose fan controls. Fan counters are sampled high/low/high
> to reject a high-byte rollover.
>=20
> Tested on MECHREVO Kuangshi16Pro Series GM6PX0X, board GM6PX0X, BIOS
> N.1.09MRO07, running 7.2.11-arch1-1: the module built with W=3D1, loaded
> beside the installed sensor module, provided all four readings, and
> unloaded without removing the existing module. Other systems and BIOS
> versions have not been tested.

Hi,

can you check if the uniwill-laptop driver works by loading it with the=20
force module option being set to 1?

Thanks,
Armin Wolf

> Assisted-by: Codex:GPT-6
> Signed-off-by: LIghtJUNction <lightjunction.me@gmail.com>
> ---
> AI assistance: Codex was used to draft the read-only driver, its Kconfig
> and Makefile integration, documentation, and commit message. The request
> was to prepare a hwmon submission for the locally verified GM6PX0X using
> the firmware read interface and no EC writes.
>=20
> Validation is limited to an external-module W=3D1 build and runtime read=
s on
> the laptop and BIOS listed above; no full kernel-tree build was performe=
d.
> checkpatch --strict reports no errors and one advisory about a new
> MAINTAINERS entry. The general HWMON entry covers these paths.
>=20
>   Documentation/hwmon/index.rst       |   1 +
>   Documentation/hwmon/mechrevo-ec.rst |  31 +++
>   drivers/hwmon/Kconfig               |  11 ++
>   drivers/hwmon/Makefile              |   1 +
>   drivers/hwmon/mechrevo-ec.c         | 290 ++++++++++++++++++++++++++++
>   5 files changed, 334 insertions(+)
>   create mode 100644 Documentation/hwmon/mechrevo-ec.rst
>   create mode 100644 drivers/hwmon/mechrevo-ec.c
>=20
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.r=
st
> index 199ca79..6bd4ece 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -189,6 +189,7 @@ Hardware Monitoring Kernel Drivers
>      mc34vr500
>      mcp3021
>      mcp9982
> +   mechrevo-ec
>      menf21bmc
>      minisforum-um780xtx
>      mlxreg-fan
> diff --git a/Documentation/hwmon/mechrevo-ec.rst
> b/Documentation/hwmon/mechrevo-ec.rst
> new file mode 100644
> index 0000000..91ffd77
> --- /dev/null
> +++ b/Documentation/hwmon/mechrevo-ec.rst
> @@ -0,0 +1,31 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +MECHREVO GM6PX0X EC
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Supported systems:
> +
> +  * MECHREVO Kuangshi16Pro Series GM6PX0X, board GM6PX0X
> +  * BIOS N.1.09MRO07
> +
> +The driver exposes two EC temperatures and two fan speeds through hwmon=
. It
> +uses the firmware ACPI method ``\_SB.INOU.ECRR`` to read EC bytes. Temp=
eratures
> +are reported in millidegrees Celsius and fan speeds in RPM. The CPU and=
 GPU
> +temperature bytes are at ``0x043e`` and ``0x044f``. The 16-bit CPU and =
GPU fan
> +counters use high/low bytes at ``0x0464``/``0x0465`` and ``0x046c``/``0=
x046b``,
> +respectively.
> +
> +Each successful ECRR read is followed by a 6 to 12 ms delay. Fan reads =
sample
> +the high byte before and after the low byte and retry up to three times=
 if the
> +high byte changes. The EC updates independently, so the driver cannot p=
rovide
> +an atomic snapshot of the two bytes.
> +
> +At probe, the driver checks EC project ID ``0x10`` at ``0x0740`` and bi=
t 6 of
> +the capability byte at ``0x078e``. It only binds the exact DMI identity=
 and
> +BIOS version listed above. Other models and BIOS versions have not been
> +validated.
> +
> +The driver is read-only. It does not call the firmware write method, ch=
ange EC
> +configuration, or expose fan-control attributes. Values above 125 degre=
es C
> +are reported as unavailable; zero is passed through as read from firmwa=
re.
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 18c682e..7e397c2 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2888,6 +2888,17 @@ config SENSORS_HP_WMI
>   	  This driver can also be built as a module. If so, the module
>   	  will be called hp_wmi_sensors.
>=20
> +config SENSORS_MECHREVO_EC
> +	tristate "MECHREVO GM6PX0X EC sensors"
> +	depends on X86 && ACPI
> +	help
> +	  If you say yes here you get read-only temperature and fan speed
> +	  monitoring for the MECHREVO Kuangshi16Pro Series GM6PX0X with BIOS
> +	  N.1.09MRO07, using its firmware ACPI method.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called mechrevo_ec.
> +
>   endif # ACPI
>=20
>   endif # HWMON
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index d4c345e..ac362a1 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_ASUS_EC)	+=3D asus-ec-sensors.o
>   obj-$(CONFIG_SENSORS_ASUS_WMI)	+=3D asus_wmi_sensors.o
>   obj-$(CONFIG_SENSORS_HONOR_FMI)	+=3D honor-fmi.o
>   obj-$(CONFIG_SENSORS_HP_WMI)	+=3D hp-wmi-sensors.o
> +obj-$(CONFIG_SENSORS_MECHREVO_EC)	+=3D mechrevo-ec.o
>=20
>   # Native drivers
>   # asb100, then w83781d go first, as they can override other drivers' a=
ddresses.
> diff --git a/drivers/hwmon/mechrevo-ec.c b/drivers/hwmon/mechrevo-ec.c
> new file mode 100644
> index 0000000..d4a3430
> --- /dev/null
> +++ b/drivers/hwmon/mechrevo-ec.c
> @@ -0,0 +1,290 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Read-only hwmon driver for the MECHREVO Kuangshi16Pro GM6PX0X. */
> +
> +#include <linux/acpi.h>
> +#include <linux/delay.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#define MECHREVO_ECRR_DELAY_MIN_US	6000
> +#define MECHREVO_ECRR_DELAY_MAX_US	12000
> +#define MECHREVO_RPM_ATTEMPTS		3
> +
> +struct mechrevo_ec_data {
> +	acpi_handle inou;
> +	/* Serialize the three ECRR calls that make up one fan sample. */
> +	struct mutex rpm_lock;
> +};
> +
> +static const struct dmi_system_id mechrevo_ec_dmi_table[] =3D {
> +	{
> +		.matches =3D {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
> +					"Kuangshi16Pro Series GM6PX0X"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6PX0X"),
> +			DMI_EXACT_MATCH(DMI_BIOS_VERSION, "N.1.09MRO07"),
> +		},
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(dmi, mechrevo_ec_dmi_table);
> +
> +static int mechrevo_ec_read_byte(struct mechrevo_ec_data *data, u16 add=
ress,
> +				 u8 *value)
> +{
> +	union acpi_object argument =3D {
> +		.integer.type =3D ACPI_TYPE_INTEGER,
> +		.integer.value =3D address,
> +	};
> +	struct acpi_object_list arguments =3D {
> +		.count =3D 1,
> +		.pointer =3D &argument,
> +	};
> +	unsigned long long raw;
> +	acpi_status status;
> +
> +	status =3D acpi_evaluate_integer(data->inou, "ECRR", &arguments, &raw)=
;
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	/* Match the delay used by the in-tree Uniwill ECRR transport. */
> +	usleep_range(MECHREVO_ECRR_DELAY_MIN_US, MECHREVO_ECRR_DELAY_MAX_US);
> +	if (raw > 255)
> +		return -ERANGE;
> +
> +	*value =3D raw;
> +	return 0;
> +}
> +
> +static int mechrevo_ec_read_temp(struct mechrevo_ec_data *data, int cha=
nnel,
> +				 long *value)
> +{
> +	u16 address;
> +	u8 raw;
> +	int ret;
> +
> +	switch (channel) {
> +	case 0:
> +		address =3D 0x043e;
> +		break;
> +	case 1:
> +		address =3D 0x044f;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ret =3D mechrevo_ec_read_byte(data, address, &raw);
> +	if (ret)
> +		return ret;
> +	if (raw > 125)
> +		return -ENODATA;
> +
> +	*value =3D raw * 1000;
> +	return 0;
> +}
> +
> +static int mechrevo_ec_read_fan(struct mechrevo_ec_data *data, int chan=
nel,
> +				long *value)
> +{
> +	u16 high_address, low_address;
> +	u8 high, low, check;
> +	int attempt, ret;
> +
> +	switch (channel) {
> +	case 0:
> +		high_address =3D 0x0464;
> +		low_address =3D 0x0465;
> +		break;
> +	case 1:
> +		high_address =3D 0x046c;
> +		low_address =3D 0x046b;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/* The EC can update between byte reads; reject a high-byte rollover. =
*/
> +	mutex_lock(&data->rpm_lock);
> +	for (attempt =3D 0; attempt < MECHREVO_RPM_ATTEMPTS; attempt++) {
> +		ret =3D mechrevo_ec_read_byte(data, high_address, &high);
> +		if (ret)
> +			goto out_unlock;
> +
> +		ret =3D mechrevo_ec_read_byte(data, low_address, &low);
> +		if (ret)
> +			goto out_unlock;
> +
> +		ret =3D mechrevo_ec_read_byte(data, high_address, &check);
> +		if (ret)
> +			goto out_unlock;
> +
> +		if (high =3D=3D check) {
> +			*value =3D ((long)high << 8) | low;
> +			ret =3D 0;
> +			goto out_unlock;
> +		}
> +	}
> +	ret =3D -EAGAIN;
> +
> +out_unlock:
> +	mutex_unlock(&data->rpm_lock);
> +	return ret;
> +}
> +
> +static umode_t mechrevo_ec_is_visible(const void *data,
> +				      enum hwmon_sensor_types type,
> +				      u32 attr, int channel)
> +{
> +	if (channel < 0 || channel > 1)
> +		return 0;
> +
> +	if (type =3D=3D hwmon_temp)
> +		return attr =3D=3D hwmon_temp_input || attr =3D=3D hwmon_temp_label ?=
 0444 : 0;
> +	if (type =3D=3D hwmon_fan)
> +		return attr =3D=3D hwmon_fan_input || attr =3D=3D hwmon_fan_label ? 0=
444 : 0;
> +
> +	return 0;
> +}
> +
> +static int mechrevo_ec_read(struct device *dev, enum hwmon_sensor_types=
 type,
> +			    u32 attr, int channel, long *value)
> +{
> +	struct mechrevo_ec_data *data =3D dev_get_drvdata(dev);
> +
> +	if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_input)
> +		return mechrevo_ec_read_temp(data, channel, value);
> +	if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_input)
> +		return mechrevo_ec_read_fan(data, channel, value);
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int mechrevo_ec_read_string(struct device *dev,
> +				   enum hwmon_sensor_types type, u32 attr,
> +				   int channel, const char **value)
> +{
> +	if (channel < 0 || channel > 1)
> +		return -EOPNOTSUPP;
> +
> +	if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_label)
> +		*value =3D channel ? "GPU EC" : "CPU EC";
> +	else if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_label)
> +		*value =3D channel ? "GPU fan" : "CPU fan";
> +	else
> +		return -EOPNOTSUPP;
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops mechrevo_ec_hwmon_ops =3D {
> +	.is_visible =3D mechrevo_ec_is_visible,
> +	.read =3D mechrevo_ec_read,
> +	.read_string =3D mechrevo_ec_read_string,
> +};
> +
> +static const struct hwmon_channel_info * const mechrevo_ec_hwmon_info[]=
 =3D {
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info mechrevo_ec_chip_info =3D {
> +	.ops =3D &mechrevo_ec_hwmon_ops,
> +	.info =3D mechrevo_ec_hwmon_info,
> +};
> +
> +static int mechrevo_ec_probe(struct platform_device *pdev)
> +{
> +	struct mechrevo_ec_data *data;
> +	struct device *hwmon_dev;
> +	u8 project, capability;
> +	acpi_status status;
> +	int ret;
> +
> +	if (!dmi_check_system(mechrevo_ec_dmi_table))
> +		return -ENODEV;
> +
> +	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	mutex_init(&data->rpm_lock);
> +	status =3D acpi_get_handle(NULL, "\\_SB.INOU", &data->inou);
> +	if (ACPI_FAILURE(status) || !acpi_has_method(data->inou, "ECRR"))
> +		return dev_err_probe(&pdev->dev, -ENODEV,
> +				     "missing INOU.ECRR method\n");
> +
> +	ret =3D mechrevo_ec_read_byte(data, 0x0740, &project);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to read EC project ID\n");
> +	ret =3D mechrevo_ec_read_byte(data, 0x078e, &capability);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to read EC fan capability\n");
> +	if (project !=3D 0x10 || !(capability & 0x40))
> +		return dev_err_probe(&pdev->dev, -ENODEV,
> +				     "unsupported EC project or fan layout\n");
> +
> +	platform_set_drvdata(pdev, data);
> +	hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev, "mechre=
vo",
> +							 data,
> +							 &mechrevo_ec_chip_info,
> +							 NULL);
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static struct platform_driver mechrevo_ec_driver =3D {
> +	.probe =3D mechrevo_ec_probe,
> +	.driver =3D {
> +		.name =3D "mechrevo-ec-hwmon",
> +	},
> +};
> +
> +static struct platform_device *mechrevo_ec_device;
> +
> +static int __init mechrevo_ec_init(void)
> +{
> +	int ret;
> +
> +	if (!dmi_check_system(mechrevo_ec_dmi_table))
> +		return -ENODEV;
> +
> +	ret =3D platform_driver_register(&mechrevo_ec_driver);
> +	if (ret)
> +		return ret;
> +
> +	mechrevo_ec_device =3D platform_device_register_simple("mechrevo-ec-hw=
mon",
> +							     PLATFORM_DEVID_NONE,
> +							     NULL, 0);
> +	if (IS_ERR(mechrevo_ec_device)) {
> +		ret =3D PTR_ERR(mechrevo_ec_device);
> +		platform_driver_unregister(&mechrevo_ec_driver);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit mechrevo_ec_exit(void)
> +{
> +	platform_device_unregister(mechrevo_ec_device);
> +	platform_driver_unregister(&mechrevo_ec_driver);
> +}
> +
> +module_init(mechrevo_ec_init);
> +module_exit(mechrevo_ec_exit);
> +
> +MODULE_DESCRIPTION("MECHREVO GM6PX0X EC hwmon driver");
> +MODULE_LICENSE("GPL");

