Return-Path: <SRS0=CmOj=7C=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B40C433E0
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 May 2020 20:03:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7C8C207E8
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 May 2020 20:03:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xxe8efaz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgETUD6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 May 2020 16:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgETUD6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 May 2020 16:03:58 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28747C061A0E
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2020 13:03:58 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id w19so1781081ply.11
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2020 13:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=k5nvM5760NzgL8aE0Bbqlvh9aiqEv9jLpMmDqn3ezaQ=;
        b=Xxe8efaz6qaJbI/qvcu2lCTMqaLVFMXOt4TVlfxpPuCl4x/QU1Dm0NQezCczLMrlg2
         4BXUSxwrtfsr6mA4eRvWzNMlPqJ0S3j5NSRGkcHM49H1AlbpPauaqQ+E9h6zyW16M3Sn
         5s9mhF+Gk35WL0yEIjdcgP7kK6tK9o6osgeUDaXowXcxHZltNLS5XgCKLmh8AK986v7+
         +Uw9Ko7cUrsMy23pRSQ3WGj6PKG6XlzOQgC0yzo2PxCzs0ZdTxudz9nns8ds2XDMBHdR
         1vEOsGOE6JcW49W96oEzGIiSyhpha52yF+5VeOMLOgrSVwAxWMjrb9aSGW+XqCWMkHWp
         /WTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=k5nvM5760NzgL8aE0Bbqlvh9aiqEv9jLpMmDqn3ezaQ=;
        b=rXql4DGbbQu61VCDXP59f2HRG9/YTHMes/LcT9cHLenpuLo/EmDGOTOap0LyPAdR7L
         KWuUNiSdZ6c1Vx/hNKBbziHsxl9wvT3S3bfGivKYAs3RM0mwYjDbF3UvRmf/qCZgx+oK
         kOR4aFkViNo8LptVKnL43AKXtO33uMBjPix8ygeGLvWxqPdPSHl/d4QJq7cv96BU8pqh
         ljcyttv14CEkWjMgWyPgoGBB7v5NjkwoKfQxHp/ma+K53lIb+ygNMsZ5BecaGoJDOz9O
         wZF3sX66vEcZfB7nPqLyfyTV3BA4w0T8ASatfXgg4AbqNPES6kpuMMqNjJLhzva6VoNX
         cJuQ==
X-Gm-Message-State: AOAM533LCqcdqzXov4NMw6uG4+ctvBBqywpdHWG/0NXcomHuw9LpuZpk
        TY06M4su7cooQcLFi6ECzaakJqcX
X-Google-Smtp-Source: ABdhPJyMWX7b40fZVZBI92gjhZ7dmUq5BxgtmK7Nfytawdqgb/wifF63dGjoQH5OI/r3yhGGXFQW5g==
X-Received: by 2002:a17:902:a511:: with SMTP id s17mr6118428plq.33.1590005037663;
        Wed, 20 May 2020 13:03:57 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x6sm2886695pfn.90.2020.05.20.13.03.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 13:03:56 -0700 (PDT)
Date:   Wed, 20 May 2020 13:03:55 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ugur Usug <Ugur.Usug@maximintegrated.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] MAX20730 updates
Message-ID: <20200520200355.GA258364@roeck-us.net>
References: <MWHPR11MB16617BBD8A8A85FCF99B909FFDB60@MWHPR11MB1661.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MWHPR11MB16617BBD8A8A85FCF99B909FFDB60@MWHPR11MB1661.namprd11.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On Wed, May 20, 2020 at 09:48:27AM +0000, Ugur Usug wrote:
> Hi Guenter,
> 
> I have a driver update for the existing MAX20730. Upon Google request, I added all other (not covered) device specific features (VOUT_MIN/DEVSET1/DEVSET2) via debugfs interface to the existing driver. I also add MAX20710 support which was a trivial job. I finished testing the driver on MAX20730. Now I am testing it on MAX20743, MAX20734 and MAX20710. How can we proceed? I can supply more details to you as well.
> 

Difficult to say since you did not actually include a patch or
patch series. On a high level, reporting VOUT_MIN/DEVSET1/DEVSET2
via debugfs would be acceptable, but not setting it (it would be
way too risky to let userspace play with such parameters).

Guenter
