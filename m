Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6509DC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 20:13:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AC26611EE
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 20:13:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235196AbhIPUO7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 16:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhIPUO7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 16:14:59 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA17C061574
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 13:13:38 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id n2-20020a9d6f02000000b0054455dae485so4612070otq.3
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 13:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WSi2TxvGMpqzFS5/ngCUTvFwz2rlcORIGd+cgG+Y/Ko=;
        b=hKoMg04XBDQWtylX5X+Jr23tJv8EakDjp8UC0mz5+WPP/oZSCNo5ohymsNEM/Dp6F4
         5AGEZhF7juIVF+sWVCBIu9hhBbhtceAt11xaOJLfZsm7d/f1CYGqTuyd+2q0OXN8U5s8
         bi+rI1lzYKKy9o9vMKN8gYTzEOoJ6vyru9gmNgjrb1SCclTT7YMAT1TBGt6sFzpm60e8
         7EkxBt8WgO/x2mDKssdixSd7QAnQF3puQsdWPtZ1SBesB3PdRMlz5umie4pB6/xwf14D
         1/GY93aB4/AW0HjnOksqmd9DjYCpUOXEl+1K4EZbxCUW+bYv7d0IUqvFyZ9EZI7R/C1E
         bIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=WSi2TxvGMpqzFS5/ngCUTvFwz2rlcORIGd+cgG+Y/Ko=;
        b=LzFmk4BFI22SjmpzpLllGgpnQQQA85DpxVUWZqtp+wuSdnzkxmFnCfN2NUjJ9pyXWz
         UGGw8bTUdXUaZnRHfGseEAoaCRVa7fUMlKbXY8On0krdpVYVLt+FQ7W03so2oYH3Nzpr
         8gQ9Ji5cVO1h8e+Zi69pOVugmAy76gROxupIn0wK5zpMJ/5xIOoxNSWU6xjUxe4zuZec
         ADezcNZjRGLZG3C6LzhV4/MKu0rveYA8f5vUGknqfwEJ0w27dlSrkHAzZhrCiWih4IIl
         bExDLDeDIrX/lFTzM+y8Rz0hlgNL6UiysR/MZan9IHxZ+BigsX9fsy4bQPUWIYwy11+V
         +/Ng==
X-Gm-Message-State: AOAM531ZT8OMKwNk03yDhdSZO3rG9qbiAmgjAL+QTp0ArjDDRejBIBAC
        uR1nzfGV4/nFMv5jtZX+Jdk=
X-Google-Smtp-Source: ABdhPJxYU7+oXR29Lnxgqt07vl1l1ptU0MrSYa1q+wJ4PjDbFaqwGQs5gTM1mL2rY7PSEqZ/1x/gtw==
X-Received: by 2002:a9d:3e08:: with SMTP id a8mr6386693otd.155.1631823217729;
        Thu, 16 Sep 2021 13:13:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j8sm897071ooc.21.2021.09.16.13.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 13:13:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 16 Sep 2021 13:13:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH hwmon v3 1/1] hwmon: (mlxreg-fan) Return non-zero value
 when fan current state is enforced from sysfs
Message-ID: <20210916201335.GA1942947@roeck-us.net>
References: <20210916183151.869427-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916183151.869427-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 16, 2021 at 09:31:51PM +0300, Vadim Pasternak wrote:
> Fan speed minimum can be enforced from sysfs. For example, setting
> current fan speed to 20 is used to enforce fan speed to be at 100%
> speed, 19 - to be not below 90% speed, etcetera. This feature provides
> ability to limit fan speed according to some system wise
> considerations, like absence of some replaceable units or high system
> ambient temperature.
> 
[ ... ]
> 
> Fixes: 65afb4c8e7e4: (hwmon: (mlxreg-fan) Add support for Mellanox FAN driver)
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied.

Thanks,
Guenter
