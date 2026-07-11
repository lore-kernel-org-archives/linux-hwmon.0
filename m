Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159AE271A94
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 02:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783738293; cv=none; b=unWRAu6/Iz93T3guU3OBbX/FnayIFBsW/xDOzUT2FqoFXKQsbJHQJxLnKnxTE+gOvi6WjU4+opqkxXeuvrZBKv8vJsbtOTTKSzCKxUezz3gGKUD/Jz1rPq0emF4CMIBH38QBmUVX1IAW/RMvYhOHh39CpQO+s4waRca8KI02hVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783738293; c=relaxed/simple;
	bh=kV5+t1cVf96il9uZ3r48WjVASA1JTph4A0dE+Atpt6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTx4cA7O5ujsYj38irtUgCUsh0r0Oe1Vvi7+Oxeb4yg3dtLksV6mwXEUmnYFHcMNEwL1wOgsFd1P3nLXqIyqFEBnhmJI0GPJpWN0IXBF9vruHZ8Kp+AkQtUkXchakJQdE6SqZtdg/q2tBFozpz83FK9tc1zbd7XpHJeMfgReOQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7ea9c6ea7deso1250437a34.3
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 19:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783738291; x=1784343091;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Ow+CdoHjMmyfY63LSiFrGfLPN8IMHJXkAbTGH2vzKs=;
        b=rl46yDGv/jzn+g/8fxhWYwLklgAQwNSYiYNwSf9HBlRN6Gd/QFdMiybOLkqXHOWVXJ
         Bce1z0bjJ7TpEUMcBhzLLELBesPlfllXuaZq3dYPdkGzNaHHBa4N4yChT5TXQU+5uNfK
         9hrciJFcvhJxIlz7k+nsQyL38zy9JOM3h4Ix3cebkxTjxGYpEOlZE5+j59ARY2l9GDUp
         s/SI/CCn5a+mNWF2eAjqBSscr+TVOSKztcEwKMIEn54DHQOT6NWc13Te8+vrd5aK3pyX
         mtTupyv3Pd8Cs5gQMowrPS4ukvUXhIGHiFr0her/rtAUdibU6c1mXmHRTQn8FMe81HYi
         ybDg==
X-Forwarded-Encrypted: i=1; AFNElJ/pTSAF8kdvX4xloqeAeVhFK67DqIFXK1FWeaEgMMENjpWzjMHgJSnwxbOqQ1iQkPg8HigMH11gm3Q+6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxapvfBlFYR36K+/O9oz4lwt+BHJsQnRNokxOyPqoDlG8t2YMuN
	67+TomMaNADWIkMTf15HXWqNYkf/Q2sGiQ7QHPzIla2JdUjgOYNBfUYGOwZLZsef+Q==
X-Gm-Gg: AfdE7clIHuuePFgRcKhKJ6l1ZCZ3VXRTwcYQJ36yrlzW5CY163AqQlNp69hrS+ZLSpc
	N2syTiNVkfhlg4VJRyf5hcpbOD7HKtvl8Mg4ksF66Ymy+ORRebtj2agX9C1lGKnZYHeKT8kpw/6
	FENaXzr4fv+pHjkBOLbxQJrrb0+nyeWJakEHC4/zMdhC5229B2Wt5H9DMwLtlB+l3KPYLnukF2C
	PNaXM6yIUTZdw4RBu0RokrFuCXxUntCYSj7EtsHN5uMpy1DrDplVYMfUzGTSbfb0IbCQlBXi89p
	8F6Lp5X4RyfWUz75YotvXA24m2OoqXv8h3VxY/GaQeZP5+yt30zsQrFodo5Wmqyg0EKW7b8skod
	ByrsAJLPL2lnlIl3sNMZELTklCdoDRlsr2Kid3BWxtpHXBQpxfrizOmhQucsIAaxaZpFgbacAXd
	TZk91yaf7F82yOZyvSkPBwqsnEXxTqZajxwX1QA7Le1E/bt+2HOwDHHUF3Ry86fYRQKYnTbV683
	nhMEmScmP5vlm8=
X-Received: by 2002:a05:6830:369a:b0:7e9:e9a0:9a8b with SMTP id 46e09a7af769-7ec097c7085mr972443a34.16.1783738290789;
        Fri, 10 Jul 2026 19:51:30 -0700 (PDT)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com. [209.85.167.170])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb2631dfsm7752550a34.13.2026.07.10.19.51.29
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 19:51:29 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-48982e3f12cso988208b6e.1
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 19:51:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/SL07bzqsPf6fGKPwqlHrgTjg44jKCMc3vTgb4mhcXvq5zWN4dGNUFaN1vwymreEqDDrg+byHmG4bJBA==@vger.kernel.org
X-Received: by 2002:a05:6808:4f6b:b0:495:fd30:479a with SMTP id
 5614622812f47-4a42afafc00mr1264673b6e.40.1783738289657; Fri, 10 Jul 2026
 19:51:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260710123236.10508-2-fourdollars@debian.org> <99c83d9e-129a-4db1-b0bc-dba75c07708e@roeck-us.net>
 <5fff5c16-691d-4009-add6-1a38aec3a4b1@gmx.de> <7b427ff8-3183-44e3-b2df-2f50ee5c0069@roeck-us.net>
In-Reply-To: <7b427ff8-3183-44e3-b2df-2f50ee5c0069@roeck-us.net>
From: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Date: Sat, 11 Jul 2026 10:51:17 +0800
X-Gmail-Original-Message-ID: <CAAT15mOr5baW-kThv8PD7k+2bV51Qxat1P0vfPg1V7gamWt6dQ@mail.gmail.com>
X-Gm-Features: AUfX_mynGoAn9_DtLEjRIhgTxL0woukwV_2jJsXE13u_w9VMZ5_WyS41makgQz0
Message-ID: <CAAT15mOr5baW-kThv8PD7k+2bV51Qxat1P0vfPg1V7gamWt6dQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] hwmon: (applesmc) Convert to hwmon_device_register_with_info
To: Guenter Roeck <linux@roeck-us.net>, Armin Wolf <w_armin@gmx.de>
Cc: Henrik Rydberg <rydberg@bitmath.org>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter, Armin,

Thank you for the detailed feedback and suggestions.

I do have access to a real Intel-based MacBook8,1 for hardware testing. I a=
gree
that converting the driver properly and renaming the non-standard attribute=
s
(fanX_output -> fanX_target, fanX_manual -> pwmX_enable) to match the HWMON=
 ABI
is the right way forward.

I will start working on a full refactoring of the fan and temperature attri=
butes
using dynamic hwmon_channel_info allocation, and test the resulting module
on the hardware.

I will send a v2 patch series once the implementation is complete and teste=
d.

Best regards,
Shih-Yuan Lee


On Sat, Jul 11, 2026 at 6:28=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 7/10/26 14:10, Armin Wolf wrote:
> > Am 10.07.26 um 16:01 schrieb Guenter Roeck:
> >
> >> On 7/10/26 05:32, Shih-Yuan Lee wrote:
> >>> The legacy hwmon_device_register() function is deprecated and trigger=
s a
> >>> warning in dmesg during driver initialization:
> >>>
> >>> [   24.706091] applesmc: key=3D620 fan=3D0 temp=3D37 index=3D36 acc=
=3D0 lux=3D2 kbd=3D0
> >>> [   24.706270] applesmc applesmc.768: hwmon_device_register() is depr=
ecated. Please convert the driver to use hwmon_device_register_with_info().
> >>>
> >>> To silence this warning, convert the driver to use the modern
> >>> hwmon_device_register_with_info() API.
> >>>
> >>> Because the driver creates all its sysfs attributes dynamically on th=
e platform
> >>> device, we define a minimal struct hwmon_chip_info with a single temp=
erature
> >>> channel and implement a visibility callback that returns 0 (hidden) f=
or it.
> >>> This satisfies the new API requirements while keeping all existing sy=
sfs paths
> >>> and attributes completely unchanged, ensuring backwards compatibility=
.
> >>>
> >>
> >> Novel, but that would completely defeat the purpose of the new API.
> >> NACK.
> >>
> >> Guenter
> >
> > Agree, this deprecation warning should not be silenced by using cheap t=
ricks.
> >
> > Lee, i think instead of abusing the hwmon_device_register_with_info() t=
o emulate the
> > behavior of the old API, i suggest that you use the new API to replace =
these two calls
> > to applesmc_create_nodes():
> >
> > ret =3D applesmc_create_nodes(fan_group, smcreg.fan_count);
> > if (ret)
> >          goto out_info;
> >
> > ret =3D applesmc_create_nodes(temp_group, smcreg.index_count);
> > if (ret)
> >          oto out_fans;
> >
> > Basically, you need to dynamically allocate a struct hwmon_channel_info=
 each for the fan
> > and temperature sensors. Then you basically use the new API to create t=
he standard attributes
> > for you, while the non-standard attributes are still created manually a=
nd passed using the
> > extra_groups parameter.
> >
> > The non-standard attributes are:
> > - fanX_safe
> > - fanX_output (should be renamed to fanX_target to comply with the stan=
dard sysfs ABI)
> > - fanX_manual (should be renamed to pwmX_enable to comply with the stan=
dard sysfs ABI)
> >
> > This changes are not exactly trivial and should be tested on real hardw=
are. You should
> > only attempt this if you have access to a compatible device for testing=
.
> >
>
> Exactly. Other drivers, such as the asus-ec-sensors driver, use the same =
approach.
>
> Thanks,
> Guenter
>
