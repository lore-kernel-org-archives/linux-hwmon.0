Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3260D1F8755
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Aug 2026 08:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786350017; cv=none; b=Edj+rr+NckLiJn3fKlZmIRPBaOuH2cJwLYqAEDPQxY29zxUnVXxXAch38Qy7nJMb2RfE+xN9nO2/XCg6RSZTU1aWQFMoBkRwXaSPhpns1y9EgWe0D+A0sgbYQQYpWRSeGhDoZdUHj5k6/9uJMw93U2UtfaP63bZwO7Dz4EJBw2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786350017; c=relaxed/simple;
	bh=nzaQJ5xHWOHZSj+57EcWQMu+TpfT4HpZOkKr5A3+P4g=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 In-Reply-To:References; b=hKO2D6hO0QciRvOELImYITmGLVhpqxv47cAmkHZJsJaHJPi0EmUyvoiXMhOcIQMLS65dXZbLRBu3GLvcvjUCkxyplT3GL37bXPiWW0/RnCXyOy97JTIiJiHANzLfZ4kKicLxiz2z8yHwP045P8Fd9P5aUzj3zgz8JlHD1JicS7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=T1m71LCQ; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="T1m71LCQ"
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786350014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mwb4T+70sQLw0zGlvvSzZhnupF748FA5zZmXS7ztNcU=;
	b=T1m71LCQgmbZJiuEVkMw3skXMvxXtbkBcBWHDF1MUhxXqfVkveKgF4RKsQurR/ajD9cSz+
	nt2SRN+B/OqyK3bqask8irYPL2hMhkMw2kK5kvpA5oKWqltev1QkSfQlgdfIdQywSybPu4
	URq2rMsh0uqV2GPSRAgbujtJBBBMkKU=
Content-Type: multipart/signed;
 boundary=d199f377d7c17763f6ce1e395f30f63cbfb46a7e8fee7409363fcd76361f;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 10 Aug 2026 16:20:05 +0800
Message-Id: <DKL487DPH7KA.3GNYMRSBR1JY3@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
In-Reply-To: <20260805134119-GKJ77474@kernel.org>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
	<20260805-ctl2301-v3-6-b86c75d1c552@linux.dev>
	<20260805134119-GKJ77474@kernel.org>
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

--d199f377d7c17763f6ce1e395f30f63cbfb46a7e8fee7409363fcd76361f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> > +&pinctrl {
> > +	i2c6-1-cfg {
> I'd prefer to use the reference, keep it short & close to where it's used
>
>  &i2c6_1_cfg
>
> > +		i2c6-1-pins {
> > +			power-source =3D <3300>;
> > +		};
> > +	};
> > +};
> > +
> > +&i2c6 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&i2c6_1_cfg>;
> > +	status =3D "okay";
> > +
> > +	temperature-sensor@4c {
> > +		compatible =3D "sensylink,ctf2301";
> > +		reg =3D <0x4c>;
> > +	};
> > +};

My intention here was to keep all board-specific pin configuration
overrides under a single &pinctrl block, so that they can be found and
maintained in one place. Using a separate top-level reference for each pin
group would tend to scatter those overrides throughout the board DTS as
more groups are customized. The &pinctrl block is also placed immediately
before the &i2c6 consumer.

Would keeping the current structure be acceptable for that reason? If you
still prefer the direct reference, I will change it to &i2c6_1_cfg in the
next revision.

                                            - Troy

--d199f377d7c17763f6ce1e395f30f63cbfb46a7e8fee7409363fcd76361f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanmJtSEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8CFgEAiJSPpno04iz/
cz/ScQC1rhjqbfbKZVHCF6VJ27Lw8fwA/jzuR+UYxLorJLN/rAcuXQS8gF7HrQ5p
lCjF5MwhGh8J
=4F8l
-----END PGP SIGNATURE-----

--d199f377d7c17763f6ce1e395f30f63cbfb46a7e8fee7409363fcd76361f--
