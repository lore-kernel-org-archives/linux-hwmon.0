Return-Path: <linus.walleij@linaro.org>
Return-path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <2ba33ee3-9c49-6d22-cf1e-f6b28afe5d62@roeck-us.net>
References: <CACRpkdYcrFQtp4h2_EfAz1K1dd083RbLzZ7jk1V6mitQLWpS9Q@mail.gmail.com>
 <2ba33ee3-9c49-6d22-cf1e-f6b28afe5d62@roeck-us.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 3 Dec 2017 17:19:05 +0100
Message-ID: <CACRpkdZnuYOh7eR-bky9yqyKJdBHVt2OT2mcbYjXE0VLHXetdg@mail.gmail.com>
Subject: Re: Bridging hwmon and thermal
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-pm@vger.kernel.org,
	Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Sun, Dec 3, 2017 at 4:39 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 12/03/2017 05:24 AM, Linus Walleij wrote:

>> Is it possible to use drivers/thermal to set up a policy
>> for controlling the HWMON fan directly by reading the
>> HWMON sensor input periodically?
>>
>
> Both register with the thermal subsystem, so I would think
> it should be possible, at least for devicetree enabled systems
> (the hwmon subsystem uses a devm function to register
> sensors with the thermal subsystem, and the only available
> devm function is devm_thermal_zone_of_sensor_register).

OK! I will try to make it tick! Thanks!

Yours,
Linus Walleij
