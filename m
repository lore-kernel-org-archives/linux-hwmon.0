Return-Path: <SRS0=jk2+=6A=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B003C352BE
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Apr 2020 09:21:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BF35206D6
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Apr 2020 09:21:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hkTtnz2D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392149AbgDPJUz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Apr 2020 05:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2392060AbgDPJUw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Apr 2020 05:20:52 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BFDC061A0C
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2020 02:20:51 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id r17so5055383lff.2
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2020 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iuZQPq25LlhzAjymFw6DX/CB5GWOdpk6lIwmaoZu2BE=;
        b=hkTtnz2DkVpj5FadPidho1Yi0E3E7wBAIYmB61/Kj4lK/X8UrCLL81x5xmrcWGWc+H
         azS6fkmcowWvwOnDXcI9l4y6Ucno0mzyziNpLxV9Mthz8Y0YUdXq82D8FzhAITXPdDF8
         3tFd/DXFS5Ty+STvGvcwXllNt8lFNMCiTuvCiXYSz2PukY3ig/gTtCqCjuJHHyXpd1A3
         QDfx/KUMUCLzLxrTqLoSlNd+gU4YBuAYH/DvcY6yoeUzHZc1o3NaKorVY+VcrIzkfObd
         u7uovSiNsexRzNZk8c0flO0ZydCK1WaSDd1IcMQT71DefMnE/zm8iho+FD/0QJcA2MJG
         wMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iuZQPq25LlhzAjymFw6DX/CB5GWOdpk6lIwmaoZu2BE=;
        b=f8jzoH9BmPWGjS+Y1uGHPei1AC1LtYImnm/qK7vTTABJEkWs3sWa60I+bamKhOh4JK
         T3RHy7AHfZsEjDNfRUgPi0Lof25wKdUr6Qp/qUoeNUcn7MIu4fR/vtXGqWytMHWyIpeG
         2YKlbhfapb0OJ4388Y/VGWytWU21Pi0jIw0B6nKfWgq+OGDDRJ23Wbs502rrsChYKQLh
         VDwTAfft6Hu7p+0gYmFCVz6ESWY9MaYjJxlAH5m7TPpL51OEISNnAWyd6b3JQN2lp1IY
         WD+0zSOqouxWYxjwqUoDCbYs0lCULwSN9VdA0kTJuSOXysBkf4na6Fos5jIa7aFG9jxu
         rt6A==
X-Gm-Message-State: AGi0PubnherILI1LrqOJo4CYb6lYx9yagTLlLV4DewG0MHVI0nyx9HPN
        0KTMLC9VC0FpJB28/IuZSGoOg6dmYPqnW8IgPAlVeA==
X-Google-Smtp-Source: APiQypJvAs9P0NYlc+VDp3QIFWPUjuxP+cKRiyTPcwcbTngB4Tr+zwZ10UYlTO8u+2AsTbbibFkxTpAAASs25r3y/l8=
X-Received: by 2002:a05:6512:52c:: with SMTP id o12mr5352302lfc.217.1587028850060;
 Thu, 16 Apr 2020 02:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200402203656.27047-1-michael@walle.cc> <20200402203656.27047-11-michael@walle.cc>
 <CAMpxmJVE3PgVCxkQ-ryc5=KSrKcpdmk1cnJUxJBz9QFCx-e_+A@mail.gmail.com>
 <80bd8661ec8a1f5eda3f09a267846eaa@walle.cc> <CAMpxmJVC7e9JnHzBo-h8M1+KmcA32=Rvxo7+znH=-kAbcCr_LQ@mail.gmail.com>
 <e0388a2137e23d76b2415a7549c01dd1@walle.cc> <CAMpxmJW1x4Orh1BZ4TUoCsYeaAAZ4NBUNvoMG9JgP0iLvXTOtg@mail.gmail.com>
 <62d157198a75a59ada15c496deeab49b@walle.cc> <eab972adf53bbac20b5a9e613fcfb5b0@walle.cc>
In-Reply-To: <eab972adf53bbac20b5a9e613fcfb5b0@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 11:20:38 +0200
Message-ID: <CACRpkdZPZ4nFQ6B3tGG9wvceoTWqAkfY0r1UKs2pf_c=ZNBG=w@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] gpio: add a reusable generic gpio_chip using regmap
To:     Michael Walle <michael@walle.cc>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 14, 2020 at 9:57 PM Michael Walle <michael@walle.cc> wrote:

> So what about the following:
>
> #define GPIO_REGMAP_ADDR_ZERO (unsigned int)(-1)

Yeah with regmap explicitly using int I guess we can't use
S32_MAX, so that is fair.

> So this way the user might assign the base addresses the normal way
> except when he wants to use zero, in that case he has to use
>
>    ->base_adr = GPIO_REGMAP_ADDR_ZERO;
>
> gpio-regmap.c could use then:
>
> if (base_addr)
>    something_useful(gpio_regmap_addr(base_addr));
>
> unsigned int gpio_regmap_addr(unsigned int addr)
> {
>    return (addr == GPIO_REGMAP_ADDR_ZERO) ? 0 : addr;
> }

That's reasonably clean.

Yours,
Linus Walleij
