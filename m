Return-Path: <SRS0=GU8J=SX=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7964C10F14
	for <linux-hwmon@archiver.kernel.org>; Sun, 21 Apr 2019 17:25:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FCBF2080D
	for <linux-hwmon@archiver.kernel.org>; Sun, 21 Apr 2019 17:25:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=autistici.org header.i=@autistici.org header.b="TX128bCG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbfDURZt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 21 Apr 2019 13:25:49 -0400
Received: from perdizione.investici.org ([94.23.50.208]:37566 "EHLO
        perdizione.investici.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbfDURZt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 21 Apr 2019 13:25:49 -0400
X-Greylist: delayed 1506 seconds by postgrey-1.27 at vger.kernel.org; Sun, 21 Apr 2019 13:25:48 EDT
Received: from [94.23.50.208] (perdizione [94.23.50.208]) (Authenticated sender: mikefender@cryptolab.net) by localhost (Postfix) with ESMTPSA id D8239140253;
        Sun, 21 Apr 2019 17:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=autistici.org;
        s=stigmate; t=1555866040;
        bh=xeX8doVAOgbVgtLzFo2KlXAycBrZL9/bbSsp9B8cXoc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=TX128bCGFgYMknk5Z6DTcZwNOqcrMxNds+lzGyZBSyWBEIGwSjA2menHGawiTICMZ
         16pSqz+KotxB0mkx4LDkCt2aIEt1vkXie9enZcBNacrc5Sh+rIoXvbhsnw5sqZYyl4
         VVEMQAixdVK1H0xzcko6OTfVxK4SSBZ104IrvAbo=
Subject: Re: [PATCH] dell-smm-hwmon.c: Additional temperature sensors
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <20181207202927.14168-1-michelesr@autistici.org>
 <20181208005603.11721-1-michelesr@autistici.org>
 <3f1b847e-2b70-70bb-f5e6-5f68ffbc63ed@roeck-us.net>
 <20181210105823.xq3mnrlfgdx63etl@pali>
 <127d6adc-6002-ad28-14bd-1ca475d421c5@autistici.org>
 <20190207124010.zfqyn2vzgwkatima@pali>
From:   Michele Sorcinelli <michelesr@autistici.org>
Message-ID: <3222ea02-52fb-78fe-41dc-aa1cf6e5cf4b@autistici.org>
Date:   Sun, 21 Apr 2019 18:00:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190207124010.zfqyn2vzgwkatima@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

I think they'll never fix it or release information about the change.
What if we modify the driver to fallback to i8k_get_temp() if i8k_get_temp_type()
fails as a probe method? Or we could add a module option to force that behavior.

Cheers,
Michele.

On 2/7/19 12:40 PM, Pali Rohár wrote:
> Do you have definite response from Dell support that they are not going
> to fix it? Then it is pity :-(
> 
> On Thursday 07 February 2019 12:16:06 Michele Sorcinelli wrote:
>> As far as I know Dell won't help with fixing the SMM layer, they probably
>> changed something starting with firmware version 1.3.0 and they don't
>> wanna release information about it.
>>
>> https://www.hwinfo.com/forum/Thread-Dell-XPS-15-9570-temperatures-not-named-anymore
>>
>> I wonder if something can be done to force the discovery of the sensors in the driver,
>> maybe adding a module option to use i8k_get_temp() as probe method as a workaround,
>> or maybe just forcing that method for this specific model?
>>
>> Let me know your thoughts.
>>
>> Thanks,
>> Michele.
>>
>> On 12/10/18 10:58 AM, Pali Rohár wrote:
>>> On Friday 07 December 2018 20:24:49 Guenter Roeck wrote:
>>>> Anyway, I would like to get some feedback if this can cause regressions
>>>> on systems which don't support that many sensors and maybe report something
>>>> completely different if one tries to read the high-numbered sensors.
>>>> I seem to recall that there was a reason for checking the type and not just
>>>> trying to read sensor values.
>>>
>>> There can be also different problem for sensors which are turned off.
>>> E.g. on notebooks with switchable graphic cards which have included
>>> temperature sensors. When graphic card is turned off, then SMM returns
>>> error when asking for temperature value (for obvious reason). But
>>> temperature type still returns correct value "this is GPU sensors".
>>>
>>> So we cannot replace temp_type check by temp_value check. It introduce
>>> race condition between "starting GPU" and initializing dell-smm hwmon.
>>> Now linux kernel has support for dynamic turning ON/OFF switchable GPU,
>>> so we need to care about these race conditions too.
>>>
> 
