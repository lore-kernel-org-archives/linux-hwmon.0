Return-Path: <SRS0=sjJb=5Z=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03526C2BB55
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Apr 2020 14:42:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E65220A8B
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Apr 2020 14:42:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=seznam.cz header.i=@seznam.cz header.b="F5YLkeY1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgDIOmK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 9 Apr 2020 10:42:10 -0400
Received: from mxs1.seznam.cz ([77.75.78.125]:10724 "EHLO mxs1.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726977AbgDIOmK (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 9 Apr 2020 10:42:10 -0400
X-Greylist: delayed 671 seconds by postgrey-1.27 at vger.kernel.org; Thu, 09 Apr 2020 10:42:08 EDT
Received: from email.seznam.cz
        by email-smtpc14a.ko.seznam.cz (email-smtpc14a.ko.seznam.cz [10.53.11.165])
        id 5652f474e3099566565b11a7;
        Thu, 09 Apr 2020 16:41:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1586443303; bh=7nHRr7R6btvLfqvv5uDKSITEp8q7v/u5E5Qgr7uOKTk=;
        h=Received:Reply-To:Subject:To:Cc:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=F5YLkeY1aNUu34NoI1nhssLvCjkgnyy13+g9tF2dzzhp9QjJ0z24xTfszPRbjAM1b
         3Utfcd9zza1bk19jzhO8RSY8nZVx5NMKeeaRxckPhTFcbR8sdNtng+LoQdw1sXEimd
         xXPUDDc03f3yeYIaipjxEVjT5CNE7vk8HaHBPc4U=
Received: from [77.75.78.48] (unknown-62-131.xilinx.com [149.199.62.131])
        by email-relay11.ko.seznam.cz (Seznam SMTPD 1.3.108) with ESMTP;
        Thu, 09 Apr 2020 16:30:03 +0200 (CEST)  
Reply-To: monstr@monstr.eu
Subject: Re: Linux driver for IRPS5401 - status reg not found
To:     Michal Simek <michal.simek@xilinx.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Robert Hancock <hancock@sedsystems.ca>
Cc:     linux-hwmon@vger.kernel.org
References: <e303166b-4d7a-d2b9-a5c0-fd4de8d22a49@xilinx.com>
 <44d8631a-618c-a061-d9ca-d8030dd8a420@roeck-us.net>
 <52d41b38-8af9-1496-65dc-c36179a9d286@sedsystems.ca>
 <299872b6-0fcf-3ef1-5b52-41fceb2dcdc0@roeck-us.net>
 <3b1750d0-bb1c-0a37-e1a0-d7c25b4bc525@sedsystems.ca>
 <20200330194859.GA12459@roeck-us.net>
 <b4322641-5918-40c4-a887-dcfa20db1733@xilinx.com>
From:   Michal Simek <monstr@seznam.cz>
Message-ID: <7a10a855-53a2-0743-be7d-86f6030626ca@seznam.cz>
Date:   Thu, 9 Apr 2020 16:29:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <b4322641-5918-40c4-a887-dcfa20db1733@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 31. 03. 20 14:38, Michal Simek wrote:
> On 30. 03. 20 21:48, Guenter Roeck wrote:
>> On Mon, Mar 30, 2020 at 01:09:56PM -0600, Robert Hancock wrote:
>>> On 2020-03-30 12:48 p.m., Guenter Roeck wrote:
>>>> On 3/30/20 8:42 AM, Robert Hancock wrote:
>>>>> On 2020-03-30 9:24 a.m., Guenter Roeck wrote:
>>>>>> On 3/30/20 4:33 AM, Michal Simek wrote:
>>>>>>> Hi Robert and Guenter,
>>>>>>>
>>>>>>> Xilinx boards are using IRPS5401 chips and I have tried to use your driver.
>>>>>>> I have checked that u-boot can detect that devices and read it.
>>>>>>>
>>>>>>> ZynqMP> i2c probe
>>>>>>> Valid chip addresses: 0C 13 14 20 43 44 74
>>>>>>> ZynqMP> i2c md 13 0 10
>>>>>>> 0000: 00 08 00 08 00 08 00 08 00 08 00 08 00 08 00 08    ................
>>>>>>> ZynqMP> i2c md 14 0 10
>>>>>>> 0000: 00 08 00 08 00 08 00 08 00 08 00 08 00 08 00 08    ................
>>>>>>> ZynqMP> i2c md 43 0 10
>>>>>>> 0000: 00 98 ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
>>>>>>> ZynqMP> i2c md 44 0 10
>>>>>>> 0000: 00 8a ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
>>>>>>> ZynqMP>
>>>>>>>
>>>>>>> Here is DT fragment which I use (it is under i2c mux)
>>>>>>>
>>>>>>> 185                         irps5401_43: irps5401@43 {
>>>>>>> 186                                 compatible = "infineon,irps5401";
>>>>>>> 187                                 reg = <0x43>; /* pmbus / i2c 0x13 */
>>>>>>
>>>>>> Does that mean the mux is at 0x13 ?
>>>>>
>>>>> These chips have two I2C addresses with two separate interfaces: the standard PMBus-compatible interface at an address between 0x40-0x4f, which the irps5401 driver supports, and another proprietary interface at an address between 0x10-0x1f. The specific addresses in those ranges is configured by the value of a resistor on one of the pins.
>>>>>
>>>>
>>>> Ah, sorry, I didn't get that part earlier. Unfortunately, the datasheet
>>>> doesn't seem to include a description of the proprietary interface
>>>> registers/commands, or maybe I am missing it.
>>>>
>>>> The chip datasheet does talk a lot about various MTP registers.
>>>> Part of that register set is Write_protect_section and
>>>> Read_protect_section. Maybe the PMBus registers are all read
>>>> protected ?
>>>
>>> There is a programming guide and register map on the Infineon site under
>>> "Additional Technical Information" here:
>>>
>>> https://www.infineon.com/cms/en/product/power/dc-dc-converters/integrated-pol-voltage-regulators/irps5401m/
>>>
>> Based on that my best guess would be that either the chips are not at the
>> expected addresses, or that the registers are indeed read protected.
> 
> I am able to detect that devices.
> 
> root@zcu104-debian:/etc/apt# i2cdetect -y -r 3
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:          -- -- -- -- -- -- -- -- -- -- -- -- --
> 10: -- -- -- 13 14 -- -- -- -- -- -- -- -- -- -- --
> 20: UU -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- 43 44 -- -- -- -- -- -- -- -- -- -- --
> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- UU -- -- --
> 
> Also disable/enable rail on 0x44 and see power good led on/off
> 
> root@zcu104-debian:~# i2cset -y 3 0x44 0 3
> root@zcu104-debian:~# i2cset -y 3 0x44 1 0x80 b
> root@zcu104-debian:~# i2cget -y 3 0x44 0x78 b
> 
> I can't read the rest of regs but checking with hw guys what they have
> done with these devices.


Just to let you know issue is with i2c driver. Here is my output for the
record.

irps5401-i2c-3-43
Adapter: i2c-0-mux (chan_id 2)
vin1:         11.56 V  (min =  +9.00 V, crit max = +14.00 V)
vin2:         11.56 V  (min =  +9.00 V, crit max = +14.00 V)
vin3:         11.56 V  (min =  +9.00 V, crit max = +14.00 V)
vin4:             N/A
vin5:          2.52 V  (min =  +0.40 V, crit max =  +4.00 V)  ALARM (CRIT)
vout1:       851.00 mV (crit min =  +0.65 V, min =  +0.68 V)
                       (max =  +1.02 V, crit max =  +1.25 V)
vout2:         1.80 V  (crit min =  +1.55 V, min =  +1.56 V)
                       (max =  +2.16 V, crit max =  +2.20 V)
vout3:         1.20 V  (crit min =  +0.90 V, min =  +0.96 V)
                       (max =  +1.43 V, crit max =  +1.59 V)
vout4:            N/A
vout5:       906.00 mV (crit min =  +0.68 V, min =  +0.79 V)
                       (max =  +1.02 V, crit max =  +1.13 V)
temp1:        +43.0°C  (high = +100.0°C, crit = +120.0°C)
temp2:        +43.0°C  (high = +100.0°C, crit = +120.0°C)
temp3:        +43.0°C  (high = +100.0°C, crit = +120.0°C)
temp4:            N/A
temp5:        +44.0°C  (high = +100.0°C, crit = +120.0°C)
pin1:          1.75 W
pin2:        406.25 mW
pin3:        468.75 mW
pin4:             N/A
pin5:         15.62 mW
pout1:         1.50 W
pout2:       406.25 mW
pout3:       468.75 mW
pout4:            N/A
pout5:        15.62 mW
iin1:        125.00 mA
iin2:         31.00 mA
iin3:         39.00 mA
iin4:             N/A
iout1:         2.00 A  (max = +21.00 A, crit max = +25.00 A)
iout2:       234.00 mA (max =  +2.50 A, crit max =  +3.12 A)
iout3:       390.00 mA (max =  +8.50 A, crit max = +10.25 A)
iout4:            N/A
iout5:         8.00 mA (max =  +0.65 A, crit max =  +0.72 A)

irps5401-i2c-3-44
Adapter: i2c-0-mux (chan_id 2)
vin1:         11.53 V  (min =  +9.00 V, crit max = +14.00 V)
vin2:         11.56 V  (min =  +9.00 V, crit max = +14.00 V)
vin3:         11.41 V  (min =  +9.00 V, crit max = +14.00 V)
vin4:         11.56 V  (min =  +9.00 V, crit max = +14.00 V)
vin5:          2.51 V  (min =  +0.40 V, crit max =  +4.00 V)  ALARM (CRIT)
vout1:         3.30 V  (crit min =  +2.90 V, min =  +2.91 V)
                       (max =  +3.69 V, crit max =  +3.70 V)
vout2:         1.13 V  (crit min =  +0.73 V, min =  +0.90 V)
                       (max =  +1.35 V, crit max =  +1.52 V)
vout3:         5.00 V  (crit min =  +4.60 V, min =  +4.70 V)
                       (max =  +5.20 V, crit max =  +5.40 V)
vout4:       152.00 mV (crit min =  +1.40 V, min =  +1.44 V)
                       (max =  +2.16 V, crit max =  +2.20 V)
vout5:       851.00 mV (crit min =  +0.64 V, min =  +0.75 V)
                       (max =  +0.97 V, crit max =  +1.07 V)
temp1:        +40.0°C  (high = +100.0°C, crit = +120.0°C)
temp2:        +40.0°C  (high = +100.0°C, crit = +120.0°C)
temp3:        +40.0°C  (high = +100.0°C, crit = +120.0°C)
temp4:        +40.0°C  (high = +100.0°C, crit = +120.0°C)
temp5:        +40.0°C  (high = +100.0°C, crit = +120.0°C)
pin1:          2.50 W
pin2:         31.25 mW
pin3:          0.00 W
pin4:          0.00 W
pin5:        187.50 mW
pout1:         2.25 W
pout2:        31.25 mW
pout3:         0.00 W
pout4:        31.25 mW
pout5:        62.50 mW
iin1:        187.00 mA
iin2:          0.00 A
iin3:          0.00 A
iin4:          0.00 A
iout1:       750.00 mA (max = +12.00 A, crit max = +14.00 A)
iout2:        46.00 mA (max =  +1.81 A, crit max =  +2.19 A)
iout3:         0.00 A  (max =  +3.50 A, crit max =  +4.00 A)
iout4:         9.28 A  (max =  +3.81 A, crit max =  +4.81 A)
iout5:        73.00 mA (max =  +0.65 A, crit max =  +0.72 A)



Thanks,
Michal
