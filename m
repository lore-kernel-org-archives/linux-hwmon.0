Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252C0C4338F
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Aug 2021 19:40:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06D5E60EE8
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Aug 2021 19:40:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240242AbhHCTkd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Aug 2021 15:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240199AbhHCTkX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Aug 2021 15:40:23 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88E40C061798
        for <linux-hwmon@vger.kernel.org>; Tue,  3 Aug 2021 12:40:11 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id o20so23455oiw.12
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Aug 2021 12:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VJzbVUXjEEXSNFsn6d4Y5Bet2e98pBDpP8bi4LGrlHw=;
        b=RDUAidnkw1E5gTNPEPHyhk5nJSGP/0lq/DBpuUHxNP2RYBJ4H1bIGAZlkg+d8LRjh/
         HruNuvpSsrL0BiN+N8tkSFSR00mI1hGsjVd92JMsys3zMVAkcVSlbZ97yzo9p4I2D4Ol
         smxwDQI2KLfDyzKQPPmnvIEogq3DPUxqK+K+CefdPCfAmVlJDs44q1g0kbIm4oEa72yw
         zCK7nYIcNRWjGlIkhC7E1nknu/+fZ+ly75Jm1zqiiZOwlGgRcXscVMOY512MOdF7GMf9
         rx/0PGeSr1A6JH8e9GpO6jKMGBI6fHjE4BMVjSJom5PvvK0mMeYNvr/r/voWH/78b+x/
         OlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=VJzbVUXjEEXSNFsn6d4Y5Bet2e98pBDpP8bi4LGrlHw=;
        b=mbO7IOQoLG20IjU9vXWbg/+yYXxF4bedA8T5uj0XKG1xivFljDdotwBMqn0C5Q4qKk
         aZWY+m0dLi5PwCY0FF7fDj7UBrcziCmxQOovqZ9iobaCWXQ/1YHqJyf/A2AFwJ8TqjK+
         u0atk4gMNK9Rk5/gNvFVIGHleampal3EeJmyeYmPVCms964kQMalay05DAq2YP4T4Tk4
         UKmOdSp0u/Envek7GF6FQI9QMODdrKep2u2fKeN2DqTwD6MFPliKFSRdAYEh5yXHJEMI
         ELSN9FM4bQdI/j4wSNxabbHySjLmPUsWDSXlRki0vQ6GFMAKtVXyC75JtaiAUsrpt57S
         xymQ==
X-Gm-Message-State: AOAM532wAwju9yiqdhe3vkQ6DK7MOyYFyF+kl5zu2qMhDKm/N5S9Yv/K
        Q/THbcrkPavyGpps1iU1u/y97+br110=
X-Google-Smtp-Source: ABdhPJz1FxpeuPwTzZyJyW5pxZXrIgQZQyKrfFrq9XxIar2dSju/9A2SY45dq/RKOzvrG1INRGk6hQ==
X-Received: by 2002:a05:6808:144a:: with SMTP id x10mr15874470oiv.82.1628019611025;
        Tue, 03 Aug 2021 12:40:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w3sm1857954ooi.14.2021.08.03.12.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 12:40:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 3 Aug 2021 12:40:09 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (w83781d) Match on device tree compatibles
Message-ID: <20210803194009.GA3055927@roeck-us.net>
References: <20210729230543.2853485-1-linus.walleij@linaro.org>
 <20210729230543.2853485-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729230543.2853485-2-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jul 30, 2021 at 01:05:43AM +0200, Linus Walleij wrote:
> I2C devices should match on the proper compatible string.
> This is already used in one device tree in the kernel (MIPS)
> so let's add the matches.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Applied.

Thanks,
Guenter
