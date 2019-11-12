Return-Path: <SRS0=vS6D=ZE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE16EC43331
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 16:38:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8131221872
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 16:38:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqXr6aKx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbfKLQiK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Nov 2019 11:38:10 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40400 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfKLQiK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Nov 2019 11:38:10 -0500
Received: by mail-pg1-f194.google.com with SMTP id 15so12199297pgt.7
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Nov 2019 08:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=bhtn3lzvolKqXh97Kffmxg++A6X6GOUuqL+ZVTIzCKk=;
        b=BqXr6aKxPxuV+51EzEhgJX0kgQVLVyj5Es0SYwaWNLCgQaTbMz8ysycSdHWw6ipd4W
         L8IAovlmg6lcx6xGperCCQCSWuMLziX3w51YMCZtrRLwIXVE0RNhqoAFN6D/jo/PE27i
         WBf5Zf157hay0Crbl2BFffAM9CawfFA+/3twcLNN4nKv7N8E/R86SXZYAU5shojYyeRO
         v+CUGV4+nc5bMR1sahMHFSQq4ld0E6giOUWYRV9k10FBtNYYtxXpM5RSEB8TzmEqZDMM
         nTAqoiavEowCVdk5FOc5Eav2AbfyHwG2EMOmvqZ03Gjvcs9syj9pp9QKnG/fKwBdvMjt
         e6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=bhtn3lzvolKqXh97Kffmxg++A6X6GOUuqL+ZVTIzCKk=;
        b=jMs5tn5QVMulXly845y0Sp/g+2Ly41/LJTnhqOAecNH4TUIFNAsUF1yYjvM8K9rLLW
         hkedq11BSLBNaWomJbzD49mbdJgYkQ4Z2yMFwn6FPkVhHjjNJv2V7Z53E9i1EiSY1CB+
         xriBgTls8BkJ9/MpcI4DwjydUgkmmkH0tUXIdGNllaq1WIGsdkVHyPLRQwN7VSB6R3ID
         bwDEKoPdnBvLvgwbJuKmcRftxtr4TvIdck49NjwDXxrOmPg3pJ/DMD7J5e/K6uJFAwo6
         sFpadC0W5a0HGQvCKGiMJyUtTLigGj0Jtls+u+3wEs0+o6Sjib3Wz4M7Sy8hKDslDQVD
         3qIA==
X-Gm-Message-State: APjAAAXdvGLBJLXTNclCIgKqReLHf5TBGHpGBgMiWp2lo/n8g6sv907w
        bSfywMEDpiazjQDi144OS84=
X-Google-Smtp-Source: APXvYqzlG8u2+9CdXvCmHiQvb4t73g6DMBNDkHZ3pIWG2si5Gmd7NX33g3/ooudQqutaU+IMf0XyEQ==
X-Received: by 2002:a17:90a:98d:: with SMTP id 13mr7648897pjo.98.1573576689140;
        Tue, 12 Nov 2019 08:38:09 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z10sm10497810pgg.39.2019.11.12.08.38.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2019 08:38:08 -0800 (PST)
Date:   Tue, 12 Nov 2019 08:38:07 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>, linux-nvme@lists.infradead.org,
        linux-hwmon@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
        Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] nvme: hwmon: provide temperature min and max values for
 each sensor
Message-ID: <20191112163807.GB26911@roeck-us.net>
References: <1573395466-19526-1-git-send-email-akinobu.mita@gmail.com>
 <20191111165306.GA19814@lst.de>
 <CAC5umyi97UJZzk+4soD+th0BZ71WfnOqnTWWuTYKyo6aWTdLXA@mail.gmail.com>
 <20191112142127.GA11580@lst.de>
 <CAC5umygX=uBQsWV8O=9NL3HeVNo_iMcq7BE-vA-wpQtyU5iV3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC5umygX=uBQsWV8O=9NL3HeVNo_iMcq7BE-vA-wpQtyU5iV3Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Nov 13, 2019 at 12:00:22AM +0900, Akinobu Mita wrote:
> 2019年11月12日(火) 23:21 Christoph Hellwig <hch@lst.de>:
> >
> > On Tue, Nov 12, 2019 at 11:19:46PM +0900, Akinobu Mita wrote:
> > > OK. I'll add two macros.
> > >
> > > #define MILLICELSIUS_TO_KELVIN(t) ((t) / 1000 + 273)

DIV_ROUND_CLOSEST() ?

> > > #define KELVIN_TO_MILLICELSIUS(t) (((t) - 273) * 1000)
> >
> > Can you add them to linux/thermal.h that already has similar
> > helpers?
> 
> Should we add a new linux/temperature.h so that any other drivers or
> subsystems (including thermal.h and hwmon.h) can use these macros?

Good idea. I don't like the idea of pulling in all of linux/thermal.h
just for the above macros.

Guenter
