Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACB7387351
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Feb 2026 08:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770193255; cv=pass; b=KNlxuhxtXxH+BJ9HdyvuPXQjwLp88sNek9Uv+9fYwZQULHspPKz6JbAlXSXSKxx9P5sZsat/ib9MJTgTYz8k3NQk2swvirWgviA/zbn7WPRL41OEKa8NndjQx1JX9PTGiqKVjWb8Oxm946wkxOHigabGZAHrM/NRS6spo/VBMcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770193255; c=relaxed/simple;
	bh=yQwGJnp8nFSA8oli4GbB6SkUvqn3H61QJ80HMfFj484=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8viox9SH14gswlV7eJJZ9XJ8q9IZmgkZIdcF9V6zSaMRz17CPglYHeOtp1EY5txcDe4lHboV7vYGQRlc9CsCp5Zm8hrQUbBpX7CDbi5HbgXpByzxiVeuiLoxitaLN8NlrEdurmKOtPD/XnNN8kjT/SoOgFAOlEt3QALfgzNfSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com; spf=pass smtp.mailfrom=gooddata.com; dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b=oA0eyKsQ; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gooddata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b="oA0eyKsQ"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1233c155a42so10688495c88.1
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Feb 2026 00:20:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770193255; cv=none;
        d=google.com; s=arc-20240605;
        b=dF9Lo0TIIPCM0068Pm6ZoVj+6y20unKGONXsy3j5cRMes6SPVZd8wFyyZLFLOQssLE
         O3FeTgk7OwMPSQgFbwE+19JUMduxHYQl6osS9906XhnZjAnly0bwmx0jG3SvonyWJnbv
         Cp6UWbtc9WtDtuwq+RhOR+bak8NgE45DMg5lx0ZBi710cn7Gd45x6ndVtxOJMwSv/eSW
         hx+DoMRDoUE15482S6uty84VLEoH9xy0w3cEESDEyGjdLqpOMcmtn3chxBO3ZtbAZBUP
         NTm2vYC4BHURt6uZMDMP2hs6ymlNErAE9BzSIBYd5Hg1NFZo2kECHdUZ/t80EqWBkXTL
         XOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UpVUHH/DUdD2rsKBwnHapoi48eE9XHeYgIxbMBSYxjM=;
        fh=gH3PcnEIVhGCyGag9xZJkCqPdqrayhl+ZpP7sWL/i6M=;
        b=bwyBQ3abQLdcFa6QLdFNd36zSL/l4UCZkqPqNSjUyls8kkrkh/YdPBoCB7d3MRzDe7
         3uS4d+3zlpnkJive8OSAz5m2vDdqUCV0vTYEXtZk2alWvIr7X0xluP4VsNUpP/ka7Urr
         NYk55k6M0h0XlCQuuUxz8ULxyGzrYm2WasrtRaJwV+McLBCH763ZcrpOEppEGVy4MMkZ
         TfISV6ngY8VqKF+wpIwDz0ZxhCMqNefNLi3e3iZ95mdKGucMz2m/NeGNzQE1IP3FrV++
         a8GoAewF18dpat2VAHjny4IwR837Woya3ysCegKc9bVutX5txoG3i7i2eHS7mQK93s+R
         GaEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gooddata.com; s=google; t=1770193255; x=1770798055; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UpVUHH/DUdD2rsKBwnHapoi48eE9XHeYgIxbMBSYxjM=;
        b=oA0eyKsQPI5VELQvxjxyxcjUsJHmTVFuQAkAhAaQwizSKigs5zbXG1Kfwq8giOJ53B
         oEVax2iuOywY9Hu93j0wpGKDygN/WaM48yErii9QI2zDf21M8yO/xQXpJt/9USc4rShp
         hsvPgJPFaeX3qrEvvWqW7SNAxkx7VIrpZZJ54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770193255; x=1770798055;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpVUHH/DUdD2rsKBwnHapoi48eE9XHeYgIxbMBSYxjM=;
        b=dj/mMXyPAiTufZegro9+vzRMSMiI6Og7uXXLt+TDitnCvKh88ZfI/jerAKJHZK5EuM
         81es0BOywB93hmLddFoJojh0yIOYp8WyhXDMvqkRj96fJ8NyCTvIiuWkWnOlxStBlT6x
         wcO/AedHYpyB4pDXPfrCSG47ZEu8kUTWMVZvNOuUUX0E2VEIuPWiGgrsnWO79v23qa1p
         tjVmVnPnIxsc8Yss+xgwIYkPm3QGmrP8IBmFtXXrpKxr8wcu+U9HwISXUM4cU2saojbZ
         3+sCZZ2d/G/B6MywS1gzDriDS+bYSlSuurZoWoomIcT68hVg4tE08RVZnlsTQh4pSUGK
         iLjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2FKXiLwkQqTLIn69iyeTT0wru7HLvy7gYJl1m3fEbpJn2RwR0gch9I0sOp09h2XPOmhuH/+vpz17rKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuxROm/aWn0hAe2NihY16CftoxZZ80kugfV5T09Ga4BLGvNFki
	34zp6nKEx3DNSFRYaqQISorhWxCiE6DUQ298YGVrsYORNG6vUahdYIv3PfauOyEybcdMb7MYKoB
	5Upw3SbG6cj3OpSpWCgCehS/XCDo4pLdHoJjkVr8h
X-Gm-Gg: AZuq6aKCfnHqzrub0Y9AVmWJpJ2SOFn0wOAMgWRyIIJb3eooQ+MqorcjbD70SaSIg96
	IJggRESGuiYc0YE+a5qCuVQCX3fi4aH8AhypQ7N+L9XZHOms66n46L36AJVHJhhyHBpKOJuVJxq
	D3k91vchpIOqS/u/yb3adI+di9mEWkjsK6AvCHWZwesjNj+geb2ztFgZKrPn1mmsycpKWPXkOdc
	0F9beF7Pije29KqwJaKZINARvI2iy1ad1t0vM9RMxsHyTQkZ0VCXyyRBiZ0TIG06KYWivFD/gcc
	1qZRIF8=
X-Received: by 2002:a05:7022:2506:b0:119:e56b:98a4 with SMTP id
 a92af1059eb24-126f478f949mr1114334c88.11.1770193254712; Wed, 04 Feb 2026
 00:20:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK8fFZ58fidGUCHi5WFX0uoTPzveUUDzT=k=AAm4yWo3bAuCFg@mail.gmail.com>
 <CAJZ5v0hvKzKTWA8jFYVDHttd+hDv1juu87vgyhf2udOGbqrQdg@mail.gmail.com>
 <d7f34e0f-e258-4fef-93eb-1ef0a3123d95@roeck-us.net> <CAK8fFZ4izdX_HDtGN60CZ3Ta61nqkUg7ncViM=mGgxKki_5FoQ@mail.gmail.com>
 <a7334568-13ce-4600-8650-607273e67976@roeck-us.net> <CAK8fFZ6gKs7s2rJ=f7bt24f+_cY-jGU33TvX3UP=U58uK-1KaQ@mail.gmail.com>
 <fff54ec8-496e-4c26-b652-358dc4de0de0@roeck-us.net> <CAK8fFZ4wEUdMAHkfdC_z8ohYB_rEXZ=dHArc75jDibgQ_-ozKw@mail.gmail.com>
 <4f151d4c-fdc6-4281-87b0-b7120eeb1b46@roeck-us.net> <CAK8fFZ401-nez_CgDTTnQiPT=oBRRJuYooXyEKFuCdHpGCPXtA@mail.gmail.com>
 <27d60756-d33e-4926-9a02-f52505339de6@roeck-us.net> <CAK8fFZ43wrQ8A_bO_g+rKN9O31sxULtqA0hUieZSzEH5KqeW1Q@mail.gmail.com>
 <CAJZ5v0hEu_io2BAzp9weUDHwHngorjZ37GRUK=ngSXNjtp38qw@mail.gmail.com>
 <CAK8fFZ65Vro5nQqJq_cvsY93hgDbfTdibWnNr5b0Bixzc-ESfg@mail.gmail.com>
 <CAK8fFZ6Vi4xayvdKh-_eLi-nDNMLuEoMsvwEnb33QqnwS7o4BA@mail.gmail.com> <1c8f748a-5c5d-4234-ae86-7bb12045a373@roeck-us.net>
In-Reply-To: <1c8f748a-5c5d-4234-ae86-7bb12045a373@roeck-us.net>
From: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
Date: Wed, 4 Feb 2026 09:20:28 +0100
X-Gm-Features: AZwV_QgEcGPFEtMQ44PFqqfa4Vwe2eBylAQU3_AL8hBX4XKGTsX1VUgdzIPJsbQ
Message-ID: <CAK8fFZ4YhuE5ygveCet3aGyOsL1e+kD1U4kQDVAe0dZECjYu9A@mail.gmail.com>
Subject: Re: [BISECTED]: acpi_power_meter: power*_average sysfs read hangs,
 mutex deadlock in hwmon_attr_show since v6.18.y
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, Igor Raits <igor@gooddata.com>, 
	Daniel Secik <daniel.secik@gooddata.com>, Zdenek Pesek <zdenek.pesek@gooddata.com>, 
	Jiri Jurica <jiri.jurica@gooddata.com>, Huisong Li <lihuisong@huawei.com>
Content-Type: text/plain; charset="UTF-8"

>
> On 2/3/26 15:21, Jaroslav Pulchart wrote:
>
> > ...
> > $ git bisect bad
> > bc3a9d217755f65c137f145600f23bf1d6c31ea9 is the first bad commit
> > commit bc3a9d217755f65c137f145600f23bf1d6c31ea9 (HEAD)
> > Author: Corey Minyard <corey@minyard.net>
> > Date:   Wed Aug 20 14:56:50 2025 -0500
> >
> >      ipmi:si: Gracefully handle if the BMC is non-functional
> >
> >      If the BMC is not functional, the driver goes into an error state and
> >      starts a 1 second timer.  When the timer times out, it will attempt a
> >      simple message.  If the BMC interacts correctly, the driver will start
> >      accepting messages again.  If not, it remains in error state.
> >
> >      If the driver goes into error state, all messages current and pending
> >      will return with an error.
> >
> >      This should more gracefully handle when the BMC becomes non-operational,
> >      as opposed to trying each messages individually and failing them.
> >
> >      Signed-off-by: Corey Minyard <corey@minyard.net>
> >
> >   drivers/char/ipmi/ipmi_si_intf.c | 29 +++++++++++++++++++++++------
> >   1 file changed, 23 insertions(+), 6 deletions(-)
>
> Now that is interesting. Does reverting that patch on top of 6.18.8
> (or any other 6.18 release) solve the problem ?
>
> Thanks,
> Guenter
>

Yes, reverting commit bc3a9d217755f65c137f145600f23bf1d6c31ea9 on top
of 6.18.8 prevents the issue, and the problem no longer triggers with
the same reproducer.
