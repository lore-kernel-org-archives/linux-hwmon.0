Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="taIgII0y"
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF2219A
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Nov 2023 06:50:01 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5d1f8bc279aso7819957b3.1
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Nov 2023 06:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701269401; x=1701874201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhKeP/2tChma4nLl2fipRCbsIXhCJ2Ql2fHfvqdfSF4=;
        b=taIgII0yRfSpWHl0rL/sC26C16ad/kzr9+L1NTjdkd+0oEL1o97qsv7sThaJ8mpPOR
         LkobQkk8+ZlUCtiwc53klj505J28qktSG4RNk2f5uqeBqGKy2IC+YnkUAGyb0iy3Mmo9
         DAjwC6DxysrpDJ49o/Syi4UYDmlgzvwE+hO7nioj0kaLHoXMthAVqtvfbR7/z0Iji4Wd
         w7e/VosvxquzH/vLdHF/2IHrE/0qDE8SkugYEZWrz3SaVK18wB1afSn4O3C1SovwQzVd
         l4TGTpmk9m+bRYJR5oPRkPW8wE9q8RdwtCgHv6K+W2uthVVeTtsfWFr+cTa2B9l0NoH7
         VsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701269401; x=1701874201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhKeP/2tChma4nLl2fipRCbsIXhCJ2Ql2fHfvqdfSF4=;
        b=bnAxqcKyGJ3oyATzX8a0yx8JYBbuSCAbbO7icLoail0bXsppyK/k9rJlwrpci9TuAv
         kgcmi19IfxnUO37WxVfPT8TMKk88ScC+vR6GTH0h207a+DGw7Ot6Jqsc7HzZjLpV7qW4
         6agVHSfGMs8GH0HUEOuQ0DeRUCPJj4IvOa6gcjV70MM3H+X9ry6szvhQYBh1Dtm/Y2w6
         a5zpe8SFONcIrRlcCnorYZKSKfqHTB/opKJ1fzbyOJ8A39ss5o3OR0bTMlJuhb/X+pZR
         K9zX0kiM3gugTMbkxxPV7WHffUE+Ln6RnR6R6wylY/dcHCSb6+CEAfqWMmEu+PEeASeq
         Hj5w==
X-Gm-Message-State: AOJu0YzT248kHFcg1B5E6U1A/IymFBWCe2syqoOE98CTu/Hq/7rlzpL0
	yIBThr/mf0T1b0BAt2I3+abZ1Ct1HkkKCV06kkhHYA==
X-Google-Smtp-Source: AGHT+IGVvGtWUCNcwNIqqWT4FI0ZK8ySjPr60DSojrMHvp+1VCvIaWJzbx2ZBbM/ASOStaPF82gKQ66tjacLTeXhKlw=
X-Received: by 2002:a0d:d814:0:b0:5c1:25f:567d with SMTP id
 a20-20020a0dd814000000b005c1025f567dmr17123038ywe.16.1701269400974; Wed, 29
 Nov 2023 06:50:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com> <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
In-Reply-To: <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 15:49:48 +0100
Message-ID: <CACRpkdaksfS4WLNQ6ohauAPq3z2LPG2uF37_jWtm0brQHaDtNw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nuno,

GPIO-related review as requested! Thanks for your patch!

On Fri, Nov 24, 2023 at 3:18=E2=80=AFPM Nuno Sa via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:

> +config SENSORS_LTC4282
> +       tristate "Analog Devices LTC4282"
> +       depends on I2C
> +       select REGMAP_I2C

select GPIOLIB

potentially also

select GPIO_REGMAP, see below.

> +struct ltc4282_gpio {
> +       const char * const *funcs;
> +       u32 out_reg;
> +       u32 out_mask;
> +       u32 in_reg;
> +       u32 in_mask;
> +       bool active_high;
> +       u8 n_funcs;
> +};

So pretty simple dedicated bits.

> +static int ltc4282_gpio_input_set(struct gpio_chip *chip, unsigned int o=
ffset)
> +{
> +       struct ltc4282_state *st =3D gpiochip_get_data(chip);
> +
> +       /* we can only control this for GPIO_1 */
> +       if (offset !=3D LTC4282_GPIO_1)
> +               return 0;
> +
> +       return regmap_set_bits(st->map, LTC4282_GPIO_CONFIG,
> +                              LTC4282_GPIO_1_CONFIG_MASK);
> +}
> +
> +static int ltc4282_gpio_output_set(struct gpio_chip *chip, unsigned int =
offset,
> +                                  int val)
> +{
> +       struct ltc4282_state *st =3D gpiochip_get_data(chip);
> +       const struct ltc4282_gpio *gpio =3D &ltc4282_gpios[offset];
> +
> +       guard(mutex)(&st->lock);
> +       /*
> +        * Explicitly setting the pin as output can only be done for GPIO=
_1. For
> +        * the other pins we just pull the line down or high-z.
> +        */
> +       if (offset =3D=3D LTC4282_GPIO_1) {
> +               int ret;
> +
> +               ret =3D regmap_update_bits(st->map, LTC4282_GPIO_CONFIG,
> +                                        LTC4282_GPIO_1_CONFIG_MASK,
> +                                        FIELD_PREP(LTC4282_GPIO_1_CONFIG=
_MASK, 2));
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /*
> +        * GPIO_2,3 and the ALERT pin require setting the bit to 1 to pul=
l down
> +        * the line
> +        */
> +       if (!gpio->active_high)
> +               val =3D !val;
> +
> +       return regmap_update_bits(st->map, gpio->out_reg, gpio->out_mask,
> +                                 field_prep(gpio->out_mask, val));
> +}
> +
> +static void ltc4282_gpio_set(struct gpio_chip *chip, unsigned int offset=
,
> +                            int val)
> +{
> +       struct ltc4282_state *st =3D gpiochip_get_data(chip);
> +       const struct ltc4282_gpio *gpio =3D &ltc4282_gpios[offset];
> +
> +       if (!gpio->active_high)
> +               val =3D !val;
> +
> +       regmap_update_bits(st->map, gpio->out_reg, gpio->out_mask,
> +                          field_prep(gpio->out_mask, val));
> +}
> +
> +static int ltc4282_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct ltc4282_state *st =3D gpiochip_get_data(chip);
> +       const struct ltc4282_gpio *gpio =3D &ltc4282_gpios[offset];
> +       int ret;
> +       u32 val;
> +
> +       ret =3D regmap_read(st->map, gpio->in_reg, &val);
> +       if (ret)
> +               return ret;
> +
> +       return !!(val & gpio->in_mask);
> +}
> +
> +static int ltc4282_gpio_valid_mask(struct gpio_chip *chip,
> +                                  unsigned long *valid_mask,
> +                                  unsigned int ngpios)
> +{
> +       struct ltc4282_state *st =3D gpiochip_get_data(chip);
> +
> +       *valid_mask =3D st->valid_mask;
> +       return 0;
> +}

Some of this looks like it could use GPIO_REGMAP, look into other
drivers using these helpers such as
drivers/gpio/gpio-ds4520.c and see how small it becomes.

It may or may not help you. But take a look.

Other than that it looks fine.

Yours,
Linus Walleij
