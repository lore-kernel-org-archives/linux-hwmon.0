Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5B31FA260
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Dec 2024 17:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734543572; cv=none; b=KWZeHNYlECg6yF+1hXvwLoKM2KJZDvW9B8D5V7KVEwKzyWjaUwwLntkUaW5BWKtNJK03jEMPNBP0eK5Pq1ulFmVzbeMA6fdYMPfFLNZYC9WDyT7KJkmqDdEhxfgYmEh7V9hp62nGUbgsse5NNuYr2kw3LpXSRccaIC2C7+jZrxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734543572; c=relaxed/simple;
	bh=1wHgPaY6aNEaFHpayslGeLq4+SvFwsE1sk9kYtwHA/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EN987SUDmYB7wqAl25Hn0FPjI7fi9nB3y44j4ypsjTAPTeSVQTShGSPsMltLpieQ2SeCYCPATdsntY25S3b8Kex3PYiqg20W/5VmJ+ECTi0od4xn9Nvex6uZqZ+jQ+/xddXTPm5090lDkMoOfaF7xHtqydtNbIY9qOoMQTvz9cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kCU5Udq8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kCU5Udq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=1wHg
	PaY6aNEaFHpayslGeLq4+SvFwsE1sk9kYtwHA/s=; b=kCU5Udq8mKb2zJCA2t/B
	lRPNq+ptxM9ymvVBe6cbZ7vleB9qlY/KuBE7LBzmkdwalIl22Gxj8EavwDTUGd3T
	h5IgU2sRgWQYsHsjEnXdAX9KDkU0xYQv2d+2mAMziN4hRHf9shnzipzUE4RT8wxK
	bSNm1Y3B6zH8MKBflGEiZTUxh4gzDzF4XBgifUeJDVWl6l6grBuHSBgvjNX6N5Hh
	+NogBa0pCLqaM3SbSAky3NA7NNG26SAb+7VZt1OIl4erqY0snuZ2ij43xJkMk9QJ
	9GbD74EB36du8F69yu+tVac26UrrUb5qNK81HEmctCgdXmzubC7hIXZnVZ2l2f6t
	MA==
Received: (qmail 405990 invoked from network); 18 Dec 2024 18:39:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Dec 2024 18:39:21 +0100
X-UD-Smtp-Session: l3s3148p1@rDrM5I4p7qcujnsY
Date: Wed, 18 Dec 2024 18:39:19 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [RFC/RFT PATCH v2] hwmon: (lm75) Hide register size differences
 in regmap access functions
Message-ID: <Z2MIx8nKdSr5sONi@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20241218150404.2713377-1-linux@roeck-us.net>
 <Z2LzPeqyxqJz06dZ@ninjato>
 <bfb3ba78-206d-4f28-a57d-c25e7d90361d@roeck-us.net>
 <Z2L3dhneuMi9ckUe@ninjato>
 <5b9f29b9-8163-4fab-9ccb-718b672083f2@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qs1eGBK/Kcb2aVW2"
Content-Disposition: inline
In-Reply-To: <5b9f29b9-8163-4fab-9ccb-718b672083f2@roeck-us.net>


--qs1eGBK/Kcb2aVW2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> All that makes me wonder: Do you by any chance have a means to test I3C support
> on SPD5118 chips ? I have a patch series for that, but I can't test it so I
> did not bother submitting it.

Sadly not. Despite Renesas being big with SPD5118, I don't have any
here and I don't see that I'll get one.

I do see, though, that Jarkko Nikula from Intel is active on the I3C
list these days. I could imagine he has some I3C controllers connected
to DDR5 modules?


--qs1eGBK/Kcb2aVW2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdjCMMACgkQFA3kzBSg
KbavCg/9FDyTZ28DgnmNPOuyabaosH2HqxLiPxAIrX28wEwv9TaB44cjRBIBjKJg
+ZFdsNR9vzLsoE9TppQmsnrLJb+8GMzBgjsDXWDA9RPCyZqcbYvTv5A5btsGQLt7
G7qMdKF3gk/HLgf1N2qtgiEGGtGOyNImrSjus/CANezWygBvuxApD9pQbUWYYCvX
12PvyeV9YkrBcRYLjSNR5P58aIOiVOKnnqwbtzkz9JcFTNiyoanTMTcHCdHFjmi3
TJCaroNgz5wgHfioe6Ou5qwyFqTKuPN7gvunOqKc5jl+4WGrQkIIjiWNkiZMgXKY
+dsIYvFWy5idzhW/yrUmWk3VlkmofUrSTky04R5CUQ5EZD7CGDTbE/QrBfxTGmWo
45X4XWj6DNTXPdWodkHA7I1BhB4WIp1KgqqTI1DOaVEVHjLglfzoJoTuFUbqS66A
kUwTbP8ovZmZ41YpWpgGyA+yDchROghODeJy8UdvCWvHq/GH30Qb3rV6TzIYoweg
VYkCmQoegCaFrafwfIPjGHNbnzh0PA4sD5irjEQMJTX+rFRpYNf2MLy1BDpORUL9
ChuayU3HRKHy0KuY7nodVqudvho3fpwbmSrQlGWwzF4Ou+x4dQmXb2gTfAl/qMlW
bN6QE5TP1IBYmMgTW+Y6aWZPFfqYO/foBjnUJZaJxMipi/WuWtE=
=ta+j
-----END PGP SIGNATURE-----

--qs1eGBK/Kcb2aVW2--
