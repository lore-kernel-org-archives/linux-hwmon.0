Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA576BB5B;
	Fri, 24 Jul 2026 16:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784912394; cv=none; b=p6z2VTsQWnxPAzg2c8X94hJhYRhIl3mvanyOo/5iAHVxowPMTEW5Bu4LpCZzXQt/pdO/ZQGfQrMkDkIvQ9XLXzo3eVRL+oSAvSLxuDFMeLquSAY6KFJVO4idA4a0c3Po4XSc2kbjT8Ov91ry5J/pcky0XSwuKfUepydngt1aZ3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784912394; c=relaxed/simple;
	bh=1kWsxiBewMRi8QbyqOurhCaqlXxlzj80uumlgyr3toY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MmAVHNu7VjiCKoPNK/yeyvV0OsmGENB0LkX5NKoi8qJIGhwFwb+uGn2SpOZcXmxwB8WH/RkL/uljY1bejY0ozvQiwys9nPPzYL5RZD20ZxoDYtBIwVhGnwa/tpaXRTHCSkovT3AY5KTv9J8Zf8vn2dQD5v6ro6+kUdR/xjKy/j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4oIkZeu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4oIkZeu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F791F00A3D;
	Fri, 24 Jul 2026 16:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784912393;
	bh=VEId563rhwkwNIYlzbvpFA2TAXyDNnpj+kGuXb12mQA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G4oIkZeui7f9ol42Z5Wdla3ZCwlzNQzxx0V8o+1LoBpNqDhw76EhuVb8EYnxqWKbo
	 15hPvOliaUf16CSZMJVSrwchWH/Yasny9ybsYqTrO9Y4AurE2mo+ODoR0XScRirgX/
	 pdKsPYLr3IZgdMa808negzTxOsQ24giaQPR50TH8xMJcWQ1YjExeAvTEEVFW8QKoih
	 DygxDbGd+r4hUJ/ezA2zAezyFVH8Yi1fb+S8KXk71VXpMzbO/B0zfblY0lcorv4eQi
	 MvT+VT2awrcoobRLSOhnfVQbNghsfKPe2HZT8NPqYCpRbzvjZXnmqFDr/2mAnLy9te
	 YmBDsnl0wjYvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UHJhZGhhbiwgU2FubWFu?= <sanman.pradhan@hpe.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724164919.247162-3-sanman.pradhan@hpe.com>
References: <20260724164919.247162-1-sanman.pradhan@hpe.com>
 <20260724164919.247162-3-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 16:59:52 +0000
Message-Id: <20260724165952.A2F791F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The arithmetic calculation in `vt7505_set_m()` can overflow when=
 converting the 64-bit result to a signed 32-bit integer, resulting in a ne=
gative or corrupted PMBus coefficient.
--

--- Patch [2]: [PATCH v3 2/2] hwmon: (pmbus/vt7505) Add driver for Analog D=
evices MAX16545/MAX16550 and Volterra VT7505 ---
commit 6d968d4ee814c7e869f893c1177921f54e4e55cd
Author: Georgi Vlaev <gvlaev@juniper.net>

hwmon: (pmbus/vt7505) Add driver for Analog Devices MAX16545/MAX16550 and V=
olterra VT7505

This commit adds a PMBus driver for the MAX16545, MAX16550, and VT7505
controllers. It reports voltage, current, power, and temperature over
PMBus, calculating current and power coefficients based on the
adi,rload-ohms device tree property.

> diff --git a/drivers/hwmon/pmbus/vt7505.c b/drivers/hwmon/pmbus/vt7505.c
> new file mode 100644
> index 0000000000000..c60f849e1f9ea
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/vt7505.c

[ ... ]

> +static void vt7505_set_m(int *m, u32 rload)
> +{
> +	u64 val =3D (u64)*m * rload;
> +
> +	/* Make sure m fits the s32 type */
> +	*m =3D DIV_ROUND_CLOSEST_ULL(val, 1000);

[Severity: Medium]
Does this downcast to a signed 32-bit integer safely handle large values of
rload?

If the rload value is sufficiently large, could the result of
DIV_ROUND_CLOSEST_ULL() exceed INT_MAX and silently overflow into a
negative PMBus coefficient?

> +}
> +
> +static int vt7505_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	const struct vt7505_chip_data *chip;
> +	struct pmbus_driver_info *info;
> +	u32 rload;
> +	int ret;

[ ... ]

> +	/*
> +	 * The m coefficient used in the direct-format current and power
> +	 * calculations depends on RLOAD, the external current-report resistor
> +	 * connected between the ILOAD pin and ground. Use the default value if
> +	 * none is specified.
> +	 */
> +	if (of_property_read_u32(dev->of_node, "adi,rload-ohms", &rload))
> +		rload =3D VT7505_RLOAD_DEFAULT;
> +
> +	if (!rload)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "adi,rload-ohms must be non-zero\n");

[Severity: Medium]
Should there be an upper bound validation for rload here?

Because rload is read directly from the device tree and passed to
vt7505_set_m(), an unexpectedly large unbounded value could trigger the
arithmetic overflow mentioned above.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724164919.2471=
62-1-sanman.pradhan@hpe.com?part=3D2
