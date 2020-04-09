Return-Path: <SRS0=sjJb=5Z=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EC4C2BA2B
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Apr 2020 15:30:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 439FD206E9
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Apr 2020 15:30:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728251AbgDIPa4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 9 Apr 2020 11:30:56 -0400
Received: from sed198n136.SEDSystems.ca ([198.169.180.136]:20807 "EHLO
        sed198n136.sedsystems.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727919AbgDIPa4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Apr 2020 11:30:56 -0400
Received: from barney.sedsystems.ca (barney [198.169.180.121])
        by sed198n136.sedsystems.ca  with ESMTP id 039FUZNd015971
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 9 Apr 2020 09:30:35 -0600 (CST)
Received: from [192.168.233.77] (ovpn77.sedsystems.ca [192.168.233.77])
        by barney.sedsystems.ca (8.14.7/8.14.4) with ESMTP id 039FUYvq052002
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
        Thu, 9 Apr 2020 09:30:34 -0600
Subject: Re: Linux driver for IRPS5401 - status reg not found
To:     Guenter Roeck <linux@roeck-us.net>, monstr@monstr.eu,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-hwmon@vger.kernel.org
References: <e303166b-4d7a-d2b9-a5c0-fd4de8d22a49@xilinx.com>
 <44d8631a-618c-a061-d9ca-d8030dd8a420@roeck-us.net>
 <52d41b38-8af9-1496-65dc-c36179a9d286@sedsystems.ca>
 <299872b6-0fcf-3ef1-5b52-41fceb2dcdc0@roeck-us.net>
 <3b1750d0-bb1c-0a37-e1a0-d7c25b4bc525@sedsystems.ca>
 <20200330194859.GA12459@roeck-us.net>
 <b4322641-5918-40c4-a887-dcfa20db1733@xilinx.com>
 <7a10a855-53a2-0743-be7d-86f6030626ca@seznam.cz>
 <087f0821-bcd5-0f85-3e02-2b95721d1c2d@roeck-us.net>
From:   Robert Hancock <hancock@sedsystems.ca>
Message-ID: <8afd61bc-9a67-0f22-2931-5ac9d084ee3f@sedsystems.ca>
Date:   Thu, 9 Apr 2020 09:30:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <087f0821-bcd5-0f85-3e02-2b95721d1c2d@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.64 on 198.169.180.136
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2020-04-09 9:16 a.m., Guenter Roeck wrote:
> Hi Michal,
> 
> On 4/9/20 7:29 AM, Michal Simek wrote:
> [ ... ]
>>
>> Just to let you know issue is with i2c driver. Here is my output for the
>> record.
>>
> Thanks a lot for the update.
> 
>> irps5401-i2c-3-43
>> Adapter: i2c-0-mux (chan_id 2)
>> vin1:         11.56 V  (min =  +9.00 V, crit max = +14.00 V)
>> vin2:         11.56 V  (min =  +9.00 V, crit max = +14.00 V)
>> vin3:         11.56 V  (min =  +9.00 V, crit max = +14.00 V)
>> vin4:             N/A
> 
> This is interesting; it means that the rail is not active (?) or
> not supported, or maybe even that the driver has a bug. The second
> chip reports a value here, so I guess the rail is inactive.
> If possible, it would be desirable to detect this during probe
> and not try to report values for this rail. It would be great if
> you can find the time to figure out what is going on.

I would assume that either that rail is not used in that board design 
and was disabled in the non-volatile config on the chip, or alternately 
the chip allows combining outputs C and D (i.e. 3 and 4) into a single 
output in which case only one will report valid data. Not sure offhand 
if there is a way to detect those cases from the PMBus interface at 
probe time.

-- 
Robert Hancock
Senior Hardware Designer
SED Systems, a division of Calian Ltd.
Email: hancock@sedsystems.ca
