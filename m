Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7920825332E
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 20:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184249; cv=none; b=pIIv5h89QjwGX+Sp34QaQkFXGHgwYPvkYFpnOhXkjzBZK8CszgJiFtito6P5JSjWWp5Xp/Me4HFOrMuz+Ijzth2YEcOS5a0moC1dlc5yatrvhUkLy6ORQab2JcdCbfNi7EzeR2lblDz/jx5MLv8ol5nH8Kgsfhq4wwu9qo88sBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184249; c=relaxed/simple;
	bh=oPcyaX6HAhB6YqOap8y+n2yWr6X/5yAQjM1ohMFisC4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CGtua1lmE+v5KQMc/YPmBBwA88+GnCBb6W6kiBi4jsV1tq4uyAieXaLwH8xvQctycP37GYs8J988ue7aaTRdE9RWpUXeJgNJx+b5aqt0rvF6NtAd+RdZ0bQ68KUZB2Cg3tLRFWl92IDbo3zDUF8DF1te2V3sXZWXqS9cbQJD+xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1EsSkVS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1EsSkVS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E8E91F000E9;
	Mon, 27 Jul 2026 20:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785184248;
	bh=Bd/BfB1Z4bJO0IhY2jqOk8FhK4v2PVmVH7geKDR56Eo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W1EsSkVSonJBktqJtrNG7bj4zubHZPsMxw97ObSE4fmeemrbxC29omben//x2wxAs
	 GmZ8AFrqxx+EpOENvYIavxLSQbWurGwKyYZG/sUm4CryHADteDVr3chXbdwokZwyak
	 Wn83qEl+5OYncjmWtRZfry8QxJQa1jInP8coOXJp2a1vgC3PJA701d3dzqidCGW+jS
	 VZZWI8XehP5Mt+3r2BwhQBb7ha6RfLst+u8aicqSrJC6znjvCXydSIkHUNPFdWpPWy
	 clzAqotXCuEk/wZrQCWJev3ww42M7OIg0kB0ueH2YshdWs/RwPdxa74UuqO2QdbqXz
	 wxgovSRO8P7uQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (lm63) Clamp PWM frequency multiplier to [1, 31]
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260727202120.3710948-1-linux@roeck-us.net>
References: <20260727202120.3710948-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:30:46 +0000
Message-Id: <20260727203047.5E8E91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Using clamp() instead of masking incorrectly handles reserved bits=
, potentially corrupting the PWM frequency multiplier.
--

--- Patch [1]: [PATCH] hwmon: (lm63) Clamp PWM frequency multiplier to [1, =
31] ---
commit 7a1685b6b2f22a4e89624bbad02ad4ecbb43a849
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (lm63) Clamp PWM frequency multiplier to [1, 31]

This commit updates the lm63 driver to clamp the PWM frequency multiplier
read from the chip to the range [1, 31]. This is intended to prevent writing
bad PWM values if the upper bits of the register are unexpectedly set on
some variants.

> diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
> --- a/drivers/hwmon/lm63.c
> +++ b/drivers/hwmon/lm63.c

[ ... ]

> @@ -249,8 +250,7 @@ static struct lm63_data *lm63_update_device(struct de=
vice *dev)
> =20
>  		data->pwm1_freq =3D i2c_smbus_read_byte_data(client,
>  				  LM63_REG_PWM_FREQ);
> -		if (data->pwm1_freq =3D=3D 0)
> -			data->pwm1_freq =3D 1;
> +		data->pwm1_freq =3D clamp(data->pwm1_freq, 1, 31);

[Severity: High]
If the upper bits of the LM63_REG_PWM_FREQ register happen to be set on some
LM63 variants, won't clamp() treat the entire byte as a magnitude?

For example, if the register reads 0x81, clamp(129, 1, 31) will evaluate
to 31, rather than isolating the lower 5-bit multiplier of 1.

Would it be more correct to mask out the reserved bits with & 0x1F before
checking for zero or clamping?

>  		data->pwm1[0] =3D i2c_smbus_read_byte_data(client,
>  				LM63_REG_PWM_VALUE);
> =20

[ ... ]

> @@ -1188,8 +1188,7 @@ static void lm63_init_client(struct lm63_data *data)
> =20
>  	/* We may need pwm1_freq before ever updating the client data */
>  	data->pwm1_freq =3D i2c_smbus_read_byte_data(client, LM63_REG_PWM_FREQ);
> -	if (data->pwm1_freq =3D=3D 0)
> -		data->pwm1_freq =3D 1;
> +	data->pwm1_freq =3D clamp(data->pwm1_freq, 1, 31);

[Severity: High]
Does this have the same risk as lm63_update_device() above, where reserved
upper bits being set will cause the multiplier to be incorrectly calculated
and clamped to 31?

> =20
>  	switch (data->kind) {
>  	case lm63:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727202120.3710=
948-1-linux@roeck-us.net?part=3D1
