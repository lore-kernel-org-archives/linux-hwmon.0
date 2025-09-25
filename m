Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F232E9EA3
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Sep 2025 09:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758791770; cv=none; b=fj5cPxTl6ijKfA0NfsROJ5TfZie/Rfjeehlx2MCvtwwS2DheOkxLVbJ3tUF+tVtzE8Msa8jLPnn0TnWz9ibyoMxLKPVA/CAQQOe9Xw3zclfeiacW/UssbyC7Vfo/nbbPkLW2wLTM+ep5z8ipHt5bKfU+zXSVXlYL8mN7Yh2+Fkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758791770; c=relaxed/simple;
	bh=R6b2qrjJDoLl8JjJK1a1b6g2iWguvqkL8xGkWDqxDs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAhWovr8IaBGKVWRNtEn3iFyM3JWlnxrgH9M/8CocwBTFli7YtxIGs5ruwhOvV6qdTOvM7ZL4d2TEAKSydz489vQKnwEll8kiq2iOpFhoQ5Jk3GJ8VXpkmE/oYj62hNeUQTV3w+wEl9k3SwrVkTkDwSp6Q7P3fRQCiuXfEtqTec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=KcRSV4Ri; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="KcRSV4Ri"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-62fa8d732daso1452854a12.3
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Sep 2025 02:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1758791766; x=1759396566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfwIA2slikNrtiwNNvj+NlMW/ldb/AEMdOl3nm8LmqM=;
        b=KcRSV4Ri5a5n4t1uwTZD8/U+CNwXXu0FKXSgXayIDV0kc4P5hZLAeAyvCffK5rQa9s
         VrN+Fj3NW27KEtO/VKYLiBHl0ZopaZmCZ8Z1rGnKAs3YUOlM0Eai5QNXvAfFOUeOb41F
         Y7jwcAA1BG5QXtd0bd+Igc4BLJTbprKEWTcJvPifLi0xSfiGeMXY4w2tPZJZ7sioCqH/
         qK7Ve8ESf12/ToNd+uWt2w7aRO9r11C6NN+tjQfAzOyTnSv4SMySmq0Ydam1uo1nAomF
         9kGkxwJVJqCvnYQj8016RgXNKfXlhbmTjgW0RmodXBL2gp3hr+ovzqd+XTt57Ujo0JgP
         I+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758791766; x=1759396566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfwIA2slikNrtiwNNvj+NlMW/ldb/AEMdOl3nm8LmqM=;
        b=gngDuPlnbXntt5SVv2lOPrjl/Z5yz15fB05TYXpbQclhhRrW1bt8f4Qqadps31thYs
         aawDWDyq6PIvMJjQpWGAuzXatBJz0yDTav/9Lw4gWV8cD4BJDDVv+9e69w/NZw0dgG3E
         QYvqqgdtS0rMsmtuKv8gkho4NN44XrHCs65VxrYOXAu0/m1tyDx5Gj5iTzJdVFztavdc
         p+tqZ/2UcSDn/aMASrowyAzm6N39YzKLtpj4yqWvlGqFrDgcaZLtHfwreH7QMKTIULTr
         k4pR7cjS0zGyJTfJR75wbhb/KQ7vfcR1n3W9Np9UuHlPjgegGsEKAwdppo+nGUHzs2uX
         uatQ==
X-Gm-Message-State: AOJu0YwgE7TOZMgdf09GZdlXz9d62vTrOf+KisEAR5lkE+5hBjOQSo/L
	cKBVJCEFFRDjuLwqFZ6JfyPes1whAIHR0o5ngbRVUlk3cnQrZRF7Funzkr1dJgqn4bk7lk3+uNA
	Q8/S75cKTyR/dpcyzM3UwnyF6sQzr7DURiRYbYMzd1Q==
X-Gm-Gg: ASbGnct9aSSKV59K+BelYujbv7Y2XQPsQzMq00xQLmG+vVUrqq2eLkNQUIKG1gdeULY
	NE/Rsz5JFLWTbo+AVzDvMzhFgAcXq4CfpIBAHZ7uH94IDweHgr6cOpsLy3dlutbC2SoG8aHJfKo
	WC8XRZacugcGC2eBnJXgnr91h7LUOUx30GDH5Dy1KZvY5gCVxIGV66m9eQqjdwcIbB+sYGu02mh
	zbe66j3
X-Google-Smtp-Source: AGHT+IH9w0rQRH1Xdl8p6KeJ3RT0NiQtsRn5ud9cIpEwnBYA3yBXFW6rDCw8YS4Ajxey/LxrtrwFxA5aH+cYhT5GYYY=
X-Received: by 2002:a05:6402:5357:b0:62f:a3ae:ff0d with SMTP id
 4fb4d7f45d1cf-6349f9eef37mr1894435a12.14.1758791764570; Thu, 25 Sep 2025
 02:16:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924213027.1887516-1-robert.marko@sartura.hr> <f019dcef-afdd-4d18-b28c-b214fa14f1c8@roeck-us.net>
In-Reply-To: <f019dcef-afdd-4d18-b28c-b214fa14f1c8@roeck-us.net>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 25 Sep 2025 11:15:52 +0200
X-Gm-Features: AS18NWAQPVOYppZ1_b4enxd-K6lpZFgT-FBM-ttaaPmwezyFrJXb-irLkljRWpg
Message-ID: <CA+HBbNFe+7XT3bSUEagsXiug-bmh=fBfLAW0d7WR73Di8-ozTA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: sparx5: make it selectable for ARCH_MICROCHIP
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	daniel.machon@microchip.com, luka.perkov@sartura.hr, 
	benjamin.ryzman@canonical.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 12:07=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 9/24/25 14:30, Robert Marko wrote:
> > LAN969x uses the same sensor and driver, so make it selectable for
> > ARCH_MICROCHIP.
> >
> LAN969x _is_ the Ethernet switch driver for Sparx5, so this description d=
oes
> not really make sense. Same as what ? Itself ?
>
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >   drivers/hwmon/Kconfig | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 840d998f850a..ba2b7b2f6c44 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -632,7 +632,7 @@ config SENSORS_I5K_AMB
> >
> >   config SENSORS_SPARX5
> >       tristate "Sparx5 SoC temperature sensor"
> > -     depends on ARCH_SPARX5 || COMPILE_TEST
> > +     depends on ARCH_MICROCHIP || COMPILE_TEST
>
> ... and silently disable it for ARCH_SPARX5 at the same time ? That is no=
t what
> the description says, and is completely unacceptable unless explained.
>
> >       help
> >         If you say yes here you get support for temperature monitoring
> >         with the Microchip Sparx5 SoC.
>
> ... and, on top of all that, still claim to support Sparx5 even that is
> no longer the case.
>
> Ah, I see, this patch depends on patches in linux-next. You might want to=
 say that.
> Also, there is context missing: If the sensor is _only_ supported on Spar=
x5
> (which everything but the dependency suggests), it does not make sense to=
 extend
> the dependencies. Why make the sensor configurable for _all_ microchip ar=
chitectures
> if it is only supported on Sparx5 ? Maybe there is some other series expl=
aining
> this, but this patch is all I got and it does not explain anything. It is=
 only
> confusing and does not make sense on its own.

Hi Guenter,
I should have extended the description a bit.

LAN969x uses the same sensor as SparX-5, and they both select ARCH_MICROCHI=
P so
SparX-5 only configs can still select this driver.

It was suggested to me to use ARCH_MICROCHIP instead of adding new ARCH sym=
bols
one by one, but if you prefer, I could just add ARCH_LAN969X instead.

Regards,
Robert
>
> Guenter
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
