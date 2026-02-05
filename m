Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DAC362150
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 08:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281528; cv=pass; b=gh1fpkj/kvUtAD2oh5tR3MT+95DcvdOl+qyDUzp2INPf8koRsS2zW8ydqqUcdyxJeGg04XMSDb//klQwH/sJd80MFo2YFjcV6rjAXr4lMeMvV2cVGbsldL5LK04FxjU+X9mP/vGegjqCWErjMWhSJ5eaD9rCGTpMQ6ORnhQy00Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281528; c=relaxed/simple;
	bh=4A/MiiJVc8pEYXXHDijQAkXnz/x9Cb0tcMWrCvdhwds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aUky68qQNtvN6rtErZr/lv+g7rdUdPcE3cM/gLMOOQf4aidw0imFDaFHf5NjVU0zLEAp2YGMq8JEJZu8zJicPvVNVaNaEUS59/w1wMO6L+otrAevaEUar9q6sPxGI9TP2Ey1NObwk6jqrQQiN21vcvVchnSno4ew42q4i+bE7tA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7kxUflh; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7kxUflh"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-126ea4e9694so1863862c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 00:52:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770281527; cv=none;
        d=google.com; s=arc-20240605;
        b=ihzw6i1vXvzBaa1z4Qg0SskMKKmRZLyUPtwOQbJ/ZAA10I9eCkw/H2CTpBHAkbxTc3
         rBW8tJvZ6v7hUDvCsvmgsM4J376o7i3ZlFLFyUSXoDhXFIXkkBxD5EXdnGegvc1u1Y+O
         hfR4h/moRm04AGraMMbdqnaWUmEye8l1wMo89fW1woe6hPnCHWPTqhceMMCWgOCsQswc
         C9OaeYWVgS6GHtSgGyyRkEmFAkKyjcFXMVeop0ZvnFMfpbhIiJpgw8xLJ7JScxnBnvEm
         Bzof+/YBS9qlJ4n5ELOC34DzI8nlrlbmqIKIyrPFCZXhe/d/kgyIbYtyjm4MO7dyMH/q
         UIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Th4luOWj55mT0ARJ2IHQ1pwY+3KM6qdiQQaJT4jyhQ=;
        fh=ByPCW8EMEGW7KZ3bWerLG0Uluah6bq84AiNE13ShK14=;
        b=ea+uo0lKe7KZ33jmCyjIc2rK5TH13Ec6XVPH+S5y/7Eh2di2BRK+k2szsZrp6Hqbt2
         dj3Pcc9Cet8jTr3aMnu/iS+F0VD4412j+lgapne+02pdb/sfORovrfLzEQLvddhfRlqo
         qawJzsru4nk46b7Eykhh4nFbAZi2f4lfCyl4+nNZUqiyIUx4y2SdGcx6gu1kadkwZJKK
         wquJ+yv2WlJANFlWAkd8NEyRWH3TbR0nvzxQKUK0rKS8C6TTKSjLyioPMzACUpY1oXie
         6X2nnRnz9SFO2EQEiMsxoLChu+0B5c+u3VQL7IcOlueWALTjwDQUqW9H+czb5+hTd+fw
         9IiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770281527; x=1770886327; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Th4luOWj55mT0ARJ2IHQ1pwY+3KM6qdiQQaJT4jyhQ=;
        b=G7kxUflhI+1m3lHP33Lh+6ubmgxzEik/RCONFGxjGglJoBkpt7H8tiyPTCHZBQqkJ6
         P57TKmeDTB3wTxxRwr4Y2bvtYIibIMs69FNOi9r8VXYPlhdChZciKaJPXELsNdOFmk2A
         JlWWAbYYD/mGrppSqsdX5CJXycMCGiEkePpEiTtLu4QwlyIvAstDVSz0qjJUnX+ga1Dm
         7pKdeLGJySUkS92yqsh3DoBlOHQkUeehsRm0d2JxuKRb6k1hqwypO8JKxOqjGLXzj3oz
         rsFlVnPyHS2OfUdcspZ17qNNnI0+jR8RBAU0Ah3DrKmuV3nh/bh/cpPF157mtgra8ZVU
         Dogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770281527; x=1770886327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Th4luOWj55mT0ARJ2IHQ1pwY+3KM6qdiQQaJT4jyhQ=;
        b=wAFs3BWTkZYnWG4U9ZF1GSpmvS3C8JzfuBDQ5h9uwuasIolz1mdVyDDecIGj1Tj8rY
         Uhn09Shh4+TKjlN0F/XQbIw5afBEMd6T3Ludex5ddxe2vnlEvy4c7tQ3mvE01jQcLHJM
         /0n0/Ryqd8+Go01yMqTdNhv6Mz1XiuZuB83+BNpeMQ3HccYVavft+7q4mMq3cXXwj4xj
         vdNr7HtZgqZxEMlPkzqlIgQNUL6ZsAwvMVxZvU2ieCpznglaJc0b+AbLtfQ9PHMXoojg
         foitgWPx7fDc98ATXNER8zNY21cHPt5D4iqPxrBBsUOtGc9cW8BGjddEwTZh9klBIQku
         YAqw==
X-Gm-Message-State: AOJu0YwVDOYt2r53go2qh09wJIFC2/Dk9mn0O19S+itx66aO4HR1dht2
	pUrCG0m9pW+qNLgwNGkgY3WSKfHToj0kT/YyaEiY2GwtKntfpgViiE0a6q5E8gHDbamhlkfYQph
	3eps6RIt0r5sSUs/IeyMsn5RkCybCtj0=
X-Gm-Gg: AZuq6aIMGRNV9H9mNxmV941Uq6WEA1rF/nPEd0roF27BYwivtFmlxB/nvlgDL12QeJZ
	lV4zViyaDPn+ZIpkhjLdgLb6ftAdeApjbTNGCdo7dCceQ56XxOd9ZUyEp8mL9AsrRI7Nfuh8fbX
	FcOKJMRQVjFXX8a38azKtEqPadbYS5vKDgXRSkzd6HaQoPTIqxcZt679LpXrdh4+ckR8gvym+uB
	G27FpYbyf/fkbJ9PmSDyCTqLb3UMVgsneRMBCxxEYl1WqhRz6rjKr7eBTMmGyb2rpsENlcv
X-Received: by 2002:a05:7022:6b9b:b0:11b:b179:6e17 with SMTP id
 a92af1059eb24-126f47ce45dmr2584476c88.34.1770281526812; Thu, 05 Feb 2026
 00:52:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202080355.53061-1-Ashish.Yadav@infineon.com> <828c7197-e49a-4a93-8290-416a1b691f11@roeck-us.net>
In-Reply-To: <828c7197-e49a-4a93-8290-416a1b691f11@roeck-us.net>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Thu, 5 Feb 2026 14:21:55 +0530
X-Gm-Features: AZwV_QifYLLFJ5Sp9pPDY_5NHwOvmvcEgLQigAqeCRsc9MatWR7WTf1T3YP_zK8
Message-ID: <CAJKbuCY8Xc0HMfpVG1FCjW_-QE-Lm_qKVxFht7Dj=18XoGjwUA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for Infineon Digital Multi-phase
 Controllers XDPE1A2G5B/7B
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Ashish.Yadav@infineon.com" <ashish.yadav@infineon.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thank you for taking the time to review and provide feedback.
I appreciate your input and insights.
Please find my comments inline below.

Best Regards,
Ashish Yadav


On Mon, Feb 2, 2026 at 8:39=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 2/2/26 00:03, ASHISH YADAV wrote:
> > From: Ashish Yadav <ashish.yadav@infineon.com>
> >
> > Hi ,
> >
> > These patches add support for Infineon Digital Multi-phase Controllers
> > XDPE1A2G5B and XDPE1A2G7B.
> >
> > XDPE1A2G5B controller supports Linear Data format for VOUT using VOUT_M=
ODE
> > command.
> > XDPE1A2G7B controller supports Linear and VID Data format for VOUT usin=
g
> > VOUT_MODE command.
> >
>
> This suggests that calling the identification code is not necessary for
> XDPE1A2G5B. Please modify the driver accordingly.
>
ACK, We will take care of this in the next release.



> Thanks,
> Guenter
>
> > In case of vid mode in XDPE1A2G7B controller, NVIDIA PWM VID vrm_versio=
n
> > is supported:
> > Vout =3D 5mV * (VID-1) + 195mV
> >
> > With Best Regards
> >     Ashish Yadav
> >
> > Ashish Yadav (2):
> >    dt-bindings: trivial-devices: Add support for XDPE1A2G5B/7B
> >    hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g5b/7b controllers
> >
> >   .../devicetree/bindings/trivial-devices.yaml  |   3 +
> >   drivers/hwmon/pmbus/Kconfig                   |   9 ++
> >   drivers/hwmon/pmbus/Makefile                  |   1 +
> >   drivers/hwmon/pmbus/pmbus.h                   |   2 +-
> >   drivers/hwmon/pmbus/pmbus_core.c              |   4 +
> >   drivers/hwmon/pmbus/xdpe1a2g7b.c              | 115 +++++++++++++++++=
+
> >   6 files changed, 133 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/hwmon/pmbus/xdpe1a2g7b.c
> >
>
