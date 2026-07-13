Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACFA353A7D
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955620; cv=none; b=CrFjrcL1H5z2tXkM2Q2N7eyLnivClq9ai/Rw6zMrSIUjoWp503ad2M6rsKV4h0BwtiO/UdIbzQA25RhCa0vIBN4ZQhgBmDoZ+0D6grRm3eWQHDQSiTBlKVzxO3bhMe8wbOocE4l9RYOJdsgnAYUD09yZuZ9pkUTelIsaisFLBqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955620; c=relaxed/simple;
	bh=NqBUMuN62l5N2Nf1UtzR+VlT4Ju3NnVcgiOFc6mKLQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQwUSkixtU3kSl6jc/1eU+bYlpKgcqHiNMebBxUpwomtywKpZzXRoD38CAfelsXTrCuw68VZeGsQmTNfFBS4jKcJ/C9vSTKEsh1QrhtCsY0h2nTiMBT13nGwQdEmG70If3k134wUnFoeF04LvORnfjwWbu3zpX2Ypy73xLLXdfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XvdxBJZi; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XvdxBJZi"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso237835e9.3
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 08:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783955617; x=1784560417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NqBUMuN62l5N2Nf1UtzR+VlT4Ju3NnVcgiOFc6mKLQ4=;
        b=XvdxBJZiGOn9DYNXobKCx2I1xUNkxnaPpPOJPhtY4NqsnJRHQ1TtSipMtIIkQlU4cD
         p3XjlgqHYDCEWs8aiAhMK+JuUsM1WjMnCuoysmDv/dbC+FmcwuarSChgOlOBxU60c4qL
         81TyXSGmXG/bk9SB3pgwyjlad7iS/ZYCnjseZyM+n265+vDedRHuv5erkE55uYYyib3e
         defNPDl2ho8eSknuLipDb4Je/LjWaGox0e3S8GqfypSw8SkPM5IgwYut7WontUfK1HZK
         R+Hc6q2fkNDkhRA6Ae7A18nOvSkGbmNOzhDkf2+j1/P7GMdxYwvn95jk0w+s+xCGTraw
         /Cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955617; x=1784560417;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqBUMuN62l5N2Nf1UtzR+VlT4Ju3NnVcgiOFc6mKLQ4=;
        b=hVfSwxeDc9fJMNanPspuAUqviwTmG0zSCFBQ5GZmsXwT0FwLr/pCHpYamcSKgiehAx
         IuEmPrDiZCQl0+HQOMkbi/BM3+vzqkbn+OJaUgfWhKysvhge6n92cAGquc9OjbK5sFo6
         yC7zRqV1/iOMfMYHcU3Aeb5IS+KI8UigoMox/ZD4iJcR5a59Dxqvn7Wtq8yg7tbI0cT3
         4OViZwtenRnwsksW3nz0nTjNOlNuay1dOG9Jl+5DF5b2Bm6CoA+ic6Ms1rJoy24DFk+u
         DOXlGC3Klw3IRLQOsGb3dbrSpyEDJftxQ4Zaexl71jnVv3RDdd1TPZEVTW2c8pOGlAHz
         xdzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5rs6CM++7mA0w/PUJ3qEvtuTN7zxiO9DQiaQoc9ZsO2Vj++Y7ZaBKzl11dd3I+NctptxsM6gtQH9ZoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxWMtFkuVqkVcrR+9u36aU2xHzC/Qxqw9rRme0ywKUIK9R5pKM
	lr6Ya0PK5wY1OMIweEQuwiZuwDo5i9wMjfeRT5SfxOfMU0rISUIF/H5LC3LuoVCz034=
X-Gm-Gg: AfdE7cmBklldYwg48GICOnxULIg3cD80JMqBR2//ZYxP+ot9qMlXqiMXE7sD5JqHvmr
	vcSa+TKIUQyG+MOZiIMVN16YzcHC+KtLlyJ7iHvQCZ05/x/+WReCcM470zOlwSQNU4qLofsgRhx
	HIS0fylh4yRzEDKNh0levZ2n7fTYBJmD8jFjhFtXJAqJ+2A6wilerKi4qtMZ5mXM4OJC/YDBHAa
	32XIEWtOHHS7u0c91fegGRkZOvyU2waTYP0/FfPPrd+7HovQF8pgDTijeis+yU/oiWFp5AsG6n0
	JtK6GH2ybWclDqg12t7LWoDIEIBQjUOEoS0FEI8Yzr9V3demDGYXPQ5VfdJ3XMNB50wpyb1BdCS
	4uXqvGLlk5CfpfsveRsS5itshRTdLrwTE5/h/wcMVX5LDO/gbJyGpCYLL/MIJ/mJOEwnJUjNo/4
	6Vqq/HissisdJiTOdbG3WDcSqOX8+7YVUcZESjBtUP3K7a+KufuMRCftPw9z93Z3ERCCWfAc7Vf
	LCAquE8vrL23FE=
X-Received: by 2002:a05:600c:310f:b0:493:d115:d835 with SMTP id 5b1f17b1804b1-493f87d5800mr97585625e9.8.1783955617181;
        Mon, 13 Jul 2026 08:13:37 -0700 (PDT)
Received: from localhost (p200300f65f47db04916e789240f263e3.dip0.t-ipconnect.de. [2003:f6:5f47:db04:916e:7892:40f2:63e3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950a32c65asm1588755e9.14.2026.07.13.08.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:13:36 -0700 (PDT)
Date: Mon, 13 Jul 2026 17:13:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	David Jander <david@protonic.nl>
Subject: Re: [PATCH v15 5/6] hwmon: add NXP MC33978/MC34978 driver
Message-ID: <alT_Scg-gKCvnx-M@monoceros>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-6-o.rempel@pengutronix.de>
 <alQS61NF-jIPf9c3@monoceros>
 <6fa34460-7753-42cc-b88c-4e5aa58a8e90@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fnnztlncnaaigsvj"
Content-Disposition: inline
In-Reply-To: <6fa34460-7753-42cc-b88c-4e5aa58a8e90@roeck-us.net>


--fnnztlncnaaigsvj
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v15 5/6] hwmon: add NXP MC33978/MC34978 driver
MIME-Version: 1.0

Hello Guenter,

On Mon, Jul 13, 2026 at 06:20:48AM -0700, Guenter Roeck wrote:
> On 7/12/26 15:20, Uwe Kleine-K=F6nig wrote:
> > Hallo again,
> >=20
> > On Fri, Jul 10, 2026 at 12:13:54PM +0200, Oleksij Rempel wrote:
> > > +#include <linux/mod_devicetable.h>
> >=20
> > As for patch 6/6: Please use the <linux/device-id/*.h> you actually need
> > only instead of this catch-all header that I want to get rid of.
> >=20
>=20
> This was only introduced in v7.2-rc2. Not all contributor branches
> (including my hwmon-next branch, which is based off v7.2-rc1)
> are synchronized to that release candidate.

In most cases device drivers don't need to #include
<linux/mod_devicetable.h> explicitly. In this case the driver uses
platform_device_id, and its definition is provided by
<linux/platform_device.h>, so the #include can just be dropped without
needing to be based on -rc2.

Best regards
Uwe

--fnnztlncnaaigsvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpVAJwACgkQj4D7WH0S
/k6XiwgAgXFXSkiO5tdspT8X0L+4tJrphihgjuzS1A2yZJ9tMyfIvhcg/eiXPZSL
DWoqAABbSTdxTvxvOW6IIptwPVfkVSRE6pw38mmzCOa6Uqa9ClQiPwM8kJl5A7GQ
aVxOaEKxIaq5SUS2mzzZ1G57e6DDCK3T9kEAydlf5d5D2gSjfm35CmyFElLfLwsH
SsvdxTDjsnmfHke5OKhgFXgyTUDJ756s7YmmOH/9RByitjtSPEgcZjoz9SrXqWfF
Wg1G9bzYGoY3SO38PsRu3hwGtkBSxrSkSuReMIHTdgm9cQiNHdq7VjBvKztmsz0u
o5cEjK8RfXLOMD4EaqpaVl5hJvDTXg==
=ac6S
-----END PGP SIGNATURE-----

--fnnztlncnaaigsvj--
