Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6142264A8;
	Wed,  1 Jul 2026 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903071; cv=none; b=Mk0TZNyLj6+559UoR8lHuvRjhBTrboIgq+Qkbjk2uhfUhHJMdDEG7Att4VSpT83+ex6om2K2SN3QqJfrfwxvBiYGjUk2zQwmc22yC5JXUD66Px1Sj99HD3CZu8T66hZuTlJ4kBScZneoyxnvz3M04qA9BSVe0X6Td4H2rX3LFRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903071; c=relaxed/simple;
	bh=EIwu/8UqdZN9LdJlrgQritUngrduTk//3yaKnASF6jg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PPk0dTe0hOuuvV1JBAn+FkswNTAQ9HTU8pN6KbuDi3QI8wT3l8mAVWAwCakyiFpsvRKV5iHxSD6kawmyiz2IscpqmCNo1wfaCworG1a8ufDjJmT1g7we428vmQtAPgrPvN8dFj3rA+h1bxtTeTBPDks2XITBy8tEwyce/CvtJj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+NwqboD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+NwqboD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8595E1F00ADE;
	Wed,  1 Jul 2026 10:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782903068;
	bh=2iXR/ImIlInOiMvJB1WEQFV8A/HPkjG7mqIsI1cro04=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g+NwqboDcpYELy+vf8tOB20t5jWhzGMerYuiOPaUbPF+lhm8bH5zbcoBBGnLPpqNT
	 DqLUB5pUwmcLC9zyeiYjqOtpsLKkbfS+cwLlozEd9I0UFaksPFNxOf68FUpgH7jFqX
	 agHyAzmPM5RsxtQk7o42k702nIfUiRrjUDB3senJA94nqm3kb9okxhD5OLSIk9pONo
	 Q8vtqTUBf/Bt91cXuM+GKCiKsjXFdl1N2ei+FGEqjOD6UBdmuJtZZI1oUhJlhCAdc7
	 hNWvoXFe12zMmwrRcDmuXgZ77ag9FvhLWUeTFrOa0yuH6XkksI0q4rOEu52dh4Kimw
	 5Bl6RaqsdMAkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260701103714.22583-2-daniel.lezcano@oss.qualcomm.com>
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
 <20260701103714.22583-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 10:51:07 +0000
Message-Id: <20260701105108.8595E1F00ADE@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] t14s_ec_hwmon_read() bypasses the regmap lock, allowing concurrent=
 I2C commands to the EC without the required 10ms hardware delay.
- [Low] The driver unconditionally uses hwmon functions but its Kconfig ent=
ry does not depend on HWMON, leading to linker errors.
--

commit 53ea0adbdbb89073fdf3f9621385cdebffccdb5b
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for temperatures

This commit exposes the Lenovo ThinkPad T14s EC environmental sensors throu=
gh
the hwmon subsystem. It registers a hwmon device to provide access to six EC
temperature sensors and exports their labels.

> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/plat=
form/arm64/lenovo-thinkpad-t14s.c
> index 5590302a5694f..c9917a1d2bd7a 100644
> --- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> +++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> @@ -11,6 +11,7 @@
>  #include <linux/delay.h>
>  #include <linux/dev_printk.h>
>  #include <linux/err.h>
> +#include <linux/hwmon.h>

[Severity: Low]
The driver now unconditionally uses hwmon functions like
devm_hwmon_device_register_with_info(), but the Kconfig definition for
EC_LENOVO_THINKPAD_T14S doesn't appear to depend on HWMON.

Will this cause linker errors if EC_LENOVO_THINKPAD_T14S is built-in while
HWMON is built as a module or disabled?

[ ... ]

> @@ -555,6 +574,113 @@ static irqreturn_t t14s_ec_irq_handler(int irq, voi=
d *data)
>  	return IRQ_HANDLED;
>  }
> =20
[ ... ]
> +static int t14s_ec_hwmon_read(struct device *dev, enum hwmon_sensor_type=
s type,
> +			      u32 attr, int channel, long *val)
> +{
> +	struct t14s_ec *ec =3D dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (attr =3D=3D hwmon_temp_input) {
> +			ret =3D t14s_ec_read(ec, ec->ec_hwmon.sys_thermx[channel].reg, &value=
);

[Severity: High]
Does calling t14s_ec_read() directly here bypass the regmap serialization?

Multiple subsystems (LEDs, keyboard, etc.) use regmap_write/read which seri=
alize
access and respect the 10ms delay between EC I2C commands.

Since t14s_ec_read() drops the I2C bus lock before sleeping for 10ms:

drivers/platform/arm64/lenovo-thinkpad-t14s.c:t14s_ec_read() {
    ...
out:
    i2c_unlock_bus(client->adapter, I2C_LOCK_SEGMENT);
    fsleep(10000);
    return ret;
}

could a concurrent regmap access acquire the I2C bus lock immediately, issu=
ing
a new command to the EC before the hardware-mandated 10ms delay has elapsed?

> +			if (ret)
> +				return ret;
> +			*val =3D value * MILLIDEGREE_PER_DEGREE;
> +
> +			return 0;
> +		}
> +		break;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701103714.2258=
3-1-daniel.lezcano@oss.qualcomm.com?part=3D1
