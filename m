Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095F2C56202
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Nov 2020 09:07:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89474208CA
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Nov 2020 09:07:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="a/0crOxl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389032AbgKZJHZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Nov 2020 04:07:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728306AbgKZJHV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Nov 2020 04:07:21 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33922C0613D4
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2020 01:07:21 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id t143so1529863oif.10
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2020 01:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cQGrDC5smS7TDRmvgcdfElmchLW6t6WEmPHZQv+KpyM=;
        b=a/0crOxljEcXSPBx/a5NWpNxyV8qD/AMM074BKilTZP7uVDT1ESMsial4+6aLbeKxc
         LrIpML5YZdXNGBDfogiFb5p4YSh95Y4HK3QbvOciP3w6RUPi9TPsLi1RHVTarxOXKdOr
         aQIIZWxuyU4zFSHu0xv1reJzxB6SWKD4WImw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cQGrDC5smS7TDRmvgcdfElmchLW6t6WEmPHZQv+KpyM=;
        b=A8lvohBQCT8ZiiKCVCceSkX3pvw/wKfITp8u2FGO+JriwNmr5gMLeHAS2plO1fWv0n
         W/GyqnLVsVHPTLRIQ5FZ2hca/F6HhBvfSJ6s2V5lfqK6dJXdvnY2AK776IPJYKsP7R2v
         aWRptRguXvlqiaNB1w9YdgVM9VZjFd6wo4d5kOVEE7fP4r7a0jsdyYWPzpwgQreB53TG
         o8+q8mhzjoMMZvcTb1nYDUz48r0ye4z9/fY3+MxCezlll8RxJyEa2CWAjMqGDAQAHCZu
         wK+qbpnXFb+dhAWS/8WYK6FPcRvKvnqnhQ4tNvxuP6UccySnW2p0zE8mw+0Sw/XHWBUA
         xWfg==
X-Gm-Message-State: AOAM532Un/aei6QjT3B1qZj+iIYnPPrEMW9mM2zY0/RoL9bJqmFVSt1f
        qxZmoNauYHwaj6muYLtUL/TBdVV44h/vSpOjrl/0DfYUF60=
X-Google-Smtp-Source: ABdhPJysNBcWj1MWCXeTwQHvCMU0Sbtmz6v9uwDFQPiVf7t9cq+yuvf9qem/OlnvkLn2VNYuObPmXUxn7QMfvK2E/2E=
X-Received: by 2002:aca:ebce:: with SMTP id j197mr1457654oih.6.1606381640466;
 Thu, 26 Nov 2020 01:07:20 -0800 (PST)
MIME-Version: 1.0
References: <20201113150853.155495-1-pbarker@konsulko.com> <20201113150853.155495-3-pbarker@konsulko.com>
 <20201126014500.GC111386@roeck-us.net>
In-Reply-To: <20201126014500.GC111386@roeck-us.net>
From:   Paul Barker <pbarker@konsulko.com>
Date:   Thu, 26 Nov 2020 09:07:11 +0000
Message-ID: <CAM9ZRVurbJgx0kUyrJj8snawrBEfLYrUwZbQ68eukVed8jEMew@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] hwmon: pwm-fan: Dynamically setup attribute groups
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 26 Nov 2020 at 01:45, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Nov 13, 2020 at 03:08:51PM +0000, Paul Barker wrote:
> > Instead of implementing an is_visible function we can dynamically
> > populate the attribute group for the device based on whether a fan
> > tachometer input is configured or not.
> >
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
>
> This will make it more difficult to ever convert the driver to use the
> devm_hwmon_device_register_with_info() API. I'd rather see a conversion
> to that API now instead of making it more difficult to implement in the
> future.

Ah I hadn't realised that was the preferred API. I'll take a look and
see if I can convert the driver, perhaps as a standalone patch so we
can get this right before I re-work my implementation of multiple
tachometer input support.

Thanks,

-- 
Paul Barker
Konsulko Group
