Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9763847ECC8
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 21:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014818; cv=none; b=smletITOfhNQaP9OVd69mOgYUwLh0lQEcLQc+PA+TQ6XOZJY3tnX/jgHmyUnFiluRd7cydfeAoR9uLh0WP7rTxTVgOiUT1FxHuO6PpEdwelJ65Un7yNWzUlQkf+LtyZ8glol7+G5mnOuYnykco5YhzXhiA5I7AM4LJU1cJaZE/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014818; c=relaxed/simple;
	bh=ALXk3gzHSIwRk4gF/Am0OeandAtH8xDhGY9Kah2l8/s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=XdK4sKDNG4LQmhVWmPUY3MpMNlhJHmtrDthENIgiaWqCCOvjTAYB9qp+OcbyVpJavKMSeLuYPt0bNKt6LS1Sosy3A4rGaXnqDnkkUUGGwsz/e+73rrAkcjP+M2z5uyjZFYtPYdPxYRBomJANWUh+BRTUR7PYrcjJOSpzo+ehXBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAhjwA5K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAhjwA5K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDC71F000C4;
	Wed, 14 Oct 2026 21:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792014817;
	bh=KCxsgHPFWa9QejPBKBKeTZubvx7BIuXxhCGNLh87qCU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QAhjwA5KxWJKYzAGOp4acKarwrdOy9YkZnQFt/Fuis4b352LUb9bHvlT1DyqPi7OK
	 hEA3LaqMco4aF2WfiuCwztuGiUjQwIYBfSIfxTH7eY0onKOt10uFKYkxozaPvG8hCn
	 J87Nz3fUV0rQid8vF6OQOhJLs0dZKmADhFNGUlGHWTGvHo+1suphMgT8SsbGc/kKY0
	 RFSZO8+ADBF+SMHBf+jgR0/F2kEqGH1s1CceHo3NiMWfsq2BU8znQ/mqpTr9rWjR1l
	 r8XPbvsTTDHr9K6TxOQIfV4xpPiCU4PUxnLdAqmXHFiHMuixLgYWnGIHcE05OPkA+p
	 GH1T5LeL9mmxQ==
Message-ID: <sashiko-outbox-171941@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (minisforum-um780xtx) Fix clamp() build failure
 with GCC 11
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U2ViYXN0acOhbiBQZXlyb3R0?= <speyrott@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014214522.243253-1-speyrott@gmail.com>
References: <fda0e59f-20e1-4a94-a714-288940dcdd37@paulmck-laptop>
 <20261014214522.243253-1-speyrott@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 21:53:36 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] hwmon: minisforum-um780xtx: integer overflow in DIV_ROUND_CLOSEST
--

commit 37b4941cfec26b0afeccdcd44aef6f32fe1e9d55
Author: Sebasti=C3=A1n Peyrott <speyrott@gmail.com>

hwmon: (minisforum-um780xtx) Fix clamp() build failure with GCC 11

This patch fixes a GCC 11 build failure by selecting clamping limits early
and using a single clamp_val() execution. This prevents GCC jump threading
from duplicating the limit check and firing an unreachable compile-time
assertion.

Closes: https://lore.kernel.org/r/fda0e59f-20e1-4a94-a714-288940dcdd37@paul=
mck-laptop

> diff --git a/drivers/hwmon/minisforum-um780xtx.c b/drivers/hwmon/minisfor=
um-um780xtx.c
> index f5d6e18cb651f..962ebf41ffb7f 100644
> --- a/drivers/hwmon/minisforum-um780xtx.c
> +++ b/drivers/hwmon/minisforum-um780xtx.c

[ ... ]

> @@ -198,13 +198,15 @@ static ssize_t um780xtx_sys_point_temp_store(struct=
 device *dev,
>  	if (points[0] >=3D points[1] || points[1] >=3D data->sys_point3)
>  		return -EIO;
> =20
> +	if (!sattr->index) {
> +		lo =3D 0;
> +		hi =3D points[1] - 1;
> +	} else {
> +		lo =3D points[0] + 1;
> +		hi =3D data->sys_point3 - 1;
> +	}
>  	value =3D DIV_ROUND_CLOSEST(value, 1000);
> -	if (!sattr->index)
> -		value =3D clamp_val(value, 0, points[1] - 1);
> -	else
> -		value =3D clamp_val(value, points[0] + 1,
> -				  data->sys_point3 - 1);
> -	points[sattr->index] =3D value;
> +	points[sattr->index] =3D clamp_val(value, lo, hi);

[Severity: Low]
Can this arithmetic result in an integer overflow for extreme inputs?

When a user writes an extremely large value like LONG_MAX to the sysfs file
in um780xtx_sys_point_temp_store(), the unbounded value is passed directly
to DIV_ROUND_CLOSEST(value, 1000) before it is clamped.=20

Because DIV_ROUND_CLOSEST adds half the divisor before dividing, an extreme
positive input can overflow and wrap around to a negative number. This would
cause the value to incorrectly clamp to the minimum bound (lo) instead of
the maximum bound (hi). Conversely, an extreme negative input could underfl=
ow
and improperly clamp to hi.

Would it be safer to pre-clamp the value before calling DIV_ROUND_CLOSEST
to prevent this overflow? Many other hwmon drivers clamp the input bounds
first prior to performing the division to avoid this behavior.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014214522.2432=
53-1-speyrott@gmail.com?part=3D1
