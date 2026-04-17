Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9C63264D0
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2026 15:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776438431; cv=none; b=iCI0+0d0snM/OEbZS11kNy6NnpvSP+nj3uG0Qk8hzBUEnFEuy/IWCqwuztFOQ2HLkPwvbe1t+zOGajSw5p6vs8965FinHEcfR9aDckGiBfVo5tgPF0Y54H90nwuBZSUpc36f5Q3Swgq97F0Ly7Z5cnv4pDejzGmoFzSpu7IOOyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776438431; c=relaxed/simple;
	bh=kzqd8+19sPpm3NUmtLaxvrJBy24G7Fm3N5Uym0jdus0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mdU922ukmexmkGeYbUsCH4tW0vQtUFH5a7UvaVjNXo/ls7ExeCIYmsYdPjx92c0iX6SXW986tLskSeWJdg7aaXBy+X7yccusqTGqrjD51PGYhsn6w2aXy90X3O870QSIpOI5fRl6BhkInpal6LP4qUf+zNyYkzmq2vSrwtsnrl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbVUEwnn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbVUEwnn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCE2C19425;
	Fri, 17 Apr 2026 15:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776438431;
	bh=kzqd8+19sPpm3NUmtLaxvrJBy24G7Fm3N5Uym0jdus0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=WbVUEwnn+79YnaefjaPMhSvMpb7GXZAXqNeJ3T38Wzmm1n+hZW7144+xWVQ40ZRsS
	 aW89O+hnp3iA6/ue549kz/DvL2MBWOsdV8Zx7ckU9WD0N81HcFCCXV73bEmXA6+i7U
	 O1iOJ3efkY2bjVMjIqGTwdnThbrDtLhqVAgPWopSnTQRu6/H3xjs1zfTCV3rQSPdJV
	 284SWZTH1LKjX9J4z0chpHkA0sDR/O4nslPU3g3Wbk9vj0Pv5RZioxwIXJ4hnN4hmD
	 w8Kq+XI5374/r7sRMwvMyRAHrkSYGuguk0+NwhFEs+UL5vCVWdJqFTsTMWXz+EB/qy
	 zLgdScg+5JO+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (yogafan) Use u32 types and improve RLLag
 filter
Reply-To: sashiko@lists.linux.dev
To: "Sergio Melas" <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260417142455.18806-1-sergiomelas@gmail.com>
References: <20260417142455.18806-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Apr 2026 15:07:10 +0000
Message-Id: <20260417150711.0CCE2C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [High] Flawed ACPI fallback logic in `yoga_fan_read` causes cross-channel=
 telemetry corruption and invalid handle evaluations.
--

commit d83c5a919208687dd832e2bb2139addf047ec4f5
Author: Sergio Melas <sergiomelas@gmail.com>

hwmon: (yogafan) Use u32 types and improve RLLag filter

This update transitions the driver to a Hardware Abstraction Layer (HAL)
to manage diverse EC behaviors across different hardware generations and
adds explicit WMI GUID detection.

> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c

[ ... ]

> @@ -123,19 +187,58 @@ static int yoga_fan_read(struct device *dev, enum h=
wmon_sensor_types type,
>  			 u32 attr, int channel, long *val)
>  {
>  	struct yoga_fan_data *data =3D dev_get_drvdata(dev);

[ ... ]

> +	/* 3. Hardware Reading with AND fallback logic */
>  	status =3D acpi_evaluate_integer(data->active_handles[channel], NULL, N=
ULL, &raw_acpi);
> +
> +	/* If the first attempt fails AND there is a second handle for that cha=
nnel, */
> +	/* try the second one */
> +	if (ACPI_FAILURE(status) && cfg->paths[channel + 1])
> +		status =3D acpi_evaluate_integer(data->active_handles[channel + 1],
> +					       NULL, NULL, &raw_acpi);

Does this fallback logic inadvertently access the wrong fan channel or
out-of-bounds memory?

During probe, active_handles is populated densely with successful ACPI
handles for each fan. For multi-fan setups, active_handles[1] corresponds
to the second fan. If reading the first fan (channel 0) fails, this fallback
will read active_handles[1]. Could this result in reporting Fan 2's speed
as Fan 1's speed?

Additionally, in single-fan setups where probe stops after finding one fan,
active_handles[1] remains uninitialized (NULL). If the read for channel 0
fails, and cfg->paths[1] is populated, this will pass NULL to
acpi_evaluate_integer(). Could this trigger an invalid evaluation of the
ACPI root namespace?

Finally, since MAX_FANS is 3, if this function is called for channel 2,
could checking cfg->paths[channel + 1] and data->active_handles[channel + 1]
read index 3, resulting in an out-of-bounds array access?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260417142455.1880=
6-1-sergiomelas@gmail.com?part=3D1
