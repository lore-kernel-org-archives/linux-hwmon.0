Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49418 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751454AbcKVUdv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Nov 2016 15:33:51 -0500
Date: Tue, 22 Nov 2016 12:33:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Lucas Tanure <tanure@linux.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: IEEE-754 Float to int
Message-ID: <20161122203349.GA26020@roeck-us.net>
References: <CAJX_Q+1iPpLnbLYB6=9gWR2EEwek5VvioBCZB6gYsChOZ3EyVA@mail.gmail.com>
 <CAJX_Q+0bDQmHYpfkK3RGTmWdJoi0RAB+u=5M9WtgyoKdeGXdrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJX_Q+0bDQmHYpfkK3RGTmWdJoi0RAB+u=5M9WtgyoKdeGXdrQ@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Nov 22, 2016 at 05:10:54PM +0000, Lucas Tanure wrote:
> Hi,
> 
> My hardware gives me the board temperature as a float 32bits.
> So, at some point my hardware gives me a 32bit IEEE-754 float, like this :
> 
> regmap_read(device->regmap, ADDR0, &temp);
> value = temp << 16;
> regmap_read(device->regmap, ADDR1, &temp);
> value |= temp;
> 
> So, value has a 32bit float now, and I would like to print over hwmon
> sysfs API. Like :
> 
> temp
> Current temperature as reported by thermal zone (sensor).
> Unit: millidegree Celsius
> RO, Required
> 
> 
> Read 26.92387 --> Read 26923 at /sys/class/hwmon/hwmon0/temp0_input
> Simple, no float operations.
> 
> How I can do it ?
> 
Only idea I have is to write a conversion function.
Note that the attribute name should be temp1_input.

Guenter
