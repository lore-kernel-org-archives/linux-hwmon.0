Return-Path: <SRS0=Jj3a=5P=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420E6C43331
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Mar 2020 16:02:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A0A22072E
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Mar 2020 16:02:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729573AbgC3QCA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 30 Mar 2020 12:02:00 -0400
Received: from sed198n136.SEDSystems.ca ([198.169.180.136]:35348 "EHLO
        sed198n136.sedsystems.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729319AbgC3QCA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 Mar 2020 12:02:00 -0400
X-Greylist: delayed 1122 seconds by postgrey-1.27 at vger.kernel.org; Mon, 30 Mar 2020 12:02:00 EDT
Received: from barney.sedsystems.ca (barney [198.169.180.121])
        by sed198n136.sedsystems.ca  with ESMTP id 02UFgx0b008192
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 30 Mar 2020 09:42:59 -0600 (CST)
Received: from [192.168.233.77] (ovpn77.sedsystems.ca [192.168.233.77])
        by barney.sedsystems.ca (8.14.7/8.14.4) with ESMTP id 02UFgwQT041410
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
        Mon, 30 Mar 2020 09:42:58 -0600
Subject: Re: Linux driver for IRPS5401 - status reg not found
To:     Guenter Roeck <linux@roeck-us.net>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-hwmon@vger.kernel.org
References: <e303166b-4d7a-d2b9-a5c0-fd4de8d22a49@xilinx.com>
 <44d8631a-618c-a061-d9ca-d8030dd8a420@roeck-us.net>
From:   Robert Hancock <hancock@sedsystems.ca>
Message-ID: <52d41b38-8af9-1496-65dc-c36179a9d286@sedsystems.ca>
Date:   Mon, 30 Mar 2020 09:42:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <44d8631a-618c-a061-d9ca-d8030dd8a420@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.64 on 198.169.180.136
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2020-03-30 9:24 a.m., Guenter Roeck wrote:
> On 3/30/20 4:33 AM, Michal Simek wrote:
>> Hi Robert and Guenter,
>>
>> Xilinx boards are using IRPS5401 chips and I have tried to use your driver.
>> I have checked that u-boot can detect that devices and read it.
>>
>> ZynqMP> i2c probe
>> Valid chip addresses: 0C 13 14 20 43 44 74
>> ZynqMP> i2c md 13 0 10
>> 0000: 00 08 00 08 00 08 00 08 00 08 00 08 00 08 00 08    ................
>> ZynqMP> i2c md 14 0 10
>> 0000: 00 08 00 08 00 08 00 08 00 08 00 08 00 08 00 08    ................
>> ZynqMP> i2c md 43 0 10
>> 0000: 00 98 ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
>> ZynqMP> i2c md 44 0 10
>> 0000: 00 8a ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
>> ZynqMP>
>>
>> Here is DT fragment which I use (it is under i2c mux)
>>
>> 185                         irps5401_43: irps5401@43 {
>> 186                                 compatible = "infineon,irps5401";
>> 187                                 reg = <0x43>; /* pmbus / i2c 0x13 */
> 
> Does that mean the mux is at 0x13 ?

These chips have two I2C addresses with two separate interfaces: the 
standard PMBus-compatible interface at an address between 0x40-0x4f, 
which the irps5401 driver supports, and another proprietary interface at 
an address between 0x10-0x1f. The specific addresses in those ranges is 
configured by the value of a resistor on one of the pins.

> 
>> 188                         };
>> 189                         irps5401_4d: irps5401@44 {
>> 190                                 compatible = "infineon,irps5401";
>> 191                                 reg = <0x44>; /* pmbus / i2c 0x14 */
> 
> Why _4d ?
> 
>> 192                         };
>>
>> I see that driver is used but with error.
>>
>> [   37.553740] irps5401 3-0043: PMBus status register not found
>> [   37.559815] irps5401 3-0044: PMBus status register not found
>>
>>
>> That's why I want to check with you what could be the problem.
>>
> 
> PMBus status registers are at 0x78 (byte) and 0x79 (word). The above
> error is reported if reading both returns an error or 0xff / 0xffff,
> which indicates that the chip is not accessible.
> 
> I can say for sure that whatever is at 0x43/0x44, it is very likely
> not an irps5401. If it was, at least registers 0x2 and 0x6 should report
> different values, and 0x01 doesn't look much better (the lower 2 bits
> should never be set).
> 
>> Also I would like to know if there is a way to disable it via any API.
> 
> Not sure what you want to disable. The message ? The PMBus core needs
> to have access to the chip to initialize. If there is no status register,
> there is nothing it can do but to refuse to instantiate.
> 
> It might make sense to use i2cdetect / i2cget in Linux to determine
> if the chips are accessible. I'd try reading the status registers (0x78
> to 0x7e), value registers (0x88 to 0x8d, 0x96, 0x97), manufacturer
> id (0x99) and model (0x9a), and i2c device ID (0xad) and revision (0xae).

This would be my first suggestion as well.

> 
>> One of this regulator is connected to another device which doesn't have
>> access to it. It means before powering up this device there is a need to
>> enable this power regulator. The best via any dedicated API.

I don't think the PMBus interface on these chips exposes any interface 
to command the regulator. However, one could do this over the Infineon 
programming/control interface on the 0x10-0x1f addresses. This protocol 
is documented publicly now (see the programming guide and register map 
document on the Infineon web site).

>>
> 
> We can add regulator support to the PMBus core or to the irps5401 driver
> if necessary (patches welcome), assuming the regulator in question is
> handled by Linux.
> 
> Hope this helps,
> Guenter
> 

-- 
Robert Hancock
Senior Hardware Designer
SED Systems, a division of Calian Ltd.
Email: hancock@sedsystems.ca
