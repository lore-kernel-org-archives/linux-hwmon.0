Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D021DE4F1
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Jul 2025 06:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.43.1.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751610246; cv=none; b=AFnZjDiB8/FTi/YpJ51cX7ZeM0y6HPCTcf9cYMIR9fRzyhx1MKEpabgKfyqHAFl7ziQbjcItAbd7HzaYe6MS4hRpaXM3ShNgk6+P3DVn45gSMTZHzAcyCNHiExuGteIMbAre7OdfndhBngsBmnx1+r+hXPK7xGPKSv8xX3pDtKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751610246; c=relaxed/simple;
	bh=+nyURpJYMrrtJgXYNwTbHiNhQHb4kswjQYh5laWuZqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bL1oePK4Yo00fgsqwaskRvb8akMTZ80qnU7tXXQAPbaj1uKMa8Zhpfx4Q7QhfqpV0l9jfFOP12PjwNXfknSt2apk4fKM7KWSXvMcxZhTgmznRF6d73uxDA3CnYdAjyS1D4mfKnn2VHhjaGFBcBRgBe/1AjBxtlc900wv7wwG/tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org; spf=pass smtp.mailfrom=kde.org; dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b=XsRhYjyx; arc=none smtp.client-ip=46.43.1.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kde.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b="XsRhYjyx"
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(Authenticated sender: shantanu)
	by letterbox.kde.org (Postfix) with ESMTPSA id A5F3C330F4E
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Jul 2025 07:23:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1751610236; bh=BXMAOeNVc1LXV+jHRKR1qC7YIV2aPfF3vuO5Uavot+s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XsRhYjyxrZvjbuuo/PRL0Zi7qdtV6g1fwpbFgJtRaXnfXiuIeRM/znTfa7D/eMX4I
	 ONCqkW2c/QlPDiTrBOdsmaiOPsMANFmjwN904CRkdFMAj6yJDID+VwKrR9RWboloAp
	 0FhMwlcPNpLxH+cA4XE95SwQhYbw4u9B6XHYw1qIrEzyDx4io8ji7e4wF+/XVMXRgu
	 w0vDXtg6J+c2yh21y5pGvcScAJikPE7F71ocqknk2zTJmaPU6uLrb4dmpFToOhZXvz
	 oJRwk/WslGD5PTEo6tg9/dPBLuBCZ1nJ0dcRPyoeULf6T1LSU7cisZ5Dv7VInW+4cS
	 ErwHJne00CzOg==
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d4495753a7so66045085a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Jul 2025 23:23:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWN1M+Lv8pSzgbPIkWN1mGoVc+VpEht1fyRb3Vblt+yWbd1Eywb97+PM+5JFGnzls4Rzeftegs+ffEbmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy36kW11wIs9Md7yQdkdZNv0+wUi2kLaMUL7eFN8b/inHgwep88
	nRBZ6AG3j/AAwdpibLRJMlOHJKODDdyFB2TCsi5+VOjp3+avPF5yO25hLMYqpPbgK/FdijdEHzm
	kaFkwVCoRjd3mOPJ6SWKwnnR9o1Q2dvw=
X-Google-Smtp-Source: AGHT+IH2vgXwJ1Ou8FZEIJ6Y6jCkw/xYscvw3cZZBqP/WIg/8wQqP3ruCg1wfCvnnEQiXgqPlndnKuv8t2H2qVhEO6o=
X-Received: by 2002:a05:620a:178e:b0:7d3:f17d:10c8 with SMTP id
 af79cd13be357-7d5ddc5fa0cmr150887585a.43.1751610235403; Thu, 03 Jul 2025
 23:23:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630201444.210420-1-shantanu@kde.org> <20250701055337.14e2f5da@posteo.net>
In-Reply-To: <20250701055337.14e2f5da@posteo.net>
From: Shantanu Tushar <shantanu@kde.org>
Date: Fri, 4 Jul 2025 08:23:45 +0200
X-Gmail-Original-Message-ID: <CABQ4Km_Ot1097OjNvvKNyYhxjqu5cD4JTZ0NoaQv9SOcWyE8=w@mail.gmail.com>
X-Gm-Features: Ac12FXytGteqnRaxHL8LLlHrleUGNb1jJR_X0XbPbU-SOK2eEgBrKfGsUH1C44Y
Message-ID: <CABQ4Km_Ot1097OjNvvKNyYhxjqu5cD4JTZ0NoaQv9SOcWyE8=w@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (corsair-psu) add support for HX1200i Series 2025
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wilken,

Thanks for the review. Unfortunately I only have access to a HXi 1200
PSU to test. Maybe support for the new HXi 1500 can come later?

Regards,
Shantanu Tushar

On Tue, 1 Jul 2025 at 05:53, Wilken Gottwalt <wilken.gottwalt@posteo.net> wrote:
>
> Yeah, looks fine to me. And it looks like there is also a HXi 1500 Series
> 2025 now.
>
> Reviewed-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
>
> On Mon, 30 Jun 2025 22:14:44 +0200
> Shantanu Tushar <shantanu@kde.org> wrote:
>
> > Add the USB ID of the Corsair HXi Series 2025 HX1200i PSU (CP-9020307).
> > Update the documentation to mention this.
> >
> > Signed-off-by: Shantanu Tushar <shantanu@kde.org>
> > ---
> >  Documentation/hwmon/corsair-psu.rst | 2 +-
> >  drivers/hwmon/corsair-psu.c         | 1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/hwmon/corsair-psu.rst b/Documentation/hwmon/corsair-psu.rst
> > index 7ed794087f84..2e99cfd556a0 100644
> > --- a/Documentation/hwmon/corsair-psu.rst
> > +++ b/Documentation/hwmon/corsair-psu.rst
> > @@ -17,7 +17,7 @@ Supported devices:
> >
> >    Corsair HX1000i (Legacy and Series 2023)
> >
> > -  Corsair HX1200i (Legacy and Series 2023)
> > +  Corsair HX1200i (Legacy, Series 2023 and Series 2025)
> >
> >    Corsair HX1500i (Legacy and Series 2023)
> >
> > diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> > index f8f22b8a67cd..6b5c8f200780 100644
> > --- a/drivers/hwmon/corsair-psu.c
> > +++ b/drivers/hwmon/corsair-psu.c
> > @@ -885,6 +885,7 @@ static const struct hid_device_id corsairpsu_idtable[] = {
> >       { HID_USB_DEVICE(0x1b1c, 0x1c1e) }, /* Corsair HX1000i Series 2023 */
> >       { HID_USB_DEVICE(0x1b1c, 0x1c1f) }, /* Corsair HX1500i Legacy and Series 2023 */
> >       { HID_USB_DEVICE(0x1b1c, 0x1c23) }, /* Corsair HX1200i Series 2023 */
> > +     { HID_USB_DEVICE(0x1b1c, 0x1c27) }, /* Corsair HX1200i Series 2025 */
> >       { },
> >  };
> >  MODULE_DEVICE_TABLE(hid, corsairpsu_idtable);
>
