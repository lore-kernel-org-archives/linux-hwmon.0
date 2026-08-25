Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3058442B0B
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 17:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787680288; cv=none; b=khyGG3NXfVo19repICbUhM8aWmaeVA2d3Mgi63MM8hPqVaeMsNt4Bv7fHa+Amd5tDdOITmT97m5+BHuRA5d3DEPRTGmdZaTbYNHQQmCZwwtcMAITWUbaXHF1ODP0h2VVg3kxyhVJMOd1kstfVEZPIvDLADSVGeHUfAah5zqLdvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787680288; c=relaxed/simple;
	bh=XRsXR/W+oXnkgvhb3Pq2abEJoYWMZ3WJ6spJ8yf7BD0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BpgPBq3xVF2N03pRKd6jUUcK288rInaZDlyAyj+QNAGyMUs0sfkvkCAdOEkT47ZQyhinUZR2BoN389xaAtnn3OMcZ/yl2USie2YWMubepDVolZsenWkxOaoRonVezC9gL6J5Bp2EdKkA6dAYvFqD3nkmXMKWEq3vH4RKZTR03oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1M+xtea; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1M+xtea"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0591F00A3D;
	Tue, 25 Aug 2026 17:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787680286;
	bh=9jsCzFERuy0giXvP7rCKzEfCHVWJoO1K4zrEvM8gPPQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N1M+xteawQPuWroElHvgX5MrDsViLHeziDcb/izVBAktHNkQQ0Ifo8bGXl6agrYnb
	 S3zzGJmhYIpWPxASCakqCGDxNOt1tN2fpHdsqzfTFJYNg7OPAuOrZM1E6zwUDd+ktB
	 wMI+TeiQ+5DQ9TdVHt8bmQlGTaTIZDSh1wxiL6QAbXG3jNfVa2DWYC+0scwTuAccxV
	 CJ3mTbi+pilKhVhDBHkKGgDGTcqK6zE1dvf4kxd6lwl7v5+x/UbGpmDgrcA63UvdTs
	 3gvG4s0yT8VToKf7Tnf1Y3kFBN8B4usXnSS5MRPMpl4Bf7X228vL/Pj6lksTxjXxvi
	 YebjvI6nCcJow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 3/6] eth: fbnic: cache hwmon sensor readings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260824175059.2485048-4-limzhineng2@gmail.com>
References: <20260824175059.2485048-1-limzhineng2@gmail.com>
 <20260824175059.2485048-4-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:51:26 +0000
Message-Id: <20260825175126.9B0591F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Signed subtraction wrap-around in `time_is_after_eq_jiffies()` cau=
ses hwmon sensor readings to freeze for 24.8 days on 32-bit architectures.
--

--- Patch [3]: [PATCH net-next v2 3/6] eth: fbnic: cache hwmon sensor readi=
ngs ---
commit 976f9fc351b80235f704002eae4e7012534c286d
Author: Zinc Lim <limzhineng2@gmail.com>

eth: fbnic: cache hwmon sensor readings

This commit introduces caching for hardware monitoring sensor readings in t=
he
fbnic driver. It caches the temperature and voltage for the remainder of the
current jiffy to prevent flooding the firmware mailbox during rapid polling.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/=
ethernet/meta/fbnic/fbnic_hwmon.c
> index 38bb26cb8e6cb..f35cb00650937 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
[ ... ]
> @@ -25,26 +26,32 @@ static umode_t fbnic_hwmon_is_visible(const void *drv=
data,
> =20
>  static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *=
val)
>  {
> +	struct fbnic_hwmon_cache *cache =3D &fbd->hwmon_cache;
>  	struct fbnic_fw_completion *fw_cmpl;
>  	int err =3D 0;
> -	s32 *sensor;
> -
> -	fw_cmpl =3D fbnic_fw_alloc_cmpl(FBNIC_TLV_MSG_ID_TSENE_READ_RESP);
> -	if (!fw_cmpl)
> -		return -ENOMEM;
> +	s32 *cached;
> =20
>  	switch (id) {
>  	case FBNIC_SENSOR_TEMP:
> -		sensor =3D &fw_cmpl->u.tsene.millidegrees;
> +		cached =3D &cache->temp_mdeg;
>  		break;
>  	case FBNIC_SENSOR_VOLTAGE:
> -		sensor =3D &fw_cmpl->u.tsene.millivolts;
> +		cached =3D &cache->volt_mv;
>  		break;
>  	default:
> -		err =3D -EINVAL;
> -		goto exit_free;
> +		return -EINVAL;
> +	}
> +
> +	if (*cached !=3D FBNIC_SENSOR_NO_DATA &&
> +	    time_is_after_eq_jiffies(cache->last_read)) {

[Severity: High]
On 32-bit architectures, if the sensor isn't read for over 24.8 days, will
time_is_after_eq_jiffies() evaluate the wrapped signed subtraction as a
false cache hit?

If this condition evaluates to true under those circumstances, the function
returns early without updating cache->last_read. Does this mean the sensor
readings will continue to falsely hit the cache, causing the temperature
and voltage values to remain frozen for the next 24.8 days?

> +		*val =3D *cached;
> +		return 0;
>  	}
> =20
> +	fw_cmpl =3D fbnic_fw_alloc_cmpl(FBNIC_TLV_MSG_ID_TSENE_READ_RESP);
> +	if (!fw_cmpl)
> +		return -ENOMEM;
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824175059.2485=
048-1-limzhineng2@gmail.com?part=3D3
