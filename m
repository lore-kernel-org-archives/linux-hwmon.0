Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADE92749FE
	for <linux-hwmon@vger.kernel.org>; Thu,  4 Sep 2025 19:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757015861; cv=none; b=I2fntAmEpqCsgjt7tpfJySFFMFJnEdsd5tQcTphNq1j+yh3emxglrrcvxKzO6Dn29wRTrSv3wKzpnlBiGiJc/9wTl2VPvQ/Kq3RysoMx6lt808zAbKiayKVMFNVxtECUynjQhbrz9jm0pC5JrRnFhSWgDzc6CI8nJ4ZCHcPhW/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757015861; c=relaxed/simple;
	bh=AkQDfljW56aeK9hFyEplI/9Ee67wMd+uq6QJcRF62eo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhQ195x1PBE957fmPrHS/vHOGhfJgz83PYz3yuDKakl3aYs1ShJCmd3WXpQVkLiJv3O7TtM7WiTu+XqG+84fAuwglT5ezi3sQ2D2Kf1mQzcmeu4BCPpslxBH3M3Finnc7Shcp57jthimOc6L5gKn/k3n/Jq0MRb/w+P5HI/Fa30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iv+32+pl; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iv+32+pl"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3381df3b950so3337811fa.0
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Sep 2025 12:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757015857; x=1757620657; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kwPz46AfjWSljE81nGPsJRjk/PBKufX3IFU3DIxO20=;
        b=Iv+32+pl+RF/5u9CXQ2H/5eyAmAkycT/gu4sr+1dppOQN7ClaN1+UkvsAo99TDI91J
         JZTVbf1mcgBfbJyKlqFd/ymeo2YWyWes8minSpK/VUiXqtkViDeOzo2lbrRAE5bQek52
         q7j1d2+8Ch3M7w8baGcVVxySNOnd3S8w3zQ1FKgO/1yjTjh5HXjnSgWETLcT72Gu/vjb
         ffs9gc7cT4wIel3sXqOYcTnic/NCW8dGMWJ7sHdrnzLj4QQ/LSUXF7Rmr0UlikLNkxeq
         gW2jIybvjzI3HKgnIZedva/HORa3f5dytWHHplPHe20DUd1v5W8Uzb2HzpDXsUZFSytk
         aCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757015857; x=1757620657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kwPz46AfjWSljE81nGPsJRjk/PBKufX3IFU3DIxO20=;
        b=Q7lVIAu2N1+JyW/QSajOz9gNcANXBzgFGSgTgn8TEI58f22K8E4UzJEwtI4hJat098
         TFWZuxHVR7H7AI9osywXwg15O4mbXnFZ2qDK5Kz7Iyf7g7JiiG1HulXlPOjG1tG0baL6
         bx3ghzXYmQDnV/g540aKR8KCL/VFNNJgWhLugrNwcD58f/PGVsTBQg1vaS/GYw6nRiDF
         KHunXqHSKP6s+6LJKZNYGZPFpHVD4rgGBuv1/hFgrAuJIzkxGtM0UcyjZ2FpSxyhN796
         LJAadME68/c5lbc/HoJYtPWTL3fAcHEWwcVg4AniNfjKmsV0DshWNTO+3DLZ8DjEyQ/L
         nTIw==
X-Gm-Message-State: AOJu0YyZ5+OUAbEm1/nMNFo0J4tuD6yfhmw77zPSkPiPVWwR74/wQp7k
	65afycbe3K+ltdqhpeIkkY33mYds4sJyeNE2Ktd4L+uCTLJq1GFomM1Rs8UkK3vmRqX3lhTKGzm
	TVFKZOwR3dXxL+5Nh+ebKI7suQqHB/foNz65v1I2z8Q==
X-Gm-Gg: ASbGncvH3MLBkWKRVRNDAFTlyXCj3jvKWMjS6cleVujbsXPmW9trfkzIoT7ftidspKN
	yjFVerHCHjQzvt5JaguYq3QZAQhE2AjT9FW+6ZgV073Nj6ODTgLRYNzSRaM6FQ42M8nGxC4j+Pu
	4ryeWMsY/3uk+E3sI84lIenOl41PiBh3km6VxWPV5oGyf4e4ZsxaT2mWtAr/D/IgneP6HNDziys
	qDJpHA=
X-Google-Smtp-Source: AGHT+IGSNGuoZa0tGd2MuceeY+rWx4+fE98zKz5kXJNG5SS9yafrJ2IfBrrLXPyBqms3qzMRhIcBxsxK/c607/IOLes=
X-Received: by 2002:a2e:a4d8:0:b0:32c:abf4:d76a with SMTP id
 38308e7fff4ca-336caf58af5mr43186631fa.38.1757015856723; Thu, 04 Sep 2025
 12:57:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com> <20250903-ltc4283-support-v2-3-6bce091510bf@analog.com>
In-Reply-To: <20250903-ltc4283-support-v2-3-6bce091510bf@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:57:25 +0200
X-Gm-Features: Ac12FXySP_jPTakETmSTujg6AZkgjLE-3L81eBmgyMtwcrvqz9e4_hK7r8cr0mE
Message-ID: <CACRpkdbgcCjZbZ2HtrNO7vK1HXzrwxkrNFCzqGguq=ckKg3cFQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nuno,

thanks for your patch!

On Wed, Sep 3, 2025 at 12:04=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:

> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>
> The LTC4283 device has up to 8 pins that can be configured as GPIOs.
>
> Note that PGIO pins are not set as GPIOs by default so if they are
> configured to be used as GPIOs we need to make sure to initialize them
> to a sane default. They are set as inputs by default.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

(...)

> +config GPIO_LTC4283
> +       tristate "Analog Devices LTC4283 GPIO support"
> +       depends on SENSORS_LTC4283

Could that be
depends on REGMAP && (SENSOR_LTC4283 || COMPILE_TEST)
?

Or does something blow up if you do that? (I guess it also needs
AUXBUS but more on that below)

should it also be

default SENSOR_LTC4283

Sof if that is compiled in (=3Dy) or module (=3Dm) then this becomes
the same by default?

> +       help
> +         If you say yes here you want the GPIO function available in Ana=
log
> +         Devices LTC4283 Negative Voltage Hot Swap Controller.
> +
> +         This driver can also be built as a module. If so, the module wi=
ll
> +         be called gpio-ltc4283.
> +
>  config GPIO_MB86S7X

This is placed among the memory-mapped drivers, but:

> +#include <linux/auxiliary_bus.h>
(...)
> +static struct auxiliary_driver ltc4283_gpio_driver =3D {
> +       .probe =3D ltc4283_gpio_probe,
> +       .id_table =3D ltc4283_aux_id_table,
> +};
> +module_auxiliary_driver(ltc4283_gpio_driver);

Create a new submenu for auxiliary bus drivers and add it
there. We already have a submenu for MFD so why not?

menu "AUXBUS GPIO expanders"
  depends on AUXILIARY_BUS
...

Have you looked into using GPIO_REGMAP?
I guess some specials are used here so maybe it is
not possible.

Yours,
Linus Walleij
