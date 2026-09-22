Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A149552952;
	Tue, 22 Sep 2026 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790097186; cv=none; b=gnswduHMJ72QQQ212d2SB2/A8BzxAfq93Y9CH/2590+t/trwJh3wGd5BGVGAApaHYiw+3oJ3GyjrrShsshjRcFN4QBNfFjBXfRI+3VUVR4axkC7xIr2cu9lvjrQPoOPk6rN9ci1CfwMkNhk5jJwdx4OjD/S/u7fQSz7oPUDqy64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790097186; c=relaxed/simple;
	bh=Rb3nQmcbLxvZugiL4VtH9ek43O+CYgD5gTfh7xpL2kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVBjSH24VrIepdmZKN+r9wv+qpCgSFM5PIVgq8jGt4cTh6sr/VmY6JXGD5LnnhAN8oXmhpjYDtGTXhbxANgsvoFvaRjiUK2/VX/gMmSbgaIyJ9AEOfNMPVN0K/Gzm44GFM6XpU3VscKo2TGg+QGrfKoITRAIQIWS5g3SqSR03zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHY8IfxD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHY8IfxD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB7C1F000FF;
	Tue, 22 Sep 2026 17:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790097185;
	bh=Rb3nQmcbLxvZugiL4VtH9ek43O+CYgD5gTfh7xpL2kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SHY8IfxDJV64fXq6J3vIAr785FWgO22jlfCwc3HIiE9OfjPAvHkP34tcUFte7KmyW
	 QeJoFYYjeFjC5NE3SWf/B6vGHIgPL9zmV2YSfH1WjtSGMdgCcGBaoI31ccT5AMWste
	 Ot96+MIsocgC602Rv2B5YM4rhIgEABqM2vAhppgbOSwDPBJarPlc93y0g1ufkbDker
	 SPcPEhGCPVvqPNf9c0jY+9X9/7RtbaxDdz0JpF26MF4k9XkVj/ThjzcZncHu0mcweX
	 D1jIff2nqWb3Ec0hbWFbVKaOCH/Bbqx5DCEL9Y+SEnEheb6YTmKQfwU/sbWR2MMGdt
	 e0Y+DGOyOsQuQ==
Date: Tue, 22 Sep 2026 18:13:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Conor <mail@conchuod.ie>, Colin Huang <u8813345@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	colin.huang2@amd.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon
 TDA38740/TDA38725
Message-ID: <20260922-pectin-backslid-9352303bb7c6@spud>
References: <20260918-add-tda38740-and-tda38725-v6-0-a8b11018d850@gmail.com>
 <20260918-add-tda38740-and-tda38725-v6-2-a8b11018d850@gmail.com>
 <dbd0a721-898b-4524-a0cd-c9751fd4bd68@roeck-us.net>
 <2646A11E-8D13-4587-8027-1370E0007F36@conchuod.ie>
 <3a107337-8e2c-45b2-8847-6b4fb7b0405e@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cpqJA5S6VLdN78Gw"
Content-Disposition: inline
In-Reply-To: <3a107337-8e2c-45b2-8847-6b4fb7b0405e@roeck-us.net>

--cpqJA5S6VLdN78Gw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 10:30:16AM -0700, Guenter Roeck wrote:
> On 9/18/26 10:24, Conor wrote:
> >=20
> >=20
> > On 18 September 2026 17:02:38 GMT+02:00, Guenter Roeck <linux@roeck-us.=
net> wrote:
> > > On 9/18/26 03:23, Colin Huang wrote:
> > > > Add a PMBus driver for Infineon TDA38740 and TDA38725
> > > > single-voltage synchronous buck regulators.
> > > >=20
> > > > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > >=20
> > > For my reference (waiting for DT patch approval):
> > >=20
> > > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> >=20
> > I'm on holiday and only have my phone, and cannot find the binding patc=
h to reply to.
> > I found it on lore and it looks okay.
> >=20
>=20
> Hi Conor,
>=20
> it was copied to "Conor Dooley <conor+dt@kernel.org>". Is that the wrong =
address ?

Nah nothing wrong with the address, just the limitations of k9 mail when
combined with the volume of mails I get.

--cpqJA5S6VLdN78Gw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarK3HAAKCRB4tDGHoIJi
0obXAQCdKDcHTJG5AcuDfg6f7evT6RLagLyTl8k2vNPWC5fQBwEAh2b7ZHs8BLFy
koqCHqdbvoS8ueN4DOiA+2+5oEZXpQ8=
=zvxl
-----END PGP SIGNATURE-----

--cpqJA5S6VLdN78Gw--
