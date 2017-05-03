Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wr0-f174.google.com ([209.85.128.174]:34910 "EHLO
        mail-wr0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751198AbdECW3M (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 3 May 2017 18:29:12 -0400
Received: by mail-wr0-f174.google.com with SMTP id z52so1578214wrc.2
        for <linux-hwmon@vger.kernel.org>; Wed, 03 May 2017 15:29:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <90f011d6-9241-e860-7a0e-2fb52c2337ce@gmail.com>
References: <20170418201702.57019-1-code@mmayer.net> <20170418201702.57019-2-code@mmayer.net>
 <CAGt4E5susQWWNZPbNh8AoWtK-4yu50VL=GqOw+_2w_FA+2V68Q@mail.gmail.com>
 <CAGt4E5uu1Ty0ReaiBZ0kcR_-jnqJQL8vgU4Y9mL64FP7f+=T7Q@mail.gmail.com>
 <20170427215737.dmnj4u2e4tfc6vfv@rob-hp-laptop> <90f011d6-9241-e860-7a0e-2fb52c2337ce@gmail.com>
From: Markus Mayer <markus.mayer@broadcom.com>
Date: Wed, 3 May 2017 15:29:10 -0700
Message-ID: <CAGt4E5s0uoLjeEhk_srxbr=f_sf-NSVXbW_HEJfjnSiAQU8o=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt/bindings: Add bindings for Broadcom STB DRAM Sensors
To: Rob Herring <robh+dt@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        Device Tree List <devicetree@vger.kernel.org>,
        ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Rob,

On 27 April 2017 at 15:00, Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 04/27/2017 02:57 PM, Rob Herring wrote:
>>>>> +Optional properties:
>>>>> +  - cell-index: the index of the DPFE instance; will default to 0 if not set
>>
>> Don't use cell-index. It's not a valid property for FDT (only real
>> OpenFirmware).
>
> My bad, I was advising Markus to use this property since it was largely
> used throughout Documentation/devicetree/bindings/. What would be a more
> appropriate way to have the same information? Aliases?

Hopefully this will be the last time we need to pester you about this.
What should we be using instead of cell-index to identify multiple
instances of a device?

To give you an idea of what the code looks like right now:

ret = of_property_read_u32(dev->of_node, "cell-index", &index);
if (ret)
    index = 0;
[...]
dev_set_name(dpfe_dev, "dpfe%u", index);
ret = device_register(dpfe_dev);

Enumerating the devices like this is what we are after.

Thanks,
-Markus
