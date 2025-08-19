Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10836335BDE
	for <linux-hwmon@vger.kernel.org>; Tue, 19 Aug 2025 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605586; cv=none; b=UdxObuajueZtP4QtQzBAonC/ZbNgOiBRMvt49KVUg+kBkP4GYGqxJsANeyaZbKquWGUI/icay4Up0pjQ5HoWuoWSC8KZhz32fZPjrAhsJ/kAi9BzUvNHh6J6iKb65b4FBtCxmcB9MteUfv+mJF5RMRxQhQWBd6V48+lq7r6mx2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605586; c=relaxed/simple;
	bh=pT7J7NlbzDj0BcguaBhEfkoD9p8GgWTOtMzLwvbVkTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioyRyhRJXCsN+3xYhWIH9LXcS3wTLcNSw7Wlnvu+izXi9nhJuWPMQtKoDXQsrC55OPuRa1cLBmbrIB1EkDDTCwXtDWvj113tz4SwTAReVH3GB7J1/k654PTNKhyjGtdH89DPhe2WJLco4tddUUhY4GG6M4Kfw0Bnod/14214OnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mHCNJYK9; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mHCNJYK9"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-333f92a69d4so39678601fa.2
        for <linux-hwmon@vger.kernel.org>; Tue, 19 Aug 2025 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605583; x=1756210383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pT7J7NlbzDj0BcguaBhEfkoD9p8GgWTOtMzLwvbVkTg=;
        b=mHCNJYK9mo3J7JRL7LLBKUB3sm+8n3Q3l8jiZz0sUCZjmNqgbzNaoPsvT95gz2usZG
         JIfDa9o6DJFez5SH8sGgAmLxZrczNj5p3AVY8CoYQ7Nkgv7wns6D0Im2lRp4SyrJoEqr
         /4MxH2lYVm+c7fBP+30ozGd8P+tsXRBG9sp3W99zB34rxxsZFdgVFQtgMmz6t4r9Gd55
         UjhuykSbX356y2He2eLaZR5aaY5CiChZn3IC09yPMo4DRli8aZ1HFyQGOycCk1Rpshd2
         GEZsSdsLtvYYEgKoserNhWOwVTjmiuQ7ej0l3Wak0CoXCZIH0irMRX3iHLppmvpcvvLh
         f78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605583; x=1756210383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pT7J7NlbzDj0BcguaBhEfkoD9p8GgWTOtMzLwvbVkTg=;
        b=fyyMsuzbHXqY5MC83SOjOW+zL1YqMm0H/Lo+QOBAxgld4nPIIZ5jGpVHAxbOz5iYs0
         vtzNgka3X2+BIe1V5v96Bjg9wrIvmrmtNAwc9hpxvR2ManzwEEOwfazCEnaPMT69HTFm
         uQx6WQGMIRJgpQwuBrFF4yJTHUsKjyM5kfSDb1ufxTBKarEXJRI9CNOqpQPcC57+BhfM
         Nh6LsdPM9j8cTTOh8e51qjxMih5PXLkp26NZNT4riD+A0qnxvVYFL3Jo6QhyBt8izJ5R
         UbcHIwThsJnvPkRwu99Sv55t8w3pl7xtvdEMe4KeMIVdsaB2o5NhmdJK6R3BLK7ElhD1
         Zl5A==
X-Gm-Message-State: AOJu0Yw/mMUAzOQjN6FiZp5LBM2rqDmZ467Iy5EeHQcUzjZG/M1keafA
	A0t6XAognOmka6ajD8xYHlcJBuiOjVfyyj/VfAfj220KU3J212uIwAyelHgoziwgB7D4TYmXUzf
	DNaTO10bI+lh2ipDCTYYpcox8HR3X/r2iEhmGDI4taw==
X-Gm-Gg: ASbGnctbLo+xd4TMVev5e38iPeZ0ETJzmfxfyUma3/x1mf2e+V4lUj92tYVs9WNtLx/
	sVJvIVAgVa7zv896nB7s7k5l8mSlTYPQgxd+sotbdNdBfF/0Y3cLY4G/BrkDjpUocL6C7kRRdxe
	RPhGFqtNnGAaAA01xYPwBeYtprUwYyjQvMMHKD9g6UbDGlPslOFNYaCQrqajz1dyZfAwxOQErXJ
	BvqngY=
X-Google-Smtp-Source: AGHT+IH+aPrIJY+DH1gxYk549l1vaPXfQI5WHK+rOHEK+EYvi2ju0qkAP63ibB4HjpirzJmCyfMVeLvlEsTbS+CROto=
X-Received: by 2002:a05:651c:3041:b0:32b:a961:803a with SMTP id
 38308e7fff4ca-335304ce141mr6002291fa.3.1755605583129; Tue, 19 Aug 2025
 05:13:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com> <20250814-ltc4283-support-v1-6-88b2cef773f2@analog.com>
In-Reply-To: <20250814-ltc4283-support-v1-6-88b2cef773f2@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:12:51 +0200
X-Gm-Features: Ac12FXx9DbzpmXtIaYcl4GeGqmQxe243v3rohATjse3LJ-Oaq4DA-z_79QbXSd0
Message-ID: <CACRpkdax9THwKRZmaAHVcKbnBdi1LxjgvibAFOUVnVQJBhBiwA@mail.gmail.com>
Subject: Re: [PATCH 6/6] gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nuno,

thanks for your patch!

On Thu, Aug 14, 2025 at 12:52=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
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

Can you check if you can use gpio-regmap.c helper?

select GPIO_REGMAP

git grep devm_gpio_regmap_register
for example drivers using this.

I think it can further cut down the code to very little.

Yours,
Linus Walleij
