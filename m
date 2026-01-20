Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A2733E36B
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Jan 2026 17:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768928515; cv=none; b=aJ+SKn7ntk4CiI6CPWcxiliW8MB/8sud3bbfuQf5EHc9jpC7MVDqi8yllslqTsqzgalgjCjnPhfrXDX6vZUM3j5ulBhLyJHD9ybceMj+ELdMxCe6JScFuGHUvpVmknSG+Cc4daYTgRrqLcESQ8+dV5sqE2yB8fbIjMy5BaJso1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768928515; c=relaxed/simple;
	bh=PEGw9xBw4ogKYTSJT9z89Z7FQh9KBbg44pnlT/18sxI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=uGuZHrHaCr58+Ur9J4wltiuLiWC4NxCy56aMefEhTTkYsc9mbwx4p+5y4QUF8KNKv00tfJlkFea+ZX/n3eyxWXMjL9HzFeRQ4J+kx/i/xqN7NTN0aZCk9i2Lpz+GTINLpNWSdoN8J8twKppNbGAm/7JsMNHQYqrGVfLWRpWbdNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRf33NAZ; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRf33NAZ"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12336c0a8b6so11791888c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Jan 2026 09:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768928511; x=1769533311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IUailGl3hB666dLaMWG2vrzy3Z8fMukkGgQryLbTNW4=;
        b=VRf33NAZuwZlZrDrhC7+EaIjHs01BeBpR2rh523c5lXap450HZptdPEyAbHGNMJyff
         or5GrNV9DnfYNtlxsi6gXaxOt0geFiNbg5Iv3s4uu5ud+t5yARRHQjxN4rNUCaL+MDJ1
         sxm66FJkxHA1M8xC46B3kdQ/wMsEkTHxCZMQACt5w4rDgGdZnOTdXAx5GtnuGoqSeXAf
         MqxtGqeKRWwBUd43OrpQW/ILy2uqH+P89YAml4tzM15AQCKog9GXnFSQrOB0xCCNhUA0
         YW9rktJyU1TDO4oWLLkZWOlbXUj0V9USF+nmg8wNhmo2pCuYD1ber+R9baoogL6Jlr/2
         nkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768928511; x=1769533311;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUailGl3hB666dLaMWG2vrzy3Z8fMukkGgQryLbTNW4=;
        b=kzm9qltR0b2lInvO3UZVo0PbrvWm/iX88WCLTW8v6ckaQAo77ZovkonOk4UV0APTGl
         yZKQ9y0SZjdnz00UJMZ7Rrgw47PKvhpDa07Rtd4y9kJOXOsWUAPvhM3EXy6pISQg05kj
         csATd5FfHE5EecwcjMARxDm7Z8VaCEQf/gsmD6aeji1JsNlE3SxwBSRfIK53I8LpLJmC
         1xuxTmcvczAlxiaDwlMjfXYFfRe+0NOL3BdheNuvpqSZ1N9T4B/+jk2jwlRkq9r0sRVv
         ElW2Arvt3E6fZMViIWGNUszsk6EJynS+FxB764TYb4BSTBqhd0QVTP+HonoLkAhYBbxG
         f5qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUht1DqjFKCDGSH21oDAW4X0J7fckjaBCf/xf3CxUwDFiX9oBux6meOQktegM0lU353lN/5aQzlVCy6sg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3X1G6K9Ajy1c3g08nnwiU2xJ+f0l/DOPllxOl1PFRAiDJGSS3
	HDxwqBbUR8e3lAzpepppICSl0l02EZLdcCzbIk+jxBvpAdz9lfCBAfMg
X-Gm-Gg: AY/fxX5dObXeZQrKd1XDDdFxx6a/XWQgJ+ukQh2dBXaY4WaqlvgP3cdam+pkjYJnSB/
	xONWPPjipiRk+h6i9OMkt3KKe5jRwkHdXqendPuA6819row05XRuveHVswnpOVDQ9dDqbpzpOCO
	Ksw5/FyVSLWPW9ewnhL3O1QRW0O8l8/tEAYz+pyBUL9hDZaU5W3L+4m2zuKdq8QR4957xkAW36Z
	p4LbZ/lyVpah4dQM1DCYT0LiZrZb8D/Rfj9f6irgrvpyfYnUAEuW5qRcWIXKkYMHjut2rQiyTLR
	JNnwZ3AWAjVd2UOPB6ytd2mlIk6A/2FMoqpwkYjZTC98xBfPBxV0sxqcObmBLZhzmZV7dwLkeeW
	01mo5dcCB8hdz7b0XVP/D5yyaa2ingOJ7LjkV3RKgN72pjsLqrrCEL9Aa9xdXh1ppKOKHrqEcFK
	9PMXHex8eveff+d6fg5UnGj5Kd3AyI5R6UvS5DxVgU61wQAeI7FSGSbee/9NebBp6bJ8FTulBOf
	5lRWqj4Vw==
X-Received: by 2002:a05:7022:418c:b0:119:e569:fb9d with SMTP id a92af1059eb24-1244a70c431mr12808662c88.12.1768928510832;
        Tue, 20 Jan 2026 09:01:50 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af108absm19903798c88.13.2026.01.20.09.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 09:01:50 -0800 (PST)
Date: Tue, 20 Jan 2026 09:01:48 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v10_2/7=5D_platform/x86=3A_Rename_?=
 =?US-ASCII?Q?lenovo-wmi-capdata01_to_lenovo-wmi-capdata?=
User-Agent: Thunderbird for Android
In-Reply-To: <c437e6e73d74b7aedd269328e1b0411a110444d3.camel@rong.moe>
References: <20260117210051.108988-1-i@rong.moe> <20260117210051.108988-3-i@rong.moe> <dc356678-4be6-3ba8-dd9e-18ba910f5e62@linux.intel.com> <c437e6e73d74b7aedd269328e1b0411a110444d3.camel@rong.moe>
Message-ID: <E7E469E6-8C93-4DB8-82E3-5CB82653984B@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On January 20, 2026 7:20:56 AM PST, Rong Zhang <i@rong=2Emoe> wrote:
>On Tue, 2026-01-20 at 16:48 +0200, Ilpo J=C3=A4rvinen wrote:
>> On Sun, 18 Jan 2026, Rong Zhang wrote:
>>=20
>> > Prepare for the upcoming changes to make it suitable to retrieve
>> > and provide other Capability Data as well=2E
>> >=20
>> > Signed-off-by: Rong Zhang <i@rong=2Emoe>
>> > Reviewed-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> > Tested-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> > ---
>> >  drivers/platform/x86/lenovo/Kconfig           |   4 +-
>> >  drivers/platform/x86/lenovo/Makefile          |   2 +-
>> >  =2E=2E=2E/lenovo/{wmi-capdata01=2Ec =3D> wmi-capdata=2Ec} | 124 ++++=
+++++---------
>> >  =2E=2E=2E/lenovo/{wmi-capdata01=2Eh =3D> wmi-capdata=2Eh} |  10 +-
>> >  drivers/platform/x86/lenovo/wmi-other=2Ec       |  11 +-
>> >  5 files changed, 78 insertions(+), 73 deletions(-)
>> >  rename drivers/platform/x86/lenovo/{wmi-capdata01=2Ec =3D> wmi-capda=
ta=2Ec} (60%)
>> >  rename drivers/platform/x86/lenovo/{wmi-capdata01=2Eh =3D> wmi-capda=
ta=2Eh} (60%)
>> >=20
>> > diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x=
86/lenovo/Kconfig
>> > index d22b774e0236f=2E=2Efb96a0f908f03 100644
>> > --- a/drivers/platform/x86/lenovo/Kconfig
>> > +++ b/drivers/platform/x86/lenovo/Kconfig
>> > @@ -233,7 +233,7 @@ config YT2_1380
>> >  	  To compile this driver as a module, choose M here: the module wil=
l
>> >  	  be called lenovo-yogabook=2E
>> > =20
>> > -config LENOVO_WMI_DATA01
>> > +config LENOVO_WMI_DATA
>> >  	tristate
>> >  	depends on ACPI_WMI
>>=20
>> This series is in the review-ilpo-next branch now=2E Thanks to all who =
have=20
>> participated in getting it into shape!
>
>Thank you for review and merging too! And thanks to Armin, Derek and
>Kurt for review and testing! ;-)
>
>> While reading it through once again while applying, I start to wonder i=
f=20
>> this config would be better named as LENOVO_WMI_CAPDATA ?
>
>I didn't thought of that when I substituted all occurrences of
>data01/cd01 with data/cd, but it's definitely a better name for me when
>it pops out=2E
>
>Hmm=2E=2E=2E Wait, we have
>
> 	=2Edriver =3D {
>-		=2Ename =3D "lenovo_wmi_cd01",
>+		=2Ename =3D "lenovo_wmi_cd",
> 		=2Eprobe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> 	},
>
>What about adopting the same name here to make everything more
>consistent? Having a unified name will be neater=2E @Derek, what do you
>think?

No preference personally, nobody is going to see the config option really =
since we just select it when we enable the others=2E Consistent naming prob=
ably helps folks who are unfamiliar with the different drivers for this int=
erface I suppose=2E

Thanks,
Derek


>Thank you all,
>Rong

