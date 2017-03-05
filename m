Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:55628 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750770AbdCEQcI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Mar 2017 11:32:08 -0500
Subject: Re: [PATCH 2/2] hwmon: Aspeed AST2400/AST2500 ADC
To: Rick Altherr <raltherr@google.com>
References: <20170228201404.32125-1-raltherr@google.com>
 <20170228201404.32125-2-raltherr@google.com>
 <CACPK8XfOZiNdrQJaDZcSZkJ4gSZZpGy-r9RQAeykeyUS0yzXMA@mail.gmail.com>
 <a512cd6c-972b-0a3b-0c2c-5eb18545798a@roeck-us.net>
 <CAPLgG==wCZn6Zx5eYdVRsRb6qBEU1g5176jn852EjKcZ9OUPtQ@mail.gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <9a2c5522-9ff0-2ee2-af5b-0022b1fdff3a@roeck-us.net>
Date: Sun, 5 Mar 2017 08:28:19 -0800
MIME-Version: 1.0
In-Reply-To: <CAPLgG==wCZn6Zx5eYdVRsRb6qBEU1g5176jn852EjKcZ9OUPtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 03/01/2017 07:29 PM, Rick Altherr wrote:
> Resending in plain text.
>
> On Tue, Feb 28, 2017 at 7:45 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 02/28/2017 04:49 PM, Joel Stanley wrote:
>>>
>>> On Wed, Mar 1, 2017 at 6:44 AM, Rick Altherr <raltherr@google.com> wrote:
>>>>
>>>> Aspeed AST2400/AST2500 BMC SoCs include a 16 channel, 10-bit ADC. This
>>>> driver implements reading the ADC values, enabling channels via device
>>>> tree, and optionally providing channel labels via device tree.  Low and
>>>> high threshold interrupts are supported by the hardware but not
>>>> implemented.
>>>>
>>>> Signed-off-by: Rick Altherr <raltherr@google.com>
>>>
>>>
>>> Looks good. Some minor comments below.
>>>
>>> Is there a reason you wrote a hwmon driver instead of an iio driver? I
>>> wasn't sure what the recommended subsystem is.
>>
>>
>> Excellent point. Question is really if there is a plan to add support for
>> thresholds. If not, an iio driver might be more appropriate.
>>
>> Guenter
>>
>
> The hardware supports firing interrupts on high and low thresholds.
> I'm not planning to use that feature yet so I didn't implement it.
> Would you prefer that I leave it as is (maybe with a TODO), implement
> the thresholding, or change to iio?
>

Let's try to determine the intended use of the ADC. I don't find the datasheet
online; all I can find is brief summaries which don't me tell much, but suggest
that it is a general purpose ADC and not specifically intended for hardware
monitoring. What is the minimum sampling rate ? That should give us an idea.
If it is in the uS range, iio would be more appropriate (and the iio-hwmon
bridge could be used if a channel is in fact used for hardware monitoring).

Thanks,
Guenter

