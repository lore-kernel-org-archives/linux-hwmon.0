Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:43378 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750788AbdFHMhJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Jun 2017 08:37:09 -0400
Subject: Re: [PATCH v3] hwmon: Add support for MAX31785 intelligent fan
 controller
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        joel@jms.id.au, msbarth@linux.vnet.ibm.com,
        tpearson@raptorengineering.com, openbmc@lists.ozlabs.org
References: <20170606070230.32669-1-andrew@aj.id.au>
 <20170607155526.GA18946@roeck-us.net> <1496908393.23335.3.camel@aj.id.au>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <9358484b-ceb2-6fe4-deef-54372a3f12da@roeck-us.net>
Date: Thu, 8 Jun 2017 05:37:06 -0700
MIME-Version: 1.0
In-Reply-To: <1496908393.23335.3.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/08/2017 12:53 AM, Andrew Jeffery wrote:
> On Wed, 2017-06-07 at 08:55 -0700, Guenter Roeck wrote:
>> On Tue, Jun 06, 2017 at 04:32:30PM +0930, Andrew Jeffery wrote:
>>> Add a basic driver for the MAX31785, focusing on the fan control
>>> features but ignoring the temperature and voltage monitoring
>>> features of the device.
>>>
>>> This driver supports all fan control modes and tachometer / PWM
>>> readback where applicable.
>>>
>>>>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
>>>>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>> ---
>>> Hello,
>>>
>>> This is a rework of Timothy Pearson's original patch:
>>>
>>>      https://www.mail-archive.com/linux-hwmon@vger.kernel.org/msg00868.html
>>>
>>> I've labelled it as v3 to differentiate from Timothy's postings.
>>>
>>> The original thread had some discussion about the MAX31785 being a PMBus device
>>> and that it should thus be a PMBus driver. The implementation still makes use
>>
>> After thinking about it, that is what it should be. If I accept it as non-PMBus
>> driver, it will be all but impossible to convert it to a PMBus driver later on,
>> and that just doesn't make any sense.
> 
> Hopefully not being too ignorant here, but can you expand on why it
> would be all but impossible to convert?
> 

I've got a lot of noise recently just for converting a driver from the old to the
new API (which changes the attribute location). Changing the driver from non-PMBus
to PMBus would very quite likely change some attributes as well.

Besides that, I think it is a bad idea to bypass an infrastructure just because
it may require a few tweaks. That generates a bad precedent, and people _would_
use that to argue that the next PMBus chip driver should not use the infrastructure
either.

Guenter

>>
>> With no one interested in writing that driver, I'll try to give it some more
>> priority myself. I do have an evaluation board somewhere, which should help.
>>
>> Note that the second fan reading should be implemented as just that, not with
>> a non-standard attribute.
> 
> Agreed.
> 
> Andrew
> 

