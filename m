Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:51022 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754048AbdJSPtf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 19 Oct 2017 11:49:35 -0400
Received: by mail-oi0-f65.google.com with SMTP id q4so15617761oic.7
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Oct 2017 08:49:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170908223706.18412-1-linus.walleij@linaro.org>
References: <20170908223706.18412-1-linus.walleij@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 19 Oct 2017 17:49:34 +0200
Message-ID: <CAK8P3a2Vv2LwmuUYV7NPgFj6aVyLRGLcdLPR29BCnM0FgwXgiw@mail.gmail.com>
Subject: Re: [PATCH] hwmon/sht15: Root out platform data
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <jic23@cam.ac.uk>,
        linux-hwmon@vger.kernel.org, arm-soc <arm@kernel.org>,
        Davide Hug <d@videhug.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Sep 9, 2017 at 12:37 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> After finding out there are active users of this sensor I noticed:
>
> - It has a single PXA27x board file using the platform data
> - The platform data is only used to carry two GPIO pins, all other
>   fields are unused
> - The driver does not use GPIO descriptors but the legacy GPIO
>   API
>
> I saw we can swiftly fix this by:
>
> - Killing off the platform data entirely
> - Define a GPIO descriptor lookup table in the board file
> - Use the standard devm_gpiod_get() to grab the GPIO descriptors
>   from either the device tree or the board file table.
>
> This compiles, but needs testing.
>
> Cc: arm@kernel.org
> Cc: Davide Hug <d@videhug.ch>
> Cc: Jonathan Cameron <jic23@cam.ac.uk>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ARM SoC folks: please ACK this so the HWMON maintainer can merge
> it when it is in reasonable shape.

Acked-by: Arnd Bergmann <arnd@arndb.de>
