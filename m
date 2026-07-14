Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D351B39CCFF
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2026 17:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784048957; cv=none; b=mQDuGmtVFnJQVJvf5rKG8T3w9RxUXEeCIQV+Tzc6C6nYqGj98h+OzCDDJdAhzq0plks5vo1iN3kgBgMyKvZnEkq7Y/mD3A0vCrisZt0XSPXvohFlsRbubyEkxijLEQIZxpNCxMriJ6ysSnaKuA7EoiqvzqP68Ugs+ZLGnhMJlIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784048957; c=relaxed/simple;
	bh=WxjKhm4bXqb1u5k7AfWGErLZRYGcCQ0DKtR2CPH2VSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ad8ptveqQUu3J+O2hpWFkwktsaXK3V7Xdgtvxf1UE1n1KWJbu0EuuS68WN8R9glFbhAVr3m4SNQ2WbtMOb8QjwkIeHVM0bylPr5AIdZDiJROLVYIsAAAs8zX590bWP78/XLHF1Z/UgjoW/vaMDAiwnIBrsw18SvAUhgeuJgj7t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FeBCzUFg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FeBCzUFg"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c19bad03so41364455e9.2
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2026 10:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784048952; x=1784653752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wmvTM4kKQclmnuTjf5INwpa0cW/U4YQPx7uaHT1J05U=;
        b=FeBCzUFghxNUCaA+Tnspo2GcArQVoHou4iqU/X3CWuu/xsXkrj/IaUqEYAihXnZI57
         cFxmzbEjVNoNdUJRXNjqqINcTlFmsL2v2JSplk3gwBDcsTlUwN1yESpdy+UM44agYSU/
         zZ2h02HtirDa29GDfz75/BGSWkfyeAEPszMqUdMVez+DXzj6eO566c6OKmazapJGYEJp
         PTuDJjNGfmkvGdb1dBHrBM0cMsxs+dsDZapAfnREmqGosuDSQgvs5gTmjyOMZddxuoXu
         U5fOG9aOoLeaD/eeyoed46S/rO4zdWOAZMDrZmm9PSk4Z45MNcMZjSyK4WhueROu1oMa
         Co1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784048952; x=1784653752;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmvTM4kKQclmnuTjf5INwpa0cW/U4YQPx7uaHT1J05U=;
        b=JW2mRIJ52BxzYch35TKbkqle5L+P6DK9BHZ+TY219UYE6WtGIeDk9azDgxXsCigNsP
         uBj7hMlH6PV2MjumypAPH8bd2JOCYpSndU3zvUn+e/j1Q+9sO4uY8YUJ6SlPTO++HIx6
         aQZwYrpMLkKni3UeN3vJ1NzcgOamxsTjbb5OcxQ1md/qWWyRIl152CbJ+xLVm6aVJlxU
         Mbp1GYLSZMKsIddb3P/pwF5ihdJfdbm37RrnLiNiwFNh67ZENLnqv4JTJfS1kMENmSMX
         I03C6Z/iVgDFIom0YTgPFmS4ORrXdUfCYN+g07yQmWB0HyObMNLHEY+jQ7pZs1wUKV+F
         NhUA==
X-Forwarded-Encrypted: i=1; AHgh+RotjIG+v+DE06HJmcYkMkzXxOUYWimotDRsfl+M2vwZiiVGHduvmXlt6XF/TWiMx8RusgLgRxuK+9H4Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQqwnI/Uek3errvUXhVlc64njPI+hGUuxQWxLMk8cORT784bs/
	KSIYnivHspkEodDSuRZrcYPG2hLTxvAvf8A6ZpdcEAXH/oaTyOU4qoJKVvGtD3ups7c=
X-Gm-Gg: AfdE7cmTVtIao+p7vm0fkvYXmO3jpzdaddqd5A2Yw2xRlWHaOk/V4uF8sbt8Lg/HGjr
	d3ulooQhPnW9aeIsSJ7PUprUkrGhGukG+V2c/++8jKMAffBKEIcw2W6LMsgB4omaSIz5PU1cEKC
	hU5edLX81aVAmEh68/HXKkss1HCoco0/PjEn5pJu5lw1Xm3t7wKQylEpVYjO7qx4ieeeCkmXKhk
	oN+H8dl2jCC15MDjhh7ZA3vlrLb9nKZFXvtb/u2loww4t8qfWL3FVyGIt+GP0wYkfZJfgE0thPg
	jdd4AnwHgRuukU/PxyQTL/a+JzwjgZtMJLnxA6TypF5W9aJgEDkRrJnss/LyZnwC26sds9TtKJH
	c5u6r1fpshxrTyf194+4lLNJxQD3t2XGQPhX6S8FkTByd5Lj5zXGzBNIwFLToIOaCVx4I4Uqa/D
	jVIJXlL1AHt3NCwNJMxg==
X-Received: by 2002:a05:600c:37cf:b0:493:c4e1:40a6 with SMTP id 5b1f17b1804b1-493f882e97fmr123207855e9.32.1784048952148;
        Tue, 14 Jul 2026 10:09:12 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4953bbd7eb2sm665125e9.0.2026.07.14.10.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:09:11 -0700 (PDT)
Date: Tue, 14 Jul 2026 19:09:07 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>, 
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm90) Switch channel parsing to fwnode APIs
Message-ID: <alZqpRFoMIsxfgS7@monoceros>
References: <20260713190659.4511-1-flaviu.nistor@gmail.com>
 <alYpqifR8RHXZWZ5@monoceros>
 <9b8a49f4-2632-4984-a617-66f4161a3c5f@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hsid2ik4lsvckpps"
Content-Disposition: inline
In-Reply-To: <9b8a49f4-2632-4984-a617-66f4161a3c5f@roeck-us.net>


--hsid2ik4lsvckpps
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] hwmon: (lm90) Switch channel parsing to fwnode APIs
MIME-Version: 1.0

Hello Guenter,

On Tue, Jul 14, 2026 at 07:43:13AM -0700, Guenter Roeck wrote:
> On 7/14/26 05:22, Uwe Kleine-K=F6nig wrote:
> > On Mon, Jul 13, 2026 at 10:06:59PM +0300, Flaviu Nistor wrote:
> > > Replace OF property handling with fwnode API in the probe function to=
 read
> > > the channels properties, improving the driver compatibility since this
> > > method is not limited to Device Tree only.
> > > Add also the needed headers for explicit include and clean up related
> > > function naming.
> > >=20
> > > Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> > > ---
> > >   drivers/hwmon/lm90.c | 48 +++++++++++++++++++++--------------------=
---
> > >   1 file changed, 23 insertions(+), 25 deletions(-)
> > >=20
> > > diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> > > index 4b9c0ccdf260..045977e30cf4 100644
> > > --- a/drivers/hwmon/lm90.c
> > > +++ b/drivers/hwmon/lm90.c
> > > @@ -101,14 +101,16 @@
> > >   #include <linux/bits.h>
> > >   #include <linux/device.h>
> > >   #include <linux/err.h>
> > > +#include <linux/fwnode.h>
> > >   #include <linux/i2c.h>
> > >   #include <linux/init.h>
> > >   #include <linux/interrupt.h>
> > >   #include <linux/jiffies.h>
> > >   #include <linux/hwmon.h>
> > >   #include <linux/kstrtox.h>
> > > +#include <linux/mod_devicetable.h>
> >=20
> > <linux/mod_devicetable.h> is going away soon. Please rely on
> > <linux/i2c.h> to provide of_device_id.
>=20
> My hwmon-next branch is based off v7.2-rc1 and of_device_id
> is declared in mod_devicetable.h.

That sounds factual correct.

If you want to imply with that statement that my recommendation is
wrong, annoying or in other ways unsuitable to you I guess you either
have to be more explicit or live with it.

<linux/i2c.h> provides i2c_driver which uses of_device_id (via struct
device_driver) and thus includes a header that provides that struct.
That won't change in the foreseeable future. If that is not good enough
for you, find means to handle that in another way.

Best regards
Uwe

--hsid2ik4lsvckpps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpWbTAACgkQj4D7WH0S
/k4v6gf8CbKocLZWdTkDRzyhhLVuU5NemXPdLKbJQJFOBL66QV0y7tnHGVwSm5zJ
QKZkZVx6HVdQ4DGdIRLA4gosw0SAR/oOdCKRnslolbpo9WOldzsGh/c3Bqj8T1R5
YXX6vIyyLolJiOF7w3OVoxmKW6CiS6TNOzoxMIccAW1sRRZCGiu5mUtqrrKySg0q
Tndo/JbFAeuze68svKdGnylXaudPFGHVnrKhw0kqWkfsBEtZj/FYR+/uqM7xF2wH
uQIGjl4a851sVIu7/uTIRiXlrMSrbsdjjWdfQkzus8g+EJ80DJZbknWvnuh7yqnR
GLmA37OxO/KnAaIYGy1PlBzjJ8+EOQ==
=hwf7
-----END PGP SIGNATURE-----

--hsid2ik4lsvckpps--
