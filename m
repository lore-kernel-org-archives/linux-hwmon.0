Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F6435944;
	Wed, 15 Jan 2025 07:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736926965; cv=none; b=AfW+LunlDyeeorVKSkBfKu5M1B7yMobcOzoCDNeocEHEIv2xxdpimWlcNsObP0iuHwazEwwomld5NbEllgdtNUmxnughl+6l2rr/CEk72QjIaWCOVn8o7869FrWzh+JMllX7EjEbTHDOr6zDjrbFLJmyuIGQeFmuW8meXVHmbpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736926965; c=relaxed/simple;
	bh=Q3PJp5HE0YO0r8URPsO6J7HCltKNBku/OqDt7CVgapo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fe735tAXT50qiuY0Ts6Bhwyl8EQeQ9N0tEZUw19EHaA0P9SpIXxh8+GOhzlpDYHgmOsSaGkZS1O2i/9AoEJ0qnXKwtlqu0w4HUN9vk7YhSe1UPPK648qcVOHOMe5dr1Ef4TXndpbTQKFHCO8tktuRLyU6WgX/ALdFj3+pgWEusQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnAG9QEs; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnAG9QEs"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e39779a268bso970230276.1;
        Tue, 14 Jan 2025 23:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736926963; x=1737531763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Sslg/zYwiRkuelfoGvfyVJqoc2ZTiVmVRtL13lnc3M=;
        b=DnAG9QEsMx3VFNqDcuEJqGNsNwP3sAL6poqCxSqP3ADaRxmt2jp+l09t+iM6z+oNbs
         CJ0Pa+XOM8W1I7R0ExqPJoAlDzu1HGW+9eUHIedmR3h8x7mszUpVp/9Uz1UASCExvEfI
         bshlUX9AK+AVhv4i92JH+WgaDTNFda7+xhwNCHVruhVs45UnntStkwO9HtohJ6wF9KgG
         rNCEsGoDIcmTrB+9gcltskVUnSGDA3XApAl1btQ5lb0b0DsSTwNwYhEy7a/7J2s0Vd8o
         hRF697kJXqaGhdS1PfOdHeFZYqmHkmWXDH8BPvPQsCdwe8KPhh8s2FSaUEMIZrZDvmyk
         zxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736926963; x=1737531763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Sslg/zYwiRkuelfoGvfyVJqoc2ZTiVmVRtL13lnc3M=;
        b=HbmsSfhm4sLxt6sHefgtAxPK2ukcJquS4AhohlkAKjraPcoFwEAO4nCIsfvtVNGqHM
         6e+iheQqJ4dEDe7IrxB5AOf7bl0/AKwKvyNm7OxFafPcHGLsTxUcvFV9MMDSB1+ClVVb
         s9/4L2cWSML6k43w9jUhM2sTAA3bhLp9gmB0Md2rZ036Lk3JHm0paj0weDNzPqZ2LmC7
         nE4vsIfCApXyXSlwFhmkfF/ed9MEjC3DZwt5OaGWcNvsWPetA2n2S0ylzvkqXefL0l+l
         RYy8zrt2X7OduFPWDfqpDMaOlFpomCu/LKtSQW4HcPsXl/IjtmJgqVma52IT0tehQCaQ
         DZSg==
X-Forwarded-Encrypted: i=1; AJvYcCUVAC48qckL0x2Ca9veqm/pvdgGvobbSQIjbg5H/OgLw76OeLRcrRRXtMaPoyafmQTrdYild4LWV1pM@vger.kernel.org, AJvYcCUvo+3MQ+buSM1Ba07G7T7/RrfPMnVPGgvSpt2tTI9tdftU1x2aasiBt4bXM24/Pkn5+m5RTm4xFmaQ@vger.kernel.org, AJvYcCVcK9OmLSx7R0TS3gYhQLZhtav6snrt3NuL9pCw+vjlZ0mu7WvUWZYzgtduMVVPLbFsGt7S6giNp0w2FnHi@vger.kernel.org, AJvYcCXsoyYV3j4/+ou53s3aspsoIIMpRKQihXVIbZ+k7t8UKCqo/iZUuo5ueg0FWw9j9srCBC16x41yHimP1X4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh8NtP+GOQUTIYfP/dP8jdTJjMoQxiOSDm5zxbKkyu3+U8q7hm
	FxeLtf679f2CO9JMgr8nC1N8xHgWQA6H4dzYBNqeJwby6u0x4lEyuy5uX6vVdd+5c6CnbpfxUU2
	9dL+geSTyPl2nMIpCaxyLZOMuyYI=
X-Gm-Gg: ASbGnctnLH96Kgz2zw/Bid05youf9lQkQVbHP1Z+zsKz8HzYKIDWFZd9vTHWTKdimp1
	TLR0vGoF0VHqJWVoQjOBe06550wq05APiG+8Piy6QyQZH6pt00/G89dCwUC0ObCTRc4ADtHY=
X-Google-Smtp-Source: AGHT+IH17XhqxAmd73MvcgPT4rEqzzyk65JKjfzd1/K9q35+ZMaWoV/BtCI1zmz6DXH06SQ6o7zDbFM4qU+9+YpcFVo=
X-Received: by 2002:a05:6902:1003:b0:e49:ef7f:de1b with SMTP id
 3f1490d57ef6-e578a1219b7mr1550169276.4.1736926963023; Tue, 14 Jan 2025
 23:42:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110082612.4107571-1-a0282524688@gmail.com>
 <20250110082612.4107571-2-a0282524688@gmail.com> <ba0e0e2b-01ba-4261-ace9-82485e1c253e@roeck-us.net>
In-Reply-To: <ba0e0e2b-01ba-4261-ace9-82485e1c253e@roeck-us.net>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 15 Jan 2025 15:42:32 +0800
X-Gm-Features: AbW1kvZgpC9Ts8_B_gBYp0vBqc0FXESjdD6C-CuJSHI1j6axLypLJeVDLnPCjBw
Message-ID: <CAOoeyxXMrBvB=GTQUhTMETx-BLATTCwFR0wxmHxtsNm_qbgMuQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] hwmon: (lm90): Add support for NCT7716, NCT7717
 and NCT7718
To: Guenter Roeck <linux@roeck-us.net>
Cc: tmyu0@nuvoton.com, jdelvare@suse.com, corbet@lwn.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Guenter,

Thank you for your comments,

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2025=E5=B9=B41=E6=9C=8810=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8811:56=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 1/10/25 00:26, Ming Yu wrote:
> ...
> > @@ -2288,7 +2329,19 @@ static const char *lm90_detect_nuvoton(struct i2=
c_client *client, int chip_id,
> >       if (config2 < 0)
> >               return NULL;
> >
> > -     if (address =3D=3D 0x4c && !(config1 & 0x2a) && !(config2 & 0xf8)=
) {
> > +     if (address =3D=3D 0x48 && !(config1 & 0x30) && !(config2 & 0xfe)=
 &&
>
> Why config1 & 0x30 (instead of 0x3e) ?
>

Fix it in the next patch.

> > +         convrate <=3D 0x08) {
> > +             if (chip_id =3D=3D 0x90)
> > +                     name =3D "nct7717";
> > +             else if (chip_id =3D=3D 0x91)
> > +                     name =3D "nct7716";
> > +     } else if (address =3D=3D 0x49 && !(config1 & 0x30) && !(config2 =
& 0xfe) &&
> > +                convrate <=3D 0x08) {
> > +             name =3D "nct7716";
>
> Please also check the chip ID, and the other unused configuration registe=
r bits.
>

Fix it in the next patch.

> > +     } else if (address =3D=3D 0x4c && !(config1 & 0x18) && !(config2 =
& 0xf8) &&
> > +                convrate <=3D 0x08) {
> > +             name =3D "nct7718";
>
> Please also check the chip ID (0x90 according to the datasheet). Why not =
check bit 5
> of config1 ?
>
> If there is a reason for not checking the reserved configuration register=
 bits,
> please add a comment to the code explaining the reason.
>

Fix it in the next patch.

> > +     } else if (address =3D=3D 0x4c && !(config1 & 0x2a) && !(config2 =
& 0xf8)) {
> >               if (chip_id =3D=3D 0x01 && convrate <=3D 0x09) {
> >                       /* W83L771W/G */
> >                       name =3D "w83l771";
> > @@ -2297,6 +2350,7 @@ static const char *lm90_detect_nuvoton(struct i2c=
_client *client, int chip_id,
> >                       name =3D "w83l771";
> >               }
> >       }
> > +
> >       return name;
> >   }
> >
> > @@ -2484,6 +2538,10 @@ static int lm90_detect(struct i2c_client *client=
, struct i2c_board_info *info)
> >               name =3D lm90_detect_maxim(client, common_address, chip_i=
d,
> >                                        config1, convrate);
> >               break;
> > +     case 0x50:      /* Nuvoton */
> > +     case 0x5c:      /* Winbond/Nuvoton */
>
> The new detection code should be implemented as separate function to avoi=
d
> weakening the detection mechanism. I would suggest to rename the current
> lm90_detect_nuvoton() to lm90_detect_winbond() and introduce a new
> lm90_detect_nuvoton(). Alternatively, add something like lm90_detect_nuvo=
ton_50().
>
> Given that all new chips have a chip ID register (called device ID), I wo=
uld suggest
> to arrange the new code around the chip IDs. Since all chips have another=
 chip ID
> register at address 0xfd, it would make sense to check that register as w=
ell.
> That would only require a single check since it looks like the value is t=
he same
> for all chips. Something like
>
>         int chid =3D i2c_smbus_read_byte_data(client, 0xfd);
>         ...
>
>         if (chid < 0 || config2 < 0)
>                 return NULL;
>
>         if (chid !=3D 0x50 || convrate > 0x08)
>                 return NULL;
>
>         switch (chip_id) {
>         case 0x90:
>                 ...
>         case 0x91:
>                 ...
>         default:
>                 ...
>         }
>
Okay, I will make these modifications in the next patch.


Best regards,
Ming
