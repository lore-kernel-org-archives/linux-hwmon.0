Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E65317715
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Jan 2026 00:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769820956; cv=none; b=RSuwTk9hULNEVKgTe4UwwLQkLT/vEXayq4RkqGZGP9KU43VP9IZIlmgxlNshzv+gwhT5nHHhTntZThjDjZ8C/8YVqwtWYyKTQp8IoNmQS5twWOvxmM7SADc5ggGSE6trXRDWXOrkqTl5QBc5dw3duLqnhQZfkygBNeHiMcWaoH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769820956; c=relaxed/simple;
	bh=Z1JmO0I/bAD2VuhUhgeTdA/CEFjzp72kijRKOu/bnjU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=TkKuYZyOTjt1tsvA3rxChCGGiYUSPaB2Eln/sMmHNCLxbqBvMfSiRpkgxc6RtiowRUZ4enRfSB4kmCHT+1eBMW/7Wh312vXsvNTxzpNszpsHrm/6RnPj6pnGF5TQcX9eKYQdnQwn23DcqayCfOWHAFpwC+pjDkr/crQJLPAsPTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9om7XWe; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9om7XWe"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-948104feb8eso729240241.3
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Jan 2026 16:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769820954; x=1770425754; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WlO7xYJM+tT3nKpCZj4OQK4votiqUa3y4KG/p2upfU=;
        b=A9om7XWeXKJN1Z+AedcVC6y8bzsZPEly5ezFJy06rSVg/u3V+Kn32SyLALUNuM5Ed2
         vLWdaivqE0bNOK5m0/XwV4kUZrorAzE5ET7dGFXGxFy0Ckk/jRYPI6Fv293FfuTJ2Rrg
         1YX/83cd6ZhODIyUjYNtx3VlrKsQAOnc6CTFw1R2yzgTQK69zWReSOzd+JJVaSXUjnO4
         sq49GELFoRPoq5oD1E1PNNDrvuaX/oVPl4q7guOISU7j9GjWRg8TMp5K3dYESs6Dr074
         U2S8+ExTO0YagFdb3Q9xLGZxImMXL+LOT+u+6gpkqs55teKd2D2iEwuSl8UPdXatGfnU
         hEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769820954; x=1770425754;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9WlO7xYJM+tT3nKpCZj4OQK4votiqUa3y4KG/p2upfU=;
        b=ewnATcOlrMePQl/WFKNpq4JGnS1Gk7kCQyAP7hSlKTkJ8xSMQ1qHPDQYlPoM8MqGhM
         3vHJx2HGq4ls8KKBlKtAdZp6cPz3QITpIp0heBB4t6dro/X/r8j54Kl/RMiUEIFvtb8M
         nj0bRbaU1AQZGyY3KCUKLUBg13Kkne1NHMpCpI16WGVwaKugxkWIm8/7Ry5yhQHslplH
         RZyss6+WqfIktKXs5eWuOhJ1iv7HJKF7Lxovc22gURwEQX+wK0Hu0lXdQ2u0ZrQBSg+c
         zN03cNZwfLsrNF0Kf+OWe3jMTs7/OPCYz32X1jXy19l0Aep6dJKHPy2/dPlXzbYSYktc
         giLg==
X-Forwarded-Encrypted: i=1; AJvYcCXxRFSri1JpirOWo7glG+P5+WiJmNkqqIfvjZAiXDh06G8wn7k7oH04LBOsVoK9swbT4k6vshn6BnGAkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNTnbBKGn9rwHkvQd2/SfrvhKZtRcDLlevPouPquNLU1M65Gi5
	KsJT22oSKXPIxauQMSV4qYV2uLHWsffxRejDlvk/tkS+OJf6jSRl6tPi
X-Gm-Gg: AZuq6aJc7WbPPTLsI/TeTYe/+GB1UvPT46mhAzuBo4wesnFsBOB9CYZyfBRXaHyx4ME
	3Xc6NIxYJeSYsLaBBHNZTQUeFppsskTlULDH/obx7/FOaApAKbWXtFuaEh6sKdWiU8NW6PCjM4B
	+heUsOP+qFx9M80zNPHM0dicpa6aJHBJG6uKQeA8ROoWHrleL2dSR3FQ8SnadsUVCejfUCh+CJa
	9ktQ/eZb6KeI/9/XOIwXxyYDSB0/U8A+Gygz8phI4uLYVjYSsmwWLXyYyPca37J8dj/O5/fEHYQ
	UYarFMth89Tm0lAxov/Ce6q0szSNSJ1Vck3+dohxsEdSArcounlUImujBoPQgqVEJ7MWY8A5tjy
	yQpUxCBwLps+CTKX1tZThpfbUUywJryaX+3x8gX8+yPE1fGL4GA7Pqbz/RCu2S+X+ibGbAE/aEC
	kxJ9mCHA==
X-Received: by 2002:a05:6102:d8a:b0:5f5:35bd:6fb3 with SMTP id ada2fe7eead31-5f8e23760a7mr1453134137.5.1769820954185;
        Fri, 30 Jan 2026 16:55:54 -0800 (PST)
Received: from localhost ([2800:bf0:150:1112:fd48:bce3:7e1d:77e2])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f734eb4e8dsm2440249137.11.2026.01.30.16.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 16:55:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 19:55:51 -0500
Message-Id: <DG2D60UNIM2J.3BXEHP4RJU0BL@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Guenter Roeck" <linux@roeck-us.net>, "TINSAE TADESSE"
 <tinsaetadesse2015@gmail.com>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "linux-hwmon@vger.kernel.org"
 <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Guenter
 Roeck" <groeck7@gmail.com>
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <CAJ12PfP+Dbxd5fFAx-zAaJQ0B53Z1nXAiPbkmivk6smKajf1=Q@mail.gmail.com> <e994308a-389a-4d67-9ec9-39a5f0d3f4b6@roeck-us.net> <CAJ12PfMC_Potx9aNxaJJ3y=sX=rzyhm-6LJ8Z8OjUyDxiDUNsA@mail.gmail.com> <39b48803-e236-4acc-84e9-18162770f9ae@roeck-us.net> <CAJ12PfMN5SOcYc6vBJEz57YVcxXAOker4WA61Xh1znP=i8aBRg@mail.gmail.com> <5ecc96da-0c87-45f6-ab57-c3ea8eb28de1@gmx.de> <b4ce70ec-7a7a-4ee4-a9bf-55d0a64f8644@roeck-us.net> <CAJ12PfP_P0cz7NrAMBehVtutQn4-OibK33KTNtjec5Qd2msdnA@mail.gmail.com> <6249756d-7e49-464e-bb7e-11dfba3085f3@roeck-us.net> <CAJ12PfODdy+rgBumHv5gUeaqikUGMkADg-UoBLuZPrtBanF40w@mail.gmail.com> <f6c1e5d5-61ad-44ba-aa7c-231334d3e821@roeck-us.net>
In-Reply-To: <f6c1e5d5-61ad-44ba-aa7c-231334d3e821@roeck-us.net>

On Tue Jan 27, 2026 at 6:41 PM -05, Guenter Roeck wrote:
> Hi,
>
> On Tue, Jan 27, 2026 at 10:23:24PM +0300, TINSAE TADESSE wrote:
>>=20
>> Disabling CONFIG_SENSORS_SPD5118_DETECT completely avoids the issue on
>> affected platforms,
>> even without any code changes. This confirms that the failures are
>> triggered specifically by automatic
>> SPD5118 instantiation on systems where the i801 controller enforces
>> SPD Write Disable.
>
> Thanks for confirming. Can you try if the patch below fixes the problem ?
> It is a wild shot, but it might be worth a try.
>
> Thanks,
> Guenter
>
> ---
> From b44c31c2c779a67827e3144b818cf21f5efacea1 Mon Sep 17 00:00:00 2001
> From: Guenter Roeck <linux@roeck-us.net>
> Date: Tue, 27 Jan 2026 15:32:32 -0800
> Subject: [PATCH] hwmon: (spd5118) Explicitly enable temperature sensor in
>  probe function
>
> Instantiating the driver does not make sense if the temperature sensor
> is disabled, so enable it unconditionally in the probe function.
>
> If that fails, write operations to the chip are likely disabled
> by the I2C controller. Bail out with an eror message if that happens.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/spd5118.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 5da44571b6a0..3e0e780014f9 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -552,6 +552,11 @@ static int spd5118_common_probe(struct device *dev, =
struct regmap *regmap,
>  	if (!spd5118_vendor_valid(bank, vendor))
>  		return -ENODEV;
> =20
> +	if (regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG,
> +			       SPD5118_TS_DISABLE, 0) < 0)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Failed to enable temperature sensor\n");
> +
>  	data->regmap =3D regmap;
>  	mutex_init(&data->nvmem_lock);
>  	dev_set_drvdata(dev, data);

Hi Guenter,

I'm experiencing the same issue reported in this thread. This patch does
not fix it for me :(.

--=20
Thanks,
 ~ Kurt
