Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8610936921C
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Jan 2026 19:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769887242; cv=pass; b=RPK762UnLlQZ10wRGVuWJa47cr5cmpkEvtLu7pIIlqtB/bWryS+hmXZoe3dy7CgN8jhO/uJwek6MipraAYf5yPQSJMiCU0n8Wzhfv3YFRvBx7D6UeA4WPgiE/y6Q2N4mpWTqrFxHkZJNKX7tigXQ0MMsaA14LQGj1/EAbZEa8+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769887242; c=relaxed/simple;
	bh=u1blYFOaihwEjJQ0Y79Tn46I3fNM8Qvm8G8aG0FYl5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qIesiEJlsuCgXvlKHUDgOGqlIs7vIGYvITAGnj79yjY+D/jnX9pSBi3LH4kfnWb+e7cjJrk/5Pq0wP91LEYtLiFaOoS8oCcdUfOaSqh90YdHqq/QjAmO0iKmiPc+j/ziWT6Bxn3iyC89oHkPgeO/+nD0QziIC6kQHAWM3oQuxTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEuKOkfc; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEuKOkfc"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-124899ee9d3so2299722c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 31 Jan 2026 11:20:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769887240; cv=none;
        d=google.com; s=arc-20240605;
        b=JD839bXqB5iHopquBRCss7rOWpdZN2H6GtHJij7xEO05f1duK1f/afLkXX8rpH+xwN
         VgFcgB814P+cxogn6YET8HYeQQEfTXMB9ELb9WcAoca/5MkvFfXY1tMQx52nk0WdV0th
         YeRFS1HAIyS64Qwjfofab4lJJdsgEQukxg1mUJC4lZOcRnOwSm2uJ1dCVfSf4K5SnbnM
         MmAOvVnZXsvfcsiRNgsafWO6N+d38gUrbtZjKoVTGbNOcJZsamchDmZgDO9g+cNjrlwx
         c8ycFl9rIMyhcIvrA7JymlM0GS8tisRh08KXsfjrxF8Tp6cyk/NcB3Lr6epq5aRYGMOS
         2GdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WeCMszZfOl4DyAwowXVTSLmSbWsHdYYmq9ZhDMIcKxY=;
        fh=7TAiGN0loP9D6il5TOUB/khZrBMnTO8y0n2FZhoQxZU=;
        b=RwkCJPCfADpDQwqt+2tdYsbuDqOsD6WVp6mnaBqhQ35tE6J4uTMo7lyGtPGnrqQQSj
         ItDtU4OiMeq/QUdQgt+dCQw4pNUCt1nxwFoSMtdZBWwHAZ3ZK0iru5UZ2cmCuC/Du2LS
         RbGA2P6gwOrO2k8KqVFQFbNps+0jr+KZqW8RtdhD9euwenQXYpyaxlI8XBhaOOf5rjKz
         7rkcIocDfbfxjkUu+dz2N3FV4Le/cn+vqxAl4WHbeI/T2Dq9ETiwD9uNcPXYhWPrHDj5
         sxNA6/WmmbOk/vWctpz0mUvtDqn9Dd7gpSOCs2VTaMwBripyXqoOaqliXcw2iuc8gZEL
         8mzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769887240; x=1770492040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeCMszZfOl4DyAwowXVTSLmSbWsHdYYmq9ZhDMIcKxY=;
        b=JEuKOkfcubhqwtGMJ+Ivxt/EMzXi3kyFM2n4x8RB/64TLDXcfEmICHH0dA46bsM9+F
         OD8cbTTuKBOJjmx8eoKqXT9Bxi32fbwIj02EK4ewBdKZoC62IB5tFqP/wxubXr9stUZn
         zMmlznW89N/D+V0Yp09hnabQNXrDIKuLXt9W4pcs79ivbtPcBejIwb23W4gwoa1/2PDI
         nokoRlDD8gEBciSLMN2RyzT7Fz83y+V3zHEcUwmdZAw8F0fOvbg7LL+fmmRBzVJnO/G0
         flavv8q+AKFPj/jMYXVlrnyFHdOLkUFlYN0Itfons0dmCopbNYrdhh7EnWY6JdBBTFoC
         /d4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769887240; x=1770492040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WeCMszZfOl4DyAwowXVTSLmSbWsHdYYmq9ZhDMIcKxY=;
        b=qVtZGwz5zb6nSzYQ5ftgXqjHBZsAEfAWJ45jS/pnDsoEUZwNLvvyweMZRcLdbMbQrF
         y+xx3KOdOKLowrn6ZrdIom9NoubAqtgJO25nbi3f19ck5Fas7n6Z/xo46Dsc4APks/je
         4qozF8R9n8iULDHS6MW18vTMZ6uL7XQfCHKzN6pWlZqSlJGcGFFtptwgWAXCbsG0rhcJ
         82E0is6mknQz35Y8uVDjoWXO/SnWDdmcbBbddZW3PSdJZdbnaAf9fPZ4LaVcNjYD8x/U
         NAK4xTTWj79UyussXefy2c1u5KqMzrUNr6TpflXTLULy9J/5wn3P1DUQKav1hfoFLg39
         LuFg==
X-Gm-Message-State: AOJu0Yx5ZrXueSkUSVcHMfzqpxd2RrZefZIPYyhh+7FL17Px+Caj8VSU
	k07wgXaIxMwOjneSJGDPE/tsJmB2xsVW4yAcXG4aQ9angeqxLlixrFGCBGd/K9J+Yq4VjkTf+er
	DVEN79vBPQO0KDlwW49KUlTbhiYzp3jI=
X-Gm-Gg: AZuq6aIeYrfDbc3saurGQ9mtITkWtPbEWVixyWF3YXASeFYQLJENsxMseBFmYmcp3fE
	iUecZNUDYUxHVjpi/Lv7tdBK+/VfKOGq9ob9RxrkQ+jS+qY+svSkcHKUiaqgwTYkary17X1eePy
	7z8k8EBUsB5Hd76GTQ0Il0/0WFaREB40CyASxJhb2OzECHa7pK3IR/KDR+e/YURqbalfXVh5Zyh
	rLGFhyYquoyvar6HhDNx1/HKcCln2fyoMAsv9ANhCLx4yTBzcpBKxKDi/rZRN3TCa0JT8hgWg==
X-Received: by 2002:a05:7022:6627:b0:11b:9386:a38e with SMTP id
 a92af1059eb24-124b109aa6cmr5196513c88.21.1769887240431; Sat, 31 Jan 2026
 11:20:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260131152048.2299403-1-linux@roeck-us.net>
In-Reply-To: <20260131152048.2299403-1-linux@roeck-us.net>
From: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Date: Sat, 31 Jan 2026 22:20:23 +0300
X-Gm-Features: AZwV_QgUUG-wTTWzA24VkBfaHFMZM1RkfL1tg9ctRMwnXxwOKvj4zhyDpqnP7mY
Message-ID: <CAJ12PfMjDs2zV+CB4Aj0fi+BUQ2NUQGybfUP2i85Wpdqq8SHiw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (spd5118) Explicitly enable temperature sensor in
 probe function
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
	Kurt Borja <kuurtb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 31, 2026 at 6:20=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> Instantiating the driver does not make sense if the temperature sensor
> is disabled, so enable it unconditionally in the probe function.
>
> If that fails, write operations to the chip are likely disabled
> by the I2C controller. Bail out with an error message if that happens.
>
> Cc: Armin Wolf <W_Armin@gmx.de>
> Cc: Kurt Borja <kuurtb@gmail.com>
> Cc: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/spd5118.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 5da44571b6a0..d8834d4d980b 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -552,6 +552,20 @@ static int spd5118_common_probe(struct device *dev, =
struct regmap *regmap,
>         if (!spd5118_vendor_valid(bank, vendor))
>                 return -ENODEV;
>
> +       /*
> +        * Some I2C controllers write protect the address range used by S=
PD5118
> +        * compliant chips. This makes the chips effectively unaccessible=
 since
> +        * the driver needs to be able to set the page in the legacy mode
> +        * register, and it needs to be able to disable the temperature s=
ensor
> +        * during suspend. Check if writes to the chip are possible by
> +        * explicitly enabling the temperature sensor. Bail out if that f=
ails.
> +        */
> +       err =3D regmap_write_bits(regmap, SPD5118_REG_TEMP_CONFIG,
> +                               SPD5118_TS_DISABLE, 0);
> +       if (err)
> +               return dev_err_probe(dev, err,
> +                                    "Failed to enable temperature sensor=
 (write protected ?)\n");
> +
>         data->regmap =3D regmap;
>         mutex_init(&data->nvmem_lock);
>         dev_set_drvdata(dev, data);
> --
> 2.45.2
>

Hi Guenter,

Tested this patch on my system, and it actually fixes the issue.

[   11.523971] i2c-core: driver [spd5118] registered
[   28.040686] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[   28.041003] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[   28.078412] i801_smbus 0000:00:1f.4: No response
[   28.078643] i801_smbus 0000:00:1f.4: No response
[   28.082927] i2c i2c-14: Creating spd5118 at 0x52
[   28.087685] spd5118 14-0052: probe
[   28.092707] i801_smbus 0000:00:1f.4: No response
[   28.092736] spd5118 14-0052: error -ENXIO: Failed to enable
temperature sensor (write protected ?)
[   28.094709] i2c i2c-14: client [spd5118] registered with bus id 14-0052
[   28.094936] i801_smbus 0000:00:1f.4: No response
[   28.095143] i801_smbus 0000:00:1f.4: No response
[   28.095351] i801_smbus 0000:00:1f.4: No response
[   28.095558] i801_smbus 0000:00:1f.4: No response
[   28.095757] i801_smbus 0000:00:1f.4: No response
[   28.095956] i801_smbus 0000:00:1f.4: No response
[   28.096153] i801_smbus 0000:00:1f.4: No response
[   28.097139] i801_smbus 0000:00:1f.4: No response
[   28.097361] i801_smbus 0000:00:1f.4: No response
[   28.097567] i801_smbus 0000:00:1f.4: No response
[   78.689689] PM: suspend entry (s2idle)
[   80.616943] ACPI: EC: interrupt blocked
[   86.510434] ACPI: EC: interrupt unblocked
[   88.175249] PM: suspend exit
