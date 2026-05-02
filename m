Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0992A382F1D
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 16:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777739320; cv=none; b=XhQxpp0CeNy/PuiIkwSukySUCpJtT/d3wf4n76aZ+kYTzAKpHrstOyGP+wh4BMuCSOrOCwf1Xlcwq9seXgnR3/5iDS1mEfNDvQQZZlgK4Sj5jfCXoRgR1ZY/oCvbGjTQvtajOd2oTdtHtG5Ya99GhGPecoQe+b3d9SOj7ZmNvcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777739320; c=relaxed/simple;
	bh=Dn4g6t3FCw077mvIW4PQICsb5St4joZ7Co7iNqaxmYs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a2JiOCEbvO+OnybTol0c89pJL1LcPIVd+2EJ6C+Lz7K8OpkaH/x1MZP311kQ2GakQalhiJPxhQP+1y4VvW4CrLmw44EC8WLjF0C9IoaV5CRllosTNJib7XswVTbFXTmN9gw6Nt6rjOxUMpFRogzTjDXLtbFtvQ5LP60ZyN1vNX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rbD9pBaM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rbD9pBaM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71710C19425;
	Sat,  2 May 2026 16:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777739319;
	bh=Dn4g6t3FCw077mvIW4PQICsb5St4joZ7Co7iNqaxmYs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=rbD9pBaMvzcFeTQD6lBgj3ZRu/rhMGDt6DSSfYhf6HBLYZpyxXMIk1xnXlLxVZQWz
	 7fajpMBgszBqYHWTzMrh4gin2abNNpzKZeZEgAWlOorOcKaKPj1ExYfp7nGGDrN5N6
	 xa7r1jct1YXrYVTbTnEWaXYL3SivJmz6HpTDebWOZJS5SBLKQw+GWHxEKfei/hwrS1
	 SusYYeIDegXUJtnIhOBZSgpdIisIwuG4EV9FQ+4z/ghokSjN2GaCglxqRXzWy1KJbG
	 FiGLkNefcUDXm7fIRn/onr+SqM6QVhetTQMV1+aMCl9hRDk2bu0R5fwf+pMzAYitV1
	 SPMl7rFC1YGfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (lm75) Fix AS6200 setup and alarm
 handling
Reply-To: sashiko@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260502160533.3527619-2-markus.stockhausen@gmx.de>
References: <20260502160533.3527619-2-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 02 May 2026 16:28:38 +0000
Message-Id: <20260502162839.71710C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The patch attempts to disable Single Shot mode but fails due to a =
misunderstanding of the sensor's endianness, leaving the device in the wron=
g mode.
- [High] The patch's new alarm logic uses `!=3D` to compare the alarm and p=
olarity bits, which inverts the output and violates the hwmon sysfs ABI.
--

commit ce15170fb232a37df75ee23f58c0868809e4b7cb
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

hwmon: (lm75) Fix AS6200 setup and alarm handling

This commit attempts to fix the AS6200 initialization by changing the
configuration mask to drive the sensor in continuous mode and active-low
setup. It also adjusts the alarm handling logic to compare the alarm bit
against the polarity bit to correctly report active alarms.

> - Change the set_mask to 0x10c0 to reflect the current active-low
>   setup properly and to drive the sensor in continous mode. This
>   takes into account that the config register is little endian and
>   the first byte sent to the chip is the LSB.

The lm75-compatible 16-bit sensors generally use a big-endian format where
the msb is sent first.

> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -137,7 +137,7 @@ static const struct lm75_params device_params[] =3D {
>  	},
>  	[as6200] =3D {
>  		.config_reg_16bits =3D true,
> -		.set_mask =3D 0x94C0,	/* 8 sample/s, 4 CF, positive polarity */
> +		.set_mask =3D 0x10C0,	/* 8 sample/s, 4 CF */

If the i2c transfer sends the lsb of 0x10C0 first, the first byte sent
is 0xC0.=20

When 0xC0 is interpreted by the chip as the msb, it sets bits 15 and 14.
Since bit 15 controls Single Shot mode, does this unintentionally keep
the device in Single Shot mode instead of enabling continuous mode?

[ ... ]

> @@ -416,7 +416,7 @@ static int lm75_read(struct device *dev, enum hwmon_s=
ensor_types type,
>  			switch (data->kind) {
>  			case as6200:
>  			case tmp112:
> -				*val =3D (regval >> 13) & 0x1;
> +				*val =3D !!(regval & BIT(13)) !=3D !!(regval & BIT(2));

Does this comparison invert the expected hwmon alarm abi?

The hwmon abi expects the alarm attribute to return 1 when an alarm
is active and 0 otherwise. The alarm bit (13) reflects the physical state
of the alert pin.

If the setup is active-low (polarity bit 2 is 0) and an alarm triggers,
the pin is pulled low so bit 13 becomes 0. The expression 0 !=3D 0 evaluates
to 0.

During normal operation, the pin is high (1), and 1 !=3D 0 evaluates to 1.

Should this use =3D=3D instead to ensure the attribute returns 1 when the
alarm condition is active?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260502160533.3527=
619-1-markus.stockhausen@gmx.de?part=3D1
