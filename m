Return-Path: <SRS0=88On=R6=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA89C43381
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Mar 2019 16:17:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 75D87206C0
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Mar 2019 16:17:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbfC0QRf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Mar 2019 12:17:35 -0400
Received: from foss.arm.com ([217.140.101.70]:57500 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727173AbfC0QRf (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Mar 2019 12:17:35 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B110C80D;
        Wed, 27 Mar 2019 09:17:34 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3955F3F575;
        Wed, 27 Mar 2019 09:17:32 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: hwmon (pwm-fan) Remove dead
 "cooling-*-state" properties
To:     arnd@arndb.de, olof@lixom.net
Cc:     Krzysztof Kozlowski <krzk@kernel.org>, linux@roeck-us.net,
        jdelvare@suse.com, kgene@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, thierry.reding@gmail.com,
        jonathanh@nvidia.com, heiko@sntech.de, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org
References: <afde4ebd929821d63b5172c8e70e15f0725a4b49.1553006788.git.robin.murphy@arm.com>
 <CAJKOXPd12YPvL61nu0TDWze4pBuQK=KbJCrc5wh-tACsRQt37g@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <14a24871-f22d-a500-8f49-922d0374ddca@arm.com>
Date:   Wed, 27 Mar 2019 16:17:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAJKOXPd12YPvL61nu0TDWze4pBuQK=KbJCrc5wh-tACsRQt37g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

[ +Arnd, Olof ]

On 19/03/2019 15:06, Krzysztof Kozlowski wrote:
> On Tue, 19 Mar 2019 at 15:54, Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> The old "cooling-{min,max}-state" properties for thermal bindings were
>> ratified to "cooling-{min,max}-level" by commit eb168b70dea5 ("of:
>> thermal: Fix inconsitency between cooling-*-state and cooling-*-level"),
>> which were later removed entirely by commit e04907dbc259 ("dt-bindings:
>> thermal: Remove "cooling-{min|max}-level" properties").
>>
>> The pwm-fan binding, however, was apparently in-flight in parallel with
>> that ratification, and so managed to introduce an example of the old
>> properties which escaped the scope of the later cleanup and has thus
>> continued to be dutifully copied for new boards despite being useless.
>> Clean up these remaining undocumented anachronisms to minimise any
>> further confusion.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>
>> Presented as one big hwmon patch for simplicity, but the DT changes
>> can quite easily be broken out by platform if maintainers prefer.
>>
>> Robin.
>>
>>   Documentation/devicetree/bindings/hwmon/pwm-fan.txt | 2 --
>>   arch/arm/boot/dts/exynos4412-odroidu3.dts           | 2 --
>>   arch/arm/boot/dts/exynos5410-odroidxu.dts           | 2 --
>>   arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi  | 2 --
> 
> Probably you should send it directly to arm-soc maintainers so it
> would go with other DT changes. In such case:
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Indeed, it had crossed my mind that routing this through arm-soc might 
make sense - Arnd, Olof, would you agree? And if so, should I resend to 
the arm-soc alias or might you be able to pick it directly?

Thanks to everyone for the acks!

Robin.

> 
> Best regards,
> Krzysztof
> 
>>   arch/arm/boot/dts/imx6qdl-emcon.dtsi                | 2 --
>>   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts  | 2 --
>>   arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi       | 2 --
>>   arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi       | 2 --
>>   8 files changed, 16 deletions(-)
>>
