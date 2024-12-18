Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE491A239C
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Dec 2024 12:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734525996; cv=none; b=YAfRxQIFXhGOOKwHAkbfvnZtx896sbHcY9Kz3Rigq1IzbUDRK0B6tdqbEole5UIYdO989qxA10C14Q6Ssk8nRWebRKQYKfU1FwlB6Kyx2ozTBJtBJrBmBIxUzRt9skHngegXzl6Mtb0whFtfcbaxTHg298bYp0M9O8sh74eyJxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734525996; c=relaxed/simple;
	bh=ac5IubuKaWww5HmOyStWbZ9+N0Xz0PpdR4Md5/u4+Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWenEvKXUlhZ71BpkWjl57FIBrYqMeREeCObYKHsj0cBbf6TwFvoLAwF7+mXL7qUNYmvGH5RWEoPc5ANBSGhm4XFbe7cbLnjcrNTThDNX8lYvNs4E8Pd58teppxj1skv51PmgiHbK+HhbRQWplP5xmsyd0bEu2I8yVW3sNvo9wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WrqDTVns; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WrqDTVns"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=eTaX
	dr6kdhSXJfEQfU0MeaS9229JNokcYV/YCiQANJw=; b=WrqDTVnskYlafOlSk+UZ
	oOQRdxrt1XyR1mbcO485kXtLHf1wUdbAiQ5STO8xA6cHJBHyOugvYLahHKzlZcmf
	UKIv1Lb6dPsqJDdwn/9pru7XBr7XsJ/ryuzrwTwyA/JLiWtNj9KF3BD9PQREIoqn
	zWYnANer4PvbP12F59HFZWaDcVmBtNAnFxPraIXTX7qsk9s0EkFSqVYt4Rl//F4d
	AXNRuhSkaQ6huynHLjxlQ8EMbZA0/UUyJ6wxuLkxVL0JtmbS3ctcOQzJc6A7auNB
	TjflQbFJqBpEVbm2wwNmssyendqZFYUsD43JOV5UFMqEgYaXqkX71rgMJ35R1Yiw
	LA==
Received: (qmail 319944 invoked from network); 18 Dec 2024 13:46:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Dec 2024 13:46:24 +0100
X-UD-Smtp-Session: l3s3148p1@pVMlzYopFO0ujnsY
Date: Wed, 18 Dec 2024 13:46:23 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [RFC/RFT PATCH] hwmon: (lm75) Hide register size differences in
 regmap access functions
Message-ID: <Z2LEH8mvVf4Uai19@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20241217225210.3298091-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TGhLIPDKYfcQHTL3"
Content-Disposition: inline
In-Reply-To: <20241217225210.3298091-1-linux@roeck-us.net>


--TGhLIPDKYfcQHTL3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 02:52:10PM -0800, Guenter Roeck wrote:
> Hide register size differences in regmap access functions to simplify
> runtime code and to simplify adding support for I3C devices. Also
> use regmap API functions for bit operations where possible.
>=20
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> This should help with adding I3C support.
> Module tested only.

Does that mean 'build tested as a module only'?

With the following small patch on top, it works \o/ I suggest that I
will include your patch in my series for adding I3C support. I have a
few patches on top already. I think this makes dependency handling a bit
easier?


diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index f2550f623bee..1ef47ba6b458 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -653,6 +653,7 @@ static int lm75_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
=20
+	/* Set this early. Our custom regmap callbacks need it */
 	dev_set_drvdata(dev, data);
=20
 	data->client =3D client;
@@ -662,7 +663,7 @@ static int lm75_probe(struct i2c_client *client)
 	if (IS_ERR(data->vs))
 		return PTR_ERR(data->vs);
=20
-	data->regmap =3D devm_regmap_init_i2c(client, &lm75_regmap_config);
+	data->regmap =3D devm_regmap_init(&client->dev, NULL, data, &lm75_regmap_=
config);
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);



--TGhLIPDKYfcQHTL3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdixBwACgkQFA3kzBSg
KbbyKxAAs/hN76TavTbLZZ8r+nRMIapvcorl7T11yLG5InTrIIQWHFVQgvS4DMkS
RQ5Y5d/6rY9iI+OVgIVqndxRuBS9Os5031yt8kgUbdxRWueSuDR6t6cKTeX6ug64
RWltl/nCVGLhoAgWXzL/zavAgm1+NwS37sZN76Gr74Q4AMLxew7Qnjmr2ePufrtz
rbMOMinOJUhk+IiMqCe5eAU2YdmOfeBDSmNl6GaNj3g9+rqT+ZrjlzlWIu3aBiEF
7j/Ida8HmNgAOo5QZ8EfXiHZU8zIaOjbxPyVyHBNVqDe7TYk+0Xp6HM9mf6mwaow
gV1j0k5qBgqWGWM+sVVzUZzlvXJXl/KyBmU4bN+HGMNPATuTW8HPkhnCg3C2iHFN
6eluBOuUQcBgCV+IHvaEPVJsEd+GCVn7NSfr27ks6U/YY00r5z7Li093sSag3bT/
3vBDUoQP1pxpUhYK3WRcABcncxrhdfplvCBKzsSCcM2G1Ft8RRDcS6TXVKxcZDUj
OJXGgX+/vRY3PDDt3ViBqB8EZ/DdvUoWoZO5P45WoIOhNZRfRvyeHi1HspknbxFz
jTQmXBoU62bdumd9npklZOwOusT7g1OmrNobYJCnUvV/KkDkztzF9q3dh8NwYzNt
7Tc0lp35+PbW4t39B0jnmJlxJv3rTjQHAVsW/onW7pTRNTDllz4=
=JWyh
-----END PGP SIGNATURE-----

--TGhLIPDKYfcQHTL3--
