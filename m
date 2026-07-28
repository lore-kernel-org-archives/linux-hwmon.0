Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ABF3264DA;
	Tue, 28 Jul 2026 03:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785210345; cv=none; b=JrDY/hdItDY2iu3ecZ6Jxe2YqnCczgwTF9DK2fJ9NCil+hZzE8h+B4UfKS3wM6DliPiyi6UtIZlHl5KfUnJvIXv0u0a73AloZ5PliTFocbgXrPyBMfToCitL+lLDrUq3Xj9bxhxV9WNA+UhXtuOll5QIwgQ1i2MZ+g/m2UX96EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785210345; c=relaxed/simple;
	bh=PVqAlAiAgci4heBwWVnlcyysnwsq0iSyhCWOBUX0eEU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pwENfwZZWMw4q7AmBdlZN8hLRt5+YbTr0j/u405KnlbAdxrO0e/NpD8RFRAf0Gp7mkSdyg16Da6KcVc9qP6LLjRc5sRBPswQgui1miYavM4D9H9qMPS8gqnMQdNcjNUB9su7BrUrmU6VYfTHiR21sqzgK52IXpan1KjcyOcRwZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dt/RVHeN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dt/RVHeN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7BB1F000E9;
	Tue, 28 Jul 2026 03:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785210343;
	bh=DFHckNq+WO4j8iRsxe8dooqfVklGc/Dzzht3P4JTKjI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dt/RVHeNuYq9zeuXhONMMcjzWg/ZStwc8PbhIUuIUaKmAiIhNF5Im9mncPW+DNkfa
	 LZaPP4MGrblLCGSZeN2mB1xa5LSYXOsvAkIwjnBgWgS5f07+PBqSmoq0l0oNka4y0a
	 boQZ/MBKjgqRgtdCMlCq+XQb1Q5pNSGfd/dZiqiv6Co1AzM1j53levBFD60yh//ztk
	 TD2sWPZMip0DME4QbcDMeQuGSw1b9tGaDwtOZ+P0DetQp3JUt90LD3fUTbcnSXdIg4
	 2gbMUCI9wMDUX6cpshZupzAjz0oWNju4bE1hzuXDErrOv7BxCfYQQpRddUoCMXCNwX
	 wO81z1D89aO3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728-dev-max20830c-v4-2-cec034298535@analog.com>
References: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
 <20260728-dev-max20830c-v4-2-cec034298535@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 03:45:42 +0000
Message-Id: <20260728034543.3F7BB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incomplete VOUT scaling introduces UAPI inconsistency and dangerou=
s hardware limit writes.
--

--- Patch [2]: [PATCH v4 2/4] hwmon: (pmbus/max20830): add VOUT feedback re=
sistor scaling support ---
commit 4d1fa3c4cb8d1f4bfe3ca16a79ad028a0dd9bfee
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: (pmbus/max20830): add VOUT feedback resistor scaling support

This commit adds support for external voltage divider scaling using the
adi,vout-rfb1-ohms and adi,vout-rfb2-ohms device tree properties. It reads
these properties and scales the feedback voltage for PMBUS_READ_VOUT.

> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max2083=
0.c
> index cb2c23672166d..7c1e94c43ac4e 100644
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c
[ ... ]
> @@ -14,6 +15,51 @@
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
> +		ret =3D pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Apply voltage divider scaling if resistors are non-zero */
> +		if (data->vout_rfb1 && data->vout_rfb2) {
> +			temp =3D (u64)data->vout_rfb1 + (u64)data->vout_rfb2;
> +			temp =3D DIV_ROUND_CLOSEST_ULL((u64)ret * temp, data->vout_rfb2);
> +			ret =3D clamp_val(temp, 0, 0xFFFF);
> +		}
> +		return ret;
> +	default:
> +		return -ENODATA;
> +	}
> +}

[Severity: High]
Does this code introduce a UAPI inconsistency by only scaling PMBUS_READ_VO=
UT?

When in1_input is read, it returns the scaled output voltage.

However, because this switch returns -ENODATA for limits (like
PMBUS_VOUT_OV_WARN_LIMIT or PMBUS_VOUT_OV_FAULT_LIMIT), reading limits like
in1_max will return the unscaled feedback voltage directly from the chip.

> +
>  static struct pmbus_driver_info max20830_info =3D {
>  	.pages =3D 1,
>  	.format[PSC_VOLTAGE_IN] =3D linear,
> @@ -24,13 +70,25 @@ static struct pmbus_driver_info max20830_info =3D {
>  		PMBUS_HAVE_TEMP |
>  		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
>  		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
> +	.read_word_data =3D max20830_read_word_data,
>  };

[Severity: High]
Should there be a matching write_word_data callback here to reverse the
scaling for limit registers?

Since there is no write_word_data callback, if a user writes a new limit us=
ing
the scaled unit, the core will write it directly to the hardware without
reverse-scaling.

The chip treats this as a feedback limit, which could drastically raise the
physical overvoltage trip point and bypass hardware protection.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-dev-max208=
30c-v4-0-cec034298535@analog.com?part=3D2
