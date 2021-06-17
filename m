Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD10C2B9F4
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jun 2021 13:14:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 411E86100B
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jun 2021 13:14:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231552AbhFQNQM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jun 2021 09:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbhFQNQM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jun 2021 09:16:12 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9759FC061574
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jun 2021 06:14:04 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 5-20020a9d01050000b02903c700c45721so6063988otu.6
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jun 2021 06:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KaVyuEQYC4RRRunggcCeQecE8bs5FXpwFN3gaH39q9g=;
        b=tiC4qKRHAmREQGk0tvIG5enZ9t6uIPNe8pfRInJ5/MU0ybVcJ0EUYNTk98fUGBF6da
         GaGhHqaCqqZYHxJmR4VxH23ejwLQjEioYTKn81Z5U3p1WpT7TEHl5yewLq52DMPiqdgh
         Mm480xjCyAp9+Lz3DCYO/RbfPK0n39v6aEkUz1xCO2xEDEGq73/Kjpy3awpv0ahmswfO
         p1pAQaigciRVwLAunQAQtq8VzPMBOHpQDRQrKYl7H7RD+Ia1i7hlVeRNj3AmHNKUpob4
         iZdMxabPjjT0jJKSEszETUUnG+Q4o1mZdoeSHlMem9ZQ9d9nIGq/H+YaWOAgNHwTdRrB
         8zUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=KaVyuEQYC4RRRunggcCeQecE8bs5FXpwFN3gaH39q9g=;
        b=uFBAd+O9mF+ytmloyEXPgCbeNG1sdHSz3eEoNvdTTrniwF7iuJj0z4BYjUySR4+dNO
         hbPVrBzPU37IOv8l2wUtkCzYu8M0j02N/P5F84YjAiMJVujO0A4vGYcufwIAGRmdZClk
         /wxl/oxvVdUlKwkZwxS//jaVheB5iG5CVqg+YEzyASHaQn2x0nwKBfYcOfAVM0vfW/6e
         zp/aCr4WTsfU+I36vEbpDh3prl+Ha/t3buKoWD3cy3qlvl5jNLp+EczEvRFeu11lm1L8
         kki8pFdblc2mq2gGrmWRddEhTytKXxPyrJm1Pq1ZZA9ax3bnOPx1pR/MXLY51KQzl/ch
         JGKw==
X-Gm-Message-State: AOAM532iyZD4BYenLlpo9IGPtVgWEJxOm5LMqPMc3TCp1fFTjiKFsHW2
        KI/CILkJ7aCf3HjEC6zTbnM=
X-Google-Smtp-Source: ABdhPJyJ/Ypvdk4ql8JPq/j7LtRvrqyl7NLydjLF9PXyLeO6QFetQQAhf7xAu+iqqRcHsVLX1L3rkw==
X-Received: by 2002:a05:6830:19f4:: with SMTP id t20mr4635889ott.103.1623935643968;
        Thu, 17 Jun 2021 06:14:03 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 3sm1278765otu.52.2021.06.17.06.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 06:14:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 17 Jun 2021 06:14:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Aleksandr Mezin <mezin.alexander@gmail.com>
Cc:     Marius Zachmann <mail@mariuszachmann.de>,
        linux-hwmon@vger.kernel.org
Subject: Re: corsair-cpro and hidraw
Message-ID: <20210617131402.GB59767@roeck-us.net>
References: <CADnvcf+LhxZoZk9eRUahSWZ3xVJLkxcAt3+4dS-JCjV8gZE_0A@mail.gmail.com>
 <2199169.9u6qy3EJ5v@marius>
 <CADnvcfK1EzyXY83wd7CJYpZ=S9+KnT0ftF9CiYhJScBGXKmm5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnvcfK1EzyXY83wd7CJYpZ=S9+KnT0ftF9CiYhJScBGXKmm5A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jun 17, 2021 at 01:11:38PM +0600, Aleksandr Mezin wrote:
> On Thu, Jun 17, 2021 at 12:27 PM Marius Zachmann <mail@mariuszachmann.de> wrote:
> ...
> > I do not know, what your device is doing
> 
> Actually, NZXT devices (at least grid/"smart device" and "smart device
> v2"/rgb&fan controller) don't have such issues - they use report ids,
> and don't even expect request-reply communication pattern. I've just
> noticed that something seems to be wrong with corsair-cpro (but
> somehow didn't notice the comment) and decided to ask.
> 
> > This device uses an echo of the command
> > in the answer and if they don't match it returns an error. This could
> > maybe lead to a false error when the replies are switched, but is
> > probably preferable.
> 
> Hm... If the response includes the id of the request, it should be
> possible to filter reports in raw_event, i. e. don't signal completion
> if the report doesn't match, and wait more. Yes, there is a corner
> case, "if a command is not supported, the length value in the reply is
> okay, but the command value is set to 0". But timing out (250 ms) in
> this case should probably be fine... Actually I have a compatible
> Corsair PSU so maybe I'll send a patch.

Patches to improve the situation are welcome. My understanding is
that with the current driver users should disable the kernel driver
if they plan to use userspace tools to access the device.

Guenter
