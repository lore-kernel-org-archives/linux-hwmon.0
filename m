Return-path: <nm@ti.com>
Subject: Re: [PATCH 1/5] hwmon: (tmp102) Use devm_add_action to register
 cleanup function
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>
References: <1466728108-2512-1-git-send-email-linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: Nishanth Menon <nm@ti.com>
Message-ID: <576D401D.80700@ti.com>
Date: Fri, 24 Jun 2016 09:13:49 -0500
MIME-Version: 1.0
In-Reply-To: <1466728108-2512-1-git-send-email-linux@roeck-us.net>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On 06/23/2016 07:28 PM, Guenter Roeck wrote:
> By registering a cleanup function with devm_add_action(), we can
> simplify the error path in the probe function and drop the remove
> function entirely.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

I dont seem to have a cover letter to reply to... but anyways..

Before: http://pastebin.ubuntu.com/17801376/
After all 5 patches: http://pastebin.ubuntu.com/17801824/

Fails on beagleboard-X15 with:
[   36.781509] tmp102 0-0048: No cache defaults, reading back from HW
[   36.795940] tmp102 0-0048: unexpected config register value

I have'nt bisected down on the specific patch in the series. Have you 
had a chance to test the series?


-- 
Regards,
Nishanth Menon
