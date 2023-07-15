Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494F8C001B0
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jul 2023 17:03:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjGORDL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jul 2023 13:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjGORDK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jul 2023 13:03:10 -0400
Received: from doubleyoutf.uk (doubleyoutf.uk [IPv6:2a00:da00:1800:3a8::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED830B5
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 10:03:09 -0700 (PDT)
Received: from [2a00:23c5:dcb3:8b33::b56]
        by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1qKifk-002vIe-FN; Sat, 15 Jul 2023 17:03:08 +0000
Message-ID: <9271e276-7727-25ee-5c46-c25f479b73d7@khalifa.ws>
Date:   Sat, 15 Jul 2023 18:03:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] hwmon: (nct6775) Add support for 18 IN readings for
 nct6799
Content-Language: en-GB
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <20230715153113.1307220-1-ahmad@khalifa.ws>
 <9c4d7f9d-d417-077d-a709-d372214bf35c@roeck-us.net>
From:   Ahmad Khalifa <ahmad@khalifa.ws>
In-Reply-To: <9c4d7f9d-d417-077d-a709-d372214bf35c@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 15/07/2023 17:48, Guenter Roeck wrote:
> On 7/15/23 08:31, Ahmad Khalifa wrote:
>> nct6799 supports 18 voltage readings where this driver stops at 16.
> You are adding three sets of registers, though, not just two. I think
> you meant to say that the driver stops at 15.

Yes, currently 15 IN defined. It was influenced by the ALARM bits
comment. I'll change it.

>> +/* NCT6799 layout of alarm bits is indexed by the REG_VIN
>> + * order, which is
>> + *      CPUVC,  VIN1,  AVSB,  3VCC,  VIN0,  VIN8,  VIN4, 3VSB
>> + *       VBAT,   VTT,  VIN5,  VIN6,  VIN2,  VIN3,  VIN7, VIN9
>> + * no space for 16-17: VHIF, VIN10 (bits 31, -1)
> 
> Why not use bit 31 ?

Well, this is the part that made me say "driver supports up to 16".
The ALARM bits have FAN_BASE starting at index 16, so the IN alarms
can only take up 0-15, unless all alarm bits have extra padding
added to push FAN_BASE/TEMP_BASE/INTRUSION_BASE up.

I took the easy option here and left out the 16 IN alarm.

Did I count this wrong?
nct6775_fan_is_visible()
	`data->ALARM_BITS[FAN_ALARM_BASE + fan]`


-- 
Regards,
Ahmad Khalifa
