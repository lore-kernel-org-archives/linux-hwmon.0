Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CFEDC48BDF
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jun 2021 19:41:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B3DE613C1
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jun 2021 19:41:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbhFRTni (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jun 2021 15:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbhFRTnh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jun 2021 15:43:37 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F00EC061574
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jun 2021 12:41:27 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id r16so11755142oiw.3
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jun 2021 12:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I+brBL0X16VqpsruCjJPt5455pAKWGL0AjBMJ9hLfVk=;
        b=IOQGoem4lWZ8RDvQGenmLphU8QW7nvrs37Tdz/aJiKAEC7BVNBSD+rUCVWSS0zQQZB
         LeIosXuNdRBO3ymNGV3ug+/p1pMC1+cNzliyD1VMUJvC8VsvtGLg+gO5Tt3YUuZnk3Gn
         qkpWEv/AAs8sGhRt7z+BbwJNbm3vlKg5Wp0cgMKtXiIZ7UskPaThoYF3c5AQ0Oln0BM1
         5jAbfqvWFdFj4Q30KMrYZS4g/yCUITZFdRFOSHXsiBLDJS8hu9qyxvuRpw/cbOuJxX4y
         9m8JMnsnURdCnz2aNCLLxQzwkF8+KkVIlhqie0Uc15f03NmUK92nNQVuO6d4DUMoWxp7
         govQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=I+brBL0X16VqpsruCjJPt5455pAKWGL0AjBMJ9hLfVk=;
        b=k1ijP7x2tesp3N33F3zR/8nT63qWuFMFoFLeHQKMq7DCL9wlDc3QH0LDFJrimqjtF6
         xrIIqJF9GsmOnwWadE8/xYRBqS2XAfeI+lcQuX73tSgoCVBbM2visBBD77dimizLFZU9
         +Qvjxzxrp8KTrk6POMiCPYZMH8PeinHLTybygkr+hDh3gdW/OPm8i0mc7go6d4YafJUM
         CQjcce/afY7GcgYDjAQbRPrk7mQq/qln1ZDjmpvSw42k1iNYnByPz1qEbX+6O9W70Q/5
         POLO5tYza6lQZkGqSIiBgQcYt5lVmSpgoipZwRUjS9G617FhB2jYAoUolYTy4cu5RCAj
         VAcw==
X-Gm-Message-State: AOAM531rFluVzehqZ3ORkxJTcTmfl5p4VjRXUgaRYIUKglUlqgDHPvds
        XeQx/GqOdNhzGbzxI8heUMA=
X-Google-Smtp-Source: ABdhPJyHDzPxkDqg0xKUEwK9RsXPrPNeGDAcqB/Gv+CLKiwVJmCepc5AzDz89eLA/QHdC43lRxlbxg==
X-Received: by 2002:aca:5cc5:: with SMTP id q188mr8454238oib.168.1624045286593;
        Fri, 18 Jun 2021 12:41:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t26sm2259157oth.14.2021.06.18.12.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 12:41:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 18 Jun 2021 12:41:24 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marius Zachmann <mail@mariuszachmann.de>
Cc:     Wilken Gottwalt <wilken.gottwalt@posteo.net>,
        Aleksandr Mezin <mezin.alexander@gmail.com>,
        linux-hwmon@vger.kernel.org, Jiri Kosina <jikos@kernel.org>
Subject: Re: corsair-cpro and hidraw
Message-ID: <20210618194124.GB1664689@roeck-us.net>
References: <CADnvcf+LhxZoZk9eRUahSWZ3xVJLkxcAt3+4dS-JCjV8gZE_0A@mail.gmail.com>
 <27527118.vr9HtJ8RzA@marius>
 <20210618121300.GB1202484@roeck-us.net>
 <36091016.oId77RFrrH@marius>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36091016.oId77RFrrH@marius>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jun 18, 2021 at 02:22:57PM +0200, Marius Zachmann wrote:
> > 
> > Same there: Make userspace and kernel mutually exclusive if parallel access
> > is shown to be problematic. "Mutually exclusive" means disable userspace
> > access completely while the driver is loaded, not some cross-subsystem
> > mutex.
> > 
> > Guenter
> > 
> 
> For now I did not get a bug report nor did anyone seem to have a real problem.
> It is mostly a theoretical issue.
> I am not unhappy about how it is.
> Maybe until a real problem occurs, we should just do nothing?
> 

That would be my suggestion.

Guenter
