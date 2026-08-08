Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB39F31714A
	for <linux-hwmon@vger.kernel.org>; Sat,  8 Aug 2026 15:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786204460; cv=pass; b=txHQ3jnJOH/vYzwVcYdugvkz6WR/VDppgLWDhs6uD1PMn4yAz4Agp0QAHzvTgM9woAFjzxnBF8QCJEG0Waix4VecXyQ59/CFmgf4UQ4sdhzoLvOTSKSE6ZExuW6h74um2YuO9OKGUAcf/gJjrqYdwwPjRt4UaS9Ku/vPeof3jao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786204460; c=relaxed/simple;
	bh=Z61U2aLKy91dURepvXcUGFLDUw/MTGNq6cUyqZZIUsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UUFW8pvq3OxJdrc2HJ7gfXFBCVLFJa9KxNJg359sQAJM7BsQg0KkA0w06cZWt6L90j48a2YbR65Fs7AcDWoLgm3stnt7TTIBBfs8YivLMyhVy1hI/xQCZs89FZlXpqdlBY4g/2LctBPt7JRQSS3jiRlSc2gwl5toqn9ONOnGpic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFdMwq4G; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFdMwq4G"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6685483aad2so753721d50.0
        for <linux-hwmon@vger.kernel.org>; Sat, 08 Aug 2026 08:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786204457; cv=none;
        d=google.com; s=arc-20260327;
        b=icsUur15lmpnJvrJNoN6PYEHiECLLmxKUSDfXBpKVwgI5DXBjhw0SZZFbW35iUowRq
         MdUcFJB/rY9OQiVCU7J7WpiksQsxjVXMzSV6FRpcsT1D0J686G/Tz+d7bapKRDR3fcJq
         u3UfE9NpHSBynkbBG3PIP+mkpCiOTjStp9t5its4sItUr3QGCtSS7zUmKnsYJTa6S5aL
         pZv2gi1aHbAddf49shdPq7vIYpENG+m9FezRaJJAfYyszJsZFgJGdgKlr04pR31GIQSi
         bnO+wGwznO4bBo3dsYJCpNrU1PJDiHjs+bKL2OWuqinDFuva6K6yXZT+DeVNosEq5Qcd
         KwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tmmozAoFPxbiX7Ml4TbJZLUpZqv+WQt0GmrM3lKqKQs=;
        fh=Gv1r9EWk2B8ufkf63ExmU4CSHBslejA5yunKD9GzsZk=;
        b=gNWEMDWludK43xDQ743LJR87tLjneKZgMu3aQaX4/9q0tNlb1LR0oVJ8ubNdolMVf9
         qFdPYt6ERk+H8K1pj/gLw0cf7eKICfOkngvpDLO69CVK+ZJVSR6quGuIba2Oz0WPYq68
         fxPUL2kU7puT0mWyqjzzue1IZfKDAM3TkvGevMFuFu2bX3vK+xrfggb4aa7Prg3ebcFB
         3AO09MZbUxIWGpSNagOya8tZmpQ9fnPVS1urtXOsYv5L5QeuZ884D0qlR+o4cPLZXbIj
         xdYbtxR7c1Itq7QvDu9ONrwXeindzS7EuSQx/1Skoag97PSPjnNZ1sF/zq/iYUE24UqB
         eLLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786204457; x=1786809257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tmmozAoFPxbiX7Ml4TbJZLUpZqv+WQt0GmrM3lKqKQs=;
        b=EFdMwq4G2owA+uvx9zXqHD95l6gDtaRbDm0EvBe73hMALhmC37M4t7auQrMWMDT8d1
         I0mUtJd5ngyzNeUU0pJgAu10Xwi3Squiw+NyYpA7JP9jRxhBdx1Fhtv98lVlB/Fi94rK
         NQi6tdKIUZphQ9LWQi1NsOP6Yo9fM2tgoatmR/qZ2iQEXMoAJgfvzUKhXr7adFQ8keAz
         Z6UYDrVTe4OGkqS6k2BE+XvBckmE60/NSSQc7UdIQVi4ayJsg6es22G2f5zWnGY7jHfx
         JBmzbpOrsajq0u6C4tDm2Y1UKl0ZulbeEe98yYvU9lCu9OFnk7D6xCZE4sx1WGce/AF0
         AYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786204457; x=1786809257;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tmmozAoFPxbiX7Ml4TbJZLUpZqv+WQt0GmrM3lKqKQs=;
        b=FEQZD7jf54PFDVGWUQolz9erpJAzB7dYr0F5nBD5HXm5GI3rLirKfSX07U2HEbFajw
         TIToKyrNugRwtY6LjumX/05RvuHPmAC8SmquRUhsfQaavg/YhevBMKmLt76O5NaMoC1f
         hWVNEYjVDX9NrfJvLtEmCT7+bZLhyrPMJJMVmaugo3W5esatehMf8sZtnOM7gRA7wpNP
         UV8uKbY691+mNok34TbewwVbQvBkrzo8VdgtZzzIhpzP5y0q3uMzbmdSlgU1dQPn7Cij
         W3b3zIAAK1WSmhcTAOLZK32oZYUxr76tCsJYiCRJTn7ZYajJ5BozFi7znFSxWtaH/aOt
         QFZg==
X-Forwarded-Encrypted: i=1; AHgh+RrgagZsRNX1qge4EVK6D7ueyGajf4fUFUc0RHGstmUPKR9rOK486k9qGk+YAtU8ShHwSpqtXteUqLoRQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygahyr9f6BRWYDUtsbXB14Iz8uafs12v8RvLsiKvl1gm7Ns16F
	bdqWip7IzLM/wNGfo8JWTvSz49iKAbD6FENPg4XqEnejhR67TBTyp1hmel5T9kHmfpFNVQTmaiF
	GquHHpUkTNDgCGPBfJyWnOcTtYyYFNUE=
X-Gm-Gg: AR+sD11hVRhq7OGEAYFoMNNblWvpz/P3JyST0rmPDxM0WELbYP+0lEU5hPE2lha48A6
	/ZrG8PlO/6ThIUM/68/2hrMUwx3MYpv7Clook1oXAwWqgwr8Tr9c+4GEp88Sz91oNWgd0ES3HE7
	eLGQzf1Mamo6Scq1HsXwemNNreOYR9fjKerRFBvwygjB4aEhxFVvl0Yf8RJ9j/K9PEaE/4FGgzE
	p5BJf6295WmTnF/x8n6i608OEpPwtSTCwLsm1brYHLcksOnqGr2wQJX/p/h/fTM2vY8XXpUemDu
	zUGNpWaFKH5D/7TuuT4AFcj3KPVHqzKyGj7yZawKQg2P
X-Received: by 2002:a05:690c:d0d:b0:81f:2825:de9 with SMTP id
 00721157ae682-82576533d01mr51258327b3.20.1786204456793; Sat, 08 Aug 2026
 08:54:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808083718.2612205-1-congnt264@gmail.com> <2651758d-e588-4c2e-aa1d-13772e09874b@roeck-us.net>
In-Reply-To: <2651758d-e588-4c2e-aa1d-13772e09874b@roeck-us.net>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Sat, 8 Aug 2026 22:54:05 +0700
X-Gm-Features: AUfX_mz5GF1q56tS2zYfboRT6ZfTu67C9LkdNH1TD9fQSgIi5XS76GrcwpbKOGs
Message-ID: <CAJpJ=Gvh=M9_Fq8g7sCCWYz=d+9VS1m4zbwZFbnKJ+-YdQtneQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (max6621) fix negative temperature offset and crit readings
To: Guenter Roeck <linux@roeck-us.net>
Cc: Vadim Pasternak <vadimp@mellanox.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 9:48=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 8/8/26 01:37, Cong Nguyen wrote:
> > max6621_read() reads the temperature input, offset and critical alert
> > registers into a u32 and assigns them to the output without sign
> > extension. The device reports these values in two's complement (the
> > driver comment and the write path, which clamps to
> > MAX6621_TEMP_INPUT_MIN =3D=3D -127000 and encodes negatives, both rely =
on
> > this), so negative values are misreported as large positive numbers:
> >
> >    - temp_offset: *val =3D (regval >> MAX6621_REG_TEMP_SHIFT) * 1000, a=
n
> >      unsigned shift, so e.g. a -10 degrees C offset (register 0xfd80)
> >      reads back as ~+1014000 millidegrees.
> >    - temp_crit: *val =3D regval * 1000, so a negative critical threshol=
d
> >      reads back as a large positive value.
> >    - temp_input used an s8 intermediate, which is correct for the
> >      -127..127 range but reports the documented +128 degrees C maximum =
as
> >      -128 degrees C.
> >
>
> This problem does not exist. The AI is hallucinating a bit. There is no m=
ention
> of +128 degrees C in the datasheet.
>
> The problem here is that MAX6621_TEMP_INPUT_MIN (-127) and MAX6621_TEMP_I=
NPUT_MAX (128)
> are wrong. That should be -128 and (+)127. I guess the AI doesn't see tha=
t.
>
> > The registers are 16-bit (the driver's own PECI error codes occupy
> > 0x8000-0x80ff), so sign-extend from bit 15 before scaling. This fixes
> > all three reads and drops the now-unused s8 intermediate.
> >
>
> The PECI error code reference is just confusing AI slop and completely ir=
relevant
> for the patch.
>
> > Fixes: 92b64580f14b ("hwmon: (max6621) Add support for Maxim MAX6621 te=
mperature sensor")
> > Cc: stable@vger.kernel.org
> > Assisted-by: Claude:claude-opus-4
> > Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> > ---
> >   drivers/hwmon/max6621.c | 11 +++++------
> >   1 file changed, 5 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
> > index a7066f3a0bb4..03ac3eb5a594 100644
> > --- a/drivers/hwmon/max6621.c
> > +++ b/drivers/hwmon/max6621.c
> > @@ -204,7 +204,6 @@ max6621_read(struct device *dev, enum hwmon_sensor_=
types type, u32 attr,
> >       struct max6621_data *data =3D dev_get_drvdata(dev);
> >       u32 regval;
> >       int reg;
> > -     s8 temp;
> >       int ret;
> >
> >       switch (type) {
> > @@ -225,8 +224,8 @@ max6621_read(struct device *dev, enum hwmon_sensor_=
types type, u32 attr,
> >                        * The temperature is given in two's complement a=
nd 8
> >                        * bits is used for the register conversion.
> >                        */
> > -                     temp =3D (regval >> MAX6621_REG_TEMP_SHIFT);
> > -                     *val =3D temp * 1000L;
> > +                     *val =3D (sign_extend32(regval, 15) >>
> > +                             MAX6621_REG_TEMP_SHIFT) * 1000L;
>
>                         *val =3D ((s16)regval >> MAX6621_REG_TEMP_SHIFT) =
* 1000L;
>
> However, as mentioned above, this is not a problem in the first place
> but AI not understanding the code and the real problem..
>
> Guenter
>
> >
> >                       break;
> >               case hwmon_temp_offset:
> > @@ -239,8 +238,8 @@ max6621_read(struct device *dev, enum hwmon_sensor_=
types type, u32 attr,
> >                       if (ret)
> >                               return ret;
> >
> > -                     *val =3D (regval >> MAX6621_REG_TEMP_SHIFT) *
> > -                            1000L;
> > +                     *val =3D (sign_extend32(regval, 15) >>
> > +                             MAX6621_REG_TEMP_SHIFT) * 1000L;
> >
> >                       break;
> >               case hwmon_temp_crit:
> > @@ -254,7 +253,7 @@ max6621_read(struct device *dev, enum hwmon_sensor_=
types type, u32 attr,
> >                       if (ret)
> >                               return ret;
> >
> > -                     *val =3D regval * 1000L;
> > +                     *val =3D sign_extend32(regval, 15) * 1000L;
> >
> >                       break;
> >               case hwmon_temp_crit_alarm:
>

You're right - temp_input is fine (the s8 already sign-extends -128..127),
and the +128/PECI reasoning was wrong. Sorry for the noise.

Agreed the real bug is the clamp range: MAX6621_TEMP_INPUT_MIN/MAX should b=
e
-128000/127000. Would you like me to send a v2 for that, or would you rathe=
r
just fix it directly?

If a v2 is useful: temp_offset/temp_crit also don't use the s8 - they scale=
 a
raw u32 - so a negative offset round-trips wrong (write -10 degC -> mc2reg
0xfd80 -> reads back 1014000). I can fold a (s16) fix for those in too, if =
you
agree it's a real issue.

Thanks,
Cong
