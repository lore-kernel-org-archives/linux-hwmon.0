Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116086;
	b=NAvx7d7wzL6L67LnZTOgaTPTPByvxLkYCSJz2YhuDnb5Jdp89PB2pKSYDFhXQ6R/BxFU
	 5ZWWItEdnvfrPPv7EIznKoMTn6WrqlnpdlLZm26cZe37y8GWDJjDf9UI0sOEn6x3tGAJr
	 GjOXwEnCzUZFkFXWi6UZRMW70zjnMGK9MLqmyBMmjEhWkyjrDNW3b95E8VA7FzUHQHKfN
	 KVg1QNMRwt81UyRBXX5eRYrmTrSs+iVkIjj1F7vjfd9B2nVXoHhF8Ox4fQSu1qXTVor/v
	 wjcFWCpYVDYKgb/Bj/dDHeO2tkzWtrZ0vIBpaY+sYWQeBrzCbrxH0FNPtVdOfj/NQeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116086;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IRQ1aUeJbqlpRukLO0OSO+iJX5nMP2YRzK7UzoqOEwM=;
	b=bI6SOHny4FJs8cfmqk8DdEpHBA+Op/OHzDhYUZjJXxKZAqZqpCfGK+DuTdR5IwPlGZ7Z
	 0diVXxvt8V20MRO9lmvbuoLfNHFd54P3HYw89FE1xxZhTa85DJLjeCouYs0GusYGJiiyv
	 N0XCsjsqJqwO0Z5Mu0EcTksi4c0KB71YDsPpiHdu0y0c/IFj7JW2KrFdV32EpXtscFaBp
	 EW8UUnjWN1WoeCeyS5HTwqv91SXeH95Jjb7cAE/eYagQe/RMzOnyeJ3Ye1ZEWptGsWx4v
	 fRWSFruVTrulliBJOcwmDEdeZKTA1OhvzHx/YFQQoW2SlXL5bH0aVWXW6BwU25eVJuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UpFLHKPw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BC0606A32A
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 19:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UpFLHKPw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF6C1F000C5;
	Thu, 19 Nov 2026 19:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795116085;
	bh=IRQ1aUeJbqlpRukLO0OSO+iJX5nMP2YRzK7UzoqOEwM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UpFLHKPwu1JmaSniGSip9GuRvsB50jJ3Qyrp/UOCu0c813vHXx69LQeav6nMSeFGK
	 rLnRSUoQ5N6OyhqaM3VQDp2nNFfjfHlauvlbGu76yC7tTtkxwLWeCATx4sz1LCYOBJ
	 C9YXG7b7nGXGCgB+S5yiAm6v3pGrYHYcbcWUzSy9pBKFNHWPUbB8K1LyvY9A3I1BUI
	 Wpem4gcpGYBxXKNp6ODNOpnkqRvRJPJvzwiff+ZwmccDqTOAvTz1ddmQ++icmioAvh
	 im21OnBqVOCfzASvlNdZDszLnBAQfImZPFeckALVELciDkJbd1lq3ikmgzmSkksWDB
	 PSVZoeotrIfJA==
Message-ID: <sashiko-outbox-223866@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: add Raspberry Pi PMIC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sander Speetjens" <sander.speetjens@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261119-hwmon-da9091-v2-1-d6c624272a9e@gmail.com>
References: <20261119-hwmon-da9091-v2-0-d6c624272a9e@gmail.com>
 <20261119-hwmon-da9091-v2-1-d6c624272a9e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 19:21:25 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [Medium] hwmon: (raspberrypi-pmic) missing !RASPBERRYPI_FIRMWARE under
  COMPILE_TEST
- [Low] hwmon: raspberrypi-pmic: broken boolean condition in
  rpi_pmic_is_visible()
- [Low] hwmon: raspberrypi-pmic: mixed C and C++ comment styles in
  rpi_pmic_update()
- [Low] hwmon: raspberrypi-pmic: dead last_update init and unused
  hwmon_dev in rpi_pmic_probe()
- [Low] hwmon: raspberrypi-pmic-hwmon: rpi_pmic_probe() still uses
  da9091 hwmon name
- [Low] hwmon: (raspberrypi-pmic) rpi_pmic_probe() logs dev_err() on
  -ENODEV
--

commit b45f4c2fa5a0bc70439e56dc5c7bc176f104a858
Author: Sander Speetjens <sander.speetjens@gmail.com>

hwmon: add Raspberry Pi PMIC driver

This commit adds a hwmon driver for the Raspberry Pi 5 PMIC that reads
voltage, current and temperature sensors through the VideoCore firmware
mailbox interface.

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 18c682e1a4756..2fd7e2fdad6c8 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2020,6 +2020,17 @@ config SENSORS_RASPBERRYPI_HWMON
>  	  This driver can also be built as a module. If so, the module
>  	  will be called raspberrypi-hwmon.
> =20
> +config SENSORS_RASPBERRYPI_PMIC
> +	tristate "Raspberry Pi PMIC monitor"
> +	depends on RASPBERRYPI_FIRMWARE || COMPILE_TEST

[Severity: Medium]
Can this cause a link failure when CONFIG_COMPILE_TEST=3Dy,
CONFIG_RASPBERRYPI_FIRMWARE=3Dm and CONFIG_SENSORS_RASPBERRYPI_PMIC=3Dy?

Because COMPILE_TEST is a boolean, RASPBERRYPI_FIRMWARE || COMPILE_TEST
allows SENSORS_RASPBERRYPI_PMIC to be built-in while the firmware driver is
a module.  In include/soc/bcm2835/raspberrypi-firmware.h,
IS_ENABLED(CONFIG_RASPBERRYPI_FIRMWARE) is true when
CONFIG_RASPBERRYPI_FIRMWARE=3Dm, so vmlinux fails to link with undefined
references to devm_rpi_firmware_get() and rpi_firmware_property().

Using:

	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)

like SENSORS_RASPBERRYPI_HWMON caps SENSORS_RASPBERRYPI_PMIC to m when
RASPBERRYPI_FIRMWARE=3Dm.

[ ... ]

> diff --git a/drivers/hwmon/raspberrypi-pmic-hwmon.c b/drivers/hwmon/raspb=
errypi-pmic-hwmon.c
> new file mode 100644
> index 0000000000000..ade0e1267aa02
> --- /dev/null
> +++ b/drivers/hwmon/raspberrypi-pmic-hwmon.c
> @@ -0,0 +1,299 @@

[ ... ]

> +struct rpi_pmic_data {
> +	struct rpi_firmware *fw;
> +	struct device *hwmon_dev;
> +	u32 values[RPI_PMIC_NUM_CHANNELS];
> +	u64 last_update;
> +};

[ ... ]

> +static int rpi_pmic_update(struct rpi_pmic_data *data)
> +{
> +	struct rpi_pmic_adc_msg msg =3D {
> +		.index  =3D cpu_to_le32(0),
> +		.length =3D cpu_to_le32(RPI_PMIC_NUM_CHANNELS),
> +	};
> +	int ret;
> +	unsigned int i;
> +
> +	ret =3D rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_PMIC_ADC,
> +				    &msg, sizeof(msg));
> +	if (ret)
> +		return ret;
> +
> +	// Sanity-check the response
> +	if (le32_to_cpu(msg.length) !=3D RPI_PMIC_NUM_CHANNELS)
> +		return -EIO;

[Severity: Low]
This isn't a bug, but Documentation/hwmon/submitting-patches.rst asks not
to mix C and C++ comment styles in a single driver.  The rest of this file
uses /* */ comments.

[ ... ]

> +static umode_t rpi_pmic_is_visible(const void *data,
> +				   enum hwmon_sensor_types type,
> +				   u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		if (channel < ARRAY_SIZE(rpi_pmic_in_idx) ||
> +		    attr =3D=3D hwmon_in_input || attr =3D=3D hwmon_in_label)
> +			return 0444;
> +		break;
> +	case hwmon_curr:
> +		if (channel < ARRAY_SIZE(rpi_pmic_curr_idx) ||
> +		    attr =3D=3D hwmon_curr_input || attr =3D=3D hwmon_curr_label)
> +			return 0444;
> +		break;
> +	case hwmon_temp:
> +		if (channel < ARRAY_SIZE(rpi_pmic_temp_idx) ||
> +		    attr =3D=3D hwmon_temp_input || attr =3D=3D hwmon_temp_label)
> +			return 0444;
> +		break;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}

[Severity: Low]
Should the channel bounds checks in rpi_pmic_is_visible() use && instead of
|| before the attribute checks?

With ||, any valid channel index short-circuits the condition and returns
0444 regardless of attr, and any input or label attribute returns 0444 even
if channel is out of range for rpi_pmic_*_idx[].

[ ... ]

> +static int rpi_pmic_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct rpi_pmic_data *data;
> +	struct rpi_firmware *fw;
> +	int ret;
> +
> +	fw =3D devm_rpi_firmware_get(dev, dev->parent->of_node);
> +	if (!fw)
> +		return -EPROBE_DEFER;
> +
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->fw =3D fw;
> +	data->last_update =3D get_jiffies_64() - msecs_to_jiffies(RPI_PMIC_CACH=
E_MS);

[Severity: Low]
This isn't a bug, but data->last_update is immediately overwritten by
rpi_pmic_update() on the next line (or discarded if probe fails).  Also,
data->hwmon_dev is only written in rpi_pmic_probe() and never read, so a
local struct device *hwmon_dev variable can replace the struct member.

> +
> +	ret =3D rpi_pmic_update(data);
> +	if (ret) {
> +		dev_err(dev, "Failed to read PMIC ADC property: %d\n", ret);
> +		return -ENODEV;
> +	}

[Severity: Low]
As reported by Guenter Roeck on v1 [1], should rpi_pmic_probe() fail
silently without dev_err() when rpi_pmic_update() fails?

Because the platform device is registered unconditionally on Raspberry Pi 5
and calling rpi_pmic_update() is the only way to detect whether the running
firmware implements RPI_FIRMWARE_GET_PMIC_ADC, logging an error produces a
spurious message on systems with older firmware.

> +
> +	data->hwmon_dev =3D
> +		devm_hwmon_device_register_with_info(dev,
> +						     "da9091", data, &rpi_pmic_chip_info, NULL);

[Severity: Low]
As reported by Guenter Roeck on v1 [2], should the hwmon device name pass a
generic name such as "rpi_pmic" instead of "da9091" so the driver does not
reference a specific PMIC chip?

[1] https://lore.kernel.org/r/be16d42f-e6bf-45d5-83a8-28afbe54e3f8@roeck-us=
.net
[2] https://lore.kernel.org/r/be16d42f-e6bf-45d5-83a8-28afbe54e3f8@roeck-us=
.net

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-hwmon-da90=
91-v2-0-d6c624272a9e@gmail.com?part=3D1
