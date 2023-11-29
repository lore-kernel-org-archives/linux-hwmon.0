Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CQEG1oDC"
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B3910CE
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Nov 2023 12:55:48 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5cc66213a34so2186477b3.1
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Nov 2023 12:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701291348; x=1701896148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYo9siRRukjyydYpWOxu+G5v9shMXxvSYO9qfz7LOa0=;
        b=CQEG1oDC57aOHEeElqbxX/8RuWEse9qb9F5n1cPybUXnf2XnjDI6lmffgslSxkXHKj
         re30QX+97AgjXEruLqA7By6uc/9ldSAfSjcleTUmF8++hyIVUubhVEBRQtk5AudH6D+v
         tLX2ps+WlXSQqK2N+pRP0dJGfH6Mug7y6l7w5Lw1OVogTgqDzJ7lnxtwiL0tqwetopzk
         v8eTM5z30V9meqFvRIaJNdWOt3kfDwBi/qq6oIJDkU/VMBVAHy0ahoACczIk0bBGGY2Z
         9kQZ6mAZMSDLYasj5Fbci9No208TRKPFLkTDgQ3Euj7rkP/ASOiML+4ocPHNlxebjxJg
         gaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701291348; x=1701896148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYo9siRRukjyydYpWOxu+G5v9shMXxvSYO9qfz7LOa0=;
        b=DZpMv5orV9/G7MnBikz2e/wmgASQLh1/6yZDcHIyziEGpWpBoc5QKVwvEMfO5kCI+8
         Wwno0B7x8zSVulqmCdkd+3OzrFJyAGg3s56r5IKrxRy2S9mL53Wloe7PfcZJYOuJPxp6
         EkJYw6HF/p+jB4Yr+lerXBAttJLoAIp6C3IJNSvuRtnWxpHr1Zo2v7SX7U2nXvJITNP9
         hz6tYCtlrwbNXGcdv2Py/L0RhWDMDJPAoYa/o+0cm3u6yKQnpFxq+J3NkYV7VWuBfO4R
         uAW+yXbIqShyWrwzSLe6CysVtj0tyQn95VlEjYUCcicIe6NjAzIyjzHFC0iMqd0aDJRa
         yheA==
X-Gm-Message-State: AOJu0YxLI4IzKMOrtfPfGyYD5lGf8hBmxi+OxI0jAs3sbyUoh6M+EA3E
	JfCXPojoWWHCrjJW8T5MkMSKe5MQWty9F1i12epEhw==
X-Google-Smtp-Source: AGHT+IHY5Wklar4mLgKVnkc8NkfHKvGY1m88CFYYIg2W1tC54blVltwsxR7dwpNX9DudxX79+O8uwT3RD441V3yMglQ=
X-Received: by 2002:a81:9e0f:0:b0:591:15a6:c11f with SMTP id
 m15-20020a819e0f000000b0059115a6c11fmr17702431ywj.50.1701291347861; Wed, 29
 Nov 2023 12:55:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
 <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com> <CACRpkdaksfS4WLNQ6ohauAPq3z2LPG2uF37_jWtm0brQHaDtNw@mail.gmail.com>
 <6384831c05b8ceeaf4a16cf9229770252989b762.camel@gmail.com>
In-Reply-To: <6384831c05b8ceeaf4a16cf9229770252989b762.camel@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 21:55:35 +0100
Message-ID: <CACRpkdZr6TdQCLy73Yx2RdMgQifd67remdxENBKYx3UvEMm87A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 5:08=E2=80=AFPM Nuno S=C3=A1 <noname.nuno@gmail.com=
> wrote:

> Cool, I actually thought that having the direction + get/set stuff would =
be weird
> given the fact that we can only PULL_LOW or HIGH_Z the pins.

There are several drivers in the kernel that implement .set_config(),
it's existing and should be enabled if it has uses.

As Andy points out: when the driver reaches a certain complexity,
such as a huge table of muxable pins (that need to be configured to
a certain muxing from device tree), and numerous complicated
pin config options (also needing to be set up from device tree),
it may be worth to implement a separate pin control driver that
act as "backend" for the GPIO driver.

I think a separate pin control driver would be overkill in this case,
it's a PWM driver with some smallish GPIO portions AFAICT,
but you get to decide.

Yours,
Linus Walleij
