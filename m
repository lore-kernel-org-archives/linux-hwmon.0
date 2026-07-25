Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5654C37B010
	for <linux-hwmon@vger.kernel.org>; Sat, 25 Jul 2026 22:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785017145; cv=none; b=g0G8MNRaMD9th5Ocr1qwfn84MVqJOSjNIJyjzyRNjTqv9bql8g7MG4W/vwQj35Bqq8K5ftGUnnThwS0tHei7RBPnzrHCoKab23yxkgx2jWfYLXkQalScNtadFzOrfW+9JQpdzj5y2FF4WsbLweL70lGAS45kM2OCq9MWTNXKNKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785017145; c=relaxed/simple;
	bh=nSAEN1h/E6ABqupW+ja/sqEqGj7XQn6XtCE6+tolnt4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ooYDP9/lwKRWQCz/m3xyEqdHJp1un7MyKQwmZnLBn1zeA19+jjj0FYL4qqWc3P1ISvKKpYti4dA3Zi0MpzLmZIiFE56ANRNLQSxB763xo8DFYbo1oBNprV9MPdYOJLHG5eo8fvmboCf+VmHBBiiAKyLIy/k3O1ytEFX6t6Osg28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6vEhQ6i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6vEhQ6i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856D01F000E9;
	Sat, 25 Jul 2026 22:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785017142;
	bh=GtsCOknVg7vn9iB+b4iHt+xVwx2XEraajU36WqEXjsc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C6vEhQ6iqOktkYcpn6NtU+BRmddQ82AaNIA5JmMv/mNS8dW6E0Md8t2gqxXK1O9vp
	 sgk01XyZ6v1dk3C37CbhD7P/divpa03wQIbM7UDY8Y/eCASySfIqy1TJhyPpv3qx5z
	 yFTeuCv69r80Y9JeuYUEh5h4q+j78sHpazvqfYxi6ZMD9nZpx+EYuNSwrElwVf516d
	 fFgRgs38lbbXXkJ5aLKoSgjeHJawqCCo0ZY7yBBx/QITbQGzVGBs6ergVq8MQNmB5m
	 aHld82f4QiV4ZTpgH6OvT8LEbm2RAA0xzyyAbetM0Uv2HYeG1SmDFqMU2fsTKh35XZ
	 H4GRJUsLWgJbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (ltc4282) Fix reading the minimum alarm voltage
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260725215755.1926830-1-linux@roeck-us.net>
References: <20260725215755.1926830-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 22:05:42 +0000
Message-Id: <20260725220542.856D01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calculation of `st->power_max` causes a 32-bit integer overflow, r=
esulting in a severely truncated max power limit being written to the devic=
e.
--

--- Patch [1]: [PATCH] hwmon: (ltc4282) Fix reading the minimum alarm volta=
ge ---
commit 42cce0899ae28102bd89120aefb684af52579bfe
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (ltc4282) Fix reading the minimum alarm voltage

Coverity reports an out-of-bounds access when reading the minimum alarm
voltage for the VGPIO channel. Add the missing return statement to fix
the problem.

Fixes: cbc29538dbf7 ("hwmon: Add driver for LTC4282")
Cc: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>

> diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
> index 39b9d3abca990..cc698803f8bf8 100644
> --- a/drivers/hwmon/ltc4282.c
> +++ b/drivers/hwmon/ltc4282.c
[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential 32-bit
integer overflow in ltc4282_set_max_limits() during device probe:

drivers/hwmon/ltc4282.c:ltc4282_set_max_limits() {
    ...
	/* Power is given by ISENSE * Vout. */
	st->power_max =3D DIV_ROUND_CLOSEST(st->vsense_max * DECA * MILLI, st->rse=
nse) * st->vfs_out;
	ret =3D ltc4282_write_power_byte(st, LTC4282_POWER_MAX, st->power_max);
    ...
}

Because the result of DIV_ROUND_CLOSEST() and st->vfs_out are both 32-bit
or smaller types, does this multiplication overflow 32-bit precision before
being assigned to st->power_max?=20

If the device tree configures a small sense resistor (e.g., 100 nOhm,
making st->rsense =3D 1) and the voltage is high, the division result can be
around 343,750,000 and st->vfs_out can be 33,280. The resulting product is
over 11.44 trillion, which would overflow a 32-bit integer.=20

Could this cause a severely truncated max power limit to be written to the
hardware, potentially triggering spurious power-bad faults or shutting down
the monitored power rail?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725215755.1926=
830-1-linux@roeck-us.net?part=3D1
