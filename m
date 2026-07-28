Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A02192F9
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785199216; cv=none; b=Snk6ilGgNkdZPGu2GREOaQ+isLr1sKPxohk7Qzw897+etr0gpr0/O0MVTV0H6ZHLH0MOZzVf/V20N7ObI12yA3vm+f4YiMg03ugxLXb+E7jf8jNBAOkup5EV/MHQFkudvvazxwUz3UwnNLjSoptnr1me9IjeKXLK6+GmENVFgQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785199216; c=relaxed/simple;
	bh=cHTZGKr8eOrMQZKuZ3XYj+ivstDvLjXVVN67HiT8yxc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AzZ7kSX6yl7mz6Vy+pH2L1RguIkWMV/IBfaPPFY42GqsAwL9bPdpRyUc9O3zLJnHDEcqOfClpq6ih53L/V2DhOfKJ0UJbXDsyBuRozOUiFHMdc0pxvJNg4SM6g3jCkaa1Y1ue4X4danYZZAuJsCtMN2KKPMdIBax4h2vaLsM5AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyJ7Tr3a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyJ7Tr3a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94FCC1F000E9;
	Tue, 28 Jul 2026 00:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785199214;
	bh=BPFU+sLTv6pS6yYexP/fJDu3QFrMuLMukDAdv/VbOcM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IyJ7Tr3ayD5byX7WHJP+joJu7QGPiCRbwEtrqdhaQJ1K14P512hi0MrTSINoBB0Uq
	 qiSqduum5coH9qoHu8J8OAXVjU8t5hmfyIugWV5W4LGLdZ9Bvr5t70dXtI5wRag5aj
	 lhK8NLkQgKrSR/Y/QdTPd8YZK+g8gWrKCb1KCckod5YoFw9QCHOb1Sot7IIPcg/hKt
	 3X5yQBreEeRdzLrmIesNbGHKzr3NXwUMGcHhoTuNUTmpiAJAp4vtEflJin/6Hfc0s/
	 fccqg1/3N9vuUfghB/CquMvZrjSx/4tMrpXniLpmV4PDO+HVBbnKlGp/BKbnwPwTfY
	 60f47osUJ/F/A==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v2 8/8] hwmon: (adt7470) Fix PWM auto temp state
 array and bounds check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260727-adt7470_fixes-v2-8-598e38a46ba6@gmail.com>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
 <20260727-adt7470_fixes-v2-8-598e38a46ba6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 00:40:14 +0000
Message-Id: <20260728004014.94FCC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver violates HWMON subsystem guidelines by using a private =
mutex (`data->lock`) instead of the required `hwmon_lock()` API to serializ=
e sysfs attributes registered outside the `info` structure.
--

--- Patch [8]: [hwmon PATCH v2 8/8] hwmon: (adt7470) Fix PWM auto temp stat=
e array and bounds check ---
commit 3702a967e9e4da59d546cf6a3b0fc208ec5ff2bf
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Fix PWM auto temp state array and bounds check

This commit fixes a bounds checking issue in pwm_auto_temp_store() where
values > 0xF could overflow into adjacent channel bits. It also corrects
the array assignment so values are written to pwm_auto_temp instead of
pwm_automatic after a successful I2C write.

Closes: https://lore.kernel.org/all/20260727034932.0B7C41F000E9@smtp.kernel=
.org/#t

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 772d2a409bb5c..c45b984c02e6b 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -1049,8 +1049,10 @@ static ssize_t pwm_auto_temp_store(struct device *=
dev,
>  	if (temp < 0)
>  		return temp;
> =20
> +	if (temp > 0xF)
> +		return -EINVAL;
> +
>  	mutex_lock(&data->lock);

[Severity: High]
This is a pre-existing issue, but does this driver violate the hwmon
subsystem locking guidelines by using a private mutex here?

According to the hardware monitoring API documentation, drivers must
implement locking required for interrupt handling and for attributes
registered outside the standard info structure using hwmon_lock() and
hwmon_unlock(). The core relies on this to serialize thermal subsystem
and sysfs operations.

By using the private data->lock in pwm_auto_temp_store(), could this
bypass the central hwmon locking mechanism and cause concurrency issues
with the thermal subsystem?

Would it make sense to update this to use hwmon_lock(dev)?

> -	data->pwm_automatic[attr->index] =3D temp;
> =20
>  	if (!(attr->index % 2)) {
>  		mask =3D 0xF0;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-adt7470_fi=
xes-v2-0-598e38a46ba6@gmail.com?part=3D8
