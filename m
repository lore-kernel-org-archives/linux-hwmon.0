Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8C737F32A
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 21:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788297785; cv=none; b=R7HGs3yLYtxQrjDcHOboZTOnJWOpyBZpDCjy3IO+HZ7UalO8uRyRLqlHo7sIyBaSrv2xOpdL+zaXfx1loyF/PxSmYPN+XykpU9kNIXyySidfFpgpZukTKiHclyhgfMLjLWu2NnUDNKsbgrYQh5Ar4z/2fEOQXVUzO2UTzk7IFr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788297785; c=relaxed/simple;
	bh=B9T9zIdxyM2TtRFrBBaiG7/BfnOeRmrlgluI5BAP1mY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fc+tSzr6/Js87fEXfDAxRaWeg/QpNuN5ihm5wPLPNhIeQ0OBcsQzehOYV6pnZ33gISmvVubhg9y6QTL3/VfBNDbjYdEXW/4ajv1odDWcWVAEr8HDnLdcjf8vnE1a9nghl99njkmRuZsqIOoLSgddBxV9/mlzLdkCZ1FuYFk+bek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URoawEii; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URoawEii"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF69B1F000E9;
	Tue,  1 Sep 2026 21:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788297783;
	bh=nz96KLKAaaII4p8C8sSFgXFe7A4cBVYLcVodnCKtXro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=URoawEii7x8/jabrsASiK8+Vr7STWSjMrX3Qy5Rig/dLiCtD6lRJ/MG9wFPIXqmtV
	 42d8AWvHNSjRGQwCyJG+aJ5qeAyXynFpkJNxxQM69yXJHft0yUhHCGD57pGR3xsdef
	 xeIuHGZSRLPdFGP7epfO1tIOr94McOI5RlZA4WxvIyMtrPuWkHbzazkIzDmMs+Em+F
	 xL/rsC8Qv2qMAiVRgmnIx8x3yMDyg5vVj9w/He3V5qOWaUtLj+0wBhVUktcmzCHGYa
	 AQCw6QvTSCHHJCF3Ksl2Yuk/t5ul5/SEcizIQOS7UnLRNorEoN3OBfwAsHqaH3dRln
	 MYz73LbYHG+wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 3/6] eth: fbnic: cache hwmon sensor readings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260831212234.1212971-4-limzhineng2@gmail.com>
References: <20260831212234.1212971-1-limzhineng2@gmail.com>
 <20260831212234.1212971-4-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 21:23:03 +0000
Message-Id: <20260901212303.BF69B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Using `time_is_after_eq_jiffies()` with a past timestamp causes =
up to 24.8 days of stale cache hits due to integer wrap-around.
--

commit 7ed3f7f9496f73d45331fe15e8dabb135858cab0
Author: Zinc Lim <limzhineng2@gmail.com>

eth: fbnic: cache hwmon sensor readings

This commit caches hwmon sensor readings for the remainder of the current
jiffy to avoid flooding the firmware mailbox with quick, successive IPC
messages when polling attributes at a high rate.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/=
ethernet/meta/fbnic/fbnic_hwmon.c
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
[ ... ]
>  static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *=
val)
>  {
[ ... ]
> +
> +	if (*cached !=3D FBNIC_SENSOR_NO_DATA &&
> +	    time_is_after_eq_jiffies(cache->last_read)) {
> +		*val =3D *cached;
> +		return 0;
>  	}

[Severity: Medium]
Does this cache validity check safely handle long periods of inactivity?

Using time_is_after_eq_jiffies() with a past timestamp can cause up to 24.8
days of stale cache hits due to integer wrap-around.

On 32-bit architectures, if the sensor is not read for more than 24.8 days
(assuming HZ=3D1000), the difference between the current jiffies and
cache->last_read wraps around the 32-bit signed boundary and becomes positi=
ve.

When this happens, the time_is_after_eq_jiffies() macro in
fbnic_hwmon_sensor_read() evaluates to true, causing the driver to serve
completely stale temperature and voltage data for the next 24.8 days instead
of properly refreshing the hardware state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831212234.1212=
971-1-limzhineng2@gmail.com?part=3D3
