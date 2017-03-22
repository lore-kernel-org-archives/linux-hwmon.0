Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:37941 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758909AbdCVIMo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Mar 2017 04:12:44 -0400
Subject: Re: IT87_REG_PWM[3-5] wrong or obsolete?
To: Justin Maggard <jmaggard10@gmail.com>, linux-hwmon@vger.kernel.org
References: <CAKgsxVQa-uZb8V2Zgm5P8Gmau9K2a4Z6U4+_W7bjSdS+m6f5ng@mail.gmail.com>
Cc: jdelvare@suse.com
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <860c7855-ed6f-394e-3470-2254142465f1@roeck-us.net>
Date: Wed, 22 Mar 2017 01:12:41 -0700
MIME-Version: 1.0
In-Reply-To: <CAKgsxVQa-uZb8V2Zgm5P8Gmau9K2a4Z6U4+_W7bjSdS+m6f5ng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Justin,

On 03/17/2017 11:42 AM, Justin Maggard wrote:
> Hi,
>
> We've started using an IT8613E chip in some hardware designs, and I
> was planning to submit our it87 driver changes to support this new
> chip.  IT8613 supports 4 fans, but the fans it supports are fans 2-5.
> One of our designs has 3 fans, with the third fan connected to FAN4;
> however, I'm unable to control that fan using the current driver.
>
> The reason is, in the current driver, IT87_REG_PWM[3-4] is set to
> 0x7f, 0xa7. But on IT8613E this should be 0x1e, 0x1f.  I see that
> these registers were defined when adding support for IT8620E.  Can
> anybody confirm that 0x7f, 0xa7 are correct on that chip?  I'm sure
> they weren't just pulled out of thin air, but it seems odd that ITE
> would have changed only those register indexes.
>
> Assuming that those registers indexes are important for at least
> IT8620E, what would be the desired way to proceed with adding IT8613E
> support?
>

I just pushed a new version of the driver which should resolve this particular
issue. Please let me know if it helps.

Note: If the chip is similar to other recent chips (multi-page), temperature
sensor type detection is probably wrong. Older chips use register 0x55 and 0x77,
newer chips use registers 0x1d, 0x1e, and 0x1f in page 2.

Guenter

