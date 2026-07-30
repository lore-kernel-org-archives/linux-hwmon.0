Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1002351C2A;
	Thu, 30 Jul 2026 01:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785374099; cv=none; b=Rpl/ekTiUUS08ENs9Z20Z4w3yIZC8SoQ4j9H0mmavM7N8UaZadDqVZhApQIkir3cWZP5tSYQUAE3ZMxg/eOQlLXee+YbJTPqpp0np0l8PDiPaISRmWEE2/sloqCBfccTN1ApEtPMkjjHjDE7yjbT5BqFl2rtF8kh9OQI2ixncH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785374099; c=relaxed/simple;
	bh=Jtb82bA05aO+GEdXy6IxN9tDw2AOLwaHY0UKPW0nDG4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lKzsoMqyjZ5NudO1UQgVZss/fd/WSg7bm5vwrJ8DefbnsV5jfCQZ48xPhQpqSmgYwTKeVjk6NxpjWFW64SNn+XELizdbp8fXfgZz1DrQGnE+0CxOWW8QwJ5Sg+nDtJbrER5qgdcGv3CIMVA1Bpm+HOznY0qNRwWMk9WI2Fux37M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKtKrWD4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKtKrWD4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525861F000E9;
	Thu, 30 Jul 2026 01:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785374098;
	bh=QDdaJ7sR2LpW9scek1DrROm6lI3ldTTB7e5UGHnbcH8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UKtKrWD4VkZt80vMAXegzW6YzDknzXGQjqirnk8RCoantYzSrJZolhPRtvwRXF1Ub
	 QuNnN7dLYfzcvs86an+pcaWlyqf++bx2ybIw99uq40QSZNde7PzL/wzng6iv+9BzbE
	 ejkIkMNecjiN908yg0HfDGUvevU6e9oNltv8GrTGMQErCH+Ji773UMlv6GqoiGEYwL
	 BTqPWLwmgcUC8Pthsp/IqOGZJgLDdx4wZYg38NW0Q10N6O8x3HV+qSmtWJnm9E8pvm
	 +HI3KZ7tz8mi7xWiuHel8IlBnl6SXpPgYaEGo9MUxs1Ps5gDT5mg/Siy2c2H6z5+55
	 8IVmeuJyFlHyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260730-dev-max20830c-v5-2-a7553f84ee74@analog.com>
References: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
 <20260730-dev-max20830c-v5-2-a7553f84ee74@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 01:14:57 +0000
Message-Id: <20260730011458.525861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Returning -ENODATA does not mask unsupported PMBus limit registe=
rs, incorrectly exposing unscaled limit attributes if the hardware responds.
--

--- Patch [2]: [PATCH v5 2/4] hwmon: (pmbus/max20830): add VOUT feedback re=
sistor scaling support ---
commit 852e7cf36da1bb5ec1c29eff09bb747755762b5b
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: (pmbus/max20830): add VOUT feedback resistor scaling support

This commit adds support for external voltage divider scaling in the max208=
30=20
driver. It reads resistor values from device tree properties and applies a=
=20
scaling formula to VOUT readings to report the actual output voltage.

> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max2083=
0.c
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c
[ ... ]
> @@ -14,6 +15,56 @@
[ ... ]
> +static int max20830_read_word_data(struct i2c_client *client, int page,
> +				   int phase, int reg)
> +{
> +	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client);
> +	const struct max20830_data *data =3D container_of(info, struct max20830=
_data, info);
> +	int ret;
> +	u64 temp;
> +
> +	switch (reg) {
> +	case PMBUS_READ_VOUT:
[ ... ]
> +		return ret;
> +	default:
> +		return -ENODATA;

[Severity: Medium]
Does returning -ENODATA here actually mask the unsupported limit registers =
as
intended?

In the PMBus core framework, returning -ENODATA from the driver's read
callback is treated as a signal to fall back to a standard I2C read. It
does not block the attribute.

If the hardware responds to the limit register reads over standard I2C, the
PMBus core will still create the sysfs attributes. Because scaling is only
applied to PMBUS_READ_VOUT in this patch, these exposed limit attributes
(e.g., in1_max) would report raw, unscaled feedback voltages, while in1_inp=
ut
reports scaled actual voltages, creating an inconsistent interface.

Should this return -ENXIO instead, which explicitly tells the PMBus core th=
at
the register is unsupported and prevents the sysfs attributes from being
created?

> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-dev-max208=
30c-v5-0-a7553f84ee74@analog.com?part=3D2
