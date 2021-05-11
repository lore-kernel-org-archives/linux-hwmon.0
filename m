Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28435C433ED
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 May 2021 13:29:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E68CD61159
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 May 2021 13:29:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbhEKNaH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 May 2021 09:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbhEKNaG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 May 2021 09:30:06 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5DBC061574
        for <linux-hwmon@vger.kernel.org>; Tue, 11 May 2021 06:29:00 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso17470872otn.3
        for <linux-hwmon@vger.kernel.org>; Tue, 11 May 2021 06:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8lOF6HHXOlHYW6Lh4rBQlqDNDVEwVDilbN03894wQXI=;
        b=NtBuMyU9CVmUzOc9seLCn1pniXAKbwLubsGiCQsIWGUYbP/IOxmh4K0NFx3YmSGDwo
         FvopB8Ayvb3y0RzMrh1t/RFDK7ZcCnMo+NROthSAgat5spHB3kG6iHwQ5IEJpkgCU8/e
         xy8HWafsyLwP5JUQ3HLL6IzzYkLwmUdjv/NGcC62252GUQTQehUymzBgLmdAWPjqwntu
         lo6AsqNkkUnZsMcOYf0Z0Ccbf50IPEbRkhMIuJtPsIw+CBEVo48k4Mpf9l2bGYcdgOeK
         oBzhkwxBNWYo/YXJxCJWABHFz/iB+iPLTGJPlwNofCNvQ3OynXojMfplF4eUvgAFJ/o0
         q5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=8lOF6HHXOlHYW6Lh4rBQlqDNDVEwVDilbN03894wQXI=;
        b=lG2WGcW0mu9SIiKJ0PYPrPlaPZx505kFdGl4ukduisT+ygGRf+IYfE07ecX6riITRk
         FtsZZD+KpyvvLit81Q1nJzxwiK8Sp5KmEDLEPWSkc5akk3JQamn/q2nPS13nH4jFhiPI
         F4SdJnY7wlf0YbcDZxRUw7xAWyvgKHofEFulc4j3oTh9eGqrtdlhf86jXdUL1AXqG9Wp
         12CfoTcQ8hfdpxGME2ukMIVH0+aRi88YMr801nTbWSCNyysEXLZON13ZB0fn1RlBs4ok
         fUnsWHuXmfNk2upz+NF8xvUQOZ6RQEiBxN8tlhMHgAB4sbJF2DCmnRYHokkQPNS9BOlD
         JvIg==
X-Gm-Message-State: AOAM5326waNvP3Xp0S2w6U2xIdG2NAVolB1AwXQLyYuwq9cnd/gEOjoQ
        aRYAIs7s9K4Ts0MuRqcYrOA=
X-Google-Smtp-Source: ABdhPJye68EizX0tVR+Qrn7Bjp6M4KasQTa9nLXCoOjj+EkJIM8LorO0oZ0KSK2cThHhSGgHjWUk9g==
X-Received: by 2002:a05:6830:4111:: with SMTP id w17mr26751325ott.99.1620739739800;
        Tue, 11 May 2021 06:28:59 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h9sm1795651otn.56.2021.05.11.06.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 06:28:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 11 May 2021 06:28:57 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        linux-hwmon <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 1/1] hwmon: (bt1-pvt) Remove redundant error printing in
 pvt_request_regs()
Message-ID: <20210511132857.GA2699771@roeck-us.net>
References: <20210511091843.4561-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511091843.4561-1-thunder.leizhen@huawei.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, May 11, 2021 at 05:18:43PM +0800, Zhen Lei wrote:
> When devm_ioremap_resource() fails, a clear enough error message will be
> printed by its subfunction __devm_ioremap_resource(). The error
> information contains the device name, failure cause, and possibly resource
> information.
> 
> Therefore, remove the error printing here to simplify code and reduce the
> binary size.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Applied.

Thanks,
Guenter
