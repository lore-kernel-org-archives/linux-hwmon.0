Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A1342252C
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 11:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683435; cv=none; b=A9WpokFiTbQeaVLYdFWnh/8ETnqpsfKV3j7j2zqtYsdzxZiuaxL++D9bzznoSntIF8sX4wuy6ZHhCsq/Uro7OPX8cGe0+tl+g9V1fB0Zw1MhsUA9r0bgz3R90bKDaUjJ6tBedVKT9Dq3KQuUfpefCU4uNsYdeAC7J7BJHftOAj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683435; c=relaxed/simple;
	bh=p2z9x0Nf8CnbaNsuR2Z/rEUPnUD2PPhU9UZQzOHDCk8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gOPlWFdf0nFGy88sKkOHWzUnSr2F5BXuEO1rMsliVEgkCw5o9HeeBZ+tucuqj/mnPgKGChKSzWxfZ9zUjcXHTPMVZVkTJxvj5MinGU2KpfdD+C1BOnPoHTBaeeX0M8wvY0FAMxMLJ0fGFCQnU8T+a73yl32sKEE2qkGhUr6uXlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTuhguCr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTuhguCr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B131F000E9;
	Fri, 10 Jul 2026 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783683423;
	bh=kzZ8pLhyPcDyJILJWh4653cuyGgRpsbnfTUWIP0a3uc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TTuhguCrYxFWlUJCVIUc6Lnlo35NBawSKchRd2eco9J41apnyua1ls8ny6nrVcNmd
	 EcEIXFSxygEu9OdvSLLvTozB3AnVM3KWboJDod3HS2cUd5hgeL6vqnBBXKoIqXrrYY
	 acI85diFE8R/ctr0mJhBRGbRreeEZ72QG2RZuQCvn5dOy0/qXdQ759d7L/YJ+Q3hTw
	 gdMskembsEx2DfeV+K0YpODBHsRYDy+mkX6TwkSk0PKiuPAv6f9IZWemOp0g8DhEyC
	 l7yt/UUWTnY8NBUJ6pWunaYosO/zdcW7b+TbOR7+wmKf0qVbu3Xxh6i750X8Zu4wxD
	 5x91JZ5Xt0jMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/8] hwmon: Add mutex protecting for sbtsi read/write
 through hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260710111642.850022-8-Akshay.Gupta@amd.com>
References: <20260710111642.850022-1-Akshay.Gupta@amd.com>
 <20260710111642.850022-8-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 11:37:02 +0000
Message-Id: <20260710113703.61B131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Integer overflow in `sbtsi_write` when `ext_range_mode` is enabled=
, causing large inputs to be incorrectly clamped to minimum.
--

--- Patch [7]: [PATCH v4 7/8] hwmon: Add mutex protecting for sbtsi read/wr=
ite through hwmon ---
commit 8772051459eabab96983f02f6316165d79c69002
Author: Prathima <Prathima.Lk@amd.com>

hwmon: Add mutex protecting for sbtsi read/write through hwmon

This commit adds a mutex and takes it around SBTSI read/write paths so that
only one transaction runs at a time. The lock is held only for the duration=
=20
of the bus transfer and associated driver bookkeeping.

> diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
> index d7ae986d824c4..11c8108d69b2a 100644
> --- a/drivers/hwmon/sbtsi_temp.c
> +++ b/drivers/hwmon/sbtsi_temp.c
[ ... ]
> @@ -84,6 +85,7 @@ static int sbtsi_temp_write(struct sbtsi_data *data, u8=
 reg_int, u8 reg_dec,
>  {
>  	int ret;
> =20
> +	guard(sbtsi)(data);
>  	ret =3D sbtsi_xfer(data, reg_int, &val_int, false);
>  	if (!ret)
>  		ret =3D sbtsi_xfer(data, reg_dec, &val_dec, false);

[Severity: High]
This isn't a bug introduced by this patch, but does this code overflow val
in the caller sbtsi_write()?

If data->ext_range_mode is enabled, a large user input val is increased wit=
hout
a prior upper-bound check:

drivers/hwmon/sbtsi_temp.c:sbtsi_write() {
    ...
	if (data->ext_range_mode)
		val +=3D SBTSI_TEMP_EXT_RANGE_ADJ;
	val =3D clamp_val(val, SBTSI_TEMP_MIN, SBTSI_TEMP_MAX);
    ...
}

Writing a large maximum value to the hwmon sysfs limit causes a signed=20
integer overflow when adding the adjustment value.

The resulting negative number is passed to clamp_val, which incorrectly cla=
mps
it to zero.

This sets the hardware temperature limit to zero degrees Celsius, which can=
=20
instantly trigger thermal throttling or a hardware thermal shutdown.

A user or management script legitimately trying to disable or maximize the =
limit
by writing the maximum possible integer will unintentionally trigger a ther=
mal=20
alert instead.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710111642.8500=
22-1-Akshay.Gupta@amd.com?part=3D7
