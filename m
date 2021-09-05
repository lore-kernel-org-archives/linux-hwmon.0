Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E32EC433F5
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Sep 2021 20:33:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C29460F5E
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Sep 2021 20:33:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233435AbhIEUeS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Sep 2021 16:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbhIEUeR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Sep 2021 16:34:17 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C79CC061575
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Sep 2021 13:33:13 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id w19so6341769oik.10
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Sep 2021 13:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GJ3/2s7zctlD/w3cz/y7AFDFJRWPV+yOSf2EnA09VXg=;
        b=WRnJc86ItzPN4toirfv1U3uEGqIGghre1kbQ9sSsQCp+zWq2KVMszukrNMT2Px2sVA
         FOEzUDtoligfvMetps9/PR7BV9eUvMRuZ/GeGhiWQBIc5I5Aki0M+VVm/PCdmKb/lFYg
         tvPR6Mizk40wrEIoZoEoAnH9gLMl8BRux54qZ0TEIHQxhUY/nxrJUhn4NLGOTJ/wcrJT
         4D/v4WIywElWm4GFZZ+3CE7o9ueG5CwyfbIKUpmBcS08WdMsYZ48VT/pTFa+moLQQaEk
         L4RqIqZV1UleDxVpDotRy0M6cmJZr1XFJQZd0VFp3glEFS+39ltp3gzWoihB+IS/a3l7
         8vDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=GJ3/2s7zctlD/w3cz/y7AFDFJRWPV+yOSf2EnA09VXg=;
        b=eYeXcHncpASmk17W+nNGEJw91sjn1D68AaQcGUXvJlfVXOjY2+33tV6jN8qLVpWLPV
         kw6dGLcqIjZNzG0c6h/LaJ/HN70vHSEBkzVh6zMoQWFro9mGnTyOitAgXFvkPXLVNGsj
         CCRAetLl62micxlDf3a2FTKgxvOqFnO1Arso+SV/BXOqjL6Rfon/vHyPdEJmWbFsPZ8l
         SfvMwItLZDhGz873/VlXMOko/RJznDNM0xLGFEgvycUYKN5IHY67vbvMvFuJ1paQji2B
         JsI+gHQuNzwpkSpWfBHDr+fv0e2NwsALHZ1Uzp7veuoL+FeuiVKdEGPNJ+9LCQsjsDNV
         B7yg==
X-Gm-Message-State: AOAM5305+6RzO1HiG2M/Fe2sAvLqv8efkAn24jFnRvbyYSM0kyyLIAoq
        hq8Q8E3w4gmN6GoUXaPhC3To91hZQE0=
X-Google-Smtp-Source: ABdhPJxx8cPCkFC7GIKIXsozyYSu3ft+wknbw3VKT9PToVpOaZD27ObpH+s1X6gDmPtsi9uNf4wDWA==
X-Received: by 2002:aca:b2c4:: with SMTP id b187mr6679186oif.90.1630873992463;
        Sun, 05 Sep 2021 13:33:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b3sm1109132oie.1.2021.09.05.13.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 13:33:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 5 Sep 2021 13:33:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     W_Armin@gmx.de
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (raspberrypi) Use generic notification mechanism
Message-ID: <20210905203310.GA3080894@roeck-us.net>
References: <20210905190049.11381-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210905190049.11381-1-W_Armin@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Sep 05, 2021 at 09:00:49PM +0200, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Use hwmon_notify_event() to make the code easier to
> understand and to also generate udev events.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied to hwmon-next.

Thanks,
Guenter
