Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD312FF16D
	for <linux-hwmon@vger.kernel.org>; Tue, 19 Aug 2025 12:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605291; cv=none; b=f3UyBEAd0rXWKOn56sNJQYDiLJhtT7I++irq/UX66PukNMERvT6m55BtsOWDxWF5QrD7PC1pnIDkVbCTxx/hoNztMMf+107wZIbkDpjQuKDHHj+RHuPA6nZVMFUNTJRMavPXRfJHM5YnSsyiozzHMN3uFMVtfk7M6W488+KtCXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605291; c=relaxed/simple;
	bh=jvZ5D7tp1bVrkSUr45nSTmELa6yA2IKS5foYDag26Ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqHbXQzwL+cZOHAUvBZjHqu6CAZWsUtcXUEpY84RgqQtbsJIR6/IjKTl1Y58F0dvG5aigbnKC3BAVEnQbrxqzuP98iNZ+6nSib4PdUmzMP3A0M/I7nZr764VGSD5f0Fzo/e07cVrDDfIPrqpi90XP7RrchC6PUEGu1OlvR0y2S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HqtQGYmL; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HqtQGYmL"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-333f918d71eso36677331fa.3
        for <linux-hwmon@vger.kernel.org>; Tue, 19 Aug 2025 05:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605288; x=1756210088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvZ5D7tp1bVrkSUr45nSTmELa6yA2IKS5foYDag26Ss=;
        b=HqtQGYmLKfsGMRc0jArKSeCknNjfKDAphbDNjc+pJdQmhWPclMMbUQqnW9ypy+dtwX
         ucD3pKYlRFucYlWFdNdTGrtvIC5diDQuGEHRR4vFdtIf5XZOGV9DSqgOYVkjV42EEasF
         3gDInV/jXXFF8HR97OmVJTi/927z4dcjchdRNDWUbwLYYje/ExhoAk4yu/h2gjJzSb1U
         IpThk7soP7cbksjzaf73PiV4ZNDl56r3Jy4ZlPxIkT53sZ5LIMQfKL9oP6CUyTo+EoZ6
         pIOZ1KEVleP/008KlBrjOKUQmDWEWhwvajcWiaHoBLBxryFNcF4NXh3srK23yQ2pPX5u
         83Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605288; x=1756210088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvZ5D7tp1bVrkSUr45nSTmELa6yA2IKS5foYDag26Ss=;
        b=wiDfCyM0Ox8ypEfr71Hr9jBe3vZl9Y1NR/jYSbbVQtYtvL5qulST1y6tQcXFdRM8Si
         1w6asbZSBMs04Mat5TQbpA6eGJrQ5u4NyoJVG/2YdwJgYyZ1yL9zKnPEww2kvLy/3mHc
         GxHnVwduor1RNjnkj6i3wmui/xMppUgHPlLZTsxEgHSdUeXPW8XsWZn35UlYSBs+1bXj
         lWFJRHrLFCLLUZtc/A4l0UmtYfiGpEF6zp5SJTc241o3R1C+G1n/aGdigbtmS6F8wUvh
         cQKOhRnZym6XU+D72UF100e0Y/c/NtuAmiqB2r+8AuyUi+ZdeVb2FvOWS6+liL3aMsJA
         GCtQ==
X-Gm-Message-State: AOJu0YxCtdsRjdFtzhlRD52OP74Lyd77wNIfNUQi0eJwiPNJ2GRwsJfd
	e6zRx/rfDYRgSa/DG6ER0QsPVWEG3GgSFcU148x2003kBlthBSTqxwfJC07POX5TqTrfVVaPM0M
	Av9aGmIZzpfJQ7HxBUiinfOmNouZB4Zs6lxYRoqmztQ==
X-Gm-Gg: ASbGnct84ttJaGdEcQ3+N1JsBh8wS5+dy27gEX3bSoZDO8jI3hDqmNXo5aeEoNyv1ig
	+nWa3y8yPVXtqLHidaYUrNS3pSdaAm9beUccD96NZWPjmsY9fs8H96Jn3+sDksiEUegCfgDdTQY
	REHx/SYtRlOE7lHY1P1FsQgGuoDUKdP6MoHIzyU+7bBnBAUi2mWzEk8QCdYJ2P8bPxzx/cLF2yM
	hyYGkU=
X-Google-Smtp-Source: AGHT+IE3dfVYJKWXUrGRuEJA3+o6pONVlCs6q8ohEH3Jv0GLPiiwaO39fGyN+yXgfnlDzLQo+oRUw/tQcalr7ak4IWY=
X-Received: by 2002:a05:651c:516:b0:32b:533a:f4d6 with SMTP id
 38308e7fff4ca-3353072e501mr6155041fa.34.1755605287796; Tue, 19 Aug 2025
 05:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com> <20250814-ltc4283-support-v1-5-88b2cef773f2@analog.com>
In-Reply-To: <20250814-ltc4283-support-v1-5-88b2cef773f2@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:07:56 +0200
X-Gm-Features: Ac12FXxaXh8IRrmO0qiQXEL9cXb2hqgOSqLusPCKGVI2Xon1ujnlah0xogXM2EI
Message-ID: <CACRpkda1E=2rCK+vt588FRJatrASx+dDss6HMX4NGoTrL=4mPQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] dt-binbings: gpio: Add bindings for the LTC4283 Swap Controller
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
> Document the bindings for the GPIO controller functions of the
> LTC4283 Hot Swap Controller.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

(...)> +title: GPIO LTC4283 Negative Voltage Hot Swap Controller

This is a weird title. What about

"Analog Devices LTC4283 Negative Voltage Hot Swap Controller GPIO"

So readers understand:
1. This is an Analog Devices component
2. It is GPIOs on the NVHSC not a GPIO with NVHSC

Yours,
Linus Walleij
