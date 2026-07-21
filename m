Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862DE4499A3;
	Tue, 21 Jul 2026 10:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628007; cv=none; b=GOCUei/3NctFGN+SvWcf3scvB7oYEs/6JPkoFq+cN+nfPsCRXFROenfwoqr4FX1G2/ECPZp5Yg7jOcqPQ32JOGHYgYYt3uCq5CfDixs35oOVrcHO+MUB2W2CA9efaiY/QIe116V+3xQVCgZWMxnCjt3+zAZSB3O482XvpRpZDLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628007; c=relaxed/simple;
	bh=RxNiZg6VNKiujo14I9B5v7gaww/65c0qeFhe4P9gYTo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C674n9T0Qd4SnB8g2auTlzt9iasKrNY8Pf0M8ILSJCuGFpcqANf/ozetjVAizrZikrT3MEJbVNk+TU2+ZJw/Tm7QJ0BMaKMGew8EydsQesKDudTZGKFG+84Q9x1McPbPKu0ZVqAyDNUzEGvWLBePfPOZtmp+Zp6smBRNOUwJdNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfLdOq+t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfLdOq+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93AC1F000E9;
	Tue, 21 Jul 2026 10:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628005;
	bh=63GK3+lU6Xik7r/DuPgi1C8D+PIBWHw++pfSdIyYQQU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kfLdOq+tb79+KbSy70kYyapDXa7M7rP+W8Pwocvw8Y9ZYW5varYPI7523bS8Jq7Wp
	 Gq0mkqgjxi9vj2IwLwXZ9iWEKxBAuRA9va8yml/LVSZVWJxxtT4FIk/dhfD12Knk3C
	 TqZ9IXLMPhL8J3Hg7dvoC+1cDF3sAYjNZP2KEJsA5h/LI5L8RlfCoslD8wR3g0YAvm
	 d3m/bFxJJbmw7dxdouVEG/cYQQoMgZ8FFPY5Q51iGf4x/fqDDI9HnXr1LhTWknA4Q1
	 4NHwVjflAMTFe8zny4uyRFyJz4ILvJhCvkUMtBIyRLiap9LEnYr4OFT3QaUIRdVqOt
	 AwgPNXFICB3BQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] hwmon: (lm63) Add Sensylink CTF2301 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260721-ctl2301-v2-4-ef5fb342872a@linux.dev>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
 <20260721-ctl2301-v2-4-ef5fb342872a@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:00:04 +0000
Message-Id: <20260721100004.D93AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unchecked I2C reads for LSB are bitwise-ORed into 16-bit registe=
r values, corrupting data on read errors.
--

--- Patch [4]: [PATCH v2 4/6] hwmon: (lm63) Add Sensylink CTF2301 support -=
--
commit bbf54143e45eb1b3b9599d60a55904a5184333c9
Author: Troy Mitchell <troy.mitchell@linux.dev>

hwmon: (lm63) Add Sensylink CTF2301 support

This commit adds support for the Sensylink CTF2301 chip to the lm63 driver.
It introduces extended local temperature resolution and optional thermal
cooling device registration.

> diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
> index e2a429e579ac1..764a7467afa60 100644
> --- a/drivers/hwmon/lm63.c
> +++ b/drivers/hwmon/lm63.c

[ ... ]

> @@ -256,8 +270,16 @@ static struct lm63_data *lm63_update_device(struct d=
evice *dev)
> =20
>  		data->temp8[0] =3D i2c_smbus_read_byte_data(client,
>  				 LM63_REG_LOCAL_TEMP);
> +		if (data->kind =3D=3D ctf2301)
> +			data->temp1_input =3D ((u16)(u8)data->temp8[0] << 8)
> +					  | i2c_smbus_read_byte_data(client,
> +						CTF2301_REG_LOCAL_TEMP_LSB);
>  		data->temp8[1] =3D i2c_smbus_read_byte_data(client,
>  				 LM63_REG_LOCAL_HIGH);
> +		if (data->kind =3D=3D ctf2301)
> +			data->temp1_max =3D ((u16)(u8)data->temp8[1] << 8)
> +					  | i2c_smbus_read_byte_data(client,
> +						CTF2301_REG_LOCAL_HIGH_LSB);

[Severity: Medium]
Will this corrupt the temperature reading if the I2C read fails?

In lm63_update_device(), if i2c_smbus_read_byte_data() for the LSB returns
a negative error code (such as -EIO), it gets bitwise-ORed with the shifted
MSB. The negative s32 error code would sign-extend, overwriting the MSB
bits entirely and resulting in a large negative temperature spike instead
of propagating the error or maintaining the previous valid reading.

Could we check the return value of i2c_smbus_read_byte_data() before
merging it into temp1_input and temp1_max?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-ctl2301-v2=
-0-ef5fb342872a@linux.dev?part=3D4
