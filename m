Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795108135;
	b=DAfcAOw9FC8Dy9jOb5FpjbD6DiLnNqd68uc3MQA5H4w4c3yBiehv33EbVmcCufIiBNVI
	 X2Lr0ePcC+g9mPTTAbTeYVhONL5G7rbpukK4d72Nw4Q+vs+CgDurgpvYX36lxDcS8bBrU
	 Z2S4L1li/hBeb/U7RRBSWDP9EO8Ggi9I8XjtB9n+ugy1/+avbXLpgCDJNEEmll7a9bQPe
	 EDdFmBeadrGkZsxHSeNKCqv5y+LcXv15eT6f0quQulsf1wVrCENo7LLD/wFmSW+7puQ9b
	 UmKhWVk5U/dDIf+MmUveKlD5ytecfQF5abUjFMc2Q6fxgAptHGuLLR6M0QKHSD38bZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=jsip5LtACNKYn+7qoo5OLOP346pcqMnnFr1l7MoLujQ=;
	b=dyobYLPgpKPOmNGF7S5x/1EheGMl8joxR+pDsul0hB14QXoQrISaFxW09LOg2gNygwXy
	 vItcifg5Al8ocTLUW+gcbEti9/3NgDwZIQFCEguUMAEQL7LvuyOJWg0RA8vXElMAdKBy0
	 VtWUC47LBQRCAh6zSH+CG7DqWlArsZXar4HKacECQs22ZmqOBB/yP4piZyyh9OG8tcrQu
	 4FSI8d3opFpDrFslKhpHXqcUBTccUnH6DVtHwMWjXTHXFAwMDA1bCd7LmzXxqdurrXE1d
	 Y6aafYi360zU4/TOwdOglsd3nUmFX2PoJfcDic1pyAgG6DcouuvQPV5dm2ocMbMnqIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WU0kzWGn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C9D606A33A
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 17:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C9D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WU0kzWGn
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso5871290a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 09:08:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795108134; cv=none;
        d=google.com; s=arc-20260327;
        b=pmwZz1Efcu3j68PbzTDJgkhK/nn+30ps7cK34pbm4NJzJrS8wKx3RYJQxGEFUXNgWV
         tcOd+arPQP/AKp+lorlcwm0bspX05xO5nJEOhNlmP1a+lg50aCToZc/K3nfYsgsptOYF
         sIyZuMbHQgjlrj+pJLS1hZy6T6S16/ZY3obkH8ePjcTOmFKdaQSWe2vAGL2E9i2rBzGc
         c1ARyPTNsTBEtjg8PI7kdwmO3yTBkz79Cp/TTPfXvNj2ttnPdVkIQlNfiCZHP06YmF0L
         yH0pVgxmXNpQZUD9iwy8VMh61KkvhbnW6NC+p2NEEIUyjptF51Rs02dsAwFYlm67q6HF
         PSjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jsip5LtACNKYn+7qoo5OLOP346pcqMnnFr1l7MoLujQ=;
        fh=mxBMF56Z/NY1jmM72F/q27Dz82sQ9/4J1IT2OEIMfhA=;
        b=oKDAFC2JopD6YSPui1VYH2bl+0Cu1iV3Lw62lYLK5HX/Uujrs3uJ0bZahocyVZiqjq
         i9Syb/ocYZPh1JPa+/W/xdHdas4g8+S7O0ENc/Z798ZHlw5jk3rdoJwRyQRhwROOs/xJ
         d4TlIiEsv+pa8UUwguWAnXBh0UHysn6vb3jyz8G2taoLTPDv3qbdMWhA3CeDyBNq74Qr
         jy6yw8eVP/aAfGN29M5wlAV6LLlaAz9JzMKC5grpmwzDhTBWH1GRnSYBTvNYKDKGp5uy
         Oaiu7YMXldJAMuzH6WJ20qD2YLVWP9c7For4HsdHbIkOe1wp/udjA7h2Nh0PTj8oGd7i
         YdaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108134; x=1795712934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jsip5LtACNKYn+7qoo5OLOP346pcqMnnFr1l7MoLujQ=;
        b=WU0kzWGnQK28cjC4LK2NrlQJ+EjNsF3jHX4t8tRAUfWVliG02Q5lkA80nhgJHt57yd
         siR8WrnL+50Bq2xRqvErsiKSiYllqkG5eLc68YAsULSpAj6dtAVywEugjF2iiIgMIFEo
         HiccjeUoyfR3wpU9q/FvaFgccf3JgKoMEIrMCXTRR6dH50WFU/nzMMoKVUKjaz1uFVkF
         vMwSS+mft8KA3BvytegcqqxWJscDAOb9zjuRM96vMzpqCBh4Vem41uwryZ2h6jYfEAxR
         owoKN8fDDVFR7G7qBG7IfZS+8eBGHJPt6LCycbWY0BE0JAZDJrdlrPkrfZdab45oZT9l
         jHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108134; x=1795712934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jsip5LtACNKYn+7qoo5OLOP346pcqMnnFr1l7MoLujQ=;
        b=x6ci7GXUkJTvaoNZDQaVbTn4QumS67BPsf7CdRrl2dnp+xgvzavAeaI5/w1Sz+ZBGO
         Vmmdfgucllx1jCiOOp8D/cOlG6+M57yu7Q92/yYPFtFyWqi2zlEQbRmgsm+/tVqH7Wlr
         4xcKRfhu0dRqoTnDXNAhlVbse/07cst68AJOIY5fN80Mq60eHpa+LnkWTZXugne/ihA0
         9rMCBYGfqhiantPPJQbsaq8S4enyUaE458xqcUDwgYDriogwipdjiDReMZ7ibany8eRK
         VbhanDGMuSJM+U4ixrXLcBUPkd3Ak1gsfsYAkvKciaYIXaZqnSS3Vtgw6WPZj5u1hFhO
         68Ag==
X-Gm-Message-State: APuU4Z/7q27gVGhZF+vN/Dvs3mSSzwtxkCo5c+B+YNNiNb44Kewntuik
	bWTemEP8Uc8baNusFsRUwifeAk4fth4iH1bEHq6pjrqZZ0brhcpjse3itNQZS3McZ5lf6TVJvHG
	w6tsJ8z0q0qTgN9bnKsjmDIyxBN5j522HzEOD
X-Gm-Gg: AYBFou3rAFkGxh2vJ19aQgIolQ1/KMWqd35BK0oszHF0dq+3OaXp4spERv64dZLxoTo
	k/fTS85hbXHJgoyDaQnLsxM2jyHaXW8EpYHARCakywp8Sr2CxC3SK8ZhBnq0uSVbUXBkXsFfqgB
	BoQp0ejWvYHLc1t2uNm0l6852wdxbXNRBt4dkVwCBh/pKUcA5gsXIVeyNIJI0EKBXTaAGYA010O
	8KGbb5dyOqbMZX4Zh4gD7+/t96/0WtUGOBgyhL6Rv1x3Kz0hq6qwFuLpLk8crvv3tS3TpjZTlDe
	31qi4DewPM+Kx/ehT9iZ0qOKm2FMiulfVUn5IMEDA8H+p40jzjA71IuDiCDsNMbGcDCO5ZA8/5I
	68XLGPEllcK6cpc4cwbUSVeJKAToovbaT9wjPFrpt7Dg3rrLubf7Oyisp7EjqKSZl
X-Received: by 2002:a05:6402:4003:b0:6ba:1881:dfcb with SMTP id
 4fb4d7f45d1cf-6ba1881e15emr2086412a12.11.1795108133606; Thu, 19 Nov 2026
 09:08:53 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118092928.163553-1-vitorhg20080@gmail.com> <58a7d381-fb19-4d55-98d5-dfdf9b16e2b7@roeck-us.net>
In-Reply-To: <58a7d381-fb19-4d55-98d5-dfdf9b16e2b7@roeck-us.net>
From: =?UTF-8?B?VsOtdG9yIFNpbHZh?= <vitorhg20080@gmail.com>
Date: Thu, 19 Nov 2026 17:08:41 +0000
X-Gm-Features: AclHuK9xhN-ZQamSIlc7Z1rgFKFoYFRWnrSdpZ43JMP7Tnt5FAE7JvzbDMvBa8I
Message-ID: <CAOhXrFeOS3nKWTBZS3TqT1BmOHkjKJumns7t9R5bjGwLc_sE0g@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (ads7871) Add error handle from spi_setup()
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks!

V=C3=ADtor

Guenter Roeck <linux@roeck-us.net> escreveu (quinta, 19/11/2026 =C3=A0(s) 1=
6:49):
>
> On Wed, Nov 18, 2026 at 09:29:28AM +0000, V=C3=ADtor Hugo Silva wrote:
> > The ads7871 probe() ignores the spi_setup() error return value
> > and it attempts to write to registers even if spi_setup() fails.
> >
> > Return the setup error before accessing any registers.
> >
> > AI was used for peer-review the patch.
> >
> > Fixes: e0c70b8078629 ("hwmon: add TI ads7871 a/d converter driver")
> >
> > Signed-off-by: V=C3=ADtor Hugo Silva <vitorhg20080@gmail.com>
>
> Applied.
>
> Thanks,
> Guenter
>
> > ---
> > Changes in v2:
> > - Clarify what happens when spi_setup() fails.
> > - Describe the fix in imperative mood.
> >
> >  drivers/hwmon/ads7871.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
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
