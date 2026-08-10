Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B3725B0A3
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Aug 2026 01:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786324148; cv=pass; b=Z+bv6AH12p+9oWwT8vteY3RaAN/TUkzOJ/gQd4s7IhHXIsQ0bjf8RTtyw3R3HU4ZeDLPvh+d9zSYHZjkApc6jwbhN2C3YrtFqkzz/uxk0mLBbxrQiStpGE2cqZXwIiIVAjPhSFqjKdRMzMdXeDLvidbM7PAyCUr/IF5R7a0xRws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786324148; c=relaxed/simple;
	bh=zN+pbN8tqiyplQ8N47IDl2D7hvlV5caKBpcxFCNw/ZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TkOgM1qSF3XBgLlsnmXEQaRmkk9s3GXzDq8Vhqetio90QIB8vojE25R6TghxMGxhPAq47WoXeN2M8FXpNCf9JYhMFBs6OhGvjvIgPNPQYz3cMD8LzTHfGuosnTTZS55FWn/nfGQhPjbUt2Q4gZSgFhLBzuzqKUE3By2Hx324OUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=EElos9Rg; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="EElos9Rg"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2020421077so195335466b.3
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Aug 2026 18:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786324142; cv=none;
        d=google.com; s=arc-20260327;
        b=Zt2CSVQv71B5CVKNJt3n0ZFaaka1sqyZnTS/DJMByPbuh2FSZPHMtXvUaqN8HgkdPd
         njiGtSl8wMMkNo/gJtxKCYoxUmLm784pASSudJZ0NQXvQJj9I4zpmcWGXnbqb+YLFSXO
         ayvowo86RVO//aOnsTTJAnx/kYxV7l6pIQWZbUblwtyIIrugI8jaKYKtu//G41kL99M1
         ZIzF14o6cUh2L0YDuHK6qzhGcD3dtyxwIyj0RgKigph4BItDzIrsEMNUPw0yguGhO5BP
         dPsdg6EH7jHrZeVB76R2FEhgz2jPmBI4KpMukgJRDqjwfihTHLkLxS6pkCEiDmyx1ij5
         hpBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zN+pbN8tqiyplQ8N47IDl2D7hvlV5caKBpcxFCNw/ZU=;
        fh=pTxiqqA97cKjrnBhz+XdxXG7IZEHQ3SLU6FqRniurgo=;
        b=Y6ZAMKntTbyZbPGMIrGFUHa5t7pNbNDgxFr1S9ClI0pqADtFTof+74VbQ4Y+mHCaFC
         oRB4pLGSiY3KGkAz5bUkhdL0ChwTwLDBI1psUSa4oNwdHNNInlbnqmQiG0GsXRTdLN0o
         PArivCrRuT1ouGqZJTWGj236bI3RIGRuiTAxEYfa7AlhwAw+aUHmMD8FD6R3Ed/zN4Cb
         x7/tr+FrKhYhfHoxMsbLc/yDxl3FFG2h6xF//OyjnCkKCPmZTWf+T2I354H4Ac7ZKflT
         p+AXj8HSD1frY1BWZh5/flD+mj4V1hAmfWhuUtpIE4HmWcQwm/jw8oWySNJzCt+4Xfuu
         iu8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786324142; x=1786928942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zN+pbN8tqiyplQ8N47IDl2D7hvlV5caKBpcxFCNw/ZU=;
        b=EElos9RgxrOPw47pGk7yzEtsmuDPLHtb4nTQ3ye+e1529Fd7h5lvftU7U4iBY30x34
         HSiOfTDjZvKEe3WxnsxvGip8jeiECPdt5P4ePx+GckWjlNHMIZwKyIPvd527/ov9PnjN
         Daym4KUHAtMqzXbZ21zHsz0UedP2ucrESWOKOIXJO45LImZtBTcR9ww5Tk3K8eMC2NtC
         pf5hFRXDUT+GRsGbGwTMCLWujjsYnBOqysay5KTu2aYbvkfZpcm3putbdOLVbgwHU2jC
         PILR+tZAHdOZcPf3li+CA9OKHTEMoI2tpLqHJcESF5NEc74NmAIOtEgitYtcU+rtScKN
         sGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786324142; x=1786928942;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zN+pbN8tqiyplQ8N47IDl2D7hvlV5caKBpcxFCNw/ZU=;
        b=pWs3H8Toz46T+bmyxqwc3QTahTfGg2legPJ2kHd3PeSQEA0LdxF7LTzXS+F78te6z3
         hrCTDGWzyBArBFkktOK0IuIImsanAUmPr3nqpkIj3LNvuD8vKjSW54lg2yGJZBEDF+Hz
         YV58FV2qaJgNYbzIeyXBKtuWvZQRIUDzbgeHjq+MvKz685j+rXr1fxfvnlIC0mHrf4uO
         xcXg/j7Fmfelbw4gSG6GOXNARwJgKI0zh7S0mLn4nCk2A6d3g7TtFOBWuWDFim0bWU+z
         JT6xQWGLW7UDB+2JaXGYuIkeA9zAe/P+LdrWelJGbkTIw15a3AaVpH3PGIFxdzcpotHS
         Hm3g==
X-Gm-Message-State: AOJu0YxfHa1kTD2t42FY3/QDuvH73Y8mSWyyvxRqNZ+aCImiTUXC75bN
	wZQ5YLKc2JEycI47tgQgdHxGVnS6J+h/ABkWb9kJcPxpOF3aDsIThkmrcEXiNyssgwHu/qRrOqY
	aHfhdaCgas2RPDQIfoPguuQ0mTciDTYT919bX9duQF+wCqrNY2jG4/GA=
X-Gm-Gg: AR+sD10UTxtcdfpOYlWemUbFnVChBiV7uQoI49G+WuoYKUi9EMb5Kh01nGypCqLddKI
	RiqxZB+eEY4wgtw+WCPRI7ZFv3Adx25xCvUrLKKeaSyB4psTuUaiOcTQHfSGzt169f2qg095m1M
	sPdYKre4l/FDknwNRmUJ2Ra641dNdL/hRLpKiPT8/Q+ZC8Bc8xlQqImHnYoa4YPRLl+AnVpi5Sb
	y4xeJ5EEfW7hK3ignH0TXWTl4Yjpb2gGJx6F8Lr5SfAIlPKZHqyzJgGLnymBlRRLu65lU4R5I0t
	Tcm+bJhiELWsp4ourX++1kfcx9OyfBmqEWYrL6PTN2zHbw==
X-Received: by 2002:a17:907:3d0d:b0:c19:45e3:2f57 with SMTP id
 a640c23a62f3a-c2039b279eamr1709292966b.9.1786324141818; Sun, 09 Aug 2026
 18:09:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807000107.1786892-1-renari@arimil.com> <20260807000107.1786892-2-renari@arimil.com>
 <20260807001412.B61901F000E9@smtp.kernel.org> <5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net>
 <CADBHdQ3x4bFe518q2PjZvGJ2=qP45+5Cmm8f99J9gRZCJun0aQ@mail.gmail.com>
 <d7bdb634-6fce-4bfe-a24f-864d20e46d92@roeck-us.net> <CADBHdQ3LhfunbnwCE2AYmWr5XwqSvJ8WGkQFW1G=GQv4dp=Ndw@mail.gmail.com>
 <28fd27da-ced5-4c2d-bbb8-0eda383bf767@roeck-us.net>
In-Reply-To: <28fd27da-ced5-4c2d-bbb8-0eda383bf767@roeck-us.net>
From: Arimil <renari@arimil.com>
Date: Sun, 9 Aug 2026 21:08:49 -0400
X-Gm-Features: AUfX_mx5FVh7XV9SCpJRpV-XOOcWIzTbUGBvIy5q3qs2-xf-KQ3NzJ2n0Px0ksE
Message-ID: <CADBHdQ1z5pp6FjdensAVYTEbJ+DqU55uP33LvFVCMh6cpQo9kg@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: (asus_rog_ryujin) Add per-device configuration
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch has already been submitted there for months, I'm now
submitting this to be included in the kernel so it doesn't have to be
compiled in via dkms. The patch I was talking about when saying I
would create a new series was the null check asked by the bot.

On Sun, Aug 9, 2026 at 6:54=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 8/9/26 15:03, Arimil wrote:
> > The github mirror that hosts the same code here:
> > https://github.com/aleksamagicka/asus_rog_ryujin-hwmon
> >
>
> Sorry, you lost me. Why did you submit a patch series for inclusion
> into the upstream Linux kernel if you want it to be applied to some
> downstream driver on github ?
>
> Either case, sure, go ahead, and feel free to discuss with the maintainer
> of that driver if and when to submit the patches for inclusion into the
> upstream Linux kernel. Going forward, please do not submit patches for
> inclusion into the upstream Linux kernel if that is not what you want.
>
> Thanks,
> Guenter
>
