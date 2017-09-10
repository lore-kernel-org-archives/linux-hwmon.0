Return-Path: <d@videhug.ch>
Return-path: <d@videhug.ch>
Date: Sun, 10 Sep 2017 16:05:28 +0200
From: Davide Hug <d@videhug.ch>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Cameron <jic23@kernel.org>, linux-hwmon@vger.kernel.org,
 arm@kernel.org, Marco Franchi <marco.franchi@nxp.com>, Jonathan Cameron
 <jic23@cam.ac.uk>
Subject: Re: [PATCH v2] hwmon/sht15: Root out platform data
Message-Id: <20170910160528.81ac76b96943ff262a61434a@videhug.ch>
In-Reply-To: <20170910094446.3154-1-linus.walleij@linaro.org>
References: <20170910094446.3154-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Sun, 10 Sep 2017 11:44:46 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> After finding out there are active users of this sensor I noticed:

I would like to point out that I'm doing this for learning purposes and that I
don't have any pressing needs for this driver to work. But of course I'm really
grateful for all the replays!

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
> Marco: can you test this patch with your setup?
> 
> Davide: can you test this patch with your setup?

I tested it and I can make it work (as the current driver) by modifying gpiolib
to not test for the FLAG_USED_AS_IRQ in _gpiod_direction_output_raw.
Otherwise again I get:

	gpio-48 (SHT15 data): _gpiod_direction_output_raw: tried to set a GPIO tied to an IRQ as output

as with the current driver. But I guess this is as expected.
(I did this on a beaglebone black with kernel 4.9.10. I'll compile a newer
kernel and try it there to.)

Thanks!
Davide
