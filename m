Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5704A23
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Oct 2025 14:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759934709; cv=none; b=F/8KOQ4sfcRkmCzPQZtJ0xD5XaI3TzY2NuO/XP+Ep4dgBSIkek3WvcJ0zQX7vsR/q4DyIy6zdeOudlDhvLultF17cGdZ9PFAXwFgJ6Y7xfzBa7lKQrbQbmwqsGnXPGgjePArqbTg3mRPfvJ3Gb2GGM1FC8cLKExM8Wwi/F432GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759934709; c=relaxed/simple;
	bh=ZpZTp7yLydk6k9ye41mhs7FwaHpLzcQvOs7lUom/qWk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SuvI6DmyGymD63/LJ29nk+TUtoAGX0xs8MUSJhQAllZdwyGpaz3CNpi+N0D16q+52bWVTkgXqUq9j3GnQa7DIfjdiXUU9Io4CHzEtcEN/+DHMVbwGoiU4+Uc8zxn+qJ7X5U0tH72G5lUZImS4FUTKLugiuweB9Zy7v8rmsbc6yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMDQBWcw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMDQBWcw"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e47cca387so78966415e9.3
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Oct 2025 07:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759934705; x=1760539505; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZpZTp7yLydk6k9ye41mhs7FwaHpLzcQvOs7lUom/qWk=;
        b=GMDQBWcwa0qlc/DOJM1+KmKRduGoK1l8vHWFHXusrplH4HXy9dEhrS5PLR94Zf849h
         /+PDu7egpKRgH2x2hcEzQ/bAeTOzmnkhdLdJdRDC7IaWdU+bcFzLEdpfJHV38mVivb0e
         2YZbCsUesNC/PQLVIHyyGjH5gwxviaquvz1YIqfCa54SaIVmTB0FcKBjvdhiJFW+a9Xf
         FlTJilzT2/7EHX0KdO0FtyfC7IoLw/DvYHTYU1wRerKQv3eFl4DShJ3NTUbZZFdy+MS6
         VGO4pcWVY20ynFfGXobRupXPC+4zg3yFVtBPragWM9H5faYObMX0YJhATjxFLv4AY2Fd
         Lf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759934705; x=1760539505;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZpZTp7yLydk6k9ye41mhs7FwaHpLzcQvOs7lUom/qWk=;
        b=Dgs0SFVnrGFPibk3TfrsjwzqCTKs31WxxUMWFRM4vQLTOZ8D2Z/CnCUQeBaLSK2iMs
         BAFua75FJEXo1dUbD/wUhkglfDPi0CV9fcDHeDl/6s4WzKr2p2nXP2UTnMYcT+l/Az2n
         EofdAvqeaVjQso1ugFL1iZybdmyVndVjp2JDuBobCVfrPCeGpT9Pign4isf4wfwVOrs7
         1StDEDDkgMTuxe4t+DM4n/W3ASZrukAVzKtBUnOkxTqwyUhcQXq25gcwN3GYwjydG9t2
         yqptJR9V4D/ah3POwGppqbzOPF4j24fzPn2dPGlO2No0/7trXWDV0OIryXZVEkQCEFJL
         JM5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWa/u4Xoxl2P8Tezh8OLUt4Vph8SyKf/b1HS9CXBgTmaQIKC2jTWSC+fdXABAybFIDwylAINp7DhGitPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTZemJNAzKKMd5WJ8x3PWJ0CsnoADxUO8nuCNhicYvbp9q3TOP
	BSw/IiS//2mpM6kp1TX8OhxtLj0OmSDzU/eQHfajfibwvSTRTkrt/4aI
X-Gm-Gg: ASbGncvxlxHv3/w1JCL2HiYemdTbW9kpBe30/7mEqxEud35fHxDy4WAeiuv4YaQnua4
	aoLzU7m8rdGDd//55VbMz7ME3AZxxIheVXENENukoOfBShY1zyC2qwHddntVl9lMXor2aMkGL9l
	ZQ3HpJe5eMVAfdWIwTnRpKEd0iSzgRkIqtfcJ4+0Pn7uf5XBzfB36cuPHq2M84iTYTD2ADeOyW0
	fJlJBGmEs2TLXu1qIAL2RYBQGWRDfUeWuBKRQNt1xeJtD4NBkKQU305H+LwOMf2YahZ2UOPKo3k
	YxDXN7zofYMAq2JP326R1PG4OYrV77Qmj2KnKNyI1KHcuqOseTshLcld2EBsw7L92k0Tg7l/zUV
	qiyfOaB7F+EZZyroGSaBshcXhPux/WJoUVWGrwmqy3tlB0WBGm8Uj8XA=
X-Google-Smtp-Source: AGHT+IGyW6szpwhvT6chXdh5vwNAgphskxs4Ai59Y5ewBvd0PpuY0IRo0TwoSwCgStADlhmhCDZqJA==
X-Received: by 2002:a05:6000:420a:b0:3ee:114f:f89f with SMTP id ffacd0b85a97d-42666ac6b77mr2395334f8f.15.1759934704901;
        Wed, 08 Oct 2025 07:45:04 -0700 (PDT)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab909sm29667338f8f.19.2025.10.08.07.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:45:04 -0700 (PDT)
Message-ID: <fc44bb98125f882af6ded5d812ad271f3fe06630.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Jean Delvare	 <jdelvare@suse.com>, Jonathan
 Corbet <corbet@lwn.net>, Linus Walleij	 <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>
Date: Wed, 08 Oct 2025 15:45:34 +0100
In-Reply-To: <9312235a-b051-48fb-985d-be2b1d3c7c1b@roeck-us.net>
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
	 <20250903-ltc4283-support-v2-2-6bce091510bf@analog.com>
	 <742fe9b5-bc53-45f2-a5f1-d086a0c9dd1c@roeck-us.net>
	 <0765a0b89779331c62a3f136ef030f7f2f40ea47.camel@gmail.com>
	 <0ce54816-2f00-4682-8fde-182950c500b9@roeck-us.net>
	 <35733a7a33301330260c01b1e59af904c8c4da6b.camel@gmail.com>
	 <9312235a-b051-48fb-985d-be2b1d3c7c1b@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-10-08 at 07:11 -0700, Guenter Roeck wrote:
> On 10/8/25 06:07, Nuno S=C3=A1 wrote:
> > On Sat, 2025-09-13 at 04:02 -0700, Guenter Roeck wrote:
> > > On Fri, Sep 12, 2025 at 03:00:22PM +0100, Nuno S=C3=A1 wrote:
> > > ...
> > > >=20
> > > > i2cdump -y -r 0x41-0x79 1 0x15 w
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,8=C2=A0 1,9=C2=A0 2,a=C2=A0 3,b=C2=
=A0 4,c=C2=A0 5,d=C2=A0 6,e=C2=A0 7,f
> > > > 40:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b004 0000 b00c a03e a03e a03e 250=
1
> > > > 48: 0000 1a03 e07f e07f f07f e07f e07f e07f
> > > > 50: e07f e07f e07f e07f e07f e07f 0000 0000
> > > > 58: 0000 7002 7002 7002 b07e b07e b07e a030
> > > > 60: 9030 a030 0000 0000 802f 1000 1000 f0ff
> > > > 68: a004 a004 0014 a004 a004 c004 0000 0000
> > > > 70: 0000 0000 0000 0000 0000 0000 0000 0000
> > > > 78: 0000 0000
> > > >=20
> > > Thanks - this should do. Note that I am traveling and will be away fr=
om my
> > > systems until September 25, so I'll only be able to look into this fu=
rther
> > > after I am back.
> > >=20
> > > Guenter
> >=20
> > Hi Guenter,
> >=20
> > I was planning in letting merge window to come to an end but I might ju=
st
> > ask
> > now. Have you forgotten about this one or do you want me to send v3 wit=
h the
> > superficial review and then you go deeper on v3?
> >=20
>=20
> I have not forgotten it, I just ran out of time. Sorry, I do have a paid
> job :-(.
>=20

Sure :). I was just not sure if you were expecting v3.

- Nuno S=C3=A1

