Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696366;
	b=po99mxFG9YEav/f5ybrbd1z3Mxg4VgmBYJfzCvs0Lihoitno3VbkDly0nHoP/TPUDaVV
	 9/JLlzmOUvHj7tkDS9wcQyalx7DpX0CZ+4gx3XzGRzEiw0840sDMC7j8DrgVT4z8SKftA
	 RjHinaq9gnnNK+anhtROwBV5p4C3QUA+mJC0gVe55BYy21NWfz4w8fSfaxnlK2W2Knnnh
	 StoKk7w7rj/dGLsONu8eG818czbNJBLBS1AGG4YhUp4XJWwTo+9PlVLOXaTpQcpElcaIz
	 nRn01I7DWChT/1XBZpuGBwwAhFhL3dI4+wEXruL0lD1GpNtNsE09JJWvIP89S1aNTRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696366;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EDuH9Cj6iHQYdRvsNQHBOSRZ77zk+KQTpmXeNSrerjw=;
	b=Soa8Ubd+cl6DDK6Oj2HvdjEwqRuReoS0+j0fXfCxXf9Y6BbduTH4q68TmYXrLupOYxDN
	 rsW1AXFO+01WNlP9G8DVcSTVBoD9B4uZVFwNqtKuuTHpsiTUCwZvpAZAMg1pWuvzeCiQc
	 vnCmK2DVUVFGwLeU9nSDUmv+qfrYPSPlonHFG1m5nOigAsswaQZc82tTnd7HutlqQzjhM
	 gfz+9DWYDRCX96psA9j+2mrpVFRs5get56b+BecEp23Ea6RN329hsm1Rjg5c6A8HUUeFk
	 TWTsQvaDeW34wUtO40PmKPF9AWt8nu/K5B3HfE35MOgEEOXbI1gFjbvgVtNAm5wtTMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aaFRGRfR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597AE606A327;
	Tue,  3 Nov 2026 08:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aaFRGRfR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43B91F00919;
	Tue,  3 Nov 2026 08:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793696365;
	bh=EDuH9Cj6iHQYdRvsNQHBOSRZ77zk+KQTpmXeNSrerjw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aaFRGRfRClEyKtnvMiMmsW8lUCZeieNtsqVEnHibPwF3rUB7fPm6CmsAmj3lNvoD6
	 JI3p5TtAZTdJFhUwHsLivmwtV7xN3yfYl4FB52K4JnBCLGwyvpyR2cT/6ctiJGmNyA
	 W6YDO9GUXbSvMIpVJ7QEYSFyG7Q5+cFtF/bfqSACr/dcF7C8ncUXblQEMquAUq8qnT
	 F9EwKY8EfIQe2CPWQ9vpjFHIAqkBs9NeU4ZVtpWiVdRjzip8oQpwadiARec/qVjnWg
	 UpAEygrVQ9X5Su6QESn5O3WQHBPSdAJF0N0jJ5JzEZHrA5d3snTEzDgxnbCGfGdpbI
	 MYAO43FiCjAEQ==
Message-ID: <sashiko-outbox-194910@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/max20830) Add support for
 MAX20810, MAX20815, LTM4739, LTM4740
Reply-To: sashiko-reviews@lists.linux.dev
To: "Carlos Jones" <carlosjr.jones@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103084331.449-3-carlosjr.jones@analog.com>
References: <20261103084331.449-1-carlosjr.jones@analog.com>
 <20261103084331.449-3-carlosjr.jones@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 08:59:24 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] hwmon: (pmbus/max20830) Kconfig help text not updated for new chips
--

commit a48cd701bd54f337809702615b2dcd55ba0b47a3
Author: Carlos Jones Jr <carlosjr.jones@analog.com>

hwmon: (pmbus/max20830) Add support for MAX20810, MAX20815, LTM4739, LTM4740

This commit adds support for the MAX20810, MAX20815, LTM4739, and LTM4740
step-down switching regulators to the max20830 PMBus driver by matching
their IC_DEVICE_ID strings ("MAX20810B" and "MAX20815B") and updating
Documentation/hwmon/max20830.rst.

> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max2083=
0.c
> index 4d25a084af096..39cce250beca4 100644
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c
> @@ -20,7 +20,15 @@ struct max20830_data {
>  	u32 vout_rfb2;
>  };
> =20
> +/*
> + * IC_DEVICE_ID strings matched at probe. The LTM4739/LTM4740 uModules
> + * report their MAX die ID with a "B" suffix, not the "LTM47xx" names in
> + * their datasheets (being corrected); the plain datasheet IDs are not
> + * matched, as no such part has been observed.
> + */
>  static const char * const supported_chip_ids[] =3D {
> +	"MAX20810B",	/* LTM4739 */
> +	"MAX20815B",	/* LTM4740 */
>  	"MAX20830",
>  	"MAX20830C",
>  	"MAX20840C",

[Severity: Low]
This isn't a bug, but when adding support for MAX20810, MAX20815, LTM4739,
and LTM4740 in supported_chip_ids[] and Documentation/hwmon/max20830.rst,
should the SENSORS_MAX20830 entry in drivers/hwmon/pmbus/Kconfig also be
updated?

Currently drivers/hwmon/pmbus/Kconfig only lists the previously supported
models:

config SENSORS_MAX20830
	tristate "Analog Devices MAX20830 and compatibles"
	help
	  If you say yes here you get hardware monitoring support for Analog
	  Devices MAX20830, MAX20830C, and MAX20840C.

Documentation/hwmon/submitting-patches.rst asks that Kconfig information be
kept up to date when adding functionality to existing drivers, similar to
commit 4cdcd4789fb6 ("hwmon: (max20830) Add support for MAX20830C and
MAX20840C").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103084331.449-=
1-carlosjr.jones@analog.com?part=3D2
