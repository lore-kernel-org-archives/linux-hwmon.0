Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:37595 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751642AbdIJNRv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 10 Sep 2017 09:17:51 -0400
Received: by mail-oi0-f67.google.com with SMTP id l9so4139696oib.4
        for <linux-hwmon@vger.kernel.org>; Sun, 10 Sep 2017 06:17:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170910094446.3154-1-linus.walleij@linaro.org>
References: <20170910094446.3154-1-linus.walleij@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 10 Sep 2017 15:17:50 +0200
Message-ID: <CAK8P3a0SinxZtUpQqn83YQSDSnXYpzZYR6SHr7zocUV_5eZySA@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon/sht15: Root out platform data
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <jic23@kernel.org>,
        linux-hwmon@vger.kernel.org, arm-soc <arm@kernel.org>,
        Marco Franchi <marco.franchi@nxp.com>,
        Davide Hug <d@videhug.ch>, Jonathan Cameron <jic23@cam.ac.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, Sep 10, 2017 at 11:44 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
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
> Cc: Marco Franchi <marco.franchi@nxp.com>
> Cc: Davide Hug <d@videhug.ch>
> Cc: Jonathan Cameron <jic23@cam.ac.uk>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Fix the return value from devm_gpiod_get() with PTR_ERR()
>   so we defer etc correctly.
>
> ARM SoC folks: please ACK this so the HWMON maintainer can merge
> it when it is in reasonable shape.
>

Acked-by: Arnd Bergmann <arnd@arndb.de>
