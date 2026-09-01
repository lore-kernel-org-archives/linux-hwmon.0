Received: from mta1.migadu.com (out-210.mta1.migadu.com [95.215.58.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC219369D43
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 06:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788243831; cv=none; b=MuZTB8/ccJQ4Hq3+b30xIyr+cjngwyeVwVSeZ3QohC2ghe5GymB5m0SY4PeJYTrLPxk8rLZqtIzJwndjtXNDQlh4bd5FP73gwWLZRu0Qm2RmBhCH2jG1lU5j2/x5OOoY9DuEcA3e4x0Rq19hQ7xlfLHgZwrygAlV04QQqh2497Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788243831; c=relaxed/simple;
	bh=JYWgi8laE2xRmYqAktJ5/SY0SxkpUmzm3vsS4saBqCs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=uvzKyp38O50s6CBEoMbRgqR/DiT37lMg8NnCdY63ZFl4/3T6gi1sN8hV8EgfDRvZy2QAH4L4EDhv9SnQeT40itvBYVdF5FBkHpnJnV01QrJlJMJ4FgVhZITLhE/aGZ/Q0B4IlOuYt6n/4WWMk7uh3QkXvUU0+LiEbEY7bf909J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tvZJo/lO; arc=none smtp.client-ip=95.215.58.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tvZJo/lO"
X-Envelope-To: linux-hwmon@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JYWgi8laE2xRmYqAktJ5/SY0SxkpUmzm3vsS4saBqCs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788243827; v=1; x=1788848627;
 b=tvZJo/lONEGG33RxIAI2uh4WeJpN8rDLDnOe1iyzX6NjrztypfMyq0QXvRzmk1xta8zfPdaz
 BOVmEewBVrrKENqDk0K0EKH+4jRl86fvdem/AV7JFLL2hKgh8uw3W9cGGs2OH/JoRkAN7cJC+So
 biHGz89sN9qpjOcvNDQn/elA=
X-Envelope-To: linux-hwmon@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 8f859e5041177fe5;
	Tue, 01 Sep 2026 06:23:47 +0000
X-Mizu-Trace-ID: 8f859e5041177fe5
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=f5ad3a7a520e0675d3a1ee0e96ded0c415497e37ee75d1d57e33fbe0b954;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 01 Sep 2026 14:23:42 +0800
Message-Id: <DL3RJ2VF605G.2L1HBQB1CUEGA@linux.dev>
Cc: "Troy Mitchell" <troy.mitchell@linux.dev>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-doc@vger.kernel.org>, "Jean Delvare" <jdelvare@suse.de>
Subject: Re: [PATCH v4 4/6] hwmon: (lm63) Add Sensylink CTF2301 support
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: <sashiko-reviews@lists.linux.dev>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>
In-Reply-To: <20260831163256.784771F000E9@smtp.kernel.org>
References: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
	<20260831-ctl2301-v4-4-b335d52a0570@linux.dev>
	<20260831163256.784771F000E9@smtp.kernel.org>

--f5ad3a7a520e0675d3a1ee0e96ded0c415497e37ee75d1d57e33fbe0b954
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2026 at 04:32:56PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [Medium] TEMP12_TO_REG and software caching logic fail to align with
> 12-bit hardware truncation, causing sysfs cache inconsistency.
>
> [...]
>
> @@ -121,6 +126,9 @@ static const unsigned short normal_i2c[] =3D { 0x18, =
0x4c, 0x4e, I2C_CLIENT_END };
>  							    127000), 1000)
>  #define TEMP8U_TO_REG(val)	DIV_ROUND_CLOSEST(clamp_val((val), 0, \
>  							    255000), 1000)
> +#define TEMP12_FROM_REG(reg)	DIV_ROUND_CLOSEST((s16)(reg) * 1000, 256)
> +#define TEMP12_TO_REG(val)	DIV_ROUND_CLOSEST(clamp_val((val), -128000, \
> +							     127937) * 256, 1000)
>  #define TEMP11_FROM_REG(reg)	((reg) / 32 * 125)
>  #define TEMP11_TO_REG(val)	(DIV_ROUND_CLOSEST(clamp_val((val), -128000, =
\
>  							     127875), 125) * 32)
>
> [...]
>
> @@ -594,6 +692,21 @@ static ssize_t set_temp8(struct device *dev, struct =
device_attribute *devattr,
>  		return err;
> =20
>  	mutex_lock(&data->update_lock);
> +	if (data->kind =3D=3D ctf2301 && nr =3D=3D 1) {
> +		temp =3D TEMP12_TO_REG(val);
> +		err =3D i2c_smbus_write_byte_data(client, LM63_REG_LOCAL_HIGH,
> +						temp >> 8);
> +		if (!err)
> +			err =3D i2c_smbus_write_byte_data(client,
> +							CTF2301_REG_LOCAL_HIGH_LSB,
> +							temp & 0xf0);
> +		if (!err)
> +			data->temp1_max =3D temp;
>
> [Severity: Medium]
> Does this sequence cause the sysfs cache to become inconsistent with the
> hardware state?
>
> The TEMP12_TO_REG macro scales the value but does not align or quantize i=
t
> to a 12-bit hardware boundary, leaving fractional bits present in the
> lowest 4 bits. Here in set_temp8, those lowest 4 bits of temp are masked
> out with 0xf0 when writing to the hardware register, but the unmasked tem=
p
> is saved in data->temp1_max.
>
> If a user writes a temperature limit that is not a perfect multiple of
> 0.0625 degrees Celsius, will this cause the sysfs interface to return the
> un-truncated value immediately after the write, but later shift to the
> truncated value upon the next device poll?

This is a bug. TEMP12_TO_REG() currently produces an unaligned 8.8
fixed-point value. The register write discards bits 3:0, while the cache
retains them, so an immediate sysfs read can differ from the value read
back from the device after the next update.

I will fix this in the next version by quantizing the converted value to
the CTF2301's 0.0625 degree C resolution before using it for both the
register writes and the cache update.

                                            - Troy

--f5ad3a7a520e0675d3a1ee0e96ded0c415497e37ee75d1d57e33fbe0b954
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCapZvbiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/UBQD/Y06tRaTFNMju
NM/etVWC7V4lTIYgMiT04x1oaUoz20cA+gOu2r4waOeMxc0picDYJZruXgDd4WEC
8kbzz6TfWb8A
=zcf8
-----END PGP SIGNATURE-----

--f5ad3a7a520e0675d3a1ee0e96ded0c415497e37ee75d1d57e33fbe0b954--
