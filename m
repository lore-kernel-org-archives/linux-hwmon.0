Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7672C433E0
	for <linux-hwmon@archiver.kernel.org>; Sat,  9 Jan 2021 02:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7457A23A9A
	for <linux-hwmon@archiver.kernel.org>; Sat,  9 Jan 2021 02:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbhAIC5C (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 8 Jan 2021 21:57:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbhAIC5B (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Jan 2021 21:57:01 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A36C061573
        for <linux-hwmon@vger.kernel.org>; Fri,  8 Jan 2021 18:56:20 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id j12so11693136ota.7
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Jan 2021 18:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dvzu6S+BgtK46FA3dOztq7gaSRVZQRbAjlLvWPCPW9E=;
        b=YaezcLZBF+x9DhewIlSbK2RhH+sI8oG/pn2e0N/DylwW1EfRP+Eji49goqDR5Bgx92
         6tmCKwoiC1yaumVMGBjO+P26PZ2fgdACON6TaLiyAz2jvgzsOFxNTr8GbUtEDfn9FgIY
         97v8jv/y7DEoVNgmoz7GN0jhFv5OGut+Ifgzp6du0TW86FeYEg3c3x0cxW2FbsSWMmbu
         Y3DbGxFcP1FDrgaXVIQ5NIHDQcdZuHab66WMJLNgiylU7gnvGoNyhot4fuQx3C4+EF2s
         5uGMJpH5R0ruWUtJ5FvCR27Aonu9FU/dZxupyO0RoEOUscwqeXvqpEVcuDEzyPIwjfbh
         XWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=dvzu6S+BgtK46FA3dOztq7gaSRVZQRbAjlLvWPCPW9E=;
        b=fq6bBYbHyWwd4+m4dbYxYbz8BERHzrjQkQ60WJisJoNxY+BoB86NscBO9fIapO8J1z
         ZdjMae1kCCzyg6LAqZOl132ZVFkKHjDD5Ot6dChzI66nj5kdx1Z3tFoNcQ0YLdgvhGZW
         PDr7Idf1PjAxOy9zBintARgSJP5x4VYqfMewRMZouF9jk/n22A5gZvdEqNx6qFR8I76X
         YYCLcK1CAcOIjGPNVEWJfvAp512qpK0lSYxRp/pKUeUSgCP3z1pU+THXCG8uS+OTO/fG
         Vi3fkXdIAliMe0wiMdBJ2nKJAt5l01j9kgzPrAX90cX3lh/w6zYc2fmzWFhLk9Z0Xs7g
         BjkA==
X-Gm-Message-State: AOAM532nLXJiCVAlfBPKx/wJMbiB573TdXQYwlAwCgzOICiqguaVnIvm
        NxvX9tz88mpsMtftL8YjOQLJEpMvcFI=
X-Google-Smtp-Source: ABdhPJwWlG7PRBlLg+9/qOiKkc1p8fxBvQMK3/Z93MTjERqLpDPTukg6EX94gvdeghAfawdew68VYw==
X-Received: by 2002:a05:6830:1e0c:: with SMTP id s12mr4534465otr.152.1610160979390;
        Fri, 08 Jan 2021 18:56:19 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t24sm2388406oij.7.2021.01.08.18.56.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 18:56:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 8 Jan 2021 18:56:16 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (it87): Switch to using the new API kobj_to_dev()
Message-ID: <20210109025616.GA52086@roeck-us.net>
References: <1609377535-29964-1-git-send-email-tiantao6@hisilicon.com>
 <20210108153704.GA28799@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108153704.GA28799@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jan 08, 2021 at 07:37:04AM -0800, Guenter Roeck wrote:
> On Thu, Dec 31, 2020 at 09:18:55AM +0800, Tian Tao wrote:
> > Switch to using the new API kobj_to_dev() to fix the below warnning:
> > drivers/hwmon/it87.c:2293:60-61: WARNING opportunity for kobj_to_dev()
> > drivers/hwmon/it87.c:2161:60-61: WARNING opportunity for kobj_to_dev()
> > drivers/hwmon/it87.c:1984:60-61: WARNING opportunity for kobj_to_dev()
> > drivers/hwmon/it87.c:2129:60-61: WARNING opportunity for kobj_to_dev()
> > drivers/hwmon/it87.c:2232:60-61: WARNING opportunity for kobj_to_dev()
> > drivers/hwmon/it87.c:2068:60-61: WARNING opportunity for kobj_to_dev()
> > 
> > Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> 
> Applied.
> 

All error/warnings (new ones prefixed by >>):

   drivers/hwmon/it87.c: In function 'it87_auto_pwm_is_visible':
>> drivers/hwmon/it87.c:2293:23: error: implicit declaration of function 'konj_to_dev'; did you mean 'kobj_to_dev'?

Now dropped. If you can't test build your patches, please stop submitting
them.

Guenter
