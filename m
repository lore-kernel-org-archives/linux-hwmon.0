Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC903CA486
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 03:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785123904; cv=none; b=jCgdrK4vN71yngN+6J5F0OVuA7n1sFTr/1nm34A6ptBP8eFdNQ63pFVuj6NT4OcJ1pWwWMsPAeaS58hivQSsLse1KeCPRQcQ9lzGnigm4uqQlaZQ5Je0R7LTf0GPbK0J8qpMgJfdtv2ekupujG1PiM+9cIO/bWi6sAmrtQgs6Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785123904; c=relaxed/simple;
	bh=glRRoMiF8YyGxSUitfZZQZP8MOXata9uSA/Ce6QgF3k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uTX8piEQL7K5pZsl3HZKz0Wx5f+g1EkBYIGXz7H9SaoPdTB+RZ+TjX8X3tKyiCQ9qjZZV4ZPKUdIYmb1RCFph8AJXNsRylZIBoMoGRxdc09SeQfK4LnlO+dDrPJNsfrBIS4rK2JjfiPD/+xeLUJUObhAhn3L8mjWMZL+n17JgXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAqhM1hc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAqhM1hc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A5D1F000E9;
	Mon, 27 Jul 2026 03:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785123902;
	bh=ip2fV9jIR2b3cJeg5ClzYn8GUYk/C88ohYLD9JJ/lHs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GAqhM1hcTHUydpMgWQV117v4RlLaR78uHjL/Dxpz+yr0BXm2jpC5b0da7pt3Qz3u4
	 7MmEJCNQgUiTxKSzQwH2kXOVhuK61GL/WnijkvaZ0LhaL5NYf292pDNprEa7WJpYom
	 X8Pqd7xTkVt2XMqzmmDDVuAAngaDQHFTZdctr89sOx9UPC6HXIuO1it66Pi5xNXTAF
	 +NykN8IHpuFgiqTimrcNFg0LHOhR849NF242z7GCSywLN8DQDJN052IxNe/byRlZsx
	 F6xgrNbsjOmNc+IQsaQKu7jffZ7713YE/R5t8qtdNWlDyV57KgPQ7XqgU1XwJQ2Cmd
	 Imqj07Gv8T3tA==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v3 6/6] hwmon: (adt7470) Use cached PWM frequency
 value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260727-adt7470_thermalzone-v3-6-21424d550c3d@gmail.com>
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <20260727-adt7470_thermalzone-v3-6-21424d550c3d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 03:45:01 +0000
Message-Id: <20260727034502.94A5D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect PWM frequency is cached in `pwm1_freq_set()` for high =
frequencies.
--

--- Patch [6]: [hwmon PATCH v3 6/6] hwmon: (adt7470) Use cached PWM frequen=
cy value ---
commit 1d5eabde22a3c2244581f951eb2060da34244bbe
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Use cached PWM frequency value

This commit updates the driver to use a cached PWM frequency in the read
path instead of querying the hardware. It aims to prevent exposing negative
error codes through sysfs if the register read fails.

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index f1150f0fe2172..405eda900650f 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c

[ ... ]

> @@ -817,6 +818,10 @@ static int pwm1_freq_set(struct device *dev, long fr=
eq)
>  	err =3D regmap_update_bits(data->regmap, ADT7470_REG_CFG_2,
>  				 ADT7470_FREQ_MASK,
>  				 index << ADT7470_FREQ_SHIFT);
> +	if (err < 0)
> +		goto out;
> +
> +	data->pwm_freq =3D adt7470_freq_map[index];

[Severity: Medium]
Is the correct index used for caching the frequency here?

Looking at pwm1_freq_set(), when setting a high frequency like 1400Hz or=20
22500Hz, the initial index is resolved to 8 or 9. The code then modifies=20
this by subtracting 8 (index -=3D 8) before updating the hardware registers.

By using this modified index to update data->pwm_freq, does the driver end
up caching 11Hz or 15Hz (indexes 0 and 1) instead of the requested high
frequency?

>  out:
>  	mutex_unlock(&data->lock);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-adt7470_th=
ermalzone-v3-0-21424d550c3d@gmail.com?part=3D6
