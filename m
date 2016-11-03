Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:32927 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754524AbcKCIjI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Nov 2016 04:39:08 -0400
Received: by mail-wm0-f46.google.com with SMTP id c184so995060wmd.0
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Nov 2016 01:39:07 -0700 (PDT)
Date: Thu, 3 Nov 2016 08:41:47 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Richard Vidal-Dorsch <richard.dorsch@gmail.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com,
        linux@roeck-us.net, wsa@the-dreams.de, jingoohan1@gmail.com,
        tomi.valkeinen@ti.com, wim@iguana.be, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-watchdog@vger.kernel.org, k.kozlowski@samsung.com,
        jo.sunga@advantech.com, weilun.huang@advantech.com,
        andrew.chou@advantech.com
Subject: Re: [PATCH v4 1/6] Add Advantech iManager MFD core driver
Message-ID: <20161103084147.GY13127@dell>
References: <20161102083751.6335-1-richard.dorsch@gmail.com>
 <20161102083751.6335-2-richard.dorsch@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20161102083751.6335-2-richard.dorsch@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, 02 Nov 2016, Richard Vidal-Dorsch wrote:

> This patch adds Advantech iManager Embedded Controller MFD core driver.
> This mfd core dirver provides an interface for GPIO, I2C, HWmon,
> Watchdog, and Backlight/Brightness control.
> 
> Signed-off-by: Richard Vidal-Dorsch <richard.dorsch@gmail.com>
> ---
>  drivers/mfd/Kconfig             |  18 +
>  drivers/mfd/Makefile            |   1 +
>  drivers/mfd/imanager-core.c     | 941 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/imanager-ec.h | 228 ++++++++++
>  include/linux/mfd/imanager.h    | 221 ++++++++++
>  5 files changed, 1409 insertions(+)
>  create mode 100644 drivers/mfd/imanager-core.c
>  create mode 100644 include/linux/mfd/imanager-ec.h
>  create mode 100644 include/linux/mfd/imanager.h

After a brief review, it is my belief that this looks like a platform
driver, which should live in drivers/platform/.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
