Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:54109 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752035AbcKROR5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Nov 2016 09:17:57 -0500
Subject: Re: [PATCH v2 1/3] hwmon: ltc2990: refactor value conversion
To: Tom Levens <tom.levens@cern.ch>
References: <1479384616-12479-1-git-send-email-tom.levens@cern.ch>
 <86c28b4f-c78b-8d3e-5c48-fa42ca614ba4@roeck-us.net>
 <alpine.LRH.2.20.1611171613250.12237@pcbe13573-vm.dyndns.cern.ch>
 <1eff12d5-e0f9-aaa0-010d-1ddcccdd6ec9@roeck-us.net>
 <alpine.LRH.2.20.1611171955330.14972@pcbe13573-vm.dyndns.cern.ch>
 <b0c20fac-9f4c-dff2-abef-cd79b1f1ae0a@roeck-us.net>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <1f8995f1-6126-87b7-bcda-bee2cabbbf81@roeck-us.net>
Date: Fri, 18 Nov 2016 06:17:53 -0800
MIME-Version: 1.0
In-Reply-To: <b0c20fac-9f4c-dff2-abef-cd79b1f1ae0a@roeck-us.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/18/2016 06:09 AM, Guenter Roeck wrote:

>>
>> The register map wraps at 0x0F, so I only sent you the first 16 bytes. But the fully expanded form is:
>>
>>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>> 00: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
>> 10: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
>> 20: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
>> 30: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
>> 40: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
>> 50: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
>> 60: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
>> 70: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
>> 80: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
>> 90: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
>> a0: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
>> b0: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
>> c0: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
>> d0: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
>> e0: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
>> f0: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
>
> Sorry, I wasn't clear. The chip uses 16-bit registers, so the
> "w" in the command would be important to report the entire
> register content, not just the first 8 bit of each register.
>
Too early, sorry. the above is fine.

Guenter

