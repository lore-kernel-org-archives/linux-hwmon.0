Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3931EBFF9
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Oct 2024 15:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729784462; cv=none; b=OB38BAbgYaD0dsQ0/rgFVDos7/3F9FjhpiNdAJCmRVZSQEICJl4j81GtnUq6pwz94y4U469uLCXBbefTVh244JtJGbrUBnWgxnN8HNkpXUrTRpOqsemBBj7bJTyCOagS19aMCH3YRsMmNQZqrfao5EVY78BcHZ34ADBpcsjLy7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729784462; c=relaxed/simple;
	bh=xpmWqBMMZY+ldlsuyI71jzCpxTAScS3Agp69Pc+fSVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FiswjFZb/VQln8gF2Nnv2LkcKd7hr9eQYNJGcsdnyfkO5n2swZWZIZ6QX1VK9ZfoBWWGsFFVXIDFYPS3pPYAfSDBLICS1K9UqQivlXKj8I6yUjLybOB2A3YGvSF46fwgQagrIBCgmgq4FCKDMdZuplUC7TN5ftytmoWy/J8r6No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=h/15Vaty; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="h/15Vaty"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d49a7207cso757252f8f.0
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Oct 2024 08:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729784459; x=1730389259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0bCYWtAOVAoz7K5tYQKyYohM0VdNcKN2It0cd1+edXw=;
        b=h/15VatyTE3kOoIkNvZiFQJnFvB/d8SgzXcLMJTbo1DgSiL/FcuwA+cztwU+NEaC9s
         qIxiiQxFbYDCtY47DBVJjIzw2BQDVFX/gZYJ83b+iL/RDsLGcwFDaiKq4oVEIFE50DnE
         xhmNPw5XOYBCDthAnv9ZNOKylH2o3k1nLOVSLqfkB/Sg1pOn/sRMT62jbNGUNvlW7HZj
         1m6QegbG71tmcuPeeB7mWfoU7H2GA8idHyA6zKK6OiS4shhmUzMi9T5kj+/sW5OTSaZy
         b17slhlt37WZ6uOkPvQbgqg/2L/yrtJDB46WeGr+zX+3z8KnEwDpjdpKgOGImpRxVodL
         grEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729784459; x=1730389259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bCYWtAOVAoz7K5tYQKyYohM0VdNcKN2It0cd1+edXw=;
        b=OsZYbmtiRSth9F/d6QIVGKF6JVjI1a6zhTLWkT3Nvqjq6wm7/5V52y95BB+BeyPUIP
         15Z/En4DthDhk8L22u039zWuttWlcs7q2xsNeEvKfAv7jfnMrAdH1CpPzFVeQTia2dxp
         Uy7GgbfIaPAUXoFuxaG54XWA8IwKNsE49vkouOnWbEkKAEedQ7LCzJ8wyDQ9EjzPAPEM
         kLJ44Xe+J9/xBrQ1f8S9zvr6iq596tRz7NhVWPF+HeH+AWiUGL1S3hpha3YqzLSHfjU8
         A4uCXWqoIgcT6teooFcdE/2PKlrtscqoyyhYhycTCH3fP0U+uni3uEhkFDPbVJAWaLrN
         DgNg==
X-Forwarded-Encrypted: i=1; AJvYcCVokJUYYtpXc9Vc4obEjCaLdU/0PGWlUID7jJO/qjv/Trp8eG6CpPrgml+KQaZrWetxdCSr2pHXo0s3hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWN8gTVN6t0oma+8/QYxaDzpgfVhJWSicGS22AXh5AaNgXgVTb
	KSZw+CoVV3/TwUerS9RSu5cj+Y8UpF96sBOGQxvgmhvxHAZekxD4kjqZYUO911o=
X-Google-Smtp-Source: AGHT+IERp2/eNZzsX4yv8fUUuhjp6KA5+OA5MDnyg6uPYvR/RwNU6G6ctkdJPcWzcvsaqhcAR5Qg3w==
X-Received: by 2002:adf:f7cb:0:b0:37d:461d:b1ea with SMTP id ffacd0b85a97d-37efcf898d0mr4107198f8f.48.1729784458868;
        Thu, 24 Oct 2024 08:40:58 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a64dc1sm11574470f8f.65.2024.10.24.08.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 08:40:58 -0700 (PDT)
Date: Thu, 24 Oct 2024 17:40:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH v1 0/2] Enable WDT reload feature
Message-ID: <nm4ckxv6swajr6hnqlkq5uoo6ncjzlg6yfxroftat6dubiefyi@xbhi4dvqacxm>
References: <20241024071548.3370363-1-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a7vvl5mbgvv3nbps"
Content-Disposition: inline
In-Reply-To: <20241024071548.3370363-1-billy_tsai@aspeedtech.com>


--a7vvl5mbgvv3nbps
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/2] Enable WDT reload feature
MIME-Version: 1.0

Hello,

On Thu, Oct 24, 2024 at 03:15:46PM +0800, Billy Tsai wrote:
> Aspeed PWM controller has the WDT reload feature, which changes the duty
> cycle to a preprogrammed value after a WDT/EXTRST#.
>=20
> Billy Tsai (2):
>   hwmon: (aspeed-g6-pwm-tacho): Extend the #pwm-cells to 4
>   hwmon: (aspeed-g6-pwm-tacho): Support the WDT reload

Huh, I'm not convinced that extending #pwm-cells for that feature is a
good idea. Unless I'm missing something none of the other supported PWM
chips can do that, so I hesitate to change a standard for it. I suggest
to make this a separate property instead.

Best regards
Uwe

--a7vvl5mbgvv3nbps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcaaoUACgkQj4D7WH0S
/k7IrAgArevIMEswllDmtB0TRJ5jEVNA4EsDQ9gZpjcVMdMbOCk91dxWPNaRWLqz
ZUO6YMK+BjGJDbYkAI1x0i73kN3YXUSAxcAAAiKeltHm3LgGqmJgNYFSGiGfyWfr
RZTNj7fkFkLBIJvsuuTV3JpVFuYpd0Sb9kWnsClMTwGoY8macjZEJU9E7syerxE4
soEUTZpYo8Rnj7qAIoBQJaj8R8wjlpzlT2Mge6xQ+DefHx4fCKuACjtmR+wzQVuq
4EE/51+wMfTDdzk2ZTjJwjYHQYTSGHoNSUhgBxtSqve5A8Onb4NRidJbXj2Hk51x
GC8JYGqYPWON7jZmu5rUFjw8yD+kLw==
=TvtQ
-----END PGP SIGNATURE-----

--a7vvl5mbgvv3nbps--
