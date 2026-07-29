Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA963B059F
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 15:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340375; cv=none; b=tLqEAV3PPgB8yNGnn3cHUy0/ImP3FMl9OljvdCt042x7Wg/I1AQdrWYSfyjANf9i/aAoIL6KHdk7jN8DBDpTW4AtUsaWn08OViVli0UELmn2KrmbSyB8YPNyhbdfU4rxH3TJF/nX4iQwNXcfNHAWSQcLIFGsQV1EZeO46l7yfwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340375; c=relaxed/simple;
	bh=1A7c1TyqaWi/8NNpsIwS3tiAWydDWmR4WkhrXAxTU6A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aPmBEjN8y1V+cfBHBFNe3bwNEIDPM0hv/tjHiSicj1gwr/ilGeKyTT5n1DdaYNae9tri9FM8o7FEa4QGVNRM6DotALBN5dn8w6LSqXR2c4O0ezddUvG0o+6rvFEJ5bk9SjUexk9nqtbPkJ+0MHC2YdMyyh7QHbbpAOl3sw9ydMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TEEOc4cL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEEOc4cL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9261F000E9;
	Wed, 29 Jul 2026 15:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785340374;
	bh=Ha1MdRwCG13Y1A8PbF/aGt8XbqalKFb8BiC2Ojs0pnk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TEEOc4cLVkhb+tt9AB/kSzr040Ltv+ZWPo6OZXyX54bFOIxy1TzaJfMmOVJ2xMD8O
	 lsKjwSJKz4Zh6oVnBCINC+nmhGW3vLQDgieAb1nFFSat5jVrbHIocBRGhvIe1M2inx
	 n02K1BQNXF8CwfgOA3Q2l3axY3uP8wtoetj7W+m/fSzRW5tRCHv75MqH9WCbOoUWtW
	 5BJ6e3i/lA5NZli6LFVBlm/5W1hmudT2Km88cLkV1DB/a8x64IN1AL0tfMVDEM8xTP
	 48rrUdPQjPyFBUYgnHkm6IzMAJoCsZllLuLgc9MDKfJRMw+po5/Wq2QaBPB0E7uI+D
	 w5gWnieunjM/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] hwmon: (ina2xx) Replace regmap in
 ina226_alert_read() with ina2xx_data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jared Kangas" <jkangas@redhat.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-1-349f7b2f1df8@redhat.com>
References: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
 <20260729-upstream-ina2xx-in0-curr1-alarms-v1-1-349f7b2f1df8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 15:52:53 +0000
Message-Id: <20260729155254.2C9261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Reading an inactive alarm attribute clears the hardware alert flag=
, causing the active alarm to falsely report as inactive (0).
--

--- Patch [1]: [PATCH 1/4] hwmon: (ina2xx) Replace regmap in ina226_alert_r=
ead() with ina2xx_data ---
commit 966375fc88632d14769d99061017ac107e2c8899
Author: Jared Kangas <jkangas@redhat.com>

hwmon: (ina2xx) Replace regmap in ina226_alert_read() with ina2xx_data

This commit updates ina226_alert_read() to accept a struct ina2xx_data
pointer instead of a struct regmap. This mirrors the signatures used by
the alert limit read and write functions.

> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -476,12 +476,12 @@ static int ina2xx_chip_read(struct device *dev, u32=
 attr, long *val)

[ ... ]

> -static int ina226_alert_read(struct regmap *regmap, u32 mask, long *val)
> +static int ina226_alert_read(struct ina2xx_data *data, u32 mask, long *v=
al)
>  {
>  	unsigned int regval;
>  	int ret;
> =20
> -	ret =3D regmap_read_bypassed(regmap, INA226_MASK_ENABLE, &regval);
> +	ret =3D regmap_read_bypassed(data->regmap, INA226_MASK_ENABLE, &regval);

[Severity: High]
This is a pre-existing issue, but I have a question about how the hardware
alert state is managed here in ina226_alert_read().

Since the INA226_MASK_ENABLE register clears the Alert Function Flag when
read, does this bypassed hardware read clear the alert flag unintentionally
if an inactive alarm attribute is polled?

For example, if userspace utilities sequentially read sysfs alarm attribute=
s,
could checking an inactive alarm trigger this clear-on-read behavior before
the actually active alarm is polled? It seems this sequence would cause the
active alarm to falsely report as inactive (0).

>  	if (ret)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-upstream-i=
na2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com?part=3D1
