Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB8B33A9FA
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Feb 2026 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771510904; cv=none; b=miMvoc3xGKb3SKeJ1rJ1J/etTGtPQ08oDx9bf8ibL8QzXzVmi39yMSmbBfC+4Ll4IXQvIbQ3P9YuJJO4BP/p4IBBVFx+xIZdBgNzVyixlEsrOAfbuiO+v+7YfNL9axXUrd2HvhzxXNRsDBhFOacLCcE7gvzfgBnJOoNJPw2NTcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771510904; c=relaxed/simple;
	bh=/ZYYXgtgPRKj1olgFBbWehbpGHm+uMISOKI3+DRNfa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tmWaGA7aqYsic2IwGjEfq1aM6vbUGGcVDzyvEX/jkwCGMOKyflgTo68Oh4YvSzYiIKqpNUdQLJsz5FqQSaJO94bvo72PWLBTjA5GJePG+a5rVvEm9C/eviVvZ5BMeR3nu5mOlyQbJC0VfO6YRkDDms7LiiIZjSBcjGkb+IDQSjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5674cd243d9so1339421e0c.0
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Feb 2026 06:21:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771510902; x=1772115702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnT2E6qzZtv6m4RxT1fh4Ezu4L7LN5MU6W5pzU+vKVg=;
        b=gsdZf7qU0r2p61amMV46zRk1TPd8FJoSn5yvzeVjbbtVR858LNvbL7XMG3q8ZAYbhK
         Jq0Pc1i7p/4Lf8mJUZgfq+IWUBRaagwoiT7psw7ngHfXkda819O6CYBkW9WEHEMTqQFT
         hCcCA82u/97HlhBMZI17i8ROkJNnqDH5i/0GOFkd2KfqAZ5dWwvdll0tz6rvK725EQDu
         K/EojIb4xQT7AnZFL1R/PHNbewFQ/3JOE9NokF425hv0bNqvh57T3ghofc2jdk9bTK+f
         7sQOmlmGNIfpTb0QtcCdFHxPIPx+18jB3C5tk52DW8FR00szkXueHqsUJGwyemk6uqQj
         PQyw==
X-Gm-Message-State: AOJu0YwnLGObdlR57L+5YWNDbJXrlpX5svc/cViicZjQeUcw0vZbJYFo
	ryUtwnnd9suvOwIqnw5Hzk6GoVmnb2LY3I8484lgmpC8gatYw/UvVGyvSQMgTTu/
X-Gm-Gg: AZuq6aJpqNLgNrsx1JENCYRq0IBjCZamkbNNh/wxPZsJwy6p33vZfElUj/RCDmIibYP
	IeCjNrU1bR00WLb9+0MqKWrwWtGU/2cFIfw97wNyvs8K4za/y0xt2xm3ATOcIG8Ruha7cTl+tBB
	7H5QxR7vP9DpkbL7g8HJf+kG6yeZMEXwbInZrw7q1Laet4xT8U9DD2CYvfqUJt1RsfNNJ52dDn9
	F/PonVPDryBIO0oqxaRBwkzAqA4elyVcuccuo4LeMZf1UpI81fCoZi8badvr3CSyjdlywPQYbDq
	6i50gWd0dvvw8xo4UtuKix5D9bSmLQPw/bH2Ip9kjqd1AD8sBbEqUTj7r+Z7KEedXuepFqeQvLe
	B2KWthO6N+mWliR3kTn/qW9rJ/amKXn0yb7LTE8HirDW/1CiOi+G3fabl+8VrRlbsVrbWsBZHmU
	AH2jrryWBSD3PQR8m8J4/epw69ZPf6dpvU/O1K5Av/FAXgxG0DrgeSTJK3P1l7
X-Received: by 2002:a05:6102:3f47:b0:5fd:ea47:d317 with SMTP id ada2fe7eead31-5fe90c14df9mr1127887137.15.1771510901661;
        Thu, 19 Feb 2026 06:21:41 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94afd343306sm13542517241.9.2026.02.19.06.21.41
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 06:21:41 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5fe0959ae3dso453724137.1
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Feb 2026 06:21:41 -0800 (PST)
X-Received: by 2002:a05:6102:3a0f:b0:5f7:246c:7d59 with SMTP id
 ada2fe7eead31-5fe90c29394mr965190137.18.1771510901101; Thu, 19 Feb 2026
 06:21:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219140532.2259235-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260219140532.2259235-1-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Feb 2026 15:21:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9CdQNBGegrfHz+-UpuyO-rmHEQ2HUa=JjVpG_0ryacg@mail.gmail.com>
X-Gm-Features: AaiRm520qeQadKACmPUSOomPwLBIUK1pbrc4MXCEiEjLJYebeqKw7k_Necoay4M
Message-ID: <CAMuHMdX9CdQNBGegrfHz+-UpuyO-rmHEQ2HUa=JjVpG_0ryacg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hwmon: (isl28022) Don't check for specific errors
 when parsing properties
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, =?UTF-8?Q?Carsten_Spie=C3=9F?= <mail@carsten-spiess.de>, 
	Guenter Roeck <linux@roeck-us.net>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

CC devicetree

On Thu, 19 Feb 2026 at 15:06, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Instead of checking for the specific error codes (that can be considered
> a layering violation to some extent) check for the property existence first
> and then either parse it, or apply a default value.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/drivers/hwmon/isl28022.c
> +++ b/drivers/hwmon/isl28022.c
> @@ -337,21 +337,28 @@ DEFINE_SHOW_ATTRIBUTE(shunt_voltage);
>   */
>  static int isl28022_read_properties(struct device *dev, struct isl28022_data *data)
>  {
> +       const char *propname;
>         u32 val;
>         int err;
>
> -       err = device_property_read_u32(dev, "shunt-resistor-micro-ohms", &val);
> -       if (err == -EINVAL)
> +       propname = "shunt-resistor-micro-ohms";
> +       if (device_property_present(dev, propname)) {
> +               err = device_property_read_u32(dev, propname, &val);
> +               if (err)
> +                       return err;
> +       } else {
>                 val = 10000;
> -       else if (err < 0)
> -               return err;
> +       }
>         data->shunt = val;

IIRC, we have removed superfluous presence checks all over the tree
during the past few years? E.g. of_property_read_*() is documented to
return -EINVAL if a property does not exist.
So this patch looks like a step back to me...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
