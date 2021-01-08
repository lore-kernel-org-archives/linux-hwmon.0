Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9D3C433DB
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Jan 2021 15:38:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D305423888
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Jan 2021 15:38:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbhAHPhr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 8 Jan 2021 10:37:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbhAHPhr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Jan 2021 10:37:47 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC8FC061380
        for <linux-hwmon@vger.kernel.org>; Fri,  8 Jan 2021 07:37:06 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id p5so11726841oif.7
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Jan 2021 07:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fd8kZJWpqcPnORegzcJGb/5TBMLMqUwz8EYC89qCmXU=;
        b=T9B46iUFJ7rGJ047KunuiN2rwgGhonACI90Mpcok+wdeGLl2sozGVR3qsOxci+2RSX
         7wDIaLZN302QL/9gZz5ZXLm4LDcec/J/LyrbL0TFNV9RGFeyADsu1z7Iggtyau6V1f1f
         zUOu+yOXzEmsULYCFeq+lYMIGtL8KvvyUq2HxVC91r1mRjKVeVunUNLblZqcR5c8Vlto
         M4051s7GKutAqmRJmbDes2/5NGbKMbAf5scaK2nsGSV1hp1WlWzGCufeBt6Xo3FT72ct
         dKy9iamJvJ2BRGfL8aTWKQ9tYpuFJWyzQCgeZ7d1WB12bSNI0xnBexFmjR0choURBBl+
         M2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=fd8kZJWpqcPnORegzcJGb/5TBMLMqUwz8EYC89qCmXU=;
        b=NNVIA+Y5wrFMnijPlExU7i2HMGKxW93y+t4Z8t3XxI38N02DfM3C1TqwLbiT2925s/
         ob/M4oFVrhspHUBayuddhV9HYrHjf5uzlPl03lksNJjcw6nDn9Hru8aicdSw19uXAANp
         pfSJ/T2zTAEEV0uzo0Mv+ZZKMYUDUpmLf2ANyQN2l6UL2JjG4TLW/vJJKzth5r+0JiOl
         jcNeqaKAbRm7ss+goV4/nBco2dpWLUJL924rHnjQV+YfgZdV0EvSxCmcMhLUDjOB1KlJ
         H+qkDTmQf3fUz+FekIWNs7yzCKf2dy65fZi4i9L5IH5/Smm3Fzb6l9VZIlZfxvyEOeTR
         AQSg==
X-Gm-Message-State: AOAM533iZm4f5lKfGhKG8amdHZxt4aicQFogzZw/CCKYSLOaOqqoTzhW
        KxBr17TlI8c4CKsNoOVN0Sw=
X-Google-Smtp-Source: ABdhPJyCxlkGWrVSW2CprPAzqYSKMAwo79deqWORddwIqgLBhAMe3cu7hVORVr0GKJjlhuDA+kQLVQ==
X-Received: by 2002:a05:6808:7d0:: with SMTP id f16mr2705242oij.109.1610120226251;
        Fri, 08 Jan 2021 07:37:06 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z3sm1813448ota.80.2021.01.08.07.37.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 07:37:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 8 Jan 2021 07:37:04 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (it87): Switch to using the new API kobj_to_dev()
Message-ID: <20210108153704.GA28799@roeck-us.net>
References: <1609377535-29964-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609377535-29964-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Dec 31, 2020 at 09:18:55AM +0800, Tian Tao wrote:
> Switch to using the new API kobj_to_dev() to fix the below warnning:
> drivers/hwmon/it87.c:2293:60-61: WARNING opportunity for kobj_to_dev()
> drivers/hwmon/it87.c:2161:60-61: WARNING opportunity for kobj_to_dev()
> drivers/hwmon/it87.c:1984:60-61: WARNING opportunity for kobj_to_dev()
> drivers/hwmon/it87.c:2129:60-61: WARNING opportunity for kobj_to_dev()
> drivers/hwmon/it87.c:2232:60-61: WARNING opportunity for kobj_to_dev()
> drivers/hwmon/it87.c:2068:60-61: WARNING opportunity for kobj_to_dev()
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied.

Thanks,
Guenter
