Return-path: <nm@ti.com>
Subject: Re: [PATCH v3 1/3] hwmon: (tmp102) Improve handling of initial read
 delay
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>
References: <1467258119-14071-1-git-send-email-linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: Nishanth Menon <nm@ti.com>
Message-ID: <578558BD.1000608@ti.com>
Date: Tue, 12 Jul 2016 15:53:17 -0500
MIME-Version: 1.0
In-Reply-To: <1467258119-14071-1-git-send-email-linux@roeck-us.net>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On 06/29/2016 10:41 PM, Guenter Roeck wrote:
> If the chip was in shutdown mode when the driver was loaded, the first
> conversion is ready no more than 35 milli-seconds after the chip was
> taken out of shutdown. The driver delay was so far set to 333 ms (HZ / 3),
> which is much higher than the maximum time needed by the chip.
> Reduce the time to 35 milli-seconds.
>
> Introduce a 'valid' flag to ensure that sensor data is actually read
> even if requested less than 333 ms after the driver was loaded.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v3: Don't go to sleep if sensor readings are not available;
>      instead, return -EAGAIN (matching previous behavior)
>      tmp102_update_device() is now a void function.
> v2: No change
>
> Note: This series depends on the following two patches in -next.


a little too late perhaps.. Apologies, was on vacation.. tested and 
for the series:

Acked-by: Nishanth Menon <nm@ti.com>


-- 
Regards,
Nishanth Menon
