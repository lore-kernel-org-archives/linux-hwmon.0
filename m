Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48146C433ED
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 May 2021 07:02:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11813610A6
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 May 2021 07:02:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232674AbhEFHDI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 6 May 2021 03:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232554AbhEFHDI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 6 May 2021 03:03:08 -0400
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050::465:202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12D3C061574
        for <linux-hwmon@vger.kernel.org>; Thu,  6 May 2021 00:02:10 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4FbPdr0BN9zQk2X;
        Thu,  6 May 2021 09:02:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id QZdqFGHllMfp; Thu,  6 May 2021 09:02:02 +0200 (CEST)
Subject: Re: [PATCH] hwmon: (nct6775) Support access via Asus WMI
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <523324cb-4e9d-c8f3-abe1-94158368aa45@bernhard-seibold.de>
 <08262b12-4345-76a9-87be-66d630af3a59@roeck-us.net>
From:   Bernhard Seibold <mail@bernhard-seibold.de>
Message-ID: <de9fba24-eb84-d967-268d-aa114c453f42@bernhard-seibold.de>
Date:   Thu, 6 May 2021 09:02:01 +0200
MIME-Version: 1.0
In-Reply-To: <08262b12-4345-76a9-87be-66d630af3a59@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -0.98 / 15.00 / 15.00
X-Rspamd-Queue-Id: B24131894
X-Rspamd-UID: 483ba8
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 06.05.2021 04:04, Guenter Roeck wrote:
> On 5/5/21 1:12 PM, Bernhard Seibold wrote:
>> Support accessing the chip via Asus WMI. This enables the driver to work
>> on boards where the IO region is reserved by ACPI.
>>
>> Signed-off-by: Bernhard Seibold <mail@bernhard-seibold.de>
>> Tested-by: Artem S. Tashkinov <aros@gmx.com>
> 
> No, this makes the driver unmaintainable. There should be a separate
> driver which only makes WMI/ACPI accesses for everything.
> 
> Guenter
> 

I'm not sure what exactly you are suggesting. I assume your suggestion
isn't to duplicate 5000 lines of code in order to avoid having 100 lines
of ifdef'ed code?
