Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA241A38F9;
	Fri, 26 Jun 2026 07:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459229; cv=none; b=l0uodbkP4sAvym64r+GMtDOhxJ2qVc19RLg71Ztc10ZRuJhF9oXebV4n3IU2uS+m6sET4410/PoNb3CkzMzQ3IJAkSTlu2rnMotynrCt1EMA47lf3eKDcH7owvijGEdtU5hDfTfwOUQ8xAu4WlGQ7dXQ9YZgmVr37Ptq7yUSJoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459229; c=relaxed/simple;
	bh=lW+p2Cal7Xhq+sstMYvwv6chLXX13iYKFCmZvZLERRk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JeCP3mYDcnIEkkbTf5Op7SmPwdGYfC8IZIRyxtpXk27JsDvBl9r7BC1sFqk3DjmuuoNZlW6ToxhJtCNN/w5ODgYTt+uvZ9wXBu3yeQDuQV40wJ54Bqq2n/PvJiaIgyiII2y3DWOpHLVeS1uMFlH6AAHaYM9mauprys7jX5vsQrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCdtfPLM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCdtfPLM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06981F000E9;
	Fri, 26 Jun 2026 07:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782459228;
	bh=QuZMAPYC0lgspTtATGsB7X2yRAXLMjuKJuMfZ8w4xbM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XCdtfPLM4BRuMkhyGTURTXQeL9X6wtCFPbIFJH1lER6I342SOVxwukgfyOGWtKvpX
	 aW4qvLW2w9VRMkk62jtGDxtYGHfg5vR6KE+/EnfcG2wf2msfWzMGQDTANG+fwuFtex
	 Oeg2kARBwFJCKOC9U9qYa0nDkBEpVUjFLbNMxTZDKQ+0B04u4iOiEf02S6OVgWS4qL
	 X8AjktY2OSusmhdhUSJ6z/Lynw0bjiSkfATTGYtMxJm/AcP1/SRo+O44cI2+ONBS8H
	 3sIgbeOJU4jg2zPVJmSe5FctFozKk6OuALtkGS57AlqOnHR1H/4arlOM05G5SliOfO
	 082NpQXDrp1Bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 9/9] hwmon: adm1275: Support ROHM BD12790
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <b209c1b47712b69f17b52cfd7a7a38ed76024ca7.1782458224.git.mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <b209c1b47712b69f17b52cfd7a7a38ed76024ca7.1782458224.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 07:33:47 +0000
Message-Id: <20260626073347.A06981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The mathematical formula documented in the comment for computing th=
e power coefficient contradicts the actual mathematically correct implement=
ation in the code.
--

commit 7dff114234776369f1046124af65696c292fcd41
Author: Matti Vaittinen <mazziesaccount@gmail.com>

hwmon: adm1275: Support ROHM BD12790

This commit adds support for the ROHM BD12790 hot-swap controller to the
adm1275 driver. It introduces a dedicated coefficient table for the new
device based on its voltage and current-sense ranges.

> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index 81c50fab7687b..406b448523769 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c

[ ... ]

> @@ -136,6 +136,30 @@ static const struct coefficients adm1272_coefficient=
s[] =3D {
> =20
>  };
> =20
> +/*
> + * BD12790 coefficients derived from preliminary datasheet, Table 1 (p.1=
8)
> + * and the PMBus direct-format relationship X =3D (Y * 10^(-R) - b) / m.
> + *
> + * Voltage: V[V] =3D 14.77e-3 * code (60V) / 24.62e-3 * code (100V)
> + *   -> m =3D 6770, R=3D-2 / m =3D 4062, R=3D-2
> + * Current: code =3D I[A] * RS * 132802.1 + 2048 (15mV) / * 66401.06 + 2=
048 (30mV)
> + *   -> m =3D 1328, b =3D 2048 * 10^(-R) =3D 20480, R=3D-1 / m =3D 664, =
same b and R
> + * Power: code =3D k * RS * PIN, k =3D 35119.94 / 17559.97 / 21071.44 / =
10535.72
> + *   -> m =3D round(k / 10^(-3-R)), R=3D-2 for 60V/15mV, R=3D-3 for the =
other three

[Severity: Low]
This isn't a bug, but does the formula in this comment correctly document
how the power coefficients are calculated?

If we evaluate m =3D round(k / 10^(-3-R)) for a value of R=3D-2 and k=3D351=
19.94,
it yields 351199.4. However, the actual code below correctly implements the
value as 3512, which implies the formula should use multiplication rather
than division.

> + * Temperature: code =3D 4.2 * T + 3188 -> m =3D 42, b =3D 3188 * 10 =3D=
 31880, R=3D-1
> + */
> +static const struct coefficients bd12790_coefficients[] =3D {
> +	[0] =3D { 6770, 0, -2 },		/* voltage, vrange 60V */
> +	[1] =3D { 4062, 0, -2 },		/* voltage, vrange 100V */
> +	[2] =3D { 1328, 20480, -1 },	/* current, vsense range 15mV */
> +	[3] =3D { 664, 20480, -1 },	/* current, vsense range 30mV */
> +	[4] =3D { 3512, 0, -2 },		/* power, vrange 60V, irange 15mV */
> +	[5] =3D { 21071, 0, -3 },		/* power, vrange 100V, irange 15mV */
> +	[6] =3D { 17560, 0, -3 },		/* power, vrange 60V, irange 30mV */
> +	[7] =3D { 10536, 0, -3 },		/* power, vrange 100V, irange 30mV */
> +	[8] =3D { 42, 31880, -1 },	/* temperature */
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782458224.gi=
t.mazziesaccount@gmail.com?part=3D9
