Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D67E3DEFFC
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 08:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140083; cv=pass; b=DBdqIRj+5z3SIID3MmWXtLjE/S52LkkVtFCwWt4yC+as1XHcSkNVJxNruuR5x7BEK/KNoaZp1M/WoBDDR9hWCnsEkP9HumP2KfS+yzldYd8PYZdO/T7Oj9C78HpW9z4qutZM8uNzZBSmsge7VEm6TB/MElvVNZUUBedvcWXLDgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140083; c=relaxed/simple;
	bh=c1jul83B6Xp5CVCl2RwEczHeZO2EZg/5nv7ZfKY51wA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nrJKwNSocVVaCuYGaJ/KJrFOlXmlsyKAVQlQ8NdNpLLiYBUi8yap/2pjOgf5HyQ1/05B3zE6Ashg0GxQ+EQBXHRFXuuzYu99GbdGRukHfVbxOCGx+AMCtvZ4HaE7NNgKS1gG+/mQNUlJNjB6ph9fUyiA++wII5nApNZJ7oxvK8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EORkwzzc; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EORkwzzc"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so1739853a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 01:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785140080; cv=none;
        d=google.com; s=arc-20260327;
        b=K1RSxpJDNENX05DF6UfWV7cCQdeg/nNemlUPllH5g1+PMixHvhVetvBOakUvrEcjn4
         JTgyrgfFgyqeBDU9mfyxMXIzT7URtVQYXuggm1GQ+r5xnuSTf22s4tq8DSPUmO7wGqx6
         nZzd3ryO4CxTcGxrU2BvNVBHhN9dMfZdpxzAZYdZicUnlsN1DjaGqNyyapJhWt4cCOuN
         JyXZ7N2y6Juq+6DY6UaHOEl/UEJykgviNoD9KLUG7xQrKx7GfWSYEZ1BEZxUQ4o5yWvd
         XMZ2k3ipNpTFY5sq/Ui5QJM93yaUqGvF09+3bOVHVa1b18GbSBsUObtGp9TwF7p3+O/B
         V1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S/4yBYKpD5ogWUhCBaB35i1jnLVmAE8JFw2/JhmzdZ4=;
        fh=JIP5XKj63vSU5WB3Mzdg4gsePzMtT7K/mB9PIrNLK6g=;
        b=WQYlesd1/pF4pw8HIKYkHu0aPMQ0XSMsHjB7os6HCihdcalrV8ixfj9TF/DRee0G00
         Vb33MAoPN55EQST0/3nwF3xDv2m6fYai3RRpB2zGsG9xv6oCTVBX5D4cHIFn7egrNRY2
         H3ay/YfQxD3zf5/4s49G1WZ+7TqfuytzBte57j6LDG13U2FMYzBCR6R6l36D11SRow0u
         xQ1oOAV5nyLyCj5hbRGnjx/vAvDZYD/dFtirY0TySWFJasDdY8saHiU4XsueZsJMYWiR
         CfmDpBQyLqngobAuHGL04Y4DyLKyoJvfLontWULWQpdla2spZKU/xAVbkb28hkMJfNB+
         EnTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785140080; x=1785744880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S/4yBYKpD5ogWUhCBaB35i1jnLVmAE8JFw2/JhmzdZ4=;
        b=EORkwzzcbT+JqC9Ty7HEx+M23tpSdhgMIsurqDImIlXqRSiKa+eQS72i/OSCfQfrZA
         BI7RJzlslkgyFrq6dyQBBvBH15k5ak7KgRcLwKwAldunawJFT+BC9K2FjDo9PujEjQie
         Mlmg/ahQo+2vcMT2GPDPyaufjzn+9NBWqSfSRbj7g44PqYLFMvsLVH1lrqRu3G+fe2Vl
         JjYP0BQXAu4m39fqS5tp8PspgYdC1UwMvZ8RHU0KMDeR1bNSDBHUoT3uQaOx+z9botKI
         T0SP8JuMHe4LtFzKWma2hfy12O1SPf+PJ6VP1I3DXVW0W/6RJWEEC2dvIbFQWV6KFSbL
         6wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785140080; x=1785744880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/4yBYKpD5ogWUhCBaB35i1jnLVmAE8JFw2/JhmzdZ4=;
        b=g+7tPm9i25DooJmlzJPvpEMrSSm8PSnlZYbBqhywExh16VuzTVPOwYkbJ9LrN7hz7R
         wUvj/IgzEfqMj5xbIr4hi/wsfgE0ESePKf0bZCWRNz6zW6JCO3Z8GPlrn1sP72ggnJh7
         fMmKqkafPXR2w+7TxciXvHzxpm5abB9ibL5zsDw7UYR4P0va6Uk0NgEtWfFAE1lyAbi3
         e/T3W33BwSJ9Mucy0bWTbAm5OdlTJUDyqSsnsttAsIYeEaXiYIrl+5SIpjWw9yo+KlLG
         Xnw2gVoxH0vqZdZM3nzyawuWd00h/GUs2xgez7uMg50Jg0/tScRtpeWXvM0RA/bsJ1f2
         WZ1w==
X-Forwarded-Encrypted: i=1; AHgh+RqcGCPhPWcPkoA2ZaFHZ8vvi/CiNYHeLtkJ2VBpCCaYINemZQEPR+tL9WYusocwr2rSPfyEU0k3aU3KgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD7yaU4Qd/zd6vpIVVx1lPbax8eZuYaJmVTJRdTVhrCNCZXuxU
	YWzvm4Hk5cvjGoMK2GkaEA0M7GxCR68FzAVjsdiJLkCcf/4zEMlwX8D6760ctEpS2Cl728qmaeS
	NqXLrCzZBOfAMykGXK2witZVblujYtj8=
X-Gm-Gg: AR+sD11XMb+Sr8FKsmkJwRygNuT2h6qX3nbEbHBU7tYdb6k8RC2x8defCCf+aqUVJvu
	/xjZnNSIprcGyAkmEc8E/k6oU6/P7SD7nasBOAO01hYWdYX+LZG7dZ1Bt4RDkUdpS8mJZw2cdEh
	u2rkHulpTUerz09GriCZjy60zQea28SBZ7hC4agMUcj4uS8dYCpq9vvyPDh4ftRKtfFxhpDk6tk
	2+lqutU+P33e/uHl801GWhk281X+r+Ph0/yWo4K2Zrb/O+R25gnm4N7kia4TWpeH6xUVfzrq9Yb
	PsidCattBeNPl0OiFr0=
X-Received: by 2002:a05:6a21:3981:b0:3bf:6222:2e7e with SMTP id
 adf61e73a8af0-3c67dad86bbmr7521724637.4.1785140080338; Mon, 27 Jul 2026
 01:14:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095935.439174-1-clamor95@gmail.com> <20260721095935.439174-3-clamor95@gmail.com>
 <amGz2YZogakb5XAv@monoceros> <CAPVz0n3WKw74zg0HmBBOo8Z7JV_pku-DjsgKF_74B8EdD5cXgA@mail.gmail.com>
 <1d7b6ff4-4ea6-41c4-b59c-25e14fdd8b53@roeck-us.net>
In-Reply-To: <1d7b6ff4-4ea6-41c4-b59c-25e14fdd8b53@roeck-us.net>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Jul 2026 11:14:28 +0300
X-Gm-Features: AUfX_myZlKwnaS6qwj95Oju8A_zPRw2XHPDS7vGqCXgn4DVxSU-T7bVSE0WxS3A
Message-ID: <CAPVz0n1dwo13swmV8HCFfKEujT0HT5cktS_uqznK86eK3ZUGGg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] hwmon: (emc1403) Convert to use OF bindings
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 25 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 17:23 Guen=
ter Roeck <linux@roeck-us.net> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 7/25/26 06:24, Svyatoslav Ryhel wrote:
> > =D1=87=D1=82, 23 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 09:28 =
Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> Hello,
> >>
> >> On Tue, Jul 21, 2026 at 12:59:34PM +0300, Svyatoslav Ryhel wrote:
> >>> From: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> >>>
> >>> Add OF match compatible table to be able to use this driver with Devi=
ce
> >>> Trees.
> >>>
> >>> Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> >>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> >>
> >> Please put your S-o-b line last.
> >>
> >
> > If S-o-b's should be chronological, then this order is correct.
> > Guenter added his reviewed-by after I have added my signed-off-by.
> >
>
> That refers to S-o-B, not to Reviewed-by: trailers.
>
> Do we really have to argue about something like this ?

I am not arguing, looking for answers.

> Do I have to mandate the order of non-SoB trailers for this subsystem ?
>

That actually may be a decent idea. In you have this stated strictly
for subsystem or have a consensus on kernel level then you can just
point a link to a documentation. Might simplify your maintainer work
;)

> Guenter
>
> >>> ---
> >>>   drivers/hwmon/emc1403.c | 16 ++++++++++++++--
> >>>   1 file changed, 14 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
> >>> index cd753b38709f2..b7ab6069ec7b1 100644
> >>> --- a/drivers/hwmon/emc1403.c
> >>> +++ b/drivers/hwmon/emc1403.c
> >>> @@ -16,6 +16,7 @@
> >>>   #include <linux/hwmon.h>
> >>>   #include <linux/hwmon-sysfs.h>
> >>>   #include <linux/err.h>
> >>> +#include <linux/mod_devicetable.h>
> >>
> >> Don't add <linux/mod_devicetable.h> please. struct of_device_id is als=
o
> >> provided by <linux/i2c.h> so adding <linux/mod_devicetable.h> isn't
> >> needed.
> >>
> >>>   #include <linux/sysfs.h>
> >>>   #include <linux/regmap.h>
> >>>   #include <linux/util_macros.h>
> >>> [...]
> >>> @@ -682,10 +683,21 @@ static const unsigned short emc1403_address_lis=
t[] =3D {
> >>>        0x18, 0x1c, 0x29, 0x3c, 0x4c, 0x4d, 0x5c, I2C_CLIENT_END
> >>>   };
> >>>
> >>> +static const struct of_device_id emc1403_of_match[] =3D {
> >>> +     { .compatible =3D "smsc,emc1402", .data =3D (void *)emc1402 },
> >>> +     { .compatible =3D "smsc,emc1403", .data =3D (void *)emc1403 },
> >>> +     { .compatible =3D "smsc,emc1404", .data =3D (void *)emc1404 },
> >>> +     { .compatible =3D "smsc,emc1428", .data =3D (void *)emc1428 },
> >>> +     { }
> >>> +
> >>
> >> Unusual empty line here.
> >>
> >>> +};
> >>> +MODULE_DEVICE_TABLE(of, emc1403_of_match);
> >>> +
> >>
> >> Best regards
> >> Uwe
>
