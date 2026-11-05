Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890042;
	b=BrqnvVAu9VBFxokS3Kjdb1wUi3YswDap/fn8BqUluid/VOCBnBuXuIESm6j87IMgNA0b
	 WMFOeuju+GA/4olyP6o78Dnn2vu4tcsyIOjtwOY+zt2QSGueAjtKFTJiK0DL4IwrsXAaK
	 taNfAUMgRl23/wf9i+/fH/u54ulaPmI36VNMd8HpNwCQasFXvMn3BykarFyw50zHP08eP
	 ucUXOo06st4goRI6x5sewjYDXHe23MoEZ0yOWW8vj5egefawWscv9Ya3dEMyaDRW8Labf
	 gsV4co2nT7lQHEyPGs/bpyMRPiSr4JyHqDG9TEfv/24SN4xP2eNBJwEaOT1OsGpHWbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jhh3rOfmt9+8e7tXOxSG5bPIHbOH/EzZ/+Q3I0eOuA4=;
	b=ioLGTeYurcUR+cFASpXoFEg09NlFuty6StugZZ52qYtHP0gqcwXYect3WpVUmI5+tHQe
	 2BoOHrmr+0sCcdpmYMsnoMrFNe8NRPjydCYSTqUaTBDeXkb6ODPa5QnQgWTFG1TbymKkX
	 T27D3eaRaATZEsxpiJLyuNHzO48H5qJtTe2CHgEWepVaujPcNu82bGj6kenW8fQjFF0QI
	 hXk0uQbAmKUfKXKT8+CK9UB87l1refDsS0FO5U3HP3sWdSrHd9LM7y3st/tFzVt1+ThWn
	 +naDC+h6jZuAsEyXwQ7k1sEO9Cfnp5lZ895QiRIHz7S4r5ytvkMKS9vkoGyLUAJuMBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=h41ijo8V;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED06A606A32D
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 14:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED06A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=h41ijo8V
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so18414745e9.2
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Nov 2026 06:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793890039; x=1794494839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jhh3rOfmt9+8e7tXOxSG5bPIHbOH/EzZ/+Q3I0eOuA4=;
        b=h41ijo8VLcdthRc+9RgmvYx5NsDst/AzLIN0l3Rh3PfJaoqgNrfZ7zT2ggC+7lc2kI
         ulT7MbshSrv49Xb5yr+Pch5PAkH0NCtKrPwmJWCokIuuvMfmhEHq9E0R5eCGTcKY961y
         HWm0H//LKYNhJ17tsnxjo2GgUSIAmgFLif7rtAfz5XgU6RY0YnmPbv099YuF4GSseCJi
         DCQ0b2oQEMYtnwVE72KyQZ2bY72UDOxriGGd7OWIwF2ydRTeV3k5ERrR9NKkSmuvT5K9
         RVW0/iAF69WrD8RYuNDgiU4vbm/+J/ta9DFrKDcRjRPoYUDCQ/DfNsmtIudR+h3dpxr0
         5Wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890039; x=1794494839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhh3rOfmt9+8e7tXOxSG5bPIHbOH/EzZ/+Q3I0eOuA4=;
        b=2dnafhatPgvkvpj+JbIDVK/JpjRjr8aDzih2yIZ3PVk7Rf16U8oWN6XP7pYlAPUkE+
         tk0Xbp+uC++zgyGLbt1t6sxhYGPjWZ63wRk/eOPCMiaE61Y7kg5DzAy12rZig+NvSJWD
         bOX0G+K5pXxQEf2QMLfm/x0sdmEkbHHcsBArTs90n+XS7n78/WCD9GVnBJlAbXpuyiMU
         VYJ/HMlzXR8LVtA0dzfja6UmYyqiw/AM19qiZ800oW92//u8L1J4Z28s6KuHvQaY6gB0
         /YO5ZvZ/tRNu0sTvS1r11mV10sZN8Vg1fQrQ4vA6HsTE7V2yHpR42Y+LmMtjc/TDOjWe
         QpUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzE4ZZOqXYI+z6rXsBe9E3aZd/divKeGpd2ZB4/peG/MYgs7u/18tpwBNQTK1fASCrWyHPR8NhwbgSs3Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z916+uHhA+4izIiRJfhpEwbOsD/CLgqi9GK5UPk8G/Vd9W0Y4Ri
	s97DB/bIu4H1ueN2t7GcUFn5xfp2GVNendHNN31qgJe5tJvF6c5ovwdDBjcKETJyUx8=
X-Gm-Gg: AYBFou0RVlBz8cGpToJ7cTQUpDZWdg+OiaNQ1YbEYGibIzePOHWZNaFKRGxMhQ8moGm
	cY6g0QtT+GAbRfA5MJLiZ0/ajzabFaMfNH4oYezmavU2Sec9B+Y/aFziiJbFvgwzXnAezozoBU2
	jBd6lC9KQRulxFuYwWFCAWg8pep09dJFpRF0GGSnYWd+ftY5czgVcw/znbWTpc3IHAuayzP65xC
	tOrdytJIwM2HjFfioJ/sLm5wvlDVR12jg8FfDtBA7sfpL5PNfdSsgr3VU2YerlIJ5KWLdIrDWnr
	1VBb4U7B8qNiWW2xYaysCwk8zxraj4JJ7lC8qvRcepQ1N+6BzxCevVPqNBysxGRT/FTSqzbX85w
	/gZZPYASEl1h2AaY36XSgr+pkYVATC1MCGnbfSgHo3gDM5VaIAtBwBuIuq2bZJW5dDhPpIbGTMc
	WTg14DmQ1TlY7QcRoqCZwWvGws5uwQxgKIaFmkfvPxwh/oxwuj8boEOywTfmlk/8z7XhQPS3/Uc
	aaWa5xtMRIamOO4azgXX+r9RnQQUbTn2FdY7IEtY2KrD4cgSnAnA+W6JEMP9/DpAJyz7i1keOui
	z3EjUO0PZAdefRWB2uZ5E+R/B7MYIyt9uhoIO749Qo+OlodqYESFQGg=
X-Received: by 2002:a05:600c:3556:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4ac187a80b4mr460893955e9.19.1793890039475;
        Thu, 05 Nov 2026 06:47:19 -0800 (PST)
Received: from localhost (p50915710.dip0.t-ipconnect.de. [80.145.87.16])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56eb4da1esm115774655e9.6.2026.11.05.06.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:47:18 -0800 (PST)
Date: Thu, 5 Nov 2026 15:42:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 3/7] mfd: Add a shared BCMBCA PMC3 PMB transport
Message-ID: <auyL6UF8WWwXsXrS@monoceros>
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-3-455fe9eed5ee@kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mag5oduzqhp4hkyd"
Content-Disposition: inline
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-3-455fe9eed5ee@kernel.org>


--mag5oduzqhp4hkyd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/7] mfd: Add a shared BCMBCA PMC3 PMB transport
MIME-Version: 1.0

Hello Linus,

On Sun, Nov 01, 2026 at 11:14:36PM +0100, Linus Walleij wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>.
<linux/platform_device.h> already provides of_device_id. Alternatively
if you insist on full iwyu, include <linux/device-id/of.h> instead.

<linux/mod_devicetable.h> pulls in many definitions that are unused in
this driver and thus introduces unneeded build dependencies.

The same applies to several other patches in this series.

Best regards
Uwe

--mag5oduzqhp4hkyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsle0ACgkQj4D7WH0S
/k4ILwgAu4/aIJ4jmqqXgp8ctE1FUWAaormLaedGkha0tPWWUWZFCWXzzflrAPQp
x3SQdXc7pbe9QPylO/FE1FtFum1V1mELFB8lRrsWaexQxDdOJtfgg9sa2EtNyzON
d0vLNNlqRg+eDysFNiyOOcwYa8AN9IWbE+14HBuzIKAdtfixCwirKoJ07ZKtQEsb
FghiifffoIz93iEIJWklhWkMmMWHCyo7KwUjlW+YCncCdVnLfqR8fbdBo+58IcXx
2dgAHS38lq0GpaZqg7vx8x/QrRgOxOqj6KgK724ffND0DJzxlFGTTLCkDD4AgELB
fCGGyZ3gyhvkLj7YEXBO+Gb9upim6w==
=fVHs
-----END PGP SIGNATURE-----

--mag5oduzqhp4hkyd--
