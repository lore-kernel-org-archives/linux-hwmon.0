Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9324B95AD
	for <linux-hwmon@vger.kernel.org>; Mon, 28 Sep 2026 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597058; cv=none; b=YYQq4Kb6antXqn2IRhqLvtMZC5htwPqKGQNxSP/E7QLHNRMsDKTebjFvjbZJ28XhS4K3lQx0mRqrY1QX47QtNJH+mXoH8j9bKtZKND5h38GqEGprgVFPN92+nDmpGW7YxwibiVZPEHaPhwaT/ghDRBadD07QW6IdxrGMs6iPXaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597058; c=relaxed/simple;
	bh=jGLIh26Vc3BjXy6NX5dJdNpiGK43hRixQLowMM2m1RQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l/OpOXuMW/pu3cAlYwfd3HyCyJEHs/e8Is6w/HohoPx3wcXQMNVbcv4dYDVk5yiDIDTT7VNZa0XUe7Z9kuLqkVjUe3H0cVfc89gZ5gVCtPG8naAjY2+XLMo6dTilFfvxiPbs/jC5dYYsjaDzwhLR8cuaop378jDBf0OZKuTX+TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=dmze8ckE; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="dmze8ckE"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id DABFF5E5E1
	for <linux-hwmon@vger.kernel.org>; Mon, 28 Sep 2026 15:04:13 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 76F7E5E5F3
	for <linux-hwmon@vger.kernel.org>; Mon, 28 Sep 2026 15:04:12 +0300 (EEST)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 39A701FFA1C
	for <linux-hwmon@vger.kernel.org>; Mon, 28 Sep 2026 15:04:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1790597051;
	bh=jQ4D5dNgKYeYV0EiBemXuEAwgxJD4Xh7c4O8CAg8VEo=;
	h=Received:From:Subject:To;
	b=dmze8ckErUNKiJxufJmvK3Ga9YHcmem8/7/Js6OEO8Mx/J7gMT5cmpu5GTkkzpf7t
	 SP0PAsegy+4XRgSqAgaMTyRryKxySORtbTKATiq1swubU6JDYoU+rFLRb7VpTQnooO
	 ISg7dbIP5g5w6tn0zhsIyZhZEtFJw2/TTUZ/K08OvsjkfFMK13h6UXLEwV4+b70hZG
	 90SvjxA0Q9PdZHK3Yfl9yd8K6CTR4q0GGUuoEYgnbBfeh5aZqDG+nMk3YEi68UMEBH
	 jACXLFJgKt6Xr/CAU0zXF7CLMkK2vavb99L/FxHaOghHah5jktKmiFBbMT4qqlNFCO
	 iSFoUmNXIzyYA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 74.125.228.43) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pz2-f43.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pz2-f43.google.com with SMTP id
 d2e1a72fcca58-86212a185dcso2063992b3a.1
        for <linux-hwmon@vger.kernel.org>;
 Mon, 28 Sep 2026 05:04:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBye5hn2eeyrDVG4XfMBMzewnZKaynQ7wShJcoU98GjWtKBppH38LNGwbdJeRz+FDwkhcPnhWltap6MswQ==@vger.kernel.org
X-Gm-Message-State: AFuF++niNkp8vv7iw7nzQgGM/Cdpt6gPIjf2jM8XZ1ynZIsqDUG9TUqy
	hKOxiFvrQbG6QzXJGvF/SeEUabeXryBn4F0FBTX00yVo9QS9iFidKkJg8wJxBAOG8KrvR0l2/qR
	wzZ8Nw4vU85S31GOz1oXETxPsdt52R00=
X-Received: by 2002:a05:6a20:7f8e:b0:3da:f969:b077 with SMTP id
 adf61e73a8af0-3de0e6f4386mr11655897637.11.1790597049772; Mon, 28 Sep 2026
 05:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me>
 <20260926-gpd-fan-duo-auto-v2-2-0a2ea41ee3b5@pm.me>
 <72ea804b-6d62-4f31-985d-4f3f0359b5be@roeck-us.net>
In-Reply-To: <72ea804b-6d62-4f31-985d-4f3f0359b5be@roeck-us.net>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 28 Sep 2026 14:03:57 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwHiJhDnpYsyWMYvzBmtGtn+pKJp+LY3dUk4mYcjw300oQ@mail.gmail.com>
X-Gm-Features: AclHuK9UWyj2IYcJHU-3AWqghb-BIOq0RdB46udxoAkI3GAb1n1QCG-rKkEdxQo
Message-ID: 
 <CAGwozwHiJhDnpYsyWMYvzBmtGtn+pKJp+LY3dUk4mYcjw300oQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: (gpd-fan) Register both fans on the GPD Win
 5
To: Guenter Roeck <linux@roeck-us.net>
Cc: alexei.solcanu@pm.me, Cryolitia PukNgae <cryolitia@uniontech.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179059705153.2755826.10827765215264976502@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Mon, 28 Sept 2026 at 13:05, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Sat, Sep 26, 2026 at 04:11:21PM -0400, Alexei Solcanu via B4 Relay wrote:
> > From: Alexei Solcanu <alexei.solcanu@pm.me>
> >
> > The GPD Win 5 uses gpd_duo_drvdata, which exposes a single fan and pwm
> > channel: pwm1 writes the same duty cycle to both fans, and fan1_input
> > only reads the first fan's RPM.
> >
> > The two fans have independent registers. Fan 1 uses duty cycle 0x047A
> > and RPM 0x0478/0x0479, fan 2 uses duty cycle 0x047B and RPM
> > 0x0476/0x0477. A duty cycle of 0 returns that fan to EC control.
> >
> > Add separate board data for the Win 5 and register fan1/pwm1 and
> > fan2/pwm2, one channel per fan. Boards with a single fan are unchanged.
> >
> > This changes behaviour on the Win 5: pwm1 and pwm1_enable now control
> > only the first fan. The second fan stays under EC control unless pwm2
> > and pwm2_enable are used.
> >
> > The GPD Duo keeps a single channel, since it is untested and its
> > second fan's RPM register is unknown.
> >
> > Tested on a GPD Win 5 (G1618-05).
> >
> > Suggested-by: Guenter Roeck <linux@roeck-us.net>
> > Assisted-by: LLM
> > Signed-off-by: Alexei Solcanu <alexei.solcanu@pm.me>
>
> Another patch new revision sent as reply of a previous one.
>
> Where does that idea come from ?  Can _someone_ please let me know ?
> It seems like a contagious disease, but no one is willing to admit
> where they caught it.

Maybe the following?
https://en.andros.dev/blog/75beece9/sending-patches-via-email-with-git/
https://nickdesaulniers.github.io/blog/2017/05/16/submitting-your-first-patch-to-the-linux-kernel-and-responding-to-feedback/

I faintly recall something like that when i was sending my first patch
a few years ago.

I checked the kernel docs and they are correct now and explicitly say
do not do this. Perhaps that was a recent change though.

Antheas

>
> Guenter
>

