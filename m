Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:36370 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754078AbdCGXu2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Mar 2017 18:50:28 -0500
Received: by mail-it0-f47.google.com with SMTP id h10so81465067ith.1
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Mar 2017 15:50:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <9a2c5522-9ff0-2ee2-af5b-0022b1fdff3a@roeck-us.net>
References: <20170228201404.32125-1-raltherr@google.com> <20170228201404.32125-2-raltherr@google.com>
 <CACPK8XfOZiNdrQJaDZcSZkJ4gSZZpGy-r9RQAeykeyUS0yzXMA@mail.gmail.com>
 <a512cd6c-972b-0a3b-0c2c-5eb18545798a@roeck-us.net> <CAPLgG==wCZn6Zx5eYdVRsRb6qBEU1g5176jn852EjKcZ9OUPtQ@mail.gmail.com>
 <9a2c5522-9ff0-2ee2-af5b-0022b1fdff3a@roeck-us.net>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 7 Mar 2017 15:24:20 -0800
Message-ID: <CAPLgG==odJOeLB_-bX+EXf6aegdnU=3+xWk-c1SM8ECLr8HYfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: Aspeed AST2400/AST2500 ADC
To: Guenter Roeck <linux@roeck-us.net>
Cc: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, Mar 5, 2017 at 8:28 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 03/01/2017 07:29 PM, Rick Altherr wrote:
>>
>> Resending in plain text.
>>
>> On Tue, Feb 28, 2017 at 7:45 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On 02/28/2017 04:49 PM, Joel Stanley wrote:
>>>>
>>>>
>>>> On Wed, Mar 1, 2017 at 6:44 AM, Rick Altherr <raltherr@google.com>
>>>> wrote:
>>>>>
>>>>>
>>>>> Aspeed AST2400/AST2500 BMC SoCs include a 16 channel, 10-bit ADC. This
>>>>> driver implements reading the ADC values, enabling channels via device
>>>>> tree, and optionally providing channel labels via device tree.  Low and
>>>>> high threshold interrupts are supported by the hardware but not
>>>>> implemented.
>>>>>
>>>>> Signed-off-by: Rick Altherr <raltherr@google.com>
>>>>
>>>>
>>>>
>>>> Looks good. Some minor comments below.
>>>>
>>>> Is there a reason you wrote a hwmon driver instead of an iio driver? I
>>>> wasn't sure what the recommended subsystem is.
>>>
>>>
>>>
>>> Excellent point. Question is really if there is a plan to add support for
>>> thresholds. If not, an iio driver might be more appropriate.
>>>
>>> Guenter
>>>
>>
>> The hardware supports firing interrupts on high and low thresholds.
>> I'm not planning to use that feature yet so I didn't implement it.
>> Would you prefer that I leave it as is (maybe with a TODO), implement
>> the thresholding, or change to iio?
>>
>
> Let's try to determine the intended use of the ADC. I don't find the
> datasheet
> online; all I can find is brief summaries which don't me tell much, but
> suggest
> that it is a general purpose ADC and not specifically intended for hardware
> monitoring. What is the minimum sampling rate ? That should give us an idea.
> If it is in the uS range, iio would be more appropriate (and the iio-hwmon
> bridge could be used if a channel is in fact used for hardware monitoring).
>
> Thanks,
> Guenter
>

AST2500 is a BMC SoC from Aspeed
(https://www.aspeedtech.com/products.php?fPath=20&rId=440).  The BMC
is a separate, always-on computer that manages the health and remote
management for a server.  The driver I sent is for the ADCs included
in the SoC that are intended to monitor power rails on the server
motherboard but are really just general-purpose ADCs.  According to
the (not public) datasheet, the sampling rate is 10-500kHz, resolution
is 10-bit, and precision +/- 2%.  This is my first time writing a
linux driver for ADCs.  My cursory look at iio indicates that that
will work fine for this driver and the hwmon-iio bridge will suffice
for the userspace stack which is currently expecting hwmon APIs.
