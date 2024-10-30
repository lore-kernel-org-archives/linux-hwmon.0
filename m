Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE7D1CBEB6
	for <linux-hwmon@vger.kernel.org>; Wed, 30 Oct 2024 19:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730316742; cv=none; b=mmk0dd4umg71QaKdixKrniU1XPuzNGsvqiJJmpcH/T4/tZFBVgRKwsqCfCDBURS9/ndIlG+uep0xisqva4E+8EVsd+0Gxkaf5AAOmk80/NGGl7FxPPvZaymWwO1EGpYvN37xGNgVF3J6f5lb01eU3YqMLs/1QSQVqI5uiA5SQjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730316742; c=relaxed/simple;
	bh=usVZ4YEunIbHVvBSq748OooOQsnvI6vxSw64f7E497c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aiPfmNIRR1VdfYnjYoDj4ukYoAVhXWVhIMT2y5r4Jz8kRCQmpLdeCimGDvkmIw79ZBMgnuKYclAey43ifKSJpiqFUXKIPBmgGckGZVnus78tya4gVp0e5yBMqk6pg+ABqFYp9QQtyfrFHV0cNXZ3Eq09XI5/iSbTc9BfNHqOF2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vk5m7Sub; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vk5m7Sub"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so12516311fa.0
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Oct 2024 12:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730316738; x=1730921538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usVZ4YEunIbHVvBSq748OooOQsnvI6vxSw64f7E497c=;
        b=vk5m7SubHmGywyjEiuLTmzq4wLffQhwdVTLYb2YspBr6SNlhTQXI++sGEXTPr1kFoi
         cmLW1APnsf+ZJYhKAp3gHzhK+g+bA6/0+a3ToQKCn378QZG3u9ZQ5q16w89F70ZHjmwh
         H1wgbiN2Shl7KQO9pevvG1hc8l1ixJgte7ovHwXjpw7ppOAYEpcUO8qoDnYGdLFVFGNe
         lMlVsMBbUUl/ptasJUyEPZI1Gbg0DX3ls9yVhzA6Mu8yAIraEGk+eilQ7Q+/QqupykBH
         rvHWiet+EoQ9r9aA0wzPdSFK1RmW0AyAzK7zfJYQIO1odMRU8gnzUyCsBY5NVox4UqXT
         D1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730316738; x=1730921538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usVZ4YEunIbHVvBSq748OooOQsnvI6vxSw64f7E497c=;
        b=aoIJ/KDzL60w/wrkEql4SliV3C04kMh2H7Rz1tgbcTjTHTPv3jA0Lb0Exf0CSg04D4
         /qmR5uwkvqqJcqw0LvP1z7f3oYd68YP2R/C6+A03zmMIMR34yxeCT3Az6kEWxYu2shO/
         zn8AhF+fWMq7tUI7BGREY3xNm8D5aiBzFVmLYxpFjJvV4we3QejXLMHqOdE4LN6vmX8O
         xA0pjRwZiP+EwrYtqqLPc49n4QdAII2kIV8jzwGjBsZXPlWTNiuOAl74k6quCRJe7bmS
         jirxPJWdvc+F65uMRsjLjf3oGOieHnQA4FOReq7HidWf0Enwpk4Z7Swov+qurJKdUGIy
         N7SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcyGxmdznGEpa9vDNgMtaoOTRvEA+4yXS/R9GcHS5FgOz5KMuicTodQT2ll3B4I5hx9vVWAPTCl59p7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvj0zq07gVtSzE5keDzpfpJXkCUfK2mQKo3MgzXPvKjMIOPKwS
	t+mYP8br8Bwphs1gQ0LOXyRdR3Czn9hqnqdAonWFvymMnh1QFPhBf4i/A1sYoPGf3ya8VH/OELk
	GFSghegITgutPUCynpiTc7XGLmMZAowt6maD5kw==
X-Google-Smtp-Source: AGHT+IFG7ijwW0f+Mp81RtWCW2V2VJcGxvm0/VX42o/gwTzTjjOH3/XQ/oqOur+E0bOLJYsbtRDWQz/jjZOssJBW5CI=
X-Received: by 2002:a05:651c:896:b0:2fa:ce87:b7da with SMTP id
 38308e7fff4ca-2fcdc9470b8mr26994961fa.18.1730316737580; Wed, 30 Oct 2024
 12:32:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-3-tmyu0@nuvoton.com>
 <CAMRc=Mc+SZN=EytxY=qA-qBEAY_F17GP-7FRE9oLojLbdUoPaQ@mail.gmail.com>
 <CAOoeyxW4=+5-QMcd_wgncFC9jgx_1Zf1Tq8RTnBvVqZ1JcUBQg@mail.gmail.com>
 <CAMRc=MexqwSCDrsBS0mK0fo_MCwngAH9XVgjRuDQjw0TVUBmPw@mail.gmail.com> <CAOoeyxXRrDuKJRMb3O2h3BF1vC=pwNN3DKfnEN9LnA+jiBCTQg@mail.gmail.com>
In-Reply-To: <CAOoeyxXRrDuKJRMb3O2h3BF1vC=pwNN3DKfnEN9LnA+jiBCTQg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Oct 2024 20:32:05 +0100
Message-ID: <CAMRc=Me+R_i1WxFGeVe-MRREGn1YJvUon73A4FHDOPgs8wVaCg@mail.gmail.com>
Subject: Re: [PATCH v1 2/9] gpio: Add Nuvoton NCT6694 GPIO support
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, jic23@kernel.org, lars@metafoo.de, 
	ukleinek@kernel.org, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 9:57=E2=80=AFAM Ming Yu <a0282524688@gmail.com> wro=
te:
>
> >
> > No for line names - as this is a dynamic USB expander, I'd suggest to
> > have them in the driver and assign to gc->names.
>
> Could I create an array to map each of the GPIO pins?
>

Please trim the quoted email to only the relevant parts.

I'm not sure what you mean by that. There's a field in struct
gpio_chip which you can use to set the line names from the driver
code.

Bart
