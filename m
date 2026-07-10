Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EC34071DD;
	Fri, 10 Jul 2026 10:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679119; cv=none; b=qYXs7szUnt19FfGguBto9tXUhF6FhK0mDzGTVhAYjhF5qBejU0sbriZGZZ6DRFIT1FjIuLk7P0j/+V8+TN2pW3itqeFYq7p3DOmreAVRKjDYywcznJiof26kKQai46MK8rY9I6WSDcyXOOrUl/r1lXu+Xn23aM0Edm6sSq3mdgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679119; c=relaxed/simple;
	bh=sFDUA/GzIDzq7MhA/ke7SrxNmq+r0JNV0c77nh2V2HY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KQhqoHixm9kK4yxZMSo+47pjJh4sYtWiWWwI0TQhcFAtWL7ZTRz/Hm+Xl0IqXOYR9diWBLYiJZnZWSTR0aQhmDxv1T0NqKI7Ne3N2+NJM8FBKh+FqN+GQLR54yz/MKKnaApsRz75Fr818esGrlikeSlSoVN2bi5FO9tbuWCL9h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrPveGIR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrPveGIR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69CC1F000E9;
	Fri, 10 Jul 2026 10:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783679118;
	bh=3ErnmHFG1dZc1V1zCZ6Y0rePlSr1UATe091kmp7eHLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NrPveGIRdMgVKMiBASABW5m3h3nJ/pK6JBtmVgYKEq0XLW8ZAhAsQHjDrag2OAFTh
	 A25fUB6N3uZtEqtiem7lPkxBx3UCxnkW64mAyQqjtDi/mYQYuvU76rWC06GaOYdsMB
	 vwvg+Fa/0VcVVy9dA8cqkZiBTLrNGLvWDPiQIjhOm4iSaLjOLxy3boFqZfsV9EfX6R
	 9wQa66WWs604FlTfEODAiVlyZVYU36akh/PYnqHvayiv3uxhqtzddlH/Cl668eHT6p
	 QMgM8IfyY1uTXu5HDjITW0rmvdgZWWpJRwDglqxhnV4lEQjzc3SzNg0+/RL1v5Lq+R
	 jbdCyZPLyCzCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 3/6] mfd: mc33978: Add NXP MC33978/MC34978 MSDI
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260710101358.2606941-4-o.rempel@pengutronix.de>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-4-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 10:25:17 +0000
Message-Id: <20260710102517.B69CC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The MFD core driver logic is located outside the drivers/mfd/ di=
rectory, which violates the MFD subsystem architectural layering guidelines.
--

--- Patch [3]: [PATCH v15 3/6] mfd: mc33978: Add NXP MC33978/MC34978 MSDI s=
upport ---
commit 09f08b1f8383cdd24c190a2b668c57a0b16e814d
Author: Oleksij Rempel <o.rempel@pengutronix.de>

mfd: mc33978: Add NXP MC33978/MC34978 MSDI support

This commit adds the Multi-Function Device (MFD) driver for the NXP MC33978
and MC34978 Multiple Switch Detection Interfaces (MSDI), setting up the SPI
device, regulators, and instantiating child devices.

> diff --git a/drivers/mfd/mc33978.c b/drivers/mfd/mc33978.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/mfd/mc33978.c
[ ... ]
> +static int mc33978_probe(struct spi_device *spi)
> +{
[ ... ]
> +	/*
> +	 * Core module creates regmap/IRQ domain/event handling. Separated
> +	 * because custom SPI protocol needs complex regmap_bus implementation.
> +	 *
> +	 * API contract: mc33978_core_init() initializes domain_out to NULL on
> +	 * entry. On success (return 0), domain_out is guaranteed to point to a
> +	 * valid IRQ domain. On error, domain_out remains NULL. This allows
> +	 * safe dereference of ddata->domain below without NULL check after
> +	 * verifying ret =3D=3D 0.
> +	 */
> +	ret =3D mc33978_core_init(dev, spi, &ddata->domain);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Does this violate the MFD subsystem architectural layering guidelines?

The MFD core driver logic, including regmap setup, IRQ domains, and event
harvesting, appears to be located outside the drivers/mfd/ directory in
mc33978_core_init().

As noted in the commit message, the core driver was placed in platform/misc.
Subsystem rules require core MFD drivers and logic to be located in
drivers/mfd/ to ensure the complex parts of the driver receive proper
maintainer review. Placing it outside bypasses this process.

Could this core logic be moved into drivers/mfd/ alongside the rest of the
MFD registration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710101358.2606=
941-1-o.rempel@pengutronix.de?part=3D3
