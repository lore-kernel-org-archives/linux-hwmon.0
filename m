Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752FB3BADB2
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 22:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784758680; cv=none; b=J6ZqbvN6oa0fpF6wKAw2kZOw9y1WqfssLGO4iPHWX/EucnF4n95YNaFVYJR6Wb3DTBXFAVrPxxnFShC/Yh3TrMgawOYm+DgG2DANrjVW8mLNXoA0FgoGacQUFFW2E7on+e09avmTUBqny6si73GedjCh5x88MKYy72QsYzvv2rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784758680; c=relaxed/simple;
	bh=rJeKsUQY+boFezBYJA/U6Gqcdv5PEzg+2ODkEOiu7y0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XkAbXfRVUcxssa+b5qOReD29BLFg4hTDC4bBThue0bxWtaLjO9Gv+apGBKfHWUVuEcEN15nvsuEXN6kxIwCpu9KI016eptkZU1jU0K62wu5oC1XtGtL5vd08yL0vWFcbkUSjTPcpGRZ5xK2CMYYlalrAooaab4Pg1Ekpzt5xpXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLXXUHRj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLXXUHRj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76421F000E9;
	Wed, 22 Jul 2026 22:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784758679;
	bh=kGB8syCmw3LIpsV7eA38OPuChf2u2JqHWIyDY3F4UjY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dLXXUHRjBmOAXX1ng220UC9HBzPIoMuCIiK+x3fKaZ8uqPU34+I64rjQzO+/0YTXa
	 sRX4mqexCNLaznJXNFlsgVU/HcCgeZ+aMtVp/8rtHB94QAZr4PwiBrZaZ/7YGLc1fC
	 6P1YvuCxnhFrAAp8M78gUhAeUGqNCuhEzhmCY1G6geIwXt9hwYZOygkdpavZAM0B39
	 skoVJ2CuxwCmkqa5ft27Uod9hUvQ2ExUtIys8fQD+Uvdypyhk9g/7m5XYAAT4GbWWE
	 U5yYeN+Am1LIBNO9Odlsltqav9aOs+yG2lQWg3DlFQjMziDuej1vgflTGxKM9dfxwU
	 cNF+LUR5P3CdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 3/6] eth: fbnic: cache hwmon sensor readings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260721221540.648272-4-limzhineng2@gmail.com>
References: <20260721221540.648272-1-limzhineng2@gmail.com>
 <20260721221540.648272-4-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 22:17:58 +0000
Message-Id: <20260722221758.D76421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The hardware monitoring cache expiration check is vulnerable to =
a 24-day jiffies wraparound bug on 32-bit systems, which can cause the driv=
er to indefinitely serve stale sensor readings.
--

--- Patch [3]: [PATCH net-next 3/6] eth: fbnic: cache hwmon sensor readings=
 ---
commit 4d77f6b947d1d111d9ffbbeb2ef3742b0f54686f
Author: Zinc Lim <limzhineng2@gmail.com>
Subject: eth: fbnic: cache hwmon sensor readings

This commit introduces caching for hardware monitoring sensor readings to
reduce firmware mailbox IPC traffic. It caches the temperature and voltage
values and serves them for the remainder of the current jiffy, using a
sentinel value to ensure the first read always triggers a refresh.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/=
ethernet/meta/fbnic/fbnic_hwmon.c
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
[ ... ]
> @@ -25,26 +26,32 @@ static int fbnic_hwmon_sensor_read(struct fbnic_dev *=
fbd, int id, long *val)
>  {
> +	struct fbnic_hwmon_cache *cache =3D &fbd->hwmon_cache;
>  	struct fbnic_fw_completion *fw_cmpl;
>  	int err =3D 0;
> +	s32 *cached;
> =20
>  	switch (id) {
>  	case FBNIC_SENSOR_TEMP:
> +		cached =3D &cache->temp_mdeg;
>  		break;
>  	case FBNIC_SENSOR_VOLTAGE:
> +		cached =3D &cache->volt_mv;
>  		break;
>  	default:
> +		return -EINVAL;
> +	}
> +
> +	if (*cached !=3D FBNIC_SENSOR_NO_DATA &&
> +	    time_is_after_eq_jiffies(cache->last_read)) {

[Severity: Medium]
Can this cache expiration check cause stale readings on 32-bit systems due =
to
jiffies wraparound?

If the hwmon sysfs files are not read for ~24.8 days, the jiffies counter w=
ill
advance such that the signed subtraction in time_is_after_eq_jiffies()
underflows. This would cause the macro to evaluate to true, resulting in a
cache hit.

Since a cache hit bypasses the firmware read and does not update last_read,
would the driver continually return the same stale cached value for the next
24.8 days until the difference wraps back to negative?

Given the commit message mentions serving reads "for the remainder of the
current jiffy", should this explicitly check for jiffies =3D=3D cache->last=
_read
instead?

> +		*val =3D *cached;
> +		return 0;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721221540.6482=
72-1-limzhineng2@gmail.com?part=3D3
