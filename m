Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794C341167F
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Oct 2026 10:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802662; cv=none; b=fDVrFQjvcVw0GoXawHNqCbrX1FjZU+rKTjaSNVs9V+cPhjgESwVkXoJn742hPAAuMYcc+3CBcii4H1WVcImwTHVsGulmE6k783Y+TFaQAg1Rw6ArHGstWH2uKFRNaJ/OGN1egvxNyu6GK/jnpqU0aZ1/COQaLEED36MlPjXLkRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802662; c=relaxed/simple;
	bh=BDqmE2ovCASMLGpvn0PIbmd0++tdc88S3TIXBLKQRbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JP+s96KaSczf8F7IEWPZGMFEJrQg7Ebz7hFL62LbP3lKLezKKPMqGyXfPJzvMW0sniob1llOkMPQqjAWEQUDR3Fo3CjxRwdgBoVAdVJz2L9AmPxrYz7P51nLCmvfGJe8qfFx4ku3JsPROPM/IGUty45Tla7ZrHHzMlQKKczCOgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=c3DUoYg6; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="c3DUoYg6"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4d870d54so977828f8f.2
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Oct 2026 03:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791802656; x=1792407456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RLup6P06ESS7erm0ADUuu6e9Di2cilyz4zC5+dpI2eU=;
        b=c3DUoYg6LPcnSwfJ9IP9UFG7dMc9d6cAdw6B+Iy9+LjdNdnSS46nitKhEWuwsWAC74
         5tbFsTgKDfSp7OXifP9xaoQNnLRJp6kZqmlyNcAAasMOUbuANEfUYtmUbIoteDwiXGSk
         KJa2Nu5OiofBgnUMPu3FBGnF04P3ee42wYjO8qzLeWeSpzkrAXDIeFXGEPZmegFaMWhf
         bxIcCj9fJL+VsCwerMoyoyehrWcKVU7VIF3vl2ZbZ1DIAc1z50PoSaPscxFhiR9sOAYW
         vuzfG06DvAdMGH85P3zSr5aUkgaL6wvNPocXZDpWNoTXi7CLuKNijrLaZmoXcx4Ek4Bq
         3LQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802656; x=1792407456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLup6P06ESS7erm0ADUuu6e9Di2cilyz4zC5+dpI2eU=;
        b=Sj6xK+h8X809F6KzsX6XWD0XBGMJw9298jIm/OiGZnoUr66yxH8PpYGwfK+IegeV6e
         LYFHVLpcwJypgkofeE3OA+jR8ZLwKdJWhrGLSlZiOTl8nEAmHQQzgBNIsmBLuDIpNJyI
         eFWOsC/pxIICIJt+vzDcPmR6XUsQaCVvL2zk01vBFEXdT2cKj7USw+ni7l25ojyUGn92
         Z4ov7zZFrRn3fPjeYO5XWmKBg14HpzkCAsVdZWpqTff0gOs7CCnVAO1q8GeVhWJx5JGp
         57S/zmelySaerdq/RhgxESdKbUNjxj4oPcp1kxFoQpNS7kqkAMQAgOof/jl4UYpFRTA3
         wEdA==
X-Forwarded-Encrypted: i=1; AKwUvByv/maXOhKVRvRTLXbKqyi1UCfZxtaHHvYwC1ckuTn9nz/isT5XB+ilykGnv8LHz4N8ZH4+Jf3O2cYwog==@vger.kernel.org
X-Gm-Message-State: AFq9FYIdDN4QqRIo29qq0OTg2hOKXUbYiED6v7cbnZwcdJdDVuDlRHUG
	fHtvfPSNx7Ky4R9xsqFqIWJinoOGWZcT63Qxz3IQDYVaaVNXm7GQAtZu9f5I217s+So=
X-Gm-Gg: AYBFou1oVm8cbukcw+dSVN7Qxe5HUP3iFlbx5au6nlBPFijIRE5JVCq0EfbosxHALyb
	LWicg91LU1HuWFPtBl/zSPBT3f3gHuDAV0XlrP+7xH2cQG1T/vB6WC+PMQFj+kSnKNIeBLyunYd
	BziUCDFmZetXGvgqqERhGFdpB7UnfSsM4B23r5Q7xek+Pbw648dFsEooUpnYxw7DKHiWeuwCXWk
	FCPZfnKbJuT8tLHnaZQKuCUBgVNOu2WwXmPgi6ovcamA4u3Uqb1IYuR4t+K1M41lvbji156xKSI
	W2+T2JGJMs06/gd7ZQUp4KvRwAibBUfF7H+m58wRBP1etrjbRLRhYDeVO41CtNfboqPePCZykPa
	qvDxnRp0MShqhQHsm+P7uqZ0nZHRXjN2b9kF5OjvmSardzdUgwtFoYfpqX3e9TOs7cSwG1PG8kK
	o2dS4ucuWB19o4Shrvs41ijUO7W2hXmZoI9ppWlQVbbkWqof1aZngJnFEqUBlywLXdjqTCSljVc
	rPoDwvXMhk/is1YeR8HY5stTR3F/CziOGqP97TdBEUWsgy9eWOf1b04gYPZlg==
X-Received: by 2002:a05:600c:3b1a:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4a18e4b91f8mr158595575e9.20.1791802656360;
        Mon, 12 Oct 2026 03:57:36 -0700 (PDT)
Received: from localhost (p200300f65f19a904ade4f69ba751c34c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ade4:f69b:a751:c34c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18bf2343asm525197235e9.9.2026.10.12.03.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:57:35 -0700 (PDT)
Date: Mon, 12 Oct 2026 12:57:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Luna Hart <lhart.opensource@witekio.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Flaviu Nistor <flaviu.nistor@gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (tps38900x) Add driver for TI
 TPS389004/TPS389006/TPS389008
Message-ID: <asy8rKc0bLUo2xCK@monoceros>
References: <20260929-lhart-dev-tps38900x-v1-0-7045c5894152@witekio.com>
 <20260929-lhart-dev-tps38900x-v1-2-7045c5894152@witekio.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jub6o62xngj3zzzr"
Content-Disposition: inline
In-Reply-To: <20260929-lhart-dev-tps38900x-v1-2-7045c5894152@witekio.com>


--jub6o62xngj3zzzr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] hwmon: (tps38900x) Add driver for TI
 TPS389004/TPS389006/TPS389008
MIME-Version: 1.0

Hello,

On Tue, Sep 29, 2026 at 04:04:05PM -0700, Luna Hart wrote:
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>

You can rely on <linux/i2c.h> to provide of_device_id and i2c_device_id
and drop <linux/mod_devicetable.h>.

The mod_devicetable.h header pulls in many unneeded dependencies and is
bad for this reason.

> [...]
> +static const struct i2c_device_id tps38900x_id[] = {
> +	{ .name = "tps389004", .driver_data = 4 },
> +	{ .name = "tps389006", .driver_data = 6 },
> +	{ .name = "tps389008", .driver_data = 8 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, tps38900x_id);
> +
> +static const struct of_device_id tps38900x_of_match[] = {
> +	{ .compatible = "ti,tps389004", .data = (void *)4 },
> +	{ .compatible = "ti,tps389006", .data = (void *)6 },
> +	{ .compatible = "ti,tps389008", .data = (void *)8 },
> +	{}

Please use { } with a space in the list terminator.


--jub6o62xngj3zzzr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMvRsACgkQj4D7WH0S
/k5rDQf/ZR/aBJ51FBzSPY3CLIfaH0pvP1Gj2j3CUzW0Vom/XobHRZB1Ti3CNv7u
FoToTijxGUAgNf01mcy4kAsKlH51piW9LmhgAhDt9yk8TrD8rDwuHcGKn2xThTdq
SyUWpDvd1KLJt1BrIbb0XLxVKJQWrwi0T1KjX2cc/Kub2y8u0KMPQmSm1hJnYY83
Dzjl4aJmfNJ8lFZwpV8Dm5a/cJDaFS6fcjmbiqrskHLo3DAJQGTINdxMT1k/y6nM
5ApNcvwdC0zs0csER7LQtHsMvu5zTGaXJhDOnhVEQzof7auCFJyoC6WlaaAWpDsr
sGnCLL/cr+GS8SOeZDlFvyWuLBjnTg==
=0D0m
-----END PGP SIGNATURE-----

--jub6o62xngj3zzzr--
