Return-Path: <SRS0=fIHL=VG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FF9C73C46
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 15:11:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CC002166E
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 15:11:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfGIPLW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Jul 2019 11:11:22 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:33479 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726601AbfGIPLV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Jul 2019 11:11:21 -0400
Received: from [167.98.27.226] (helo=ct-lt-765.unassigned)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1hkrm2-0006V6-VL; Tue, 09 Jul 2019 16:11:19 +0100
Subject: Re: [PATCH v1 0/5] Help with lm75.c changes
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20190709095052.7964-1-iker.perez@codethink.co.uk>
 <48ef8bb0-b420-24a4-16a2-c8d6e5d30eee@roeck-us.net>
From:   Iker Perez del Palomar <iker.perez@codethink.co.uk>
Message-ID: <d786c56d-e518-d310-ea57-60a8fbefc787@codethink.co.uk>
Date:   Tue, 9 Jul 2019 16:11:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <48ef8bb0-b420-24a4-16a2-c8d6e5d30eee@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,


Thank you for offering to coach me!  You are right, I don't have
experience of writing kernel drivers at all.  I would like to be
coached by you.  I have a system with an tmp75b device to test with.

At the moment I haven't been given any project to work in. so I decided
to work in this driver.  We were using this driver and I wanted
to give a boost to it, while I learn more about the kernel drivers.
However I am open to any suggestions you might have, although If I am
given a new project I won't be able to work on this as much as now.

Thanks for your feedback and for offering to coach me,

Iker

On 09/07/2019 14:43, Guenter Roeck wrote:
> Hi,
> 
> On 7/9/19 2:50 AM, Iker Perez wrote:
>> From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
>> 
>> Hello,
>> 
>> I have been working in the lm75.c driver, trying to add a variable
>>  update_time to the tmp75b device.
>> 
>> I am not very confident about, if what I am doing and how I am 
>> doing it is the best way it could be done. For that reason, I 
>> decided to send my current changes, so maybe I could be helped and 
>> my code revised.
>> 
>> I decided to separate my all my changes in probably more than 
>> needed commits because I thought that it would b easier to 
>> understand at first place. After the feedback and my changes are 
>> ready to submit I will squash the ones that are related between 
>> them and the patch series will be much shorter.
>> 
>> Thanks in advance for your help,
>> 
> 
> Looking through your patch series, I can't help thinking that you 
> don't have much experience writing kernel drivers. I am open to 
> coaching you through this, but I have to ask: Do you have an actual 
> use case ? This is not something we'll want to do as a coding 
> exercise, since it will add a non-trivial amount of code to the 
> kernel.
> 
> Thanks, Guenter
> 
>> Regards,
>> 
>> Iker
>> 
>> Iker Perez del Palomar Sustatxa (5): hwmon: (lm75) Add kind field 
>> to struct lm75_data hwmon: (lm75) Include hwmon_chip in the 
>> permitted types to be writen hwmon: (lm75) Give write permission
>> to hwmon_chip_update_interval hwmon: (lm75) Create function from
>> code to write into registers First approach to sample time writing
>>  method
>> 
>> drivers/hwmon/lm75.c | 166 
>> +++++++++++++++++++++++++++++++++------------------ 1 file
>> changed, 108 insertions(+), 58 deletions(-)
>> 
> 
> 

-- 
Iker Perez del Palomar, Software Engineer
Codethink Ltd                             35 Dale St, Manchester M1 2HF
http://www.codethink.co.uk/          Manchester, M1 2JW, United Kingdom
We respect your privacy.   See https://www.codethink.co.uk/privacy.html
