Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38614 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751418AbcKMVIL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 13 Nov 2016 16:08:11 -0500
Subject: Re: Changing PWM on Winbond W83627DHG-P
To: Rudolf Marek <r.marek@assembler.cz>,
        Patrik Dufresne <info@patrikdufresne.com>
References: <CAJ=kj5zud0RiV1nORXoX0Rop4TvsuAxd4vRZtRL-1ANMegkWTw@mail.gmail.com>
 <49f137d4-b50d-0642-6532-3097137d4c7d@assembler.cz>
Cc: linux-hwmon@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <4d5e1bdb-0140-c8dd-7b95-fae6b3b7327d@roeck-us.net>
Date: Sun, 13 Nov 2016 13:08:08 -0800
MIME-Version: 1.0
In-Reply-To: <49f137d4-b50d-0642-6532-3097137d4c7d@assembler.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/13/2016 08:27 AM, Rudolf Marek wrote:
> Hi Patrik
>
> Please read this:
>
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/hwmon/w83627ehf?id=refs/tags/v4.9-rc4
>
> IIRC you need to set it to manual mode first via echo 1 > .../pwmX_enable
> and perhaps then it will accept your PWM values.
>

Correct.

In general, though, I would suggest to stick with automatic fan control.

Guenter

> I'm giving proper mailing list on CC, maybe someone will help.
>
> Thanks
> Rudolf
>
>
> Dne 13.11.2016 v 17:18 Patrik Dufresne napsal(a):
>> Hello,
>>
>> Sorry to contact you directly, but I didn't find the proper mailing list to post
>> my question related to w83627ehf driver.
>>
>> I own a Supermicro X8DTL-iF with a Winbond W83627DHG-P chipset. The chipset was
>> properly discovered and enabled by lm-sensors. In sysfs, I can see the path
>> /sys/devices/platform/w83627ehf.2576.
>>
>> I've tried changing the value of pwm* according
>> to https://www.kernel.org/doc/Documentation/hwmon/w83627ehf. But it doesn't have
>> any effect on the actual fan speed.
>>
>> Any suggestions ?
>>
>> --
>> Patrik Dufresne Service Logiciel inc.
>> http://www.patrikdufresne.com <http://patrikdufresne.com/>/
>> 514-971-6442
>> 1-114 rue des Hautbois,
>> St-Colomban, QC J5K 2H6
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

