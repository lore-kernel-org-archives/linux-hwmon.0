Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56462 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750927AbcK1DZI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Nov 2016 22:25:08 -0500
Subject: Re: [PATCH 3/3] hwmon: tmp108: Update driver to use hwmon_chip_info.
To: John Muir <john@jmuir.com>
References: <1480223737-82080-2-git-send-email-john@jmuir.com>
 <1480223737-82080-4-git-send-email-john@jmuir.com>
 <20161127230035.GA19132@roeck-us.net>
 <B6A7DE8C-950A-4BC6-8186-308E3152FD9D@jmuir.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <2336d181-e9b7-664f-a38f-79bff623413f@roeck-us.net>
Date: Sun, 27 Nov 2016 19:25:05 -0800
MIME-Version: 1.0
In-Reply-To: <B6A7DE8C-950A-4BC6-8186-308E3152FD9D@jmuir.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/27/2016 06:10 PM, John Muir wrote:
>> On 2016.11.27, at 15:00 , Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Sat, Nov 26, 2016 at 09:15:37PM -0800, John Muir wrote:
>>> Move the tmp108 driver from hwmon attribute groups to
>>> hwmon_chip_info.
>>>
>>> Signed-off-by: John Muir <john@jmuir.com>
>>> ---
>>
>> Hi John,
>>
>> please have a look at the following patch.
>>
>> Something else: Symbolic permissions are out of favor nowadays.
>> You might instead just use 0644 / 0444. Not that I really care,
>> but it prevents the inevitable follow-up patches.
>>
>
> Hi Guenter,
>
> Thank you for this patch. I will attempt to implement the same changes using the older interfaces in my 4.4 implementation. I will incorporate your changes and other comments as soon as I can (early this week) and re-send my patch series.
>
Hi John,

My pleasure.

I also wrote a module test for the driver (with my patch applied):

https://github.com/groeck/module-tests/blob/master/scripts/tmp108.sh

Just in case you want to give it a try.

Guenter

