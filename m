Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC91612A177
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Dec 2024 16:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734538058; cv=none; b=dwtUPYxIE+NldhbctUP38PyVUiMxX/B3UgHwfyyRm9F5zru0n5KdVZcYWrlZIHgVFPcvrf4i2LKKKYA86sSSZX8XffhfequwVuP6+Csw6aIEAwt7utv9VJ6XrFgQPCGABxNodmnZF/wlMEdACVzwn/ZSZU98W4urzjR1akbCxIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734538058; c=relaxed/simple;
	bh=T40X+Cw9ZEmB+gg7q70d7sVgogHCgmhn6GU8Em8pgRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJ1LMpjifWWpQj228stPVk0SOzvK7vipurEcv/mHv8hFhQoWsOvFGCXFkq/sJ8UwDBJV0BhfhRt1XfhExrGgwZ13FdTGO6NtH+pU5Q+xlknkJIl8nrkSCWHVKsfTlgfkAJdHPpqSonnaa6yk1VNcctSVReyaVJNGA7o25+BJuxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=A/8XY1/A; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="A/8XY1/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=mR2u
	iVz5dntfrYTgCbXsHSt9LGYZzYgWRwSD++Ii+Uk=; b=A/8XY1/AMhOIBHDpipQD
	rxLTsdnFB0tq46yasoL7iZwSI6LzgNGAZKPel+k9jdAQbm+CR8hTIlmJMkKmSThI
	5EUkNCJgKk0qhwtwZuLbpBaNzkjuT192SY3ZA98EipeePzJsDF5iw0r/G+VTfQPL
	lqmS2j6HDYtqJMAQpjGhhsVDXNEPjnk1pG1HsY69uqMUL4TWq/IxW0fADpia0pve
	GIZW5D+RrUdLxcF063OCoReDAacnCzTtdD4Mt+OpiBhaFpzhFp4mTwgmFY8v8aH9
	dsjuK5q7iq1A6jcyBQMv2U9qzaoDwGfXgNVwz9V649aQSQ5wjS1p8y32hzsdQr9E
	sg==
Received: (qmail 379613 invoked from network); 18 Dec 2024 17:07:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Dec 2024 17:07:26 +0100
X-UD-Smtp-Session: l3s3148p1@zTQanI0p7NYujnsY
Date: Wed, 18 Dec 2024 17:07:25 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [RFC/RFT PATCH v2] hwmon: (lm75) Hide register size differences
 in regmap access functions
Message-ID: <Z2LzPeqyxqJz06dZ@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20241218150404.2713377-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZPCJXIHmwLswLp5K"
Content-Disposition: inline
In-Reply-To: <20241218150404.2713377-1-linux@roeck-us.net>


--ZPCJXIHmwLswLp5K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guenter,

quick response, will test your new patch later.

> ---
> v2: Fix accesses to 16-bit configuration register.

Great, thanks, I missed that more fixing is needed.

>     Use regmap access functions for all operations on config register.
>     Declare regmap bus and use devm_regmap_init().

The regmap_bus solution is really nice! Didn't know about it.

>     Drop local configuration register copy; let regmap handle bit updates.

And one patch is gone from my queue. I had this as well :)

>     Note: The driver could use additional cleanup, such as using bit macros
>     and using devm_regulator_get_enable(). That is left for another day.

I didn't do BIT yet (although tempted), but I have the regulator cleanup
already. Also, 'client' can go from the priv struct with just a little
bit of reordering. I hope I can send all the stuff tomorrow.

I have the proof-of-concept running on I3C already, need to remove some
FIXMEs, though.

Thanks and happy hacking,

   Wolfram


--ZPCJXIHmwLswLp5K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdi8zoACgkQFA3kzBSg
Kbaaog//fiEeDi/ddM8nkimiZ4y+FKxlY3Vqw35UALZv6wIMEh7hu8/lMbo2j6sU
KcZd0WiAS1BtZFJI6qsY87J+SFO1uWXsPdcrm/YsB8+7wO+nxXJxZ54o4KEtTIRF
AOJfQGZjotNRzUevgFzrwzJ81OJzBzl/oZXA6Wg/lu7WUBtFAybSXRbu7s3tnaNm
lKSRIZLqNG2sn/CrOwLLULIHrIGq6hY7GuVDwj4aKTpPtAoegvCGPG5EOy2oPPHk
L0jvQThPQHVrwlj8MK9uPAbjeW525nzd1SzzxeVJGyouxHeLYEFP/xlMYDdrOK/U
Egz6dsRHpPs0OOFRTzc6juLZvE6L//yfWO1+jYJw8cIp0bmMAbYkNY47zfD0yW5n
WTCdHCwSxaOLHbQRpJOrswL4JuucP6sk40/eaGoRZexQmXdabrBEXriSrE7ZdroU
wunTSv3Te/hb8YfRetLvtmaYk0iNAqaO40RMYmMZUpmvaHHRduGQeB55Pgyp4Fmp
hMYcdQUjuLczZ9DUXuFOxot+u/R1Vx+EBQfDgGFcuBJefPPruy013JBG+siI6WOq
kAAoQQNiD+FA/LVI9PpWpP4fk4/5wI+Gvt8YYe7sHDqtXisWM7ngzP41MQd1zQ3M
SoFPir/weUVvr3TOo0sHsTGrUkltnkf3Yp2X8c2QBfWL44eB3z4=
=G9lM
-----END PGP SIGNATURE-----

--ZPCJXIHmwLswLp5K--
