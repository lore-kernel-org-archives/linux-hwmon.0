Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4393016F7
	for <linux-hwmon@vger.kernel.org>; Sat, 25 Jul 2026 13:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784985911; cv=pass; b=IFtW4iCBl8zr2Wd1e8i/C4itWPA67BA12n/BW4Su1IMfx1KkFq0NL2QYmVT6lrTDBpRA1wPl+ArmlRmJqp8Z7Q+8WaoUgEFs+EUqcrUCNvJ7Hd7MPXXOFnrQE38wRR2QK+olBwY3SoFI7IZ2PQ+WSTUwyIbPBX+e6EuJQO8Dv74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784985911; c=relaxed/simple;
	bh=O+PLvidt4qQJi+8RWeGqsl1wZYXnZW4fi4aLhPE+zgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gRxHxULaa2BH35FTmpB9LQRbvt30NyqokHwqYHEdA9qx9YFsV6xLghRxi0TBflHJYu9QiZDJ8w8uSX/lJLT8P/zXMiopOaH66ERLThZdtWg53fXT+qArr+t1jvR0roVJlwRoIn1bLyIY8SZyX15Nh3qcqcJ2h5aeR2gGZXMwrVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjxjY++2; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjxjY++2"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84867f07d63so1638153b3a.2
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Jul 2026 06:25:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784985909; cv=none;
        d=google.com; s=arc-20260327;
        b=bfMVjKmLlIzVt3C7XFd4aypznPGyzfjXlCyNSFD/WxrSrbG7epPoiZdFS2ysAEiJdP
         mKhESlQFmp5C/jUhiL0+41/PeEOPDa4LgnqFNPrCeTkxxpSfibf1n+5+tH6bKwPbS6Rb
         azaidFXeqsmdb2wMLgyMDOvjj82ek6OCcKbZKqoi1BKwHvKmyysbMaUYaJH+DoSmW5u7
         rfTcH88P0ZWHdoQBsLQQ5N4SHBEnnNrk1BstGMBnc3skiHaqqAOGz3kSBU/RHAPKLqjB
         2/d973R+6DDoyP88sc1u8W1Fe1fAYd8jXJXmzSV7Din76o+NFwLOEerpcruGVw4EIZtP
         UJEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RsVrgRB1j+9eE5XFcyDuofqOTr5n/vldNF5OvYr6AZ8=;
        fh=Qe662/myXn8WJ9E6X4zDnpnRi7FjsShZTnKvYQgdmpU=;
        b=BQERi7spUksNT3x9F3Q2ytBBlKIx9RDoEsWzR3WL48DBuncW6gvEb4mLKXulG7iIZV
         erZjmN1C3Jm1RgUunHuCCfOy0TOd6l/Fiwr51wEflLhwEbgRCkPc34ENTiPb3jYUdXLP
         CS8xR96L94xli4X1OL0tfql2rzV3Nw1SKYATCntFZIqyVcg3aaDDzjqF4H8MJizBCxuS
         h9Nh5z6pyDhdTXlzlsEMLbA+Hq9Yc+LQ/kLPRAZqyQRHSI2Iv4C8ZhI1qx2vbBAGsFq1
         5mqxcdFpbx7GINzjWT5YexMH7PPMnvZ+S4ECrMlnjhk8JQPTWZQl/FmFNMjD8MxTZlqr
         caXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784985909; x=1785590709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RsVrgRB1j+9eE5XFcyDuofqOTr5n/vldNF5OvYr6AZ8=;
        b=VjxjY++2eQWSOulzM32m3nPH5SG5ZI835qe5quWSHgIc5wpEbBT7osgsRZXpkDevqO
         lAerjlE9CwD+sVBNVLa5zTfcJZ7hpsF0iB68TfEPQxddSWosM600mzhu7zNyrVo+1M5Q
         xgvYwJHfO0CVjXFGMvKmmsGvH971LEPGxT0RxQwOrvZXk2dzCWEafib5wvHyuLgEJdQL
         jkQIkQsFz+qlzW0JPW+tmi7sW03fLmgPS9IVEj6w0/GtGs3qD9T0b0MduUG0816hXCP0
         fmhXaTuL8WOZw+CRR7voIdhtp4wg3x836U8Xi/H9vy4kPO9RjUlEP3RcwDthpbOZilzS
         oX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784985909; x=1785590709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RsVrgRB1j+9eE5XFcyDuofqOTr5n/vldNF5OvYr6AZ8=;
        b=JRlSBMQnp63/x10cSTS5ynrkx7x93XOgqBZLCoP7EXg7VwShkwvHDLtD6HxgHKtIgs
         GnJh/9vIEd5twXTt6G/X3MgPYmt4yd3kWLlEodYVOCbo7mCWkYLearn0PLafHCeBVc5R
         sR267QqVJDAGNdwSYaSmffd3n+tKMIT0heHcnev8bqsRtx6gKdnzvXVm1/gdYxs9oFdY
         4UCrVdHLbDmxCNn84Atka1sFmgTwbcP3Z2INPpsgy4ih0+78UHgqifxWpG13msOMV74W
         JqZKsUHEWvnLrrNrXGVasA5XPSq/7c5QvtS4CbImDWZWDmY8OB/6MDpG0XLW4/1R+q3/
         MhLA==
X-Forwarded-Encrypted: i=1; AHgh+RrZDdKpbTHhUp+MGYbzx5ADqETqOrIsd/eOsqT0Wx2P2OFBeBkTE6Kde+3MAfv+B8r2SakR4KUTYC50Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLZcGD8iVcJ44IEhE2A+PmoD/TbuX2hm5cpcjxcRnTS+XQ6uSS
	AHJ1Dr95lBBremyozRyGPx/xl/gJaSPZA4fzXWJmgbyFSeHVQUGZrQVmAIpjPQwl54e7w3fMo8F
	0hfXIH5A6FB5gGtS1KxFT/KZATfFH6jE=
X-Gm-Gg: AR+sD12XqW96Ydwd0ER6FXOZ1fa5voKgsjUFSCk4LWg56yqQ38wN1m4ViRf+k1mEcZK
	4I1TjnPNwN+Ix8izesnqmvw7rDiWbNAMWc+416nppS8unV9h/xnOj3jXu1JiREtxEkeHGiCCgbu
	/HRQpxQwG7ZwH11JYal1B7q0IsEThK5tWsqC0fRQbGgvlOv4lVBUOdtPF7fCQ4iqt3jq3mjeMZu
	KtUQ2yHEWiqjJsC/Op19TCUHYOukOgzofx5G1ZZi2DKjCJx3T4o2uHHdrtsOX8CU0skvjzA9lvw
	aYq7pd/k/ylkxd8kEU8=
X-Received: by 2002:a05:6a20:2d11:b0:3bf:d487:4b38 with SMTP id
 adf61e73a8af0-3c67dd8a2dbmr2233399637.23.1784985909177; Sat, 25 Jul 2026
 06:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095935.439174-1-clamor95@gmail.com> <20260721095935.439174-3-clamor95@gmail.com>
 <amGz2YZogakb5XAv@monoceros>
In-Reply-To: <amGz2YZogakb5XAv@monoceros>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 25 Jul 2026 16:24:57 +0300
X-Gm-Features: AUfX_mwi2WZv66EGYRzBQrw-ixRBZCIhNyd1PMWCLX6j69ZyCS0eS-15Y1-6-Ng
Message-ID: <CAPVz0n3WKw74zg0HmBBOo8Z7JV_pku-DjsgKF_74B8EdD5cXgA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] hwmon: (emc1403) Convert to use OF bindings
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 23 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 09:28 Uwe =
Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello,
>
> On Tue, Jul 21, 2026 at 12:59:34PM +0300, Svyatoslav Ryhel wrote:
> > From: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> >
> > Add OF match compatible table to be able to use this driver with Device
> > Trees.
> >
> > Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
> Please put your S-o-b line last.
>

If S-o-b's should be chronological, then this order is correct.
Guenter added his reviewed-by after I have added my signed-off-by.

> > ---
> >  drivers/hwmon/emc1403.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
> > index cd753b38709f2..b7ab6069ec7b1 100644
> > --- a/drivers/hwmon/emc1403.c
> > +++ b/drivers/hwmon/emc1403.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/hwmon.h>
> >  #include <linux/hwmon-sysfs.h>
> >  #include <linux/err.h>
> > +#include <linux/mod_devicetable.h>
>
> Don't add <linux/mod_devicetable.h> please. struct of_device_id is also
> provided by <linux/i2c.h> so adding <linux/mod_devicetable.h> isn't
> needed.
>
> >  #include <linux/sysfs.h>
> >  #include <linux/regmap.h>
> >  #include <linux/util_macros.h>
> > [...]
> > @@ -682,10 +683,21 @@ static const unsigned short emc1403_address_list[=
] =3D {
> >       0x18, 0x1c, 0x29, 0x3c, 0x4c, 0x4d, 0x5c, I2C_CLIENT_END
> >  };
> >
> > +static const struct of_device_id emc1403_of_match[] =3D {
> > +     { .compatible =3D "smsc,emc1402", .data =3D (void *)emc1402 },
> > +     { .compatible =3D "smsc,emc1403", .data =3D (void *)emc1403 },
> > +     { .compatible =3D "smsc,emc1404", .data =3D (void *)emc1404 },
> > +     { .compatible =3D "smsc,emc1428", .data =3D (void *)emc1428 },
> > +     { }
> > +
>
> Unusual empty line here.
>
> > +};
> > +MODULE_DEVICE_TABLE(of, emc1403_of_match);
> > +
>
> Best regards
> Uwe
