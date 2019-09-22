Return-Path: <SRS0=O0xC=XR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1AFC3A5A6
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Sep 2019 19:54:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED4B720830
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Sep 2019 19:54:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ze3Cg9fo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389586AbfIVTy5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 22 Sep 2019 15:54:57 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35664 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389396AbfIVTy5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 22 Sep 2019 15:54:57 -0400
Received: by mail-pl1-f194.google.com with SMTP id y10so4209908plp.2;
        Sun, 22 Sep 2019 12:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=58rz5lvZVLhyd3Zg5tFeoG2i1LxHbdCzbi0Xwdg+Hv0=;
        b=Ze3Cg9fo3n9ot13AgjjPA7VlZdKL+jZ9Q2MWl5do8JiKX3agJLQf50Qha3TMGaFSkg
         SSOx542vRNfNK8spCVle+bDR78FFgrz8Aw224KMkujysLKciSMW5vVahPuPMAoekxOZj
         I/Y2WkgwBq4iKsx0NvGqGQnABaTs8WIEyw/enRk8U8+yaG1rkRTYmnMzIvhG/LYtnFF5
         dhW7uQzDv6lypd0pT5a9claAMPeeI7vgFs8gbLOM7kkmmNRatjIeoqJyZh94hXGmlglH
         PKM3k7JBdOMfLr1WwJj29PDM2O7EmLERsjhQLTP5KIQBFsiJkg2H/1XybhoHLhmAyePp
         jQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=58rz5lvZVLhyd3Zg5tFeoG2i1LxHbdCzbi0Xwdg+Hv0=;
        b=Guj0MzkOVlAjvoMC5WOqO79zbedHLf3K6XnOE1U9a8hxRSvo/5Dkk2hUuucdMJpLKM
         9lMf07PvtQJkQScQdcCXDPHSfMHD/sbXw1bSbkRumebjPclxfmLI7M8ANi17Mhk7tGPI
         XRUoN+rhU3tzgNkp6bMvbWkALCh++p1u+lzZVsEQIg7NmJqrlWbeVA4AbL+qzhgbCtde
         GMDQ46u+2hR7JieN2WZC+06HS1ChUvMS6Bo8iYWECdjUHq9MH4hTjDH8YN/WGB1s1map
         oVk0FO7BhnMWoQzBlAIzLKFUHRpuOA8CNgU+JjU0e7Wy08tpXLp6NMI1OttHt29Run8k
         h4MA==
X-Gm-Message-State: APjAAAXQq3JwEEet+NbE7Vmju3trpT7juUMJYsKgSg0pvIhYvTqoI/UU
        g0JJulm1bs10i1etSvLex5U=
X-Google-Smtp-Source: APXvYqy0rB2eJoBS+CV0p4O9NTj3nfbrjzNJF/+o3iW0l95REhL6JCGCgorDF7ssy0ke5pQp+nuHAw==
X-Received: by 2002:a17:902:14b:: with SMTP id 69mr28362662plb.286.1569182094743;
        Sun, 22 Sep 2019 12:54:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y15sm10269662pfp.111.2019.09.22.12.54.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Sep 2019 12:54:53 -0700 (PDT)
Date:   Sun, 22 Sep 2019 12:54:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Lukas Zapletal <lzap@redhat.com>
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        Clemens Ladisch <clemens@ladisch.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] k10temp: update documentation
Message-ID: <20190922195452.GA24696@roeck-us.net>
References: <CAP80Qm2ORJ4cXukhH8oXeGv-C9LrADa1XyDuyq5LKeV_YaYxqA@mail.gmail.com>
 <20190921115752.GA22647@roeck-us.net>
 <CAP80Qm3ayVfh-pE2M5euTSf0Z0EJ3AvwTiK+YjM5xynEKH-g3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP80Qm3ayVfh-pE2M5euTSf0Z0EJ3AvwTiK+YjM5xynEKH-g3w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Sep 22, 2019 at 08:25:40PM +0200, Lukas Zapletal wrote:
> > Your patch does not apply to the curent mainline kernel.
> > What is the parent branch ?
> 
> Oh well, this is my first contribution. I used Greg's staging tree
> which I found in a first contributor tutorial on web. I will rebase,
> let me know which branch do I need to pick. Thanks.

Mainline should be fine.

Guenter
