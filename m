Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF6237B00E
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 05:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787289525; cv=none; b=khGbjVO+92lxb/cMZP7vkXcWRQ/56hbrcM5oR/iSHTUDZ8szVvlWibRqi+cs3ecSd/M5uq7bNNCmNZOjC1aicxQLmAlaEj0LfTG6WsgWygKMpi9ZEAcEDdL2uFq1V0L927jYsnQvundGm1IFCe4edL9u/ZatrjY9UOtdZVpqOLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787289525; c=relaxed/simple;
	bh=mguydW1EoucwZLQf5sz/R8+rDgh7fch+XbDfMv/QG9Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W3X4juhIF40VrYtPwv57pW+GoYYltG2M2fpAHJPVV/1VHPTJqXuuharOK7SzVQFKJcZ+6/QwDthVZjAN71a17ks3R89wduLSAVFFf1gMAAgnBmT5gl94qgFDbEIu6TIbSTcpnZDoYYWmR0Lb5nudWZRw2beKmA9ueaRq5uQ7Gbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cH7/0djd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cH7/0djd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD1D1F000E9;
	Fri, 21 Aug 2026 05:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787289523;
	bh=mIhoOr8/aKYaOOo+KaM8UxYFaS4Cv8veWF+8PFaY5Tc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cH7/0djd5aUb4+LobdkdHKld2tW9K7PG0hKCnWk9cms0t2BqaTr/SWFFn4OHtidig
	 3B9tENcpFTVp0fOBlaF7tlMX+bVU+lbmSo7lZqwBvkxRrmmZByGQ//Ep4a8Zpb25fv
	 3BizEpE4AfK0h3Dxjo4wUs+ejMbd+q1TpA7xPE2FIfwHMxMPS/DNHpPdF0BTX1F4Ic
	 zAV6KuStY8i/eaBNjyStq4UBR2JaxD2F55c3bPGJ3GEp8djQyTmDYCdDv9834PoPcS
	 znMEXZz6bxl0xsCcd4gjp93xTRFHnoGTv+fu0Yi/WUS9v0xKhsTRurnYr8kW4rNZL1
	 mExXXBd0+mQhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: Fix potential UAF in pec_store
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260821050808.667204-1-linux@roeck-us.net>
References: <20260821050808.667204-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 05:18:43 +0000
Message-Id: <20260821051843.8CD1D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] The function `pec_store()` mixes `goto`-based error handling (`g=
oto put;`) with scope-based cleanup (`scoped_guard`), which violates subsys=
tem guidelines.
--

--- Patch [1]: [PATCH] hwmon: Fix potential UAF in pec_store ---
commit faaeb6b5ca43335968fb5512ec894ab84e5edc9c
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: Fix potential UAF in pec_store

This patch fixes a potential use-after-free in pec_store() by replacing
guard() with scoped_guard(). The previous guard() usage attempted to unlock
the mutex after dropping the final device reference when jumping to the 'pu=
t'
label.

> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 29dc90a2c3fe7..8cf717ae8b1dd 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -371,18 +371,17 @@ static ssize_t pec_store(struct device *dev, struct=
 device_attribute *devattr,
>  	 * handling is not required.
>  	 */
>  	hwdev =3D to_hwmon_device(hdev);
> -	guard(mutex)(&hwdev->lock);
> -	if (hwdev->chip->ops->write) {
> -		err =3D hwdev->chip->ops->write(hdev, hwmon_chip, hwmon_chip_pec, 0, v=
al);
> -		if (err && err !=3D -EOPNOTSUPP)
> -			goto put;
> +	scoped_guard(mutex, &hwdev->lock) {
> +		if (hwdev->chip->ops->write) {
> +			err =3D hwdev->chip->ops->write(hdev, hwmon_chip, hwmon_chip_pec, 0, =
val);
> +			if (err && err !=3D -EOPNOTSUPP)
> +				goto put;

[Severity: Medium]
This is a pre-existing issue, but does this code mix goto-based error
handling with scope-based cleanup helpers?

According to the subsystem guidelines in include/linux/cleanup.h, mixing go=
to
and cleanup helpers in the same function creates confusing ownership semant=
ics
and should be avoided. Would it be better to also convert the 'hdev' refere=
nce
management to use __free(put_device) to fully eliminate the goto pattern?

> +		}
> +		if (!val)
> +			client->flags &=3D ~I2C_CLIENT_PEC;
> +		else
> +			client->flags |=3D I2C_CLIENT_PEC;
>  	}
> -
> -	if (!val)
> -		client->flags &=3D ~I2C_CLIENT_PEC;
> -	else
> -		client->flags |=3D I2C_CLIENT_PEC;
> -
>  	err =3D count;
>  put:
>  	put_device(hdev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821050808.6672=
04-1-linux@roeck-us.net?part=3D1
