Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC00310644
	for <linux-hwmon@vger.kernel.org>; Mon,  5 Jan 2026 08:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767601952; cv=none; b=OIxX6fmItQnb1GpKJcz2rApVb0LrNPa2bBTZTUz+omld+qbXrtr842KpsNwqH2iS7le/0YfM50DqE4itQcS+637+YslVf8E+pxSUgfQiWO/ZDw9r0OCaKenvPlHOugj5CmobQRDlmVnHyC7v9tbeZwbUTynkxgxjThURiZ9WN6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767601952; c=relaxed/simple;
	bh=LJmgRKXYoAHvq/TQGQY3/C+GlmDM1tVa6AJhqo7hYvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ABq5kx2DWSn1eaa1b51UjVWNQCytetUXdaP75y+/82pir6I1exbSGRLhnVC9RjIdDXRE7XGW9ttE/d6kX1i6uUBrimeGtKk7IYvkbJhvFpXeP30IQGDINnlSP9QI+36UI6wFy91HyGYo/egrpXMVaRlwfia8COadHZUtXCdxNhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZ4d/W0U; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZ4d/W0U"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-bc2abdcfc6fso7893773a12.2
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Jan 2026 00:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767601950; x=1768206750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fo08J3tSCaaxrzNErTGajnvZWiQ6ptH4xH2O+PzWE8=;
        b=CZ4d/W0U1h8RYCTpDnVtrfjttYRcsSjprJEgMbQvyOoL1f0yAQxyT1WMGlH6wR5670
         uB682/09t2hAMQvhPtxw935GfHxOfrNjtyDTb3x2xuu5QKVyMsFiEUzAxArrmRB03xzl
         UFITUVBU35/UwujzxC+OmfzsMt3DxC6YxGLXNkruZxqOs+NokpAg4ZFUDUS5AYMrFj0f
         2jKZk6qPw4+nLiEMOTFNSkNIJ03B8GRILhijrFopVe5cA1TZ8N9XIjzvYMmQ/FWFDwos
         C2eSxEzjj4ecufnrN/GEtwcaoPLC8H/Lfqhe/Ym2OnCO/gdBACrH8YPhICBl/TWVdq+N
         I5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601950; x=1768206750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7fo08J3tSCaaxrzNErTGajnvZWiQ6ptH4xH2O+PzWE8=;
        b=AYdGEQKl7NbQ6RktRFfJrjgsdCvgmmZtCzWOmw0rBrMqYfdL7oWzOj+gTsvwXNbYZ+
         FmHqaaKQ28c27MsZvRgAEM8kvgpD8i4rb7cnwadHPIyKFAYeMLjWseJ/BHVxI2XRtHEG
         Rf58yCFniNt0cQRBGeAPojJ9WSpz9xT0saJIrNE5tSio8l/Jt8MJ+xfWldL4V68hJmms
         iRPjo3PZfkoMXRslEbfsPzUS7qgRGovDP6+6qRUShJnl8CD2Rxp4zmDzgV0sCCvj2PRW
         Y0uXedlivT+q1h6LeJrWBti+6udPQfCRcoV8r4cpKuqT7HyQbC4EMAinGnbGgaCPKLWs
         qIQg==
X-Forwarded-Encrypted: i=1; AJvYcCWxT3qmr1HVNCu815vsRnZJGjD1Md5fHN47sqkeJfFfrcAceUs6mrPQpJLnNqm75d153SkSFNKpONQ8ng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6HP6xVEswMPIklPwPbnSKw53k5UYAssPlBUB9zvwW1Qq8jJnQ
	4rtL3Bna8BPnuoX5ezyDY9uz7nm4OR5/tZkuFzX+RR99m6cIAbnUfQwL8K6ZB0FsA4IuZGC3YZE
	QUDTiM3Kjqgl0zOGEFWC6+YLZ8bJOVqE=
X-Gm-Gg: AY/fxX5FgR99N88u+zWkwQ/a7/14avjFu9w6K5Ay+/VUgcjINiI8fXt5IuA/MMHAdeZ
	8qeX0Nq5dTtRneNt1Z7+S6wxLUDlIsKtBCsNThSe5L+Qg1FXJc3hEu1Ljuvst+y+CYyA7UhA0Y+
	zwmJSjaXKpebHK45GdCRER88mtLGETu7xrPrI8X/UredtMTcXsp3Yv4JuXsiFwpp+8F3zIYjSzT
	RDdp//oF2QgyqrqRyus0ue+E7ZetHuFE8ypFxBTHpJHUquPVZcw8US10IcO5qeOcwZ1X11DSL/W
	WMJDQQ==
X-Google-Smtp-Source: AGHT+IHiblyZORclmy9Tl+KEklE6ggJwldJP6m/nwek/KbEjP0j8V7N2X4p0A8skqr+HZL0xqczyMRxp022I+gyZ4/w=
X-Received: by 2002:a05:7301:1983:b0:2ae:5092:934 with SMTP id
 5a478bee46e88-2b05ec83761mr48451722eec.37.1767601950295; Mon, 05 Jan 2026
 00:32:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251231105503.77881-1-Ashish.Yadav@infineon.com>
 <2ee75453-0869-4348-ad92-f7ff71aca75d@kernel.org> <CAJKbuCYisQ2CxcXsoT7bPuuJTc=662tgoKcQi-AQu1pWHTj+Qg@mail.gmail.com>
 <d7292b72-3e06-43c8-a7a9-bbacb7276ce5@kernel.org>
In-Reply-To: <d7292b72-3e06-43c8-a7a9-bbacb7276ce5@kernel.org>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Mon, 5 Jan 2026 14:02:18 +0530
X-Gm-Features: AQt7F2os5CaHOIbtmANyf-_mROZ8scn1M3Oyk_qn1aRNqZ8-QJamghWxOXE4r2Y
Message-ID: <CAJKbuCaY_96u9cGsG9+oirNRobLBN122j6+4Cz7yjc7e2ZM2sg@mail.gmail.com>
Subject: Re: [PATCH] hwmon:(pmbus/tda38740a) Add driver for Infineon
 TDA38740A/TDA38725A Voltage Regulator
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	ASHISH YADAV <Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

I am really sorry for inconvenience.
I will take care of the review comments provided by you in the new
patch generation.

Thanks & Regards
  Ashish Yadav

On Mon, Jan 5, 2026 at 12:35=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 04/01/2026 11:43, ashish yadav wrote:
> > Hi Krzysztof and Guenter,
> >
> > Thanks for your time for providing your valuable feedback.
> > It helps me a lot.
> >
> > Please ignore this patch.
>
> Hm? I already reviewed it, so do you want to say you just wasted my time?
>
> > I will release two new separate patches for DeviceTree and Driver Code.
>
>
> Best regards,
> Krzysztof
