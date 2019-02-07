Return-Path: <SRS0=CTyS=QO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8723EC282C2
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Feb 2019 12:34:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E2B921907
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Feb 2019 12:34:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=autistici.org header.i=@autistici.org header.b="gth37Jd/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbfBGMec (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 7 Feb 2019 07:34:32 -0500
Received: from perdizione.investici.org ([94.23.50.208]:29548 "EHLO
        perdizione.investici.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfBGMec (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Feb 2019 07:34:32 -0500
X-Greylist: delayed 1100 seconds by postgrey-1.27 at vger.kernel.org; Thu, 07 Feb 2019 07:34:31 EST
Received: from [94.23.50.208] (perdizione [94.23.50.208]) (Authenticated sender: mikefender@cryptolab.net) by localhost (Postfix) with ESMTPSA id 952151401F4;
        Thu,  7 Feb 2019 12:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=autistici.org;
        s=stigmate; t=1549541767;
        bh=sjmHY9aDDchQdHcgHW6hvG74vKp73uJ8suoTQLLgwls=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=gth37Jd/ipy+rDJ/uPemqMYlLQyx0C6t9OkZJo+EDs82CJQmM8vlMl99sBtGI0q1w
         VoNyGBP3DT9cm/QmluWBIa3Bvxk1nPRLwDEnbYrhqGl15eqc6QJeDam0DmDKvyyri4
         NoIWWzp/lzYS7oeHnzmlCfTA7P5vAbQh9sUkJR94=
Subject: Re: [PATCH] dell-smm-hwmon.c: Additional temperature sensors
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <20181207202927.14168-1-michelesr@autistici.org>
 <20181208005603.11721-1-michelesr@autistici.org>
 <3f1b847e-2b70-70bb-f5e6-5f68ffbc63ed@roeck-us.net>
 <20181210105823.xq3mnrlfgdx63etl@pali>
From:   Michele Sorcinelli <michelesr@autistici.org>
Message-ID: <127d6adc-6002-ad28-14bd-1ca475d421c5@autistici.org>
Date:   Thu, 7 Feb 2019 12:16:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20181210105823.xq3mnrlfgdx63etl@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

As far as I know Dell won't help with fixing the SMM layer, they probably
changed something starting with firmware version 1.3.0 and they don't
wanna release information about it.

https://www.hwinfo.com/forum/Thread-Dell-XPS-15-9570-temperatures-not-named-anymore

I wonder if something can be done to force the discovery of the sensors in the driver,
maybe adding a module option to use i8k_get_temp() as probe method as a workaround,
or maybe just forcing that method for this specific model?

Let me know your thoughts.

Thanks,
Michele.

On 12/10/18 10:58 AM, Pali Rohár wrote:
> On Friday 07 December 2018 20:24:49 Guenter Roeck wrote:
>> Anyway, I would like to get some feedback if this can cause regressions
>> on systems which don't support that many sensors and maybe report something
>> completely different if one tries to read the high-numbered sensors.
>> I seem to recall that there was a reason for checking the type and not just
>> trying to read sensor values.
> 
> There can be also different problem for sensors which are turned off.
> E.g. on notebooks with switchable graphic cards which have included
> temperature sensors. When graphic card is turned off, then SMM returns
> error when asking for temperature value (for obvious reason). But
> temperature type still returns correct value "this is GPU sensors".
> 
> So we cannot replace temp_type check by temp_value check. It introduce
> race condition between "starting GPU" and initializing dell-smm hwmon.
> Now linux kernel has support for dynamic turning ON/OFF switchable GPU,
> so we need to care about these race conditions too.
> 
