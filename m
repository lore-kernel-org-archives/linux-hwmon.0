Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0838BC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Sep 2021 13:09:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C71A261153
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Sep 2021 13:09:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233253AbhIJNKz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Sep 2021 09:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233185AbhIJNKz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Sep 2021 09:10:55 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA96C061574
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Sep 2021 06:09:44 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id q21so3135726ljj.6
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Sep 2021 06:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=07PT27p7zHKjZHBp2B5BX9u8Gie93aalvUmA2DnpkbU=;
        b=pv+Ld0Chfc0IwuNTgrSPoGEDpnJ1FaZKUcPk+vXM4MzxV7AiX4+TIoSaDlaAOprOOz
         CnvDWfgHRooxBnmVFX2rxzzdS0DONyVQeUq1lzhJkgJs6epk44WmAcq3+IMaemgRjh+w
         yShhaOi/cCAiopo95c2weNqVULF/5sF+wtaRKfe3yh1Y3ggF2vH9bknU9wlMT064VaZd
         qoHISfEGXpWQZbFGMoDhMen2Cga8eWZt+aaOU71py+jTc5WNV/kqZUQxneiakTwtDLnj
         eAIgp6z09y6cKDEbrFTakx2mkML3aIN0hvFVeRJYAK/6OACU9SJVYQlfeDu6ZizPvdYB
         ok6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=07PT27p7zHKjZHBp2B5BX9u8Gie93aalvUmA2DnpkbU=;
        b=m7HWsCJpdgO5hFzRq3evyfU7HJ/wDCwMnItpH+Cvn9MAOvktDHKTZH+AfucYfoh2Th
         6CusBibcB/voGFi3I9Nj4SMZTfYaa5veTCWY/TZxNcLhIyCEROTebii38Je9la0LBWZm
         g9hRDCnmC32e842b9T0k77pVNjIzC47h2ZEfjGbUBczX0qPCzwb9bcOt81iDRaFo7vcg
         XA6cviiKYLsmsvvgZAtl18o2fJpAFZnT2AGZnDsb9ee5bAWD/mE1CbRR9m9jE81MEp7C
         mwPME9dNnkPBqTbGPW9KMbiW0XkUFHw6bgJfPguGEldlMOh8Hx2b1WKRuX37aIv2DRn9
         OMLg==
X-Gm-Message-State: AOAM530ttxLLKmGuwCnwuRrPFJtCeREegNLgmSeNNMC+GHnxGH/5x9rK
        wJTwSX7WImWo9UMlb6QEhmHJ0rrNzWU1FygDJv8eZkPmUZ04qg==
X-Google-Smtp-Source: ABdhPJwmUotEFtiDpHCIubDhlO+N0pZXjTz5skzAShNZW7rjvSARv7UMW/w2kGNnk2OMLDVPLhqFvA2EQbLapFq60y8=
X-Received: by 2002:a2e:98d3:: with SMTP id s19mr3973008ljj.179.1631279382018;
 Fri, 10 Sep 2021 06:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <CABoTLcTEjKYwnFS1dB+-rGCM9BYvFBY1T1_M0OpdjqAy+M8SCQ@mail.gmail.com>
 <20210909170230.GD3973437@roeck-us.net>
In-Reply-To: <20210909170230.GD3973437@roeck-us.net>
From:   Oskar Senft <osk@google.com>
Date:   Fri, 10 Sep 2021 09:09:26 -0400
Message-ID: <CABoTLcT_EMexwCFuRAFVqZmrdCe05ec4U7CD8-+BLzEAd5QkgQ@mail.gmail.com>
Subject: Re: nct7802 mode selection for RTD1,2,3 via device tree?
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter

> Sure, all you need to do is to define the bindings and get them approved.
> From there I'll be happy to accept the necessary patch(es).
I just sent two separate patches, one to add the device tree bindings
and an independent patch to add the RTD modes configuration.

I hope that was right?

Thanks
OSkar.
