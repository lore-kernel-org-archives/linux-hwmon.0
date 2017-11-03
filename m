Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:45241 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755445AbdKCKLH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Nov 2017 06:11:07 -0400
Subject: Re: [PATCH v2 2/3] hwmon: (aspeed-pwm-tacho) Deassert reset in probe
To: Joel Stanley <joel@jms.id.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Mykola Kostenok <c_mykolak@mellanox.com>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        Patrick Venture <venture@google.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        devicetree <devicetree@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Jeremy Kerr <jk@ozlabs.org>
References: <20171102035349.1902-1-joel@jms.id.au>
 <20171102035349.1902-3-joel@jms.id.au> <20171102145406.GA9240@roeck-us.net>
 <CACPK8Xc3Hsj9TD8L2A6e-iCMZp5=HG9aan5m0YsWV-CZHFPo5A@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <900c6a0b-b7e3-a317-76fd-7694e971944f@roeck-us.net>
Date: Fri, 3 Nov 2017 03:11:03 -0700
MIME-Version: 1.0
In-Reply-To: <CACPK8Xc3Hsj9TD8L2A6e-iCMZp5=HG9aan5m0YsWV-CZHFPo5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/02/2017 07:32 PM, Joel Stanley wrote:
> On Fri, Nov 3, 2017 at 1:54 AM, Guenter Roeck <linux@roeck-us.net> wrote:
>> On Thu, Nov 02, 2017 at 02:53:48PM +1100, Joel Stanley wrote:
>>> The ASPEED SoC must deassert a reset in order to use the PWM/tach
>>> peripheral.
>>>
>> Again, you claim that the current driver would not work at all, which
>> is simply not correct. It doesn't work if the chip wasn't taken out
>> of reset by other means. This doesn't take into account situations and
>> hardware where the chip is taken out of reset automatically at boot, h
>> or by the ROM monitor/BIOS. It assumes that the reset pin can _always_
>> be controlled by software.
> 
> The reset is internal to the SoC. There is no pin to speak of, just a
> wire inside the SoC, so it can always be controlled by software.
> 
> There's SoC does not release any resets automatically; the default
> value on boot is for the reset to be asserted and this is not
> configurable.
> 
>> Similar, it forces the chip into reset when the driver is removed,
>> which is even worse. Unload the driver, and no more fan control ?
>> Really ? Then why is there an autonomous chip for fan control
>> to start with ? This is questionable even if the reset pin is
>> optional.
> 
> Similarly, the PWM/Tach unit is inside the SoC; it's not an external device.
> 
> It would be strange to remove the driver and expect the system to keep
> operating normally.
> 
>> You'll have to make reset handling optional for me to accept it.
>> I am quite sure that I said that before.
> 
> Please reconsider in light of the details above. It does not make any
> sense to build a system without this reset.
> 

So you are saying that this driver never worked ? Hard to believe.
I'll need input from other users.

Guenter
