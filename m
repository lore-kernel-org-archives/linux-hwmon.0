Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385688;
	b=gQHJ/b3jfsvBOC1hA1OlgKCjo1qRPV0qmXsz6MJR2U6krO+B2+RdFjIt3rfxd1vI7zp1
	 8V4iuKNi3TRSIv95cQIZXXlDSPT7O/7gxZseHnh2u3tKHqbK+973qd6VTpRJnQM16wrz5
	 vJm8jCw3ZswbluJIE4UDv0OQrFuxadPVwtzyiTWATRigQKlZBoTURT+vq12ILb55/oHso
	 jeWsi10H8o9RNjcagn5LpR1Xw6UoSm5ZJplB3A375kjenoGfnJLoVBoaDxJf8aGwIrS1R
	 4bGnLktASYNmxvoA6zVfRIkGtQQa3eVHxsbc2sJuGFYt+/XloXVdLkdUr87vyW84Yvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385688;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=ozt45SO9SNbgET4s4ObSVlBbWJaqhmWlm2cKG74C5s8=;
	b=u/1tiPQoXHBvFAfFLbBqFVOLG0M9czQtYqeqOKFUApFN4XAW6ARK5VU7Y9RO++BwA0vs
	 CKsrSgItW2WzAYSo3Wki/67HvzNAAf1kt10MCPgnczEPlaONIwwcPUNg8IVjd+Indav2i
	 /Wjnh04mtFoGsCNexlGaDX4AKtek9GIMggOBDVIkx/yWnKPUTQtEI9/bMMxEmMfxUWqqn
	 C9tlBrEfbUN39XD16IluaWpOe4MfPzXfi7K/XFbPAqJ0NjwQXNqTm2J1ULNdMtenxKrGM
	 0ySbt6bMIbzcH2n0MfZIuhCXRPV0Na7wOZTPzASS2g3Co9VTcocKmUtyp1Jz5PJTxeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Ze4N3Joh;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B48606A31A
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 18:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88B48606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Ze4N3Joh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793385685; x=1793990485; i=w_armin@gmx.de;
	bh=ozt45SO9SNbgET4s4ObSVlBbWJaqhmWlm2cKG74C5s8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Ze4N3JohfCMUAl0rIE7u/WjchnDNhVeZTf6CFQp83nZOlEZvzzMp8AMlpF9ERQy/
	 pFyUWIWPRiriUjc8VwHuUQGNU8gkCBsECRIE7Ed/hFV7RpUoxwRK/tu8wE3Ds62Ek
	 t3SyvGT38l4E8RpnrerqOrcwkc7r6Yf6tMjpyZMGHfTWIklhx9zyDbeTybi9P3tOn
	 OgGeko77aUkJVxRprRsrfkZKmQLk+hbu1238KgNO+dqcAxLCC8tZkWpNwwSJ7aoiI
	 oy5sqBcykGqsz/483vBTsHeGAzPQe5UId/T0TcK4mJWagPWUln9aPZHcqUDwpANHT
	 jogT1HnRyNCia497iA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6Ue3-1xTlQS0ixV-00Azch; Fri, 30
 Oct 2026 19:41:25 +0100
Message-ID: <03df1ce2-f3d5-4678-8e3f-ebfa12c669db@gmx.de>
Date: Fri, 30 Oct 2026 19:41:24 +0100
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
 <de2db474-969d-4999-9b7b-1e5dc5f81ac2@gmx.de>
 <CAOD9jONjxwnyYdNUKYNy1pOv2yBTvVy9yT+iB_yatooisjG4GA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAOD9jONjxwnyYdNUKYNy1pOv2yBTvVy9yT+iB_yatooisjG4GA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fxbxmUpudoG1tZt2BHBkRctKhCFcjUdZCwjj7IUhSBTktq7MvYv
 m/wEMGAj+6CJIAb3krJF0ayYqZGRFOWGej9TW5YLT1to1DYFQciKoI+U1Fjq7zwgxr3t4C7
 4BspCjiXC9MQ4zc8kJdwJnZD9QmK/53ZDSzLvLzOetJRIk8npq8lBUL6V34f8zJMB0RZUua
 Qqv9txqEnalz4kItB3MEg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:J9IVLnmNbSw=;ea5SpGJCPD5zss1fZI2T+JboVmY
 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
 sCZ+e+qsDJ6I1Vlpoj9XIx1mKTBqOiBSsAaBA==

Am 30.10.26 um 09:54 schrieb LIght JUNction:
> Hi Armin,
>=20
> I checked the in-tree uniwill_laptop driver and its force path. I have
> not loaded it with force=3D1 on the GM6PX0X. For an unsupported DMI
> entry, force enables all features except the battery charge limit.
> Probe sets EC 0x0741 bit 0 and initializes NVIDIA CTGP, writing 0 to
> the CTGP offset at 0x0744. The current ctgp_offset here is 25, so this
> would overwrite the active value.

True, but you can restore it over sysfs. Also i assume that this value=20
will be restored upon a reboot.

> The sensor map is a partial match: CPU/GPU temperatures and the
> primary fan address match. The secondary fan low byte differs:
> uniwill_laptop uses 0x046D; the verified GM6PX0X map uses 0x046B. The
> generic driver also reads the fan bytes without the high/low/high
> check in my patch.

I checked this offset, and it seems that some versions of the Control=20
Center use offset 0x046B, while other use 0x046D. Can you check if=20
reading from offset 0x046D still results in valid fan speed readings?

I would be very supprised if Uniwill had decided to move such an=20
register, maybe it is a typo inside the Control Center?

Thanks,
Armin Wolf

> I can't confirm full operation with force=3D1 on this model. A
> sensor-only test path without those EC writes would be needed to
> verify it.

AFAIK loading the driver with force=3D1 should be reasonably safe.

Thanks,
Armin Wolf

> Thanks,
> LIghtJUNction
>=20
> On Fri, 30 Oct 2026 08:37:43 +0100, Armin Wolf <W_Armin@gmx.de> wrote:
>> Am 29.10.26 um 21:35 schrieb LIght JUNction:
>>> From: LIghtJUNction <lightjunction.me@gmail.com>
>>>
>>> The GM6PX0X firmware exposes CPU and GPU temperatures and fan speeds
>>> through the INOU.ECRR ACPI method. Add a read-only hwmon driver for
>>> these sensors, scoped to the verified MECHREVO Kuangshi16Pro GM6PX0X,
>>> board GM6PX0X, and BIOS N.1.09MRO07.
>>>
>>> The driver checks the firmware project ID and fan capability before
>>> registering the device. It uses only ECRR reads and exposes standard
>>> hwmon temperature and fan input attributes. It does not write EC
>>> registers or expose fan controls. Fan counters are sampled high/low/hi=
gh
>>> to reject a high-byte rollover.
>>>
>>> Tested on MECHREVO Kuangshi16Pro Series GM6PX0X, board GM6PX0X, BIOS
>>> N.1.09MRO07, running 7.2.11-arch1-1: the module built with W=3D1, load=
ed
>>> beside the installed sensor module, provided all four readings, and
>>> unloaded without removing the existing module. Other systems and BIOS
>>> versions have not been tested.
>>
>> Hi,
>>
>> can you check if the uniwill-laptop driver works by loading it with the
>> force module option being set to 1?
>>
>> Thanks,
>> Armin Wolf
>>
>>> Assisted-by: Codex:GPT-6
>>> Signed-off-by: LIghtJUNction <lightjunction.me@gmail.com>
>>> ---
>>> AI assistance: Codex was used to draft the read-only driver, its Kconf=
ig
>>> and Makefile integration, documentation, and commit message. The reque=
st
>>> was to prepare a hwmon submission for the locally verified GM6PX0X usi=
ng
>>> the firmware read interface and no EC writes.
>>>
>>> Validation is limited to an external-module W=3D1 build and runtime re=
ads on
>>> the laptop and BIOS listed above; no full kernel-tree build was perfor=
med.
>>> checkpatch --strict reports no errors and one advisory about a new
>>> MAINTAINERS entry. The general HWMON entry covers these paths.
>>>
>>>    Documentation/hwmon/index.rst       |   1 +
>>>    Documentation/hwmon/mechrevo-ec.rst |  31 +++
>>>    drivers/hwmon/Kconfig               |  11 ++
>>>    drivers/hwmon/Makefile              |   1 +
>>>    drivers/hwmon/mechrevo-ec.c         | 290 +++++++++++++++++++++++++=
+++
>>>    5 files changed, 334 insertions(+)
>>>    create mode 100644 Documentation/hwmon/mechrevo-ec.rst
>>>    create mode 100644 drivers/hwmon/mechrevo-ec.c
>>>
>>> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index=
.rst
>>> index 199ca79..6bd4ece 100644
>>> --- a/Documentation/hwmon/index.rst
>>> +++ b/Documentation/hwmon/index.rst
>>> @@ -189,6 +189,7 @@ Hardware Monitoring Kernel Drivers
>>>       mc34vr500
>>>       mcp3021
>>>       mcp9982
>>> +   mechrevo-ec
>>>       menf21bmc
>>>       minisforum-um780xtx
>>>       mlxreg-fan
>>> diff --git a/Documentation/hwmon/mechrevo-ec.rst
>>> b/Documentation/hwmon/mechrevo-ec.rst
>>> new file mode 100644
>>> index 0000000..91ffd77
>>> --- /dev/null
>>> +++ b/Documentation/hwmon/mechrevo-ec.rst
>>> @@ -0,0 +1,31 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +MECHREVO GM6PX0X EC
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +Supported systems:
>>> +
>>> +  * MECHREVO Kuangshi16Pro Series GM6PX0X, board GM6PX0X
>>> +  * BIOS N.1.09MRO07
>>> +
>>> +The driver exposes two EC temperatures and two fan speeds through hwm=
on. It
>>> +uses the firmware ACPI method ``\_SB.INOU.ECRR`` to read EC bytes. Te=
mperatures
>>> +are reported in millidegrees Celsius and fan speeds in RPM. The CPU a=
nd GPU
>>> +temperature bytes are at ``0x043e`` and ``0x044f``. The 16-bit CPU an=
d GPU fan
>>> +counters use high/low bytes at ``0x0464``/``0x0465`` and ``0x046c``/`=
`0x046b``,
>>> +respectively.
>>> +
>>> +Each successful ECRR read is followed by a 6 to 12 ms delay. Fan read=
s sample
>>> +the high byte before and after the low byte and retry up to three tim=
es if the
>>> +high byte changes. The EC updates independently, so the driver cannot=
 provide
>>> +an atomic snapshot of the two bytes.
>>> +
>>> +At probe, the driver checks EC project ID ``0x10`` at ``0x0740`` and =
bit 6 of
>>> +the capability byte at ``0x078e``. It only binds the exact DMI identi=
ty and
>>> +BIOS version listed above. Other models and BIOS versions have not be=
en
>>> +validated.
>>> +
>>> +The driver is read-only. It does not call the firmware write method, =
change EC
>>> +configuration, or expose fan-control attributes. Values above 125 deg=
rees C
>>> +are reported as unavailable; zero is passed through as read from firm=
ware.
>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>> index 18c682e..7e397c2 100644
>>> --- a/drivers/hwmon/Kconfig
>>> +++ b/drivers/hwmon/Kconfig
>>> @@ -2888,6 +2888,17 @@ config SENSORS_HP_WMI
>>>    	  This driver can also be built as a module. If so, the module
>>>    	  will be called hp_wmi_sensors.
>>>
>>> +config SENSORS_MECHREVO_EC
>>> +	tristate "MECHREVO GM6PX0X EC sensors"
>>> +	depends on X86 && ACPI
>>> +	help
>>> +	  If you say yes here you get read-only temperature and fan speed
>>> +	  monitoring for the MECHREVO Kuangshi16Pro Series GM6PX0X with BIOS
>>> +	  N.1.09MRO07, using its firmware ACPI method.
>>> +
>>> +	  This driver can also be built as a module. If so, the module
>>> +	  will be called mechrevo_ec.
>>> +
>>>    endif # ACPI
>>>
>>>    endif # HWMON
>>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>>> index d4c345e..ac362a1 100644
>>> --- a/drivers/hwmon/Makefile
>>> +++ b/drivers/hwmon/Makefile
>>> @@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_ASUS_EC)	+=3D asus-ec-sensors.o
>>>    obj-$(CONFIG_SENSORS_ASUS_WMI)	+=3D asus_wmi_sensors.o
>>>    obj-$(CONFIG_SENSORS_HONOR_FMI)	+=3D honor-fmi.o
>>>    obj-$(CONFIG_SENSORS_HP_WMI)	+=3D hp-wmi-sensors.o
>>> +obj-$(CONFIG_SENSORS_MECHREVO_EC)	+=3D mechrevo-ec.o
>>>
>>>    # Native drivers
>>>    # asb100, then w83781d go first, as they can override other drivers=
' addresses.
>>> diff --git a/drivers/hwmon/mechrevo-ec.c b/drivers/hwmon/mechrevo-ec.c
>>> new file mode 100644
>>> index 0000000..d4a3430
>>> --- /dev/null
>>> +++ b/drivers/hwmon/mechrevo-ec.c
>>> @@ -0,0 +1,290 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/* Read-only hwmon driver for the MECHREVO Kuangshi16Pro GM6PX0X. */
>>> +
>>> +#include <linux/acpi.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/dmi.h>
>>> +#include <linux/err.h>
>>> +#include <linux/hwmon.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/slab.h>
>>> +
>>> +#define MECHREVO_ECRR_DELAY_MIN_US	6000
>>> +#define MECHREVO_ECRR_DELAY_MAX_US	12000
>>> +#define MECHREVO_RPM_ATTEMPTS		3
>>> +
>>> +struct mechrevo_ec_data {
>>> +	acpi_handle inou;
>>> +	/* Serialize the three ECRR calls that make up one fan sample. */
>>> +	struct mutex rpm_lock;
>>> +};
>>> +
>>> +static const struct dmi_system_id mechrevo_ec_dmi_table[] =3D {
>>> +	{
>>> +		.matches =3D {
>>> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
>>> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
>>> +					"Kuangshi16Pro Series GM6PX0X"),
>>> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6PX0X"),
>>> +			DMI_EXACT_MATCH(DMI_BIOS_VERSION, "N.1.09MRO07"),
>>> +		},
>>> +	},
>>> +	{}
>>> +};
>>> +MODULE_DEVICE_TABLE(dmi, mechrevo_ec_dmi_table);
>>> +
>>> +static int mechrevo_ec_read_byte(struct mechrevo_ec_data *data, u16 a=
ddress,
>>> +				 u8 *value)
>>> +{
>>> +	union acpi_object argument =3D {
>>> +		.integer.type =3D ACPI_TYPE_INTEGER,
>>> +		.integer.value =3D address,
>>> +	};
>>> +	struct acpi_object_list arguments =3D {
>>> +		.count =3D 1,
>>> +		.pointer =3D &argument,
>>> +	};
>>> +	unsigned long long raw;
>>> +	acpi_status status;
>>> +
>>> +	status =3D acpi_evaluate_integer(data->inou, "ECRR", &arguments, &ra=
w);
>>> +	if (ACPI_FAILURE(status))
>>> +		return -EIO;
>>> +
>>> +	/* Match the delay used by the in-tree Uniwill ECRR transport. */
>>> +	usleep_range(MECHREVO_ECRR_DELAY_MIN_US, MECHREVO_ECRR_DELAY_MAX_US)=
;
>>> +	if (raw > 255)
>>> +		return -ERANGE;
>>> +
>>> +	*value =3D raw;
>>> +	return 0;
>>> +}
>>> +
>>> +static int mechrevo_ec_read_temp(struct mechrevo_ec_data *data, int c=
hannel,
>>> +				 long *value)
>>> +{
>>> +	u16 address;
>>> +	u8 raw;
>>> +	int ret;
>>> +
>>> +	switch (channel) {
>>> +	case 0:
>>> +		address =3D 0x043e;
>>> +		break;
>>> +	case 1:
>>> +		address =3D 0x044f;
>>> +		break;
>>> +	default:
>>> +		return -EOPNOTSUPP;
>>> +	}
>>> +
>>> +	ret =3D mechrevo_ec_read_byte(data, address, &raw);
>>> +	if (ret)
>>> +		return ret;
>>> +	if (raw > 125)
>>> +		return -ENODATA;
>>> +
>>> +	*value =3D raw * 1000;
>>> +	return 0;
>>> +}
>>> +
>>> +static int mechrevo_ec_read_fan(struct mechrevo_ec_data *data, int ch=
annel,
>>> +				long *value)
>>> +{
>>> +	u16 high_address, low_address;
>>> +	u8 high, low, check;
>>> +	int attempt, ret;
>>> +
>>> +	switch (channel) {
>>> +	case 0:
>>> +		high_address =3D 0x0464;
>>> +		low_address =3D 0x0465;
>>> +		break;
>>> +	case 1:
>>> +		high_address =3D 0x046c;
>>> +		low_address =3D 0x046b;
>>> +		break;
>>> +	default:
>>> +		return -EOPNOTSUPP;
>>> +	}
>>> +
>>> +	/* The EC can update between byte reads; reject a high-byte rollover=
. */
>>> +	mutex_lock(&data->rpm_lock);
>>> +	for (attempt =3D 0; attempt < MECHREVO_RPM_ATTEMPTS; attempt++) {
>>> +		ret =3D mechrevo_ec_read_byte(data, high_address, &high);
>>> +		if (ret)
>>> +			goto out_unlock;
>>> +
>>> +		ret =3D mechrevo_ec_read_byte(data, low_address, &low);
>>> +		if (ret)
>>> +			goto out_unlock;
>>> +
>>> +		ret =3D mechrevo_ec_read_byte(data, high_address, &check);
>>> +		if (ret)
>>> +			goto out_unlock;
>>> +
>>> +		if (high =3D=3D check) {
>>> +			*value =3D ((long)high << 8) | low;
>>> +			ret =3D 0;
>>> +			goto out_unlock;
>>> +		}
>>> +	}
>>> +	ret =3D -EAGAIN;
>>> +
>>> +out_unlock:
>>> +	mutex_unlock(&data->rpm_lock);
>>> +	return ret;
>>> +}
>>> +
>>> +static umode_t mechrevo_ec_is_visible(const void *data,
>>> +				      enum hwmon_sensor_types type,
>>> +				      u32 attr, int channel)
>>> +{
>>> +	if (channel < 0 || channel > 1)
>>> +		return 0;
>>> +
>>> +	if (type =3D=3D hwmon_temp)
>>> +		return attr =3D=3D hwmon_temp_input || attr =3D=3D hwmon_temp_label=
 ? 0444 : 0;
>>> +	if (type =3D=3D hwmon_fan)
>>> +		return attr =3D=3D hwmon_fan_input || attr =3D=3D hwmon_fan_label ?=
 0444 : 0;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int mechrevo_ec_read(struct device *dev, enum hwmon_sensor_typ=
es type,
>>> +			    u32 attr, int channel, long *value)
>>> +{
>>> +	struct mechrevo_ec_data *data =3D dev_get_drvdata(dev);
>>> +
>>> +	if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_input)
>>> +		return mechrevo_ec_read_temp(data, channel, value);
>>> +	if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_input)
>>> +		return mechrevo_ec_read_fan(data, channel, value);
>>> +
>>> +	return -EOPNOTSUPP;
>>> +}
>>> +
>>> +static int mechrevo_ec_read_string(struct device *dev,
>>> +				   enum hwmon_sensor_types type, u32 attr,
>>> +				   int channel, const char **value)
>>> +{
>>> +	if (channel < 0 || channel > 1)
>>> +		return -EOPNOTSUPP;
>>> +
>>> +	if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_label)
>>> +		*value =3D channel ? "GPU EC" : "CPU EC";
>>> +	else if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_label)
>>> +		*value =3D channel ? "GPU fan" : "CPU fan";
>>> +	else
>>> +		return -EOPNOTSUPP;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct hwmon_ops mechrevo_ec_hwmon_ops =3D {
>>> +	.is_visible =3D mechrevo_ec_is_visible,
>>> +	.read =3D mechrevo_ec_read,
>>> +	.read_string =3D mechrevo_ec_read_string,
>>> +};
>>> +
>>> +static const struct hwmon_channel_info * const mechrevo_ec_hwmon_info=
[] =3D {
>>> +	HWMON_CHANNEL_INFO(temp,
>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>>> +	HWMON_CHANNEL_INFO(fan,
>>> +			   HWMON_F_INPUT | HWMON_F_LABEL,
>>> +			   HWMON_F_INPUT | HWMON_F_LABEL),
>>> +	NULL
>>> +};
>>> +
>>> +static const struct hwmon_chip_info mechrevo_ec_chip_info =3D {
>>> +	.ops =3D &mechrevo_ec_hwmon_ops,
>>> +	.info =3D mechrevo_ec_hwmon_info,
>>> +};
>>> +
>>> +static int mechrevo_ec_probe(struct platform_device *pdev)
>>> +{
>>> +	struct mechrevo_ec_data *data;
>>> +	struct device *hwmon_dev;
>>> +	u8 project, capability;
>>> +	acpi_status status;
>>> +	int ret;
>>> +
>>> +	if (!dmi_check_system(mechrevo_ec_dmi_table))
>>> +		return -ENODEV;
>>> +
>>> +	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>>> +	if (!data)
>>> +		return -ENOMEM;
>>> +
>>> +	mutex_init(&data->rpm_lock);
>>> +	status =3D acpi_get_handle(NULL, "\\_SB.INOU", &data->inou);
>>> +	if (ACPI_FAILURE(status) || !acpi_has_method(data->inou, "ECRR"))
>>> +		return dev_err_probe(&pdev->dev, -ENODEV,
>>> +				     "missing INOU.ECRR method\n");
>>> +
>>> +	ret =3D mechrevo_ec_read_byte(data, 0x0740, &project);
>>> +	if (ret)
>>> +		return dev_err_probe(&pdev->dev, ret,
>>> +				     "failed to read EC project ID\n");
>>> +	ret =3D mechrevo_ec_read_byte(data, 0x078e, &capability);
>>> +	if (ret)
>>> +		return dev_err_probe(&pdev->dev, ret,
>>> +				     "failed to read EC fan capability\n");
>>> +	if (project !=3D 0x10 || !(capability & 0x40))
>>> +		return dev_err_probe(&pdev->dev, -ENODEV,
>>> +				     "unsupported EC project or fan layout\n");
>>> +
>>> +	platform_set_drvdata(pdev, data);
>>> +	hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev, "mech=
revo",
>>> +							 data,
>>> +							 &mechrevo_ec_chip_info,
>>> +							 NULL);
>>> +	return PTR_ERR_OR_ZERO(hwmon_dev);
>>> +}
>>> +
>>> +static struct platform_driver mechrevo_ec_driver =3D {
>>> +	.probe =3D mechrevo_ec_probe,
>>> +	.driver =3D {
>>> +		.name =3D "mechrevo-ec-hwmon",
>>> +	},
>>> +};
>>> +
>>> +static struct platform_device *mechrevo_ec_device;
>>> +
>>> +static int __init mechrevo_ec_init(void)
>>> +{
>>> +	int ret;
>>> +
>>> +	if (!dmi_check_system(mechrevo_ec_dmi_table))
>>> +		return -ENODEV;
>>> +
>>> +	ret =3D platform_driver_register(&mechrevo_ec_driver);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	mechrevo_ec_device =3D platform_device_register_simple("mechrevo-ec-=
hwmon",
>>> +							     PLATFORM_DEVID_NONE,
>>> +							     NULL, 0);
>>> +	if (IS_ERR(mechrevo_ec_device)) {
>>> +		ret =3D PTR_ERR(mechrevo_ec_device);
>>> +		platform_driver_unregister(&mechrevo_ec_driver);
>>> +		return ret;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void __exit mechrevo_ec_exit(void)
>>> +{
>>> +	platform_device_unregister(mechrevo_ec_device);
>>> +	platform_driver_unregister(&mechrevo_ec_driver);
>>> +}
>>> +
>>> +module_init(mechrevo_ec_init);
>>> +module_exit(mechrevo_ec_exit);
>>> +
>>> +MODULE_DESCRIPTION("MECHREVO GM6PX0X EC hwmon driver");
>>> +MODULE_LICENSE("GPL");
>=20

