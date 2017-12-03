Return-Path: <linus.walleij@linaro.org>
Return-path: <linus.walleij@linaro.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 3 Dec 2017 14:24:42 +0100
Message-ID: <CACRpkdYcrFQtp4h2_EfAz1K1dd083RbLzZ7jk1V6mitQLWpS9Q@mail.gmail.com>
Subject: Bridging hwmon and thermal
To: linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	linux-pm@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
	Eduardo Valentin <edubezval@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

Hi folks,

This system:
https://dflund.se/~triad/krad/dlink-dns-313/

Has:
- 1 GPIO fan using drivers/hwmon/gpio-fan.c
- 1 temperature sensor using drivers/hwmon/lm75.c

So it is the simplest form of chassis cooling.

Is it possible to use drivers/thermal to set up a policy
for controlling the HWMON fan directly by reading the
HWMON sensor input periodically?

If not: should it be? It seems natural to me.

I guess this stuff is normally "policy in userspace"
but we already have thermal policies in the kernel,
so...

Yours,
Linus Walleij
