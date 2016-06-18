Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:37594 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751405AbcFRPQz (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sat, 18 Jun 2016 11:16:55 -0400
Subject: Re: [PATCH v5 1/1] hwmon: Add support for INA3221 Triple
 Current/Voltage Monitors
To: "Andrew F. Davis" <afd@ti.com>
References: <20160610153233.6169-1-afd@ti.com>
 <20160610153233.6169-2-afd@ti.com> <20160610164435.GA9125@roeck-us.net>
 <5764860E.1040305@ti.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <576565DB.5040007@roeck-us.net>
Date: Sat, 18 Jun 2016 08:16:43 -0700
MIME-Version: 1.0
In-Reply-To: <5764860E.1040305@ti.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Andrew,

On 06/17/2016 04:21 PM, Andrew F. Davis wrote:
> On 06/10/2016 11:44 AM, Guenter Roeck wrote:
>> On Fri, Jun 10, 2016 at 10:32:33AM -0500, Andrew F. Davis wrote:
>>> Add support for the the INA3221 26v capable, Triple channel,
>>> Bi-Directional, Zero-Drift, Low-/High-Side, Current/Voltage Monitor
>>> with I2C interface.
>>>
>>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>>
>> Applied to -next.
>>
>> Can you by any chance send me a register dump ? I would like to write
>> module test code for the chip.
>>
>
> No problem:
>
> # i2cdump -y 2 0x48
> No size specified (using byte-data access)
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
> 00: 18 16 80 00 08 7f 80 7f 80 00 00 00 00 00 00 00    ???.?????.......
> 10: e0 00 00 f0 00 00 03 00 00 7f 00 00 00 00 00 00    ?..?..?..?......
> 20: 7f 0a 01 00 00 XX 00 00 00 00 0e 00 00 00 40 00    ???..X....?...@.
> 30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> 40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> 50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> 60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> 70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> 80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> 90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 55 00    ..............U.

The chip registers are 16 bit. Can you repeat the command using the "w" option ?

Thanks,
Guenter

