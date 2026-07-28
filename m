Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D169E224AFA
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198967; cv=none; b=tgOcq43rYmYfjBwf968LrAezZTKImOSmPOg7hlbC9oiDoHkwrLOgidTGbpWi9l9OMV+8xx3mwwDxmVr7aVjiMli56phsoGmXibbLgsiluPlQ+uM5yD6YmWHc2zX8vjJrVU8ti5yGSVtQVdfHyYpjrhlm5/A/ec7vXq+sMwSWgYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198967; c=relaxed/simple;
	bh=wkFwe+dMLcrRgyyQgVSLl7wQDbOGre2SIl6LhVgll/o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qym8iPDuhHe/yDuU0ln9aNCmPgfRGBY5ghhOHbTD4u95+zPNzfP9+h9F9OGuT2FRYhFUg7P8i+6QRqmLQfMXNamTdW0XrCB6YmeIYxMEvhgZwSb2flY5v18Qb2OUUeCf27jNDvQ0FAArbxvVEFtxq7e2dI2w98zdnklhLGb9m6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRMXkuKw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRMXkuKw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958621F000E9;
	Tue, 28 Jul 2026 00:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785198965;
	bh=xAm49MyhM3L5B+uMLBLn391oyX9Brf6creIgLD4wUTM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GRMXkuKwHzKIAZWkCCX7ZnFGpDp7XA2vWa+xC6+V7EFY7vo3wC1DpZQyk/IqHe4xV
	 paAFHBpGjnil085kh3t8KbdI3v1eG7Npsg+m641ZNNV/Kkd23PvPAqWjfgQVI2UT6l
	 5NzBNlPGxf1Yh2AlhVXuuH0wWzJKhg13hxy9lKxtfDf3gzk2Nq0mLhxoeyZuBZMNWL
	 h4hRE+iaj24yG/LtOt4slBpayZFEbkPt6MGaz5N8bAQPPSSYrezToH6kR2EOVItrAb
	 KxIh6N8ADYFgmLc065TIganJg1hNagDsF62mHBar5RC4wc/50ZBJlvYf0ucvnhXd90
	 /2LVnvZHaUNbg==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v2 6/8] hwmon: (adt7470) Use cached PWM frequency
 value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260727-adt7470_fixes-v2-6-598e38a46ba6@gmail.com>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
 <20260727-adt7470_fixes-v2-6-598e38a46ba6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 00:36:05 +0000
Message-Id: <20260728003605.958621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] A partial register write failure in pwm1_freq_set leaves the cac=
hed pwm_freq permanently out of sync with the actual hardware state.
--

--- Patch [6]: [hwmon PATCH v2 6/8] hwmon: (adt7470) Use cached PWM frequen=
cy value ---
commit 3b9b6b91fb202f2983f66278540c1017bb53f4e6
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Use cached PWM frequency value

This commit updates the ADT7470 driver to use a cached PWM frequency
value instead of querying the hardware on each read. The cache is=20
initialized during probe and updated after a successful write operation=20
to prevent exposing negative error codes through sysfs if a read fails.

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index c6fc7d38d698c..1fbca4869b7b6 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c

[ ... ]

> @@ -832,6 +835,10 @@ static int pwm1_freq_set(struct device *dev, long fr=
eq)
>  	err =3D regmap_update_bits(data->regmap, ADT7470_REG_CFG_2,
>  				 ADT7470_FREQ_MASK,
>  				 index << ADT7470_FREQ_SHIFT);
> +	if (err < 0)
> +		goto out;
> +
> +	data->pwm_freq =3D closest_freq;
>  out:
>  	mutex_unlock(&data->lock);

[Severity: Medium]
Does this leave the cached pwm_freq out of sync with the hardware if the
second register write fails?

If regmap_update_bits() fails for ADT7470_REG_CFG_2, the function aborts
and jumps to out without updating data->pwm_freq. However, the first
register (ADT7470_REG_CFG) may have already been updated successfully right
above this snippet.

Because adt7470_pwm_read() now relies solely on this cache instead of
reading the hardware, sysfs reads will permanently return the old frequency
value even though the hardware might be operating in a mixed frequency
state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-adt7470_fi=
xes-v2-0-598e38a46ba6@gmail.com?part=3D6
