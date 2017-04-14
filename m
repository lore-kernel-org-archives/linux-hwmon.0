Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:52247 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751544AbdDNCtq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Apr 2017 22:49:46 -0400
Subject: Re: [PATCH 1/3] mfd: cros-ec: Add functions to read mapped memory
To: Moritz Fischer <moritz.fischer.private@gmail.com>
References: <1491602410-31518-1-git-send-email-moritz.fischer@ettus.com>
 <20170413210354.GA17134@roeck-us.net>
 <CAJYdmeNXJgzgM3uTi-DjA1B10wSipqSPZ20qhboysqKY_tvVLQ@mail.gmail.com>
Cc: Moritz Fischer <moritz.fischer@ettus.com>,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, olof@lixom.net,
        jdelvare@suse.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <ac61bfca-bfa0-143b-c9ca-365b8026ce8d@roeck-us.net>
Date: Thu, 13 Apr 2017 19:49:43 -0700
MIME-Version: 1.0
In-Reply-To: <CAJYdmeNXJgzgM3uTi-DjA1B10wSipqSPZ20qhboysqKY_tvVLQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 04/13/2017 03:53 PM, Moritz Fischer wrote:
> Hi Guenter,
>
> On Thu, Apr 13, 2017 at 2:03 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> On Fri, Apr 07, 2017 at 03:00:08PM -0700, Moritz Fischer wrote:
>>> From: Moritz Fischer <mdf@kernel.org>
>>>
>>> The ChromeOS EC has mapped memory regions where things like temperature
>>> sensors and fan speed are stored. Provide access to those from the
>>> cros-ec mfd device.
>>>
>>
>> Turns out struct cros_ec_device already provides a cmd_readmem callback,
>> which is widely used by other drivers. Why don't you just use it ?
>
> This is only actually set by the lpc version of the cros_ec. I2C and
> SPI connected ECs

Hmm - weird. I thought I saw it implemented for those, but I must have been
struck by lightning or something. Let me check with Gwendal to see how
this (ie its use from iio) is supposed to work on non-LPC systems.

Guenter

> emulate it. I can most certainly hook it up in the (spi,i2c) drivers,
> but the implementation
> for SPI and I2C needs to live somewhere. drivers/platform/chrome/cros_ec_proto.c
> seemed to be a good place.
>
> Thanks for the feedback!
>
> Moritz
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

