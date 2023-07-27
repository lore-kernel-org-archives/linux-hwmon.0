Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0325AC001E0
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jul 2023 16:49:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbjG0Qtb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jul 2023 12:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjG0Qta (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jul 2023 12:49:30 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3682696
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jul 2023 09:49:29 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-783549ef058so47148839f.2
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jul 2023 09:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690476568; x=1691081368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tk158OnV9QOKmqHX7ckwpYjL+PBBSRQ+KsNpjYylWZY=;
        b=goBfVfj1J3kn4TilOXVURafR/V09zuLjwhlqHZYEA2zZok4erLHkkvw1f2L1MfbJDD
         xUHpEZi6OELgJ92KiMWDehooEstA1WVf6QwMzapABa7dGQhKY5AxvwJVXlICmxPX3dgw
         Lu2xLo+h/ZCngy4uDQDCRiL8lMH/dX0TVLDznpKohhXLceZVKf11JOsJ+CKOqZvzMxyX
         +Et4EkF3c7nL0mfMPmSvSzjzyZ1cs1ttBQpnNNvFjPd8FGEZlbIhlagSscd6AYfyjxd2
         B3ZPlHDxe9+zM4KvrJ7MOdIRs9i0/4QTgmgPxmtlZcE8c3WRivSyWJmFopftfMugTIkC
         Awcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690476568; x=1691081368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tk158OnV9QOKmqHX7ckwpYjL+PBBSRQ+KsNpjYylWZY=;
        b=FMoLAWSJ1pO3OFvJqTmeQiU2rzvFPl0ubBL/gTx10lFH+36dC0iz02Da5EqE9gANlY
         X+7UMSvrEbd3Z7lMf2bpar8371HWL8y3F0Sc075Mt0V9HknLT9YrjHM4T/xXGvVJ1Msq
         J6IJZq2Uoqi4CUmrWSehN0W+tVDEmUTRqPN/0yGtHXoA9fXcfmgKOM4MZk95fFrLLVbz
         a6o1lyShgIbSDNQykj6gCbVk7KoU/6HC2bnAcy2cDzVTJYx8AAx0+00GKBkpl/6miDjn
         e5bWJn2B43YxblxlWITaC2kZYkg/nzkK/ujeBvg9nBqK/hH2kVLz++sxvWONTBs3bGVI
         x0Bw==
X-Gm-Message-State: ABy/qLaClqQvl80DUkO8plmJZfq7rG0z/lNTjDppBINEn8MI0S6KPuPO
        5yz6GMPo1+x7LiEvl0eQYZKUIu/XJ9g=
X-Google-Smtp-Source: APBJJlGYMVR65VAzbgM/w/dArtBMT0SEiGK9xb4YDbnCBEha0jo4Ru5ecR3xRz34b/6Uk6pnuD5IXw==
X-Received: by 2002:a92:c7cf:0:b0:348:bf82:a917 with SMTP id g15-20020a92c7cf000000b00348bf82a917mr5310883ilk.26.1690476568461;
        Thu, 27 Jul 2023 09:49:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n11-20020a92dd0b000000b00346330d7783sm592955ilm.36.2023.07.27.09.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 09:49:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <36f9d274-1272-7360-1885-b57fa3479cec@roeck-us.net>
Date:   Thu, 27 Jul 2023 09:49:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] hwmon: (hs3001) Switch to use i2c_driver's probe callback
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Andre Werner <andre.werner@systec-electronic.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
References: <20230727071123.512966-1-u.kleine-koenig@pengutronix.de>
 <7ab9f3c0-5677-ceb5-b9af-81af12a32cbc@roeck-us.net>
 <20230727163936.dnhav2mfho3ilubf@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230727163936.dnhav2mfho3ilubf@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/27/23 09:39, Uwe Kleine-König wrote:
> On Thu, Jul 27, 2023 at 06:34:14AM -0700, Guenter Roeck wrote:
>> On 7/27/23 00:11, Uwe Kleine-König wrote:
>>> The previous mass switch of hwmon drivers done in commit 1975d167869e
>>> ("hwmon: Switch i2c drivers back to use .probe()") was based on
>>> v6.4-rc1. Since then this driver was added which needs to be converted
>>> back in the same way before eventually .probe_new() can be dropped from
>>> struct i2c_driver.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>> ---
>>> Hello,
>>>
>>> this driver appeared in next today. It would be great if this patch
>>> could be added on top to not interfere with the quest to remove
>>> .probe_new directly after v6.6-rc1.
>>>
>> I just made the change in the original patch.
> 
> fine for me.
> 
>> Thanks, and sorry for not noticing.
> 
> If that helps: this wasn't the first recent commit reintroducing a
> .probe_new :-) Actually I wanted to drop .probe_new already in the last
> cycle but didn't pay attention between v6.4 and v6.5-rc1 which
> introduced a few more of these. In the current cycle this was already
> the fifth.
> 

Sorry, I didn't pay attention. I'll try to do better. I may need my own
version of checkpatch ...

Guenter

