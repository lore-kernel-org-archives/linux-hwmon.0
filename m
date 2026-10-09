Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8726C2737F9;
	Fri,  9 Oct 2026 12:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548068; cv=none; b=B2jP5m/STfLZy/nS1Sxb6MgLJexbcqeRU97KTl6TvIsLBj3KMrTsW0EvEVJRGQzP/+/ogdXm4/vKTORpF77P4Kyp0C/H3lpYQfjNZTIQivgsyMNy6Of3uRAE7gPnIfP9xa+dlfpHqNsU/CPjmyg/UBAmOOBqi6RvhQsA4rnLByk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548068; c=relaxed/simple;
	bh=TCNF0jpWRYJV9Gun1t6oM5yVbdSbaQ3sVeBoo6D3+Os=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=m7BLky5YAsmfDv7P6S9D/ON1UA+r8afhi/8de4s4EkhFdtSzH69q7iiCEuSoxyDuOFmaij7omxzbJuf1Y2+N2HjxzNyzs0Q2GaLIamn3P/xqVGMnlTn+TSkXzdYn5nnylfIpSkSUgikWtLZltm1zXeKb/1nulqScQCDu4rDWXDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLOUuAoQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLOUuAoQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9431F000FF;
	Fri,  9 Oct 2026 12:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791548058;
	bh=m/M79T0qSkGDFGaGmp2E8WidSUwZc+ebzrY+W9q8Ijg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nLOUuAoQ67S2R4qPGDZWblM6Rxpr7nCEzu4+Zb1hPYGYJLBmq+OVMZNOwqzuk3lxn
	 TZR2CkUAcxSfBt6kOyF/zmGhngKnYgNfUAYVO1v2S+t+ETJNDh0kMqgGFbkN/NMTrN
	 7ktngULJeW35Yg0320TAgp2QtjDYVKMZguo2mEo03/a7Xh+TZGu+aDZDboirPSuTQd
	 WdkDYUPaOTcBqB1c7C2jnwOVRzUm6UbBU965fOIqB7AhnmJ2xDFLZwzHfOg9oC//Bq
	 cd4OnPYBwIL/LJ8AVp5z2gWwWxN1anl1IrPXanfNZREqAY2cF8G9c7vRzb/xHHtgDm
	 veYYYeamG8Ufg==
Message-ID: <sashiko-outbox-165498@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] hwmon: (lm75) add MAX31875 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Erasmus Mari Geronimo" <johnerasmusmari.geronimo@analog.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009115617.1976-4-johnerasmusmari.geronimo@analog.com>
References: <20261009115617.1976-1-johnerasmusmari.geronimo@analog.com>
 <20261009115617.1976-4-johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:14:17 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] hwmon: lm75: unconditional 16-bit polarity mask corrupts max31875 =
conversion rate
- [Medium] hwmon: lm75: Fix incorrect bit mask for MAX31875 conversion rate
- [Medium] hwmon: lm75: max31875 state desynchronization on probe
--

commit 5136e5422ce7bd39a8f47ef8a45e61f3dcdb4cf8
Author: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

hwmon: (lm75) add MAX31875 support

This commit adds support for the Maxim MAX31875 I2C temperature sensor
by extending the lm75 driver. The new device supports a 16-bit
configuration register with configurable resolutions and selectable
conversion rates.

> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 2d2d752aeac9d..cda28b9b093c1 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c

[ ... ]

> @@ -222,6 +223,14 @@ static const struct lm75_params device_params[] =3D {
>  		.default_resolution =3D 16,
>  		.default_sample_time =3D MSEC_PER_SEC / 20,
>  	},
> +	[max31875] =3D {
> +		.config_reg_16bits =3D true,
> +		.default_resolution =3D 10,
> +		.default_sample_time =3D 4000,
> +		.num_sample_times =3D 4,
> +		.sample_times =3D (unsigned int []){ 125, 250, 1000, 4000 },
> +		.alarm =3D true,
> +	},

[Severity: High]
Does setting .config_reg_16bits to true for max31875 cause a regression
where the conversion rate is corrupted during initialization?

In lm75_generic_probe(), the polarity mask is unconditionally set to BIT(10)
for 16-bit chips:

    if (!data->params->config_reg_16bits)
        pol_mask =3D LM75_ALERT_POLARITY_HIGH_8_BIT;
    else
        pol_mask =3D LM75_ALERT_POLARITY_HIGH_16_BIT;

This mask is then applied to the configuration register:

    clr_mask =3D data->params->clr_mask | pol_mask;
    ...
    err =3D lm75_write_config(data, set_mask, clr_mask);

Because the max31875 conversion rate mask includes BIT(10) and BIT(9),
could probing the max31875 forcefully clear or set the MSB of its
conversion rate, causing mutual corruption between the alarm polarity and
conversion rate settings?

[Severity: Medium]
Since .set_mask and .clr_mask are not defined here, does this result in a
state desynchronization on probe?

In lm75_generic_probe(), the software state is unconditionally initialized =
to
the defaults:

    data->sample_time =3D data->params->default_sample_time;
    data->resolution =3D data->params->default_resolution;

But since the configuration masks are 0, lm75_write_config() fails to
enforce these defaults on the hardware.

If a bootloader or prior system state configured the conversion rate or
resolution differently, will the driver state become desynchronized from the
actual hardware state?

[ ... ]

> @@ -494,6 +506,13 @@ static int lm75_update_interval(struct device *dev, =
long val)
>  			return err;
>  		data->sample_time =3D data->params->sample_times[index];
>  		break;
> +	case max31875:
> +		err =3D regmap_update_bits(data->regmap, LM75_REG_CONF,
> +					 0x0600, (3 - index) << 9);

[Severity: Medium]
Is the bit mask for the MAX31875 conversion rate correct here?

Because lm75_i2c_reg_read() uses i2c_smbus_read_word_data() for 16-bit
configuration registers, the chip's MSB is placed in the lower 8 bits of the
returned value to maintain compatibility with 8-bit standard LM75 features.

This means D10 and D9 map to bits 2 and 1 of regval.

Using the mask 0x0600 and shifting by 9 modifies bits 10 and 9 of regval,
which alters bits D2 and D1 of the chip's LSB instead of setting the
conversion rate.

Should the mask be 0x0006 and the shift be 1?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009115617.1976=
-1-johnerasmusmari.geronimo@analog.com?part=3D3
