Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C4FEC433FE
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Nov 2022 02:41:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbiKGCl6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 6 Nov 2022 21:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbiKGCl5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 6 Nov 2022 21:41:57 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B78B654B
        for <linux-hwmon@vger.kernel.org>; Sun,  6 Nov 2022 18:41:55 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id m204so10865311oib.6
        for <linux-hwmon@vger.kernel.org>; Sun, 06 Nov 2022 18:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxZ+k7gdIji03RCQaZ41likzUEk0OuGwS76cc6ZNWEQ=;
        b=pDPNUzn1EI3qtOpdkjgnI0HwcCRAjOjtJgCAV+y+15tnnrwfuWY6+1SMa4PKhjF2Hl
         dQHgTihpXnAy5nmGO8JNInnp1uXuDwyf5txW6mB6ZEyZPq+rFiTUzl0yVo/POOJJgamQ
         WOknwxb35Aval5EGVzCWDic1s06yvpHJz4xJJ8PxRs/UYRZjvlqGf+DxbvOpuk6UdQLt
         eZwoLwZtUO1USu9mJ/sDyWVQsiqgTurNAP3ZO1Fk2S9dBCr6EZQbY2MvmcOSXcxVGxsb
         gEwIFZ0zXq9Ozwp8/fsBaqjezGlPTG4g8t0Qpjy31jhIgisJ/hb+86v/U3qrBdhrz5CP
         hqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxZ+k7gdIji03RCQaZ41likzUEk0OuGwS76cc6ZNWEQ=;
        b=yHy8rBS2gsQtJRHyS4pJVu2/3DeHzYY6cloIW+UpxUD0ZF5wSvhWM6EbHnZpgQ3+qB
         xLJkb//Epmq9y21FsdUUZEUkYiOifnv1ZQ6sza6tuhsGh+6w5O/JFpsIL97lZt/ApFid
         QXBFSwzn8mGziBvK8dMwxmmTY6zORCTzMP51HjNb51v/2ZpLDFX9TdMEOkkSZD6p0pEK
         VvjqhQuOSHS0OCZf/m9hvk/HHd5Ty/OD5oOQ4WhH2gATfFhp/gnX2jsBZblytro4o6r0
         9P9GENj/UBx8bytwuWCRCjEp5U47fZdHskeDa7uvad2uPDaB0cdEeIv0l+ngsQLvZgpC
         D+SA==
X-Gm-Message-State: ACrzQf0oLxViFyaZdKCyTrlgpytS3TY+jT57Ysxld49FSzPyzi629wF7
        Su9rBM5Hq7DXzvrZ8MQiBYtRqqRr7b0=
X-Google-Smtp-Source: AMsMyM4dg+UHjL22PVkJ4fT4Eh3mVcxKIBxrQELtHEeVdUYV1PxhJIHz7cPsnlryiGpKwjhumnoZWA==
X-Received: by 2002:a05:6808:1247:b0:353:4258:718f with SMTP id o7-20020a056808124700b003534258718fmr25863376oiv.155.1667788913319;
        Sun, 06 Nov 2022 18:41:53 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f18-20020a4ae612000000b0049052c66126sm1844170oot.2.2022.11.06.18.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 18:41:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 6 Nov 2022 18:41:49 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marc SCHAEFER <schaefer@alphanet.ch>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: Power measurement wrong when idle
Message-ID: <20221107024149.GA977242@roeck-us.net>
References: <20221029123338.GA11915@alphanet.ch>
 <532f711c-6566-8a69-a199-4753bd24111e@roeck-us.net>
 <20221104105257.GA8083@alphanet.ch>
 <20221105143119.GA27879@alphanet.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105143119.GA27879@alphanet.ch>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Nov 05, 2022 at 03:31:19PM +0100, Marc SCHAEFER wrote:
> Hello,
> 
> On Fri, Nov 04, 2022 at 11:52:57AM +0100, Marc SCHAEFER wrote:
> > so far I could install a 5.10 kernel on buster (that kernel contains drivers
> > and some firmwares, in form of .ko).
> 
> I just compiled some stock kernels from kernel.org using make bindeb-pkg
> 
> The results:
> 
> 4.19.260 HAS NOT the bug
> 4.19.264 HAS NOT the bug
> 5.0.1 HAS the bug
> 5.1   HAS the bug
> 
> If I understand it well, 5.0.1 is the first ever 5.x kernel and
> 4.19.264 the latest 4.x kernel.

Unfortunately I don't find a relevant change between v4.19 and v5.0.

The only chance I can see would be to bisect between those kernel versions
to try to find the responsible commit.

Guenter
