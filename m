Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794994376;
	b=IPspIUHaG3fliqwwaLWcl55EWn3m2J09FxAhTtCRqXMvB++wpksUHgdExtv0ygK0EkUI
	 T5ZrmeFt/7i+8d+zjLJdYPuUsUq+W6TfFX8go5FMGhHmhxdc2o+4M4DJCHGNB7KpkPVvu
	 TrOXwsyOfs+Azf4xsCNVOIkiH1zZJiSgFIzsppp6bGJ896K1dEJPI5jySVkl8+9YLf+eL
	 MJOZIadZDCtvQ/S6OtS6iVhmBa/EaGMyOX9iPK/9PR3reS0Ja5F04rCGbGpX/Fao7Mhgl
	 2TZSW85FUIdWe20yfetTpoPm3obzGtUroJC+VsZwNvMZnIcVo5xWsRPAiPifaRoFXCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=1og26ai2g5/1tjoNZvFJW/L87BQlfRg2PfgGs0r2tR8=;
	b=AGCZ/98KPSfo6bIlN/E2tRocWG4M+wzBwGPDN5N361DbYsGHeVxFIgbrawp0+aHSSIcm
	 uMxcMXQXqVriud0W/SrF+t8ZAF+6xQLKldpflNcVyk9IVFIL9FaUPyRChB+SuIKMMcyW9
	 zhx9QRD1bcAb45RXjIw+HYa6ftCiDABNqa4hGGuchNJgBifE+F/Lzhd8Oj/vn8cFkHagB
	 m2fBBaLE8Ke2cV+C0wSacKfGXNd2Lq7bIv9G+RQ3JatnItQ9fKiHHIe5W4q0wRaNCIRX2
	 bOrQgf4xJCf2dObtp0YgHswWIR5VA5deGoG+/6Nj+xBnB9PFjHJJ9S1C4wlTIpBianw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUyLLo7T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53254606A320
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 09:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53254606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUyLLo7T
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso1289478a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 01:32:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794994374; cv=none;
        d=google.com; s=arc-20260327;
        b=hx4eLJn6Xv1cYWWjlZ+gQaZDZGXyMiIfGMdNmCciRevPnYmarzaa9HJlcgXMtG6F7L
         7ZDNkHf3pG2ABT7IRZpB22p45v5UUiWHviXjKBO/j0T6K9jc+Pn+JpHlJIhCbicLJtvA
         AstP1ZEhQrEst/nX5EK8Ci2RBxhNqajOkiNkdbYsJQ6iw61bg03fd8J2uKLfD+v+EUmJ
         yRrJwQ81U9/8fSO5fAHgh9t7m/lJ2MXlrONJ7GEv+OtlAwkBUCEh1pFxMte03WSOKOk3
         KoSavbAZN9BB/ZthXNn/VKQPXQbzFWRNjRBsZaP1xKXw/xEW45igjoYfQQKbshuztSJ2
         I+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1og26ai2g5/1tjoNZvFJW/L87BQlfRg2PfgGs0r2tR8=;
        fh=mxBMF56Z/NY1jmM72F/q27Dz82sQ9/4J1IT2OEIMfhA=;
        b=RH60wKB61WzTMOJqNb6NnY6Z0vRHstDJmdBzovjSRGrEn+1H2XBH1kQ+3lW9gKSJzX
         dBUhCv+jdXwkhDUoxrdGmoeb1J5aBChrfoJxFg3tBNcbmj/QOPLswUyXxJjcXf3lLJF1
         EVatdIFAGNu1P6LP5qhDrdfPU0KZIYkMMUfbfAMNV78pCtJopnYXZH7L+gfPC2OOf/EN
         yzBwlqaorrzw9wfOmP9e1rLVvAovUnmw5L0EY+3icOY5QBIIohrcCp1jSj/Ufn9jNXTC
         Pt/QjAEoLJ1V6U3e2WYTV3OFYEDLUpoKSNZujq/YjwpV2qbH93ecDNpT0s9lON8uPOtc
         rQJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994374; x=1795599174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1og26ai2g5/1tjoNZvFJW/L87BQlfRg2PfgGs0r2tR8=;
        b=NUyLLo7TKo8kd+pdxNJ17kzQAc3/3WX2/6eyLeImBX5Kz/SK2YTsHys+7s6myaUo6U
         yXzIgaDwHjCziE76JfjGHmZkGqrxAqkXIA//TA3OhZ9qnziAHm782Zs4aoctaNWiVmMw
         MsVXEZxYaGsnMWtiFAThQ2FOAKdlPbtuulnEblFM27VfaU10TRZ1e6yZ8pwcfTEniziS
         oAQs37tvkficajAKBkbRf2m0aH3rOk2B2S5FPx65C9hCbO/ikgHzQpuudT7f8FJk+SmZ
         3HS6YHMKVdpGhcYxtSkU9mdyW/lY1gLOjAlEjwozZBVZrHojThDYD2tvKqLwjqqdcIiz
         sSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994374; x=1795599174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1og26ai2g5/1tjoNZvFJW/L87BQlfRg2PfgGs0r2tR8=;
        b=epMQ0tBTDh0PfeiMfEovj7T1v596Cgj8JOaVdv1Uxbb/xgCKO+zUjXEUjhjFNiEJ4z
         jnNLAkzCBevQgSkv0t02XyLywAnVjIjtX4//ODDXRJIXauzZyoI3I/eauuYV6QHU9ABx
         6Rinwa6y0cG0dJ/uwk/IlvYJC0NFilVDvgK5v0Dcuc+0zgjUGS7JgvLBfkKFSD96GmlD
         6Hm6IFlkYHElrcYewwXz/xbSL7HLs6NygwFljKFF7yi6TfJl47c0cD7JN5Em1K5ZfqwI
         bZm3rwVNe8zmJcmrBI0iVJDyDDyqV8JT0JSUmaBg+zfw1lhHC2GLMImGVvs+c3d7GiB3
         GybQ==
X-Gm-Message-State: APuU4Z9h18QrjdIV0EQ1OIqKb6OWUf0RfCoUpYr1eN4ZpZXUBwaTA+Xr
	b8018TtNDQYUrK4f4uguyXuaosnqmYbKoGZ9buT6bSlOnTIikTAU6wPGmIBTxHbVYshwu7n2ce8
	wDfbsiB5epQudrFL9mJa/CiykE9X27ERfgEjjucA=
X-Gm-Gg: AYBFou3NGnLDEe98m0C/6WziNul7YvE7vs6+ovsBcCBIa0R1i+XHF9hNBJisuiIGly1
	WKlNya5lDpRh61cnobsNkmpLglZkZAy8Lm3UNb8WKPQJNbQ+1j7sYIk6y6Sa3KUwCX+VKqkHvBe
	ZRPIszM9pecBUDIXJb7aKkrA7dsEhXofG1ACUf2T2KQCdNXRAmgvbF4hRNcy5MVU+pXwQb7H+Ac
	lwHVSsBNYhKdKoAh+uZ7pgDepikOPinm7LA13AhoXZuoYb5x9ofkTNy2Tj4UJsY8pKfmrZKaUqM
	xKIgAVLzjzJcCbmtoiKQCIn0zuUdWkGXHiYg6Xb60vV4WL+gFLbheNtTz/PZAPzGqbCe/LTAeIU
	EIfuw8ijho+5pwS2l2xJKnFvfjQ//jh+e/KiA8AhpJjyJ1ji5QG7gbxsn32+1scxD
X-Received: by 2002:a05:6402:c894:10b0:6b6:e8cb:642d with SMTP id
 4fb4d7f45d1cf-6b887eb24bcmr1021031a12.8.1794994373377; Wed, 18 Nov 2026
 01:32:53 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117205132.141964-1-vitorhg20080@gmail.com> <6fcf276b-8e06-45aa-a780-f91bcf478d8f@roeck-us.net>
In-Reply-To: <6fcf276b-8e06-45aa-a780-f91bcf478d8f@roeck-us.net>
From: =?UTF-8?B?VsOtdG9yIFNpbHZh?= <vitorhg20080@gmail.com>
Date: Wed, 18 Nov 2026 09:32:42 +0000
X-Gm-Features: AclHuK-NU1K_-Ddmc1vQBFnPhIET7kbdmrk1i1L9me54bFB5GXP_DNSaJgOvC60
Message-ID: <CAOhXrFcNqDCU6RC=EmL=NCPyf78rB+403mfdkbFLF5aCog==Jw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (ads7871) Add error handle from spi_setup()
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Guenter,

Thanks for the review. I've sent the v2 with suggested changes:
clarifying what happens
if the spi_setup() fails and using imperative mood.

Thanks,
V=C3=ADtor

Guenter Roeck <linux@roeck-us.net> escreveu (ter=C3=A7a, 17/11/2026 =C3=A0(=
s) 23:15):
>
> On 11/17/26 12:51, V=C3=ADtor Hugo Silva wrote:
> > The ads7871 probe() ignores the spi_setup() error return value
> > and it attempts to write on registers even if spi_setup() fails or not
> >
> or not what ?
>
> > This patch returns the setup error before accessing any registers.
> >
> s/This patch returns/Return/
>
> (imperative mood, see Documentation/process/submitting-patches.rst)
>
> Thanks,
> Guenter
>
> > AI was used for peer-review the patch.
> >
> > Fixes: e0c70b8078629 ("hwmon: add TI ads7871 a/d converter driver")
> >
> > Signed-off-by: V=C3=ADtor Hugo Silva <vitorhg20080@gmail.com>
> > ---
> >   drivers/hwmon/ads7871.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
> > index 36297bc6d047..a1ffc35d9272 100644
> > --- a/drivers/hwmon/ads7871.c
> > +++ b/drivers/hwmon/ads7871.c
> > @@ -187,7 +187,9 @@ static int ads7871_probe(struct spi_device *spi)
> >       /* Configure the SPI bus */
> >       spi->mode =3D (SPI_MODE_0);
> >       spi->bits_per_word =3D 8;
> > -     spi_setup(spi);
> > +     ret =3D spi_setup(spi);
> > +     if (ret)
> > +             return ret;
> >
> >       pdata =3D devm_kzalloc_obj(dev, *pdata);
> >       if (!pdata)
>
