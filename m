Return-Path: <SRS0=etf3=UN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BC9C31E4B
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jun 2019 21:48:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 93CCB2184D
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jun 2019 21:48:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=autistici.org header.i=@autistici.org header.b="iv3ZLKsx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfFNVst (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jun 2019 17:48:49 -0400
Received: from latitanza.investici.org ([82.94.249.234]:38879 "EHLO
        mx1.investici.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfFNVst (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jun 2019 17:48:49 -0400
X-Greylist: delayed 591 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Jun 2019 17:48:48 EDT
Received: from mx1.investici.org (localhost [127.0.0.1])
        by mx1.investici.org (Postfix) with ESMTP id 18E2E120550;
        Fri, 14 Jun 2019 21:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=autistici.org;
        s=stigmate; t=1560548336;
        bh=soiYJsoP9D5rzGKr/zvYD+ApS9xwcBblGZb5zEcAPdQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iv3ZLKsx067iSaSVPFWO9N/eZxkn+lMUISWGZHC3R2lw5G7HlyFudIs/xrnuvPv5p
         mHdhgqJZlM9UrZqJ7cBPo1kkG4r8lIMOfHajfLKg0Ja3/8xzCMQpWmYUnvqwESXckw
         PtpztMTa1QXBdbLMTl55HdXI+hnzKSZgrEMY9J1w=
Received: from [82.94.249.234] (mx1.investici.org [82.94.249.234]) (Authenticated sender: mikefender@cryptolab.net) by localhost (Postfix) with ESMTPSA id 95A491204BB;
        Fri, 14 Jun 2019 21:38:53 +0000 (UTC)
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
Message-ID: <305ec8ed-a04d-054a-0684-e5461da117ee@autistici.org>
Date:   Fri, 14 Jun 2019 22:38:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190207124010.zfqyn2vzgwkatima@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Looks like they've broken the SMM method for XPS 9560 too in a recent firmware upgrade.
Have you thought about the possibility to fall back to i8k_get_temp() when the label
method fails, or when the user decides to explicitly enable it as an alternative with
a module option?

Looks like Dell decided to change the API so future firmwares will stop supporting
that method anyway, so I think action must be taken in the driver to address the problem.

Kind regards,
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
