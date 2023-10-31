Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB24C4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Oct 2023 14:17:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234984AbjJaOQ7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Oct 2023 10:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234937AbjJaOQ5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Oct 2023 10:16:57 -0400
Received: from so254-32.mailgun.net (so254-32.mailgun.net [198.61.254.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C0AF9
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 07:16:52 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1698761811; x=1698769011; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date:
 Sender: Sender; bh=C77qF6G8bxTGUukh5Nl3X1VGMsjB6QD9fEDEBZTAN7A=;
 b=s+mPCH/eI0jmSLN9ac4VHZJitLTHN8SyWcOx9lka/iFF77PU7lk0sOH4Xlvne1ockQbldPjUESgqzna97VkPmuaH1JDyqvxjsOCXpVw5qex4ryTMcCjvUgUcM7Z8K7cvBM0X1lD3y9tEJr2zdYGVHZpKHuo0gu9kyFscTRuQNptJXifAp5EiU3g5aw3O0bd879GLzS1VD0Wd1dyK0bSaKCtmQAjsZNrWogK/vImHG9zztXWzWZzG4VX/459UYEhKjLTHL11WLIowZ9YdjhtdY70Q4xPWovhhS3pIcdWo6Sc/dwe8+P72QoXzaK8VAflhThNMRSUrPV9pECnhhfxWzg==
X-Mailgun-Sending-Ip: 198.61.254.32
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by 75c11d8834c0 with SMTP id
 65410c53879a348f4f77dc37 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 31 Oct 2023 14:16:51 GMT
Sender: james@equiv.tech
Date:   Tue, 31 Oct 2023 07:16:50 -0700
From:   James Seo <james@equiv.tech>
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, Armin Wolf <W_Armin@gmx.de>,
        linux-hwmon@vger.kernel.org
Subject: Re: [BUG] hp-wmi-sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -22
Message-ID: <ZUEMUt8t+mWjMYA2@equiv.tech>
References: <ZT1U/zE6cApQKC2h@equiv.tech>
 <CGME20231031102014eucas1p2f377b89cd0381231b5c7f321e2902fe8@eucas1p2.samsung.com>
 <oypijd5y2nf60f.fsf%l.stelmach@samsung.com>
 <ZUEIcOBpVzxC/+c1@equiv.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZUEIcOBpVzxC/+c1@equiv.tech>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 31, 2023 at 07:00:17AM -0700, James Seo wrote:
> After using iasl to decompile the DSDT you sent to ACPI Source Language (ASL),
> everything looks fine with HPBIOS_BIOSNumericSensor. Not that I'm particularly
> familiar with ASL, but search for "Name (SEN1, Package (0x06)" and read on to
> the "Method (_INI, 0, NotSerialized)" and the "Method (WQAE, 1, Serialized)"
> lines below. It certainly looks like that's how the BIOS on that system is
> generating HPBIOS_PlatformEvents instances at runtime.

Correction: I meant "HPBIOS_BIOSNumericSensor instances" in the last line here.

Sorry about that.

