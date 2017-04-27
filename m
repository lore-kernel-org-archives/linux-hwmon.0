Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36191 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754292AbdD0WBA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Apr 2017 18:01:00 -0400
Subject: Re: [PATCH 1/2] dt/bindings: Add bindings for Broadcom STB DRAM
 Sensors
To: Rob Herring <robh@kernel.org>,
        Markus Mayer <markus.mayer@broadcom.com>
References: <20170418201702.57019-1-code@mmayer.net>
 <20170418201702.57019-2-code@mmayer.net>
 <CAGt4E5susQWWNZPbNh8AoWtK-4yu50VL=GqOw+_2w_FA+2V68Q@mail.gmail.com>
 <CAGt4E5uu1Ty0ReaiBZ0kcR_-jnqJQL8vgU4Y9mL64FP7f+=T7Q@mail.gmail.com>
 <20170427215737.dmnj4u2e4tfc6vfv@rob-hp-laptop>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        Device Tree List <devicetree@vger.kernel.org>,
        ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <90f011d6-9241-e860-7a0e-2fb52c2337ce@gmail.com>
Date: Thu, 27 Apr 2017 15:00:56 -0700
MIME-Version: 1.0
In-Reply-To: <20170427215737.dmnj4u2e4tfc6vfv@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 04/27/2017 02:57 PM, Rob Herring wrote:
>>>> +  - reg: must reference the start address and length of the DCPU register
>>>> +    space
>>>> +
>>>> +Optional properties:
>>>> +  - cell-index: the index of the DPFE instance; will default to 0 if not set
> 
> Don't use cell-index. It's not a valid property for FDT (only real 
> OpenFirmware).

My bad, I was advising Markus to use this property since it was largely
used throughout Documentation/devicetree/bindings/. What would be a more
appropriate way to have the same information? Aliases?
-- 
Florian
