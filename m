Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385771;
	b=hc+Rw8JsZ5zpWabvnAd1M5g2SKA/V+eJNm5PqQ+p/oObmc/nwspm5boLZtrzI9RmxZZI
	 PxSYDQK/W6L5vDHmYcgexH4fY9LBQ2220PHoBzlW3ZFa+mjlK5KnS24xMVBFI4eswwB6n
	 wBknjeFV5qLdkM05hKjFqV5nKh4YHnAwpxbwMNZiT8DdbiQNLf7kXAyn6IXpG0CVghXV0
	 6U+2JCI+LQVqdPzBirhkr559HEHinF0Sb08ZE6Vmr30s4Z9Y4NQNTnxO2lN+J4Oo/Z6Mw
	 JyKYAVGwgEA91k4mZ9sp3vbB8V2pbuYJdLaoEyiGRL6JLUWqadt2h9AKWmxbs+oPKjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385771;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=9yn+0DOcSvDJeEzngAZXy+G0ohXdS5FUdFs/vxrAHp4=;
	b=CXRQ1pybYhHDLZXl5XXKirWSQOaIIHVDrSxi4EqaYJumAPJL+YPkz5zu+0hD0O6kGCZM
	 h8TUz1DIg9Ew9sspxWDg4gnv3R4sahJECo4t2nUHONWKiC1cmgn9kEDzIV9rIeomJIIdA
	 qoid7CH4yNPA8f8cn+kCo0MJjqAqbPB6Kacl5IoMww8+aG+XZn8lHfwXwvsvtZnHUYJUP
	 T/rlikhk1qmBZ23GeUBl07K943HUv6jGoL65mOpGCG2njJ+RTa9i0iCRzo9uEmoDbnIBM
	 mEURPtxRvZI6RdVbGm7T22fnsi6wSDXTZWfECGxh5TNozbI/QrQdcSzCUKETqiSLGWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=fafUkf3W;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FCC606A31D
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 18:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60FCC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=fafUkf3W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793385755; x=1793990555; i=w_armin@gmx.de;
	bh=9yn+0DOcSvDJeEzngAZXy+G0ohXdS5FUdFs/vxrAHp4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fafUkf3WPaPRMKz88FTKlot1mLHKIXaT2JpQU1YC3W6aU/asSqzgDaZeLWeODcEt
	 X/jjNjyrWoCoTs3hwMo54c47iMxOGlwftO260ztHtWlSJ0Y6JKYDwyTW7g8oq1DOW
	 +8pnabpdyOumpK9fEpNVBAVy99t4GtNEe6up1KENGnLNrdLh4mpdIQB6bq0aPeS9O
	 u3mm4O6FF9nh2Fy+avDN/hmPRPFESVvO76ii6+byUIBvX90ZMKeyQgT9f0j+Zos0O
	 SlGCzlERW7uyHk7rIFvSWVhdtfKzgnFlAdXXU1JFdVT/XX6mdxR3YKiEgNzHqJvNs
	 vRteQ0R2YeKKs6bGUw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MrQIv-1wipiO2nvr-00bl4e; Fri, 30
 Oct 2026 19:42:35 +0100
Message-ID: <dae6828e-2da3-441f-bc5e-a273819f7499@gmx.de>
Date: Fri, 30 Oct 2026 19:42:35 +0100
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
 <CAOD9jONGkoub7CPdBqmNGhSWvy8p5S=bJCY-43NxjkQPEqQzyw@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAOD9jONGkoub7CPdBqmNGhSWvy8p5S=bJCY-43NxjkQPEqQzyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ygu4m0BLf7DmpcsxIYIWdeQN925gt4kPmQZ9p4pjqIJOwhFFSwc
 Vmfsxb6ts+SOKG2aRlSzZ6vaBCnUxBQH/OImNv9ig+cPVf/8BZuqI4c3+yHLFb83kfbJ69b
 LsRvObytZNA7OGnm6/Aut27YXpVQ4HRzHWbcDqUhQCpPq5LTdPWgS7E2vh3G1CpnDBo2Wwa
 FuqPMPjSl6WNoehwFbhRg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8XboT7uo1dg=;GZiCvBYTqAM3pHch89AClO3262w
 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
 tCo/5HrEQ47ouqkCMuWWOonQqnA==

Am 30.10.26 um 10:16 schrieb LIght JUNction:
> Hi Armin,
>=20
> One clarification: I won't load uniwill_laptop with force=3D1 on this
> machine. The force path enables nearly every feature. Probe sets EC
> 0x0741 bit 0, initializes CTGP at 0x0743-0x0746, modifies the lightbar
> registers, and writes keyboard-backlight settings, including enabling
> China mode and clearing KBD_POWER_OFF.
>=20
> On unload, the driver clears the bit at 0x0741, but it does not
> restore the CTGP, lightbar, or keyboard-backlight values. The
> installed tuxedo_nb02_nvidia_power_ctrl exposes only ctgp_offset here,
> so I cannot snapshot and restore the other values. Its GM6PX0X path
> also deliberately preserves the firmware power configuration.

Those settings should be reinitialized by the EC during a cold boot.

Thanks,
Armin Wolf

> I therefore cannot verify force=3D1 safely on this running system. This
> remains a source-level assessment; I have not loaded the driver with
> force=3D1.
>=20
> Thanks,
> LIghtJUNction
>=20
> On Fri, 30 Oct 2026 03:54:55 -0500, LIght JUNction
> <lightjunction.me@gmail.com> wrote:
>> Hi Armin,
>>
>> I checked the in-tree uniwill_laptop driver and its force path. I have =
not loaded it with force=3D1 on the GM6PX0X. For an unsupported DMI entry,=
 force enables all features except the battery charge limit. Probe sets EC=
 0x0741 bit 0 and initializes NVIDIA CTGP, writing 0 to the CTGP offset at=
 0x0744. The current ctgp_offset here is 25, so this would overwrite the a=
ctive value.
>>
>> The sensor map is a partial match: CPU/GPU temperatures and the primary=
 fan address match. The secondary fan low byte differs: uniwill_laptop use=
s 0x046D; the verified GM6PX0X map uses 0x046B. The generic driver also re=
ads the fan bytes without the high/low/high check in my patch.
>>
>> I can't confirm full operation with force=3D1 on this model. A sensor-o=
nly test path without those EC writes would be needed to verify it.
>>
>> Thanks,
>> LIghtJUNction
>>
>> On Fri, 30 Oct 2026 08:37:43 +0100, Armin Wolf <W_Armin@gmx.de> wrote:
>>> Am 29.10.26 um 21:35 schrieb LIght JUNction:
>>>> From: LIghtJUNction <lightjunction.me@gmail.com>
>>>>
>>>> The GM6PX0X firmware exposes CPU and GPU temperatures and fan speeds
>>>> through the INOU.ECRR ACPI method. Add a read-only hwmon driver for
>>>> these sensors, scoped to the verified MECHREVO Kuangshi16Pro GM6PX0X,
>>>> board GM6PX0X, and BIOS N.1.09MRO07.
>>>>
>>>> The driver checks the firmware project ID and fan capability before
>>>> registering the device. It uses only ECRR reads and exposes standard
>>>> hwmon temperature and fan input attributes. It does not write EC
>>>> registers or expose fan controls. Fan counters are sampled high/low/h=
igh
>>>> to reject a high-byte rollover.
>>>>
>>>> Tested on MECHREVO Kuangshi16Pro Series GM6PX0X, board GM6PX0X, BIOS
>>>> N.1.09MRO07, running 7.2.11-arch1-1: the module built with W=3D1, loa=
ded
>>>> beside the installed sensor module, provided all four readings, and
>>>> unloaded without removing the existing module. Other systems and BIOS
>>>> versions have not been tested.
>>>
>>> Hi,
>>>
>>> can you check if the uniwill-laptop driver works by loading it with th=
e
>>> force module option being set to 1?
>>>
>>> Thanks,
>>> Armin Wolf
>>>
>>>> Assisted-by: Codex:GPT-6
>>>> Signed-off-by: LIghtJUNction <lightjunction.me@gmail.com>
>>>> ---
>>>> AI assistance: Codex was used to draft the read-only driver, its Kcon=
fig
>>>> and Makefile integration, documentation, and commit message. The requ=
est
>>>> was to prepare a hwmon submission for the locally verified GM6PX0X us=
ing
>>>> the firmware read interface and no EC writes.
>>>>
>>>> Validation is limited to an external-module W=3D1 build and runtime r=
eads on
>>>> the laptop and BIOS listed above; no full kernel-tree build was perfo=
rmed.
>>>> checkpatch --strict reports no errors and one advisory about a new
>>>> MAINTAINERS entry. The general HWMON entry covers these paths.
>>>>
>>>>    Documentation/hwmon/index.rst       |   1 +
>>>>    Documentation/hwmon/mechrevo-ec.rst |  31 +++
>>>>    drivers/hwmon/Kconfig               |  11 ++
>>>>    drivers/hwmon/Makefile              |   1 +
>>>>    drivers/hwmon/mechrevo-ec.c         | 290 ++++++++++++++++++++++++=
++++
>>>>    5 files changed, 334 insertions(+)
>>>>    create mode 100644 Documentation/hwmon/mechrevo-ec.rst
>>>>    create mode 100644 drivers/hwmon/mechrevo-ec.c
>>>>
>>>> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/inde=
x.rst
>>>> index 199ca79..6bd4ece 100644
>>>> --- a/Documentation/hwmon/index.rst
>>>> +++ b/Documentation/hwmon/index.rst
>>>> @@ -189,6 +189,7 @@ Hardware Monitoring Kernel Drivers
>>>>       mc34vr500
>>>>       mcp3021
>>>>       mcp9982
>>>> +   mechrevo-ec
>>>>       menf21bmc
>>>>       minisforum-um780xtx
>>>>       mlxreg-fan
>>>> diff --git a/Documentation/hwmon/mechrevo-ec.rst
>>>> b/Documentation/hwmon/mechrevo-ec.rst
>>>> new file mode 100644
>>>> index 0000000..91ffd77
>>>> --- /dev/null
>>>> +++ b/Documentation/hwmon/mechrevo-ec.rst
>>>> @@ -0,0 +1,31 @@
>>>> +.. SPDX-License-Identifier: GPL-2.0
>>>> +
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>>>> +MECHREVO GM6PX0X EC
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>>>> +
>>>> +Supported systems:
>>>> +
>>>> +  * MECHREVO Kuangshi16Pro Series GM6PX0X, board GM6PX0X
>>>> +  * BIOS N.1.09MRO07
>>>> +
>>>> +The driver exposes two EC temperatures and two fan speeds through hw=
mon. It
>>>> +uses the firmware ACPI method ``\_SB.INOU.ECRR`` to read EC bytes. T=
emperatures
>>>> +are reported in millidegrees Celsius and fan speeds in RPM. The CPU =
and GPU
>>>> +temperature bytes are at ``0x043e`` and ``0x044f``. The 16-bit CPU a=
nd GPU fan
>>>> +counters use high/low bytes at ``0x0464``/``0x0465`` and ``0x046c``/=
``0x046b``,
>>>> +respectively.
>>>> +
>>>> +Each successful ECRR read is followed by a 6 to 12 ms delay. Fan rea=
ds sample
>>>> +the high byte before and after the low byte and retry up to three ti=
mes if the
>>>> +high byte changes. The EC updates independently, so the driver canno=
t provide
>>>> +an atomic snapshot of the two bytes.
>>>> +
>>>> +At probe, the driver checks EC project ID ``0x10`` at ``0x0740`` and=
 bit 6 of
>>>> +the capability byte at ``0x078e``. It only binds the exact DMI ident=
ity and
>>>> +BIOS version listed above. Other models and BIOS versions have not b=
een
>>>> +validated.
>>>> +
>>>> +The driver is read-only. It does not call the firmware write method,=
 change EC
>>>> +configuration, or expose fan-control attributes. Values above 125 de=
grees C
>>>> +are reported as unavailable; zero is passed through as read from fir=
mware.
>>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>>> index 18c682e..7e397c2 100644
>>>> --- a/drivers/hwmon/Kconfig
>>>> +++ b/drivers/hwmon/Kconfig
>>>> @@ -2888,6 +2888,17 @@ config SENSORS_HP_WMI
>>>>    	  This driver can also be built as a module. If so, the module
>>>>    	  will be called hp_wmi_sensors.
>>>>
>>>> +config SENSORS_MECHREVO_EC
>>>> +	tristate "MECHREVO GM6PX0X EC sensors"
>>>> +	depends on X86 && ACPI
>>>> +	help
>>>> +	  If you say yes here you get read-only temperature and fan speed
>>>> +	  monitoring for the MECHREVO Kuangshi16Pro Series GM6PX0X with BIO=
S
>>>> +	  N.1.09MRO07, using its firmware ACPI method.
>>>> +
>>>> +	  This driver can also be built as a module. If so, the module
>>>> +	  will be called mechrevo_ec.
>>>> +
>>>>    endif # ACPI
>>>>
>>>>    endif # HWMON
>>>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>>>> index d4c345e..ac362a1 100644
>>>> --- a/drivers/hwmon/Makefile
>>>> +++ b/drivers/hwmon/Makefile
>>>> @@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_ASUS_EC)	+=3D asus-ec-sensors.=
o
>>>>    obj-$(CONFIG_SENSORS_ASUS_WMI)	+=3D asus_wmi_sensors.o
>>>>    obj-$(CONFIG_SENSORS_HONOR_FMI)	+=3D honor-fmi.o
>>>>    obj-$(CONFIG_SENSORS_HP_WMI)	+=3D hp-wmi-sensors.o
>>>> +obj-$(CONFIG_SENSORS_MECHREVO_EC)	+=3D mechrevo-ec.o
>>>>
>>>>    # Native drivers
>>>>    # asb100, then w83781d go first, as they can override other driver=
s' addresses.
>>>> diff --git a/drivers/hwmon/mechrevo-ec.c b/drivers/hwmon/mechrevo-ec.=
c
>>>> new file mode 100644
>>>> index 0000000..d4a3430
>>>> --- /dev/null
>>>> +++ b/drivers/hwmon/mechrevo-ec.c
>>>> @@ -0,0 +1,290 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>> +/* Read-only hwmon driver for the MECHREVO Kuangshi16Pro GM6PX0X. */
>>>> +
>>>> +#include <linux/acpi.h>
>>>> +#include <linux/delay.h>
>>>> +#include <linux/dmi.h>
>>>> +#include <linux/err.h>
>>>> +#include <linux/hwmon.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/mutex.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/slab.h>
>>>> +
>>>> +#define MECHREVO_ECRR_DELAY_MIN_US	6000
>>>> +#define MECHREVO_ECRR_DELAY_MAX_US	12000
>>>> +#define MECHREVO_RPM_ATTEMPTS		3
>>>> +
>>>> +struct mechrevo_ec_data {
>>>> +	acpi_handle inou;
>>>> +	/* Serialize the three ECRR calls that make up one fan sample. */
>>>> +	struct mutex rpm_lock;
>>>> +};
>>>> +
>>>> +static const struct dmi_system_id mechrevo_ec_dmi_table[] =3D {
>>>> +	{
>>>> +		.matches =3D {
>>>> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
>>>> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
>>>> +					"Kuangshi16Pro Series GM6PX0X"),
>>>> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6PX0X"),
>>>> +			DMI_EXACT_MATCH(DMI_BIOS_VERSION, "N.1.09MRO07"),
>>>> +		},
>>>> +	},
>>>> +	{}
>>>> +};
>>>> +MODULE_DEVICE_TABLE(dmi, mechrevo_ec_dmi_table);
>>>> +
>>>> +static int mechrevo_ec_read_byte(struct mechrevo_ec_data *data, u16 =
address,
>>>> +				 u8 *value)
>>>> +{
>>>> +	union acpi_object argument =3D {
>>>> +		.integer.type =3D ACPI_TYPE_INTEGER,
>>>> +		.integer.value =3D address,
>>>> +	};
>>>> +	struct acpi_object_list arguments =3D {
>>>> +		.count =3D 1,
>>>> +		.pointer =3D &argument,
>>>> +	};
>>>> +	unsigned long long raw;
>>>> +	acpi_status status;
>>>> +
>>>> +	status =3D acpi_evaluate_integer(data->inou, "ECRR", &arguments, &r=
aw);
>>>> +	if (ACPI_FAILURE(status))
>>>> +		return -EIO;
>>>> +
>>>> +	/* Match the delay used by the in-tree Uniwill ECRR transport. */
>>>> +	usleep_range(MECHREVO_ECRR_DELAY_MIN_US, MECHREVO_ECRR_DELAY_MAX_US=
);
>>>> +	if (raw > 255)
>>>> +		return -ERANGE;
>>>> +
>>>> +	*value =3D raw;
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int mechrevo_ec_read_temp(struct mechrevo_ec_data *data, int =
channel,
>>>> +				 long *value)
>>>> +{
>>>> +	u16 address;
>>>> +	u8 raw;
>>>> +	int ret;
>>>> +
>>>> +	switch (channel) {
>>>> +	case 0:
>>>> +		address =3D 0x043e;
>>>> +		break;
>>>> +	case 1:
>>>> +		address =3D 0x044f;
>>>> +		break;
>>>> +	default:
>>>> +		return -EOPNOTSUPP;
>>>> +	}
>>>> +
>>>> +	ret =3D mechrevo_ec_read_byte(data, address, &raw);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +	if (raw > 125)
>>>> +		return -ENODATA;
>>>> +
>>>> +	*value =3D raw * 1000;
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int mechrevo_ec_read_fan(struct mechrevo_ec_data *data, int c=
hannel,
>>>> +				long *value)
>>>> +{
>>>> +	u16 high_address, low_address;
>>>> +	u8 high, low, check;
>>>> +	int attempt, ret;
>>>> +
>>>> +	switch (channel) {
>>>> +	case 0:
>>>> +		high_address =3D 0x0464;
>>>> +		low_address =3D 0x0465;
>>>> +		break;
>>>> +	case 1:
>>>> +		high_address =3D 0x046c;
>>>> +		low_address =3D 0x046b;
>>>> +		break;
>>>> +	default:
>>>> +		return -EOPNOTSUPP;
>>>> +	}
>>>> +
>>>> +	/* The EC can update between byte reads; reject a high-byte rollove=
r. */
>>>> +	mutex_lock(&data->rpm_lock);
>>>> +	for (attempt =3D 0; attempt < MECHREVO_RPM_ATTEMPTS; attempt++) {
>>>> +		ret =3D mechrevo_ec_read_byte(data, high_address, &high);
>>>> +		if (ret)
>>>> +			goto out_unlock;
>>>> +
>>>> +		ret =3D mechrevo_ec_read_byte(data, low_address, &low);
>>>> +		if (ret)
>>>> +			goto out_unlock;
>>>> +
>>>> +		ret =3D mechrevo_ec_read_byte(data, high_address, &check);
>>>> +		if (ret)
>>>> +			goto out_unlock;
>>>> +
>>>> +		if (high =3D=3D check) {
>>>> +			*value =3D ((long)high << 8) | low;
>>>> +			ret =3D 0;
>>>> +			goto out_unlock;
>>>> +		}
>>>> +	}
>>>> +	ret =3D -EAGAIN;
>>>> +
>>>> +out_unlock:
>>>> +	mutex_unlock(&data->rpm_lock);
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static umode_t mechrevo_ec_is_visible(const void *data,
>>>> +				      enum hwmon_sensor_types type,
>>>> +				      u32 attr, int channel)
>>>> +{
>>>> +	if (channel < 0 || channel > 1)
>>>> +		return 0;
>>>> +
>>>> +	if (type =3D=3D hwmon_temp)
>>>> +		return attr =3D=3D hwmon_temp_input || attr =3D=3D hwmon_temp_labe=
l ? 0444 : 0;
>>>> +	if (type =3D=3D hwmon_fan)
>>>> +		return attr =3D=3D hwmon_fan_input || attr =3D=3D hwmon_fan_label =
? 0444 : 0;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int mechrevo_ec_read(struct device *dev, enum hwmon_sensor_ty=
pes type,
>>>> +			    u32 attr, int channel, long *value)
>>>> +{
>>>> +	struct mechrevo_ec_data *data =3D dev_get_drvdata(dev);
>>>> +
>>>> +	if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_input)
>>>> +		return mechrevo_ec_read_temp(data, channel, value);
>>>> +	if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_input)
>>>> +		return mechrevo_ec_read_fan(data, channel, value);
>>>> +
>>>> +	return -EOPNOTSUPP;
>>>> +}
>>>> +
>>>> +static int mechrevo_ec_read_string(struct device *dev,
>>>> +				   enum hwmon_sensor_types type, u32 attr,
>>>> +				   int channel, const char **value)
>>>> +{
>>>> +	if (channel < 0 || channel > 1)
>>>> +		return -EOPNOTSUPP;
>>>> +
>>>> +	if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_label)
>>>> +		*value =3D channel ? "GPU EC" : "CPU EC";
>>>> +	else if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_label)
>>>> +		*value =3D channel ? "GPU fan" : "CPU fan";
>>>> +	else
>>>> +		return -EOPNOTSUPP;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static const struct hwmon_ops mechrevo_ec_hwmon_ops =3D {
>>>> +	.is_visible =3D mechrevo_ec_is_visible,
>>>> +	.read =3D mechrevo_ec_read,
>>>> +	.read_string =3D mechrevo_ec_read_string,
>>>> +};
>>>> +
>>>> +static const struct hwmon_channel_info * const mechrevo_ec_hwmon_inf=
o[] =3D {
>>>> +	HWMON_CHANNEL_INFO(temp,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>>>> +	HWMON_CHANNEL_INFO(fan,
>>>> +			   HWMON_F_INPUT | HWMON_F_LABEL,
>>>> +			   HWMON_F_INPUT | HWMON_F_LABEL),
>>>> +	NULL
>>>> +};
>>>> +
>>>> +static const struct hwmon_chip_info mechrevo_ec_chip_info =3D {
>>>> +	.ops =3D &mechrevo_ec_hwmon_ops,
>>>> +	.info =3D mechrevo_ec_hwmon_info,
>>>> +};
>>>> +
>>>> +static int mechrevo_ec_probe(struct platform_device *pdev)
>>>> +{
>>>> +	struct mechrevo_ec_data *data;
>>>> +	struct device *hwmon_dev;
>>>> +	u8 project, capability;
>>>> +	acpi_status status;
>>>> +	int ret;
>>>> +
>>>> +	if (!dmi_check_system(mechrevo_ec_dmi_table))
>>>> +		return -ENODEV;
>>>> +
>>>> +	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>>>> +	if (!data)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	mutex_init(&data->rpm_lock);
>>>> +	status =3D acpi_get_handle(NULL, "\\_SB.INOU", &data->inou);
>>>> +	if (ACPI_FAILURE(status) || !acpi_has_method(data->inou, "ECRR"))
>>>> +		return dev_err_probe(&pdev->dev, -ENODEV,
>>>> +				     "missing INOU.ECRR method\n");
>>>> +
>>>> +	ret =3D mechrevo_ec_read_byte(data, 0x0740, &project);
>>>> +	if (ret)
>>>> +		return dev_err_probe(&pdev->dev, ret,
>>>> +				     "failed to read EC project ID\n");
>>>> +	ret =3D mechrevo_ec_read_byte(data, 0x078e, &capability);
>>>> +	if (ret)
>>>> +		return dev_err_probe(&pdev->dev, ret,
>>>> +				     "failed to read EC fan capability\n");
>>>> +	if (project !=3D 0x10 || !(capability & 0x40))
>>>> +		return dev_err_probe(&pdev->dev, -ENODEV,
>>>> +				     "unsupported EC project or fan layout\n");
>>>> +
>>>> +	platform_set_drvdata(pdev, data);
>>>> +	hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev, "mec=
hrevo",
>>>> +							 data,
>>>> +							 &mechrevo_ec_chip_info,
>>>> +							 NULL);
>>>> +	return PTR_ERR_OR_ZERO(hwmon_dev);
>>>> +}
>>>> +
>>>> +static struct platform_driver mechrevo_ec_driver =3D {
>>>> +	.probe =3D mechrevo_ec_probe,
>>>> +	.driver =3D {
>>>> +		.name =3D "mechrevo-ec-hwmon",
>>>> +	},
>>>> +};
>>>> +
>>>> +static struct platform_device *mechrevo_ec_device;
>>>> +
>>>> +static int __init mechrevo_ec_init(void)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	if (!dmi_check_system(mechrevo_ec_dmi_table))
>>>> +		return -ENODEV;
>>>> +
>>>> +	ret =3D platform_driver_register(&mechrevo_ec_driver);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	mechrevo_ec_device =3D platform_device_register_simple("mechrevo-ec=
-hwmon",
>>>> +							     PLATFORM_DEVID_NONE,
>>>> +							     NULL, 0);
>>>> +	if (IS_ERR(mechrevo_ec_device)) {
>>>> +		ret =3D PTR_ERR(mechrevo_ec_device);
>>>> +		platform_driver_unregister(&mechrevo_ec_driver);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void __exit mechrevo_ec_exit(void)
>>>> +{
>>>> +	platform_device_unregister(mechrevo_ec_device);
>>>> +	platform_driver_unregister(&mechrevo_ec_driver);
>>>> +}
>>>> +
>>>> +module_init(mechrevo_ec_init);
>>>> +module_exit(mechrevo_ec_exit);
>>>> +
>>>> +MODULE_DESCRIPTION("MECHREVO GM6PX0X EC hwmon driver");
>>>> +MODULE_LICENSE("GPL");
>=20

