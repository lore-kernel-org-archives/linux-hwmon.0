Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFD644C67F
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 13:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787232185; cv=none; b=VNCxSqsXw63q2ifz8pY3SI4FFzT+9z1jKcQBM6dC3eMr5NRHPPtoKbVGzXLiKMypkip5GYqSbrw3FUDNAiDQnmkgZVsyYrR7yjq/Igh41d0uUg7jYNCBD24MlZMT6nuBXWbuUtNhfds248Ch0U7JTPUwO/zy+ShKvH8TqJgdCYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787232185; c=relaxed/simple;
	bh=N5HUlRkSsK6LIiFLbrw1s5TIppOlbtyZqOaS+kCzyMs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rvmERUhTqK9D6hLQ8NTP2cPAZ1CBWb6rKvmuvso5XQ6LOCENZqntylWKy4iC1eSzixt5h2sPfA+oiuqQKEup6zZvV15bAFuQoubyPUh7ZV93GwAnF7lqV1AthHgi3e3aLjLNAorOPwJ7lr+rr425SHsaEqdu1ALnGU9d10j4CpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8UKitI2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8UKitI2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1BA1F00A3A;
	Thu, 20 Aug 2026 13:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787232184;
	bh=f22OoiNdbT8pk/zJOv1uCW4UcCLP60KRTGotcvg/DbM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g8UKitI2uxMrM1XphH8WDOcXiqiDJ33c8Xw2Qh6uEvXvIHBgLLJtfvrL122kZLcy9
	 n644AFJNxcu54bR0jm0009X/yULGTeTP3gu7AjEi9Be1sQKIPBIFLKSEqaP7FWt0bv
	 oDlm03lMZ9IFo2pgEGxzD2lbBEp4mEiDYF2oV/UUnHRoo+y5nA0aVvhu7AWCJe6ma0
	 0JVXSc3SXysRcjclcB1X2xOB7DzVUN1PCjPlRLRcHDOuVn8RnDpM0lxHH3TcWRP5LS
	 +t+1wWF9Gq2UtjKAiZ1/Pw7MAskUFTYqapJPQN7Qhimt62RZ17cGS+7o3iwpQ6jFsX
	 B7AlJsMn1indw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] hwmon: (ina2xx) Decouple in0 and curr1 alarms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jared Kangas" <jkangas@redhat.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-4-fdce35abc41e@redhat.com>
References: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
 <20260820-upstream-ina2xx-in0-curr1-alarms-v2-4-fdce35abc41e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 13:23:03 +0000
Message-Id: <20260820132304.2B1BA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Writing 0 to an inactive alert limit unintentionally clears the cu=
rrently active alert, breaking the newly introduced alarm decoupling.
--

--- Patch [4]: [PATCH v2 4/4] hwmon: (ina2xx) Decouple in0 and curr1 alarms=
 ---
commit 0eea1308d1961d2cb0471626855b002f45901d56
Author: Jared Kangas <jkangas@redhat.com>

hwmon: (ina2xx) Decouple in0 and curr1 alarms

This commit attempts to decouple shunt voltage and current limit alarms by
tracking the active alert type and returning zero during reads if the active
alarm is for a different type.

> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
[ ... ]
> @@ -484,6 +521,7 @@ static int ina226_alert_limit_write(struct ina2xx_dat=
a *data, enum ina2xx_alert_
>  				 INA226_ALERT_CONFIG_MASK, 0);
>  	if (ret < 0)
>  		return ret;
> +	data->active_alert =3D INA2XX_ALERT_NONE;
> =20
>  	ret =3D regmap_write(regmap, INA226_ALERT_LIMIT,
>  			   ina226_alert_to_reg(data, reg, val));
> @@ -492,9 +530,13 @@ static int ina226_alert_limit_write(struct ina2xx_da=
ta *data, enum ina2xx_alert_
> =20
>  	if (val) {
>  		mask =3D ina2xx_alert_type_to_mask(alert);
> -		return regmap_update_bits(regmap, INA226_MASK_ENABLE,
> -					  INA226_ALERT_CONFIG_MASK, mask);
> +		ret =3D regmap_update_bits(regmap, INA226_MASK_ENABLE,
> +					 INA226_ALERT_CONFIG_MASK, mask);
> +		if (ret < 0)
> +			return ret;
> +		data->active_alert =3D alert;
>  	}
> +
>  	return 0;
>  }

[Severity: High]
Will this unintentionally disable active alerts if a 0 is written to an
inactive alert?

Because the read side was updated in this patch to return 0 for inactive
alerts, state restoration tools might now read 0 for an inactive alert and
subsequently write 0 back to it during initialization.

When ina226_alert_limit_write() is called with val =3D=3D 0 for that inacti=
ve
alert, the code just before this hunk unconditionally clears the hardware
mask and the newly added line sets data->active_alert =3D INA2XX_ALERT_NONE.

Since val is 0, the if (val) block is bypassed, leaving all alerts
disabled. This seems to allow writes to an inactive alert to silently
disable the currently active alert.

Does this function need an early return or guard to ignore writes of 0
if the alert being written to is already inactive?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-upstream-i=
na2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com?part=3D4
