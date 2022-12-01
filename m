Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B493DC47088
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Dec 2022 11:37:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiLALhG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Dec 2022 06:37:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbiLALg7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2022 06:36:59 -0500
Received: from gateway31.websitewelcome.com (gateway31.websitewelcome.com [192.185.144.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE32025E9C
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 03:36:58 -0800 (PST)
Received: from atl1wswcm06.websitewelcome.com (unknown [50.6.129.167])
        by atl3wswob02.websitewelcome.com (Postfix) with ESMTP id 3FC5974DDC
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 11:36:58 +0000 (UTC)
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTP
        id 0hs7pjvG8Pz0t0hs9peqGV; Thu, 01 Dec 2022 11:36:58 +0000
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kkbqgxk/YMTTr4GHrSnoqsTFSBqsgm0vcdYl9c4cfVM=; b=cHqwZipTJvf7mo34V7k1JJ/oF3
        Q+Cbi/iDPx2RAi0MV2UuWRZFTJ4yDmOX7Y9MoufE5BQTM6vKI6tXN2vcUXRl4SVtn5HYV+tuKTzm4
        mdzRGlGHYHYtqi7Yvuj1MnjPMwOnNvHJsToCD+OyoU5ufhqmhEhkwCEi975lekG8O4it19c27xeLU
        UPynG/XUCLvIT9gojkYohQBHU+ajExN5/jrXjtrjcOLQgvpzJDCl5wdkbNp4AnPK9mNzVp6UiLf0G
        N+XqENu/t3S+pBgV8JcuUBUiX985x50JaihfZePxljLN/xqLIA0U04885omD8uFjCOXfF/McHN6lz
        3bXdVrtQ==;
Received: from [223.187.121.253] (port=48632 helo=[192.168.221.42])
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <saravanan@linumiz.com>)
        id 1p0hs6-000SeA-HR;
        Thu, 01 Dec 2022 11:36:54 +0000
Message-ID: <1c989c0a-e66d-9c57-5932-0fa5599ef8ad@linumiz.com>
Date:   Thu, 1 Dec 2022 12:36:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/4] hwmon: (pmbus/mpq7932) Add a support for mpq7932
 Power Management IC
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        linux@roeck-us.net, jdelvare@suse.com,
        linux-kernel@vger.kernel.org, marten.lindahl@axis.com
References: <20221201044643.1150870-1-saravanan@linumiz.com>
 <20221201044643.1150870-4-saravanan@linumiz.com>
 <f28da7ab-920d-a534-9f5d-e8407d0487a9@linaro.org>
From:   Saravanan Sekar <saravanan@linumiz.com>
In-Reply-To: <f28da7ab-920d-a534-9f5d-e8407d0487a9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 223.187.121.253
X-Source-L: No
X-Exim-ID: 1p0hs6-000SeA-HR
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.221.42]) [223.187.121.253]:48632
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 17
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLqy/MShy7Q2k3FXf9gnp2IOZ49C5ng4w1qSAp4BumxhlXyFE3Ga1KppdE3kk5DKFvVZ5wS63pYCHHSvMBbz42rIh5DjKVP5KSbAaseBVm/MCU0CT3Sw
 eeWf4OkNKZM7Gf+PPZGxjoLriNlTicqNLXji1/QLB3bMTiZ0j3nJmov2KhWw/Ebvt39ILfX18P4ptPVRasfmSvXRl4O/ETCnbjE=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 01/12/22 11:26, Krzysztof Kozlowski wrote:
> On 01/12/2022 05:46, Saravanan Sekar wrote:
>> The MPQ7932 is a power management IC designed to operate from 5V buses to
>> power a variety of Advanced driver-assistance system SOCs. Six integrated
>> buck converters with hardware monitoring capability powers a variety of
>> target rails configurable over PMBus interface.
>>
>> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
>> ---
>>   drivers/hwmon/pmbus/Kconfig   |  10 +++
>>   drivers/hwmon/pmbus/Makefile  |   1 +
>>   drivers/hwmon/pmbus/mpq7932.c | 144 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 155 insertions(+)
>>   create mode 100644 drivers/hwmon/pmbus/mpq7932.c
> 
> This is a friendly reminder during the review process.
> 
> It seems my previous comments were not fully addressed. Maybe my
> feedback got lost between the quotes, maybe you just forgot to apply it.
> Please go back to the previous discussion and either implement all
> requested changes or keep discussing them.
> 
Thank you again for your time for review.

I saw two comments from you on V1 which I believe addressed on V2

1. Missing maybe_unused, so drop of_match_ptr.
  ".of_match_table = of_match_ptr(mpq7932_of_match)"

dropped of_match_ptr.

2. It's a regulator, not hwmon.
   "config SENSORS_MPQ7932_REGULATOR
    tristate "MPS MPQ7932 buck regulator" "

It is PMIC chip with hwmon support access over PMBUS.

Please help if anything I missed

> Thank you.
> 
> Best regards,
> Krzysztof
> 

