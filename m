Return-Path: <SRS0=Tvco=AS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB51C433DF
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jul 2020 00:56:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E09EC206E2
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jul 2020 00:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="utZXuTrr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgGGA4l (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jul 2020 20:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgGGA4l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jul 2020 20:56:41 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48177C061755
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2020 17:56:41 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id v26so6020204vkn.2
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2020 17:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s0U+Ae9VUStW4ggEhVdvGzjNMlpXyTeUY/9gfTY0/ec=;
        b=utZXuTrrhdNVvBHa1uweiJE4wi7wuw2yaj43gZoKVA+qQ/6IXeglgpTFncFc45q4ND
         xHb/E0aE4+EHzVpKgNpesgrAOJlG3Cecc1+o1aN1nGqNxny5/dSHdSbeNbt8Gx+5Jy4d
         U0adT/ZKYdmYq5vzD/F7dPXHiYT5Brm13Ur9F1y48aJOToL/HPM5vU7MZ4kMFsPUNFur
         hNpvFdJlGj/vIa9735IUUtO17dbYeotu04ZtBzAOKp8zrb++93ecNoOrFyLaVZG6kX+J
         fYAKztNMx7FwrQy9Y+dYCt6e1dHMuSJ/ThTdQ0+C1AAtm18ddSH8UAdBPirsWmTPSgrR
         rrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s0U+Ae9VUStW4ggEhVdvGzjNMlpXyTeUY/9gfTY0/ec=;
        b=k4fgvhVfWUsCvMzcsHmzq5DT+wGyWz1q3rfWzBWOaaOaBBJqsOEZ+eHqi871qnvdLF
         ZLjSTSRcq5i+/gFKCOvuBKl6au8RdqqzmuDhwQD/spdv8NHeM2xCjnzK3H3+EkH2JuiL
         mXDIJ07BaDLIvVBdqviKLWQ0j2p1BIFArvdeyjowkXw1mdG3U8HLUcO/HjZEGuRvg6rY
         u6kdEzEuaqrRbW3qdb3S0l+LbhOGzs2q4RpV9Rfn9q2XHMOg71tVIWHxxS4UFWIwvSQO
         2A2+kX5OADOR4PivJ+njE4mlPRlqDplJE+MnS7df2tm13WeKAzEafVfhBAslBBuZEucV
         AVpA==
X-Gm-Message-State: AOAM530km71JFzOr3eMIOj9jG4/kIyN3MAHuExWG4aco59/PsEEqFrnQ
        cdRzGSnWTMfEF8XcHzpQf4R995O2HEUhkNlrTQyMyA==
X-Google-Smtp-Source: ABdhPJypuhUMCtj7x1ckYaC6Q89LU+doEAJ8U+ir85soCY7TokFB47XjJ5t2vzKQFIEK/maz9ZHoQTHnpvT5bIXg0Wo=
X-Received: by 2002:a1f:978d:: with SMTP id z135mr20253309vkd.86.1594083400343;
 Mon, 06 Jul 2020 17:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200707002203.2494094-1-linchuyuan@google.com>
 <20200707002203.2494094-3-linchuyuan@google.com> <1d6c34f5-6da2-a081-3d13-559f9dbbe352@roeck-us.net>
In-Reply-To: <1d6c34f5-6da2-a081-3d13-559f9dbbe352@roeck-us.net>
From:   Chu Lin <linchuyuan@google.com>
Date:   Mon, 6 Jul 2020 17:56:29 -0700
Message-ID: <CAKCA56AYnkD1gqZQjhJwv6aCTRNV2axB88aD-6QVrJHc=VxBNQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon:max6697: fixing the type issue where the
 comparison is always true
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Kais Belgaied <belgaied@google.com>,
        Jason Ling <jasonling@google.com>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhongqi Li <zhongqil@google.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 6, 2020 at 5:54 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/6/20 5:22 PM, Chu Lin wrote:
> >   - Use reverse christmas tree order convension
> >   - fix the type issue where comparision is always true
> >   - Change the line limit to 100 char instead of 80 char
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Chu Lin <linchuyuan@google.com>
>
> Unless I am missing something, this patch fixes the first patch
> of the series. This is not reviewable. Please combine with the
> first patch.
>
> Thanks,
> Guenter
Sorry, I will fix it.

Chu
