Return-Path: <SRS0=Jj3a=5P=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E30CC43331
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Mar 2020 19:10:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3AE72072E
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Mar 2020 19:10:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgC3TKQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 30 Mar 2020 15:10:16 -0400
Received: from sed198n136.SEDSystems.ca ([198.169.180.136]:23173 "EHLO
        sed198n136.sedsystems.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbgC3TKQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 Mar 2020 15:10:16 -0400
Received: from barney.sedsystems.ca (barney [198.169.180.121])
        by sed198n136.sedsystems.ca  with ESMTP id 02UJ9v1v015727
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 30 Mar 2020 13:09:57 -0600 (CST)
Received: from [192.168.233.77] (ovpn77.sedsystems.ca [192.168.233.77])
        by barney.sedsystems.ca (8.14.7/8.14.4) with ESMTP id 02UJ9u3x047386
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
        Mon, 30 Mar 2020 13:09:57 -0600
Subject: Re: Linux driver for IRPS5401 - status reg not found
To:     Guenter Roeck <linux@roeck-us.net>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-hwmon@vger.kernel.org
References: <e303166b-4d7a-d2b9-a5c0-fd4de8d22a49@xilinx.com>
 <44d8631a-618c-a061-d9ca-d8030dd8a420@roeck-us.net>
 <52d41b38-8af9-1496-65dc-c36179a9d286@sedsystems.ca>
 <299872b6-0fcf-3ef1-5b52-41fceb2dcdc0@roeck-us.net>
From:   Robert Hancock <hancock@sedsystems.ca>
Message-ID: <3b1750d0-bb1c-0a37-e1a0-d7c25b4bc525@sedsystems.ca>
Date:   Mon, 30 Mar 2020 13:09:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <299872b6-0fcf-3ef1-5b52-41fceb2dcdc0@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.64 on 198.169.180.136
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2020-03-30 12:48 p.m., Guenter Roeck wrote:
> On 3/30/20 8:42 AM, Robert Hancock wrote:
>> On 2020-03-30 9:24 a.m., Guenter Roeck wrote:
>>> On 3/30/20 4:33 AM, Michal Simek wrote:
>>>> Hi Robert and Guenter,
>>>>
>>>> Xilinx boards are using IRPS5401 chips and I have tried to use your driver.
>>>> I have checked that u-boot can detect that devices and read it.
>>>>
>>>> ZynqMP> i2c probe
>>>> Valid chip addresses: 0C 13 14 20 43 44 74
>>>> ZynqMP> i2c md 13 0 10
>>>> 0000: 00 08 00 08 00 08 00 08 00 08 00 08 00 08 00 08    ................
>>>> ZynqMP> i2c md 14 0 10
>>>> 0000: 00 08 00 08 00 08 00 08 00 08 00 08 00 08 00 08    ................
>>>> ZynqMP> i2c md 43 0 10
>>>> 0000: 00 98 ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
>>>> ZynqMP> i2c md 44 0 10
>>>> 0000: 00 8a ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
>>>> ZynqMP>
>>>>
>>>> Here is DT fragment which I use (it is under i2c mux)
>>>>
>>>> 185                         irps5401_43: irps5401@43 {
>>>> 186                                 compatible = "infineon,irps5401";
>>>> 187                                 reg = <0x43>; /* pmbus / i2c 0x13 */
>>>
>>> Does that mean the mux is at 0x13 ?
>>
>> These chips have two I2C addresses with two separate interfaces: the standard PMBus-compatible interface at an address between 0x40-0x4f, which the irps5401 driver supports, and another proprietary interface at an address between 0x10-0x1f. The specific addresses in those ranges is configured by the value of a resistor on one of the pins.
>>
> 
> Ah, sorry, I didn't get that part earlier. Unfortunately, the datasheet
> doesn't seem to include a description of the proprietary interface
> registers/commands, or maybe I am missing it.
> 
> The chip datasheet does talk a lot about various MTP registers.
> Part of that register set is Write_protect_section and
> Read_protect_section. Maybe the PMBus registers are all read
> protected ?

There is a programming guide and register map on the Infineon site under 
"Additional Technical Information" here:

https://www.infineon.com/cms/en/product/power/dc-dc-converters/integrated-pol-voltage-regulators/irps5401m/

-- 
Robert Hancock
Senior Hardware Designer
SED Systems, a division of Calian Ltd.
Email: hancock@sedsystems.ca
