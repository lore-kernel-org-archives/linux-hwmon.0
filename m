Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A6CC433DB
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Jan 2021 15:35:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6469A239A1
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Jan 2021 15:35:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbhAHPfd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 8 Jan 2021 10:35:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbhAHPfc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Jan 2021 10:35:32 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE11C061380
        for <linux-hwmon@vger.kernel.org>; Fri,  8 Jan 2021 07:34:52 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id d8so9991457otq.6
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Jan 2021 07:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=C3YP9u3buB0qacNeLmH7//35l62Dv7XIXbK4jxqPEH8=;
        b=OSegogdb2DRks0kDFSrMFXj8iRaGH1rCfAV9cmTV5+vD4KlgyVbu5eLXMR6qZtnayZ
         RQG2uiVeoWkNfVqBAoQYz4VfAVMUT83v+Xq0/Z0nocuFfqYD8zPiSF4cPqIDvVZdqJIV
         gFZF5yQaRyYPeRMmGkjTp1SMtx0LYWH3QV6U/wXD8aUeEHDu+Snkx/qd/B8v7llbblsa
         KEKt4joXCYZ9xieyP+OAi3q2D/HhaFM2dqKVYjr/lAN0T5FzUgVI26M1MCzNxDgcN+KD
         7YK0eTvmcpacoHvmhygKdijCS0q1Jh2Nwi/WJiS+99lwnMJt0uHZwc2Oeol1Kv+venCH
         kiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=C3YP9u3buB0qacNeLmH7//35l62Dv7XIXbK4jxqPEH8=;
        b=hTGFyJCEJchioHBheSXqcW5BRtxYcwcQLlDASWO9FfgPPhut+xEAePFSt2W66P9Xhx
         qR2JHEowIhDpdCMiZW/KxxEBbnOfePC3bs69P64+LCIUAKH8m8xrsmaE+roH5SdxoY/7
         zKrGV3ANiHtfbaJBeBDNFsw87oel59oRcqskW5fURVmqBndH/+I7mrcAZu5332f1sqbg
         /tbaOCuqlVctDJgVQHjnAGrw8fytL4gxupPe+saLyXJPs5/1Fa7N/lpISTZr+2ZKkfop
         RqK2x0TojY/ssJKJ/1hsEpQdaTPA3Lsopj8GLjiOu5c0vdUAq2Y6jogIOtUnmTaxlcwb
         2Vkw==
X-Gm-Message-State: AOAM532PHegFyJQqehzQA1XdUbbGGSSdAyadPrR9X7h2YvNaD0lZtymR
        4+e7IlF9ik2Dfe/3v+J527I=
X-Google-Smtp-Source: ABdhPJx1ZHIt+W8g+wNwOQSZNB1A4Cch28oIs1bnXkMgg7kTp0IjRSuZ+y6/tqHXqySEe0LJFIlTXw==
X-Received: by 2002:a05:6830:160f:: with SMTP id g15mr3026822otr.129.1610120091980;
        Fri, 08 Jan 2021 07:34:51 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q18sm1783173ood.35.2021.01.08.07.34.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 07:34:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 8 Jan 2021 07:34:50 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (max6650): Switch to using the new API
 kobj_to_dev()
Message-ID: <20210108153450.GA260273@roeck-us.net>
References: <1609376621-46463-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609376621-46463-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Dec 31, 2020 at 09:03:41AM +0800, Tian Tao wrote:
> Switch to using the new API kobj_to_dev() to fix the below warnning:
> drivers/hwmon/max6650.c:324:60-61: WARNING opportunity for
> kobj_to_dev().
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied.

Thanks,
Guenter
