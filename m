Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42066 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935938AbcKWNPW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Nov 2016 08:15:22 -0500
Subject: Re: Concerns re: sensor count in adt7470_read_temperatures()
To: Martin Etnestad <martin.etnestad@appeartv.com>,
        linux-hwmon@vger.kernel.org
References: <02d36c1c-0939-27fd-457c-ba07256bcb1f@appeartv.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <ec2168fd-23d4-75f1-3a5e-f08dc2d8a910@roeck-us.net>
Date: Wed, 23 Nov 2016 05:14:20 -0800
MIME-Version: 1.0
In-Reply-To: <02d36c1c-0939-27fd-457c-ba07256bcb1f@appeartv.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/23/2016 12:44 AM, Martin Etnestad wrote:
> Hi,
>
> I believe I have found an issue with adt7470_read_temperatures() and am looking for input from anyone familiar with the driver.
>
> The sensor counting in said function treats a temperature reading of 0x00 as meaning there is no sensor.
> It happens on this line:
> https://github.com/groeck/linux/blob/master/drivers/hwmon/adt7470.c#L253
>
> The device manual states that 0x00 is the default value for the temperature registers, so I would indeed expect that value if there is no corresponding sensor.
> But it also seems clear to me that 0x00 is in fact a valid temperature reading, and one that we must allow for.
> For reference, see " TEMPERATURE DATA FORMAT" on page 14 of the device manual here:
> http://www.analog.com/media/en/technical-documentation/data-sheets/ADT7470.pdf
>
> Hence, I think the safest approach is to _not_ attempt to count/detect the number of sensors, but simply initialize the count to the maximum (ADT7470_TEMP_COUNT) in adt7470_probe().

If there is no means to enable / disable sensors, you are correct. However,
the number is calculated only to limit the wait time when reading the sensors
(see commit 2f22d5dff6f95). All we would accomplish by changing that would be
to re-introduce a default wait time of 2 seconds for the chip to read the
temperature sensors, just to address the very unlikely case that a temperature
sensor reads 0 (which, in practice, _is_ really unlikely). So better leave it
alone.

Guenter

