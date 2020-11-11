Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA0AC5517A
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Nov 2020 15:44:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65D8B206A1
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Nov 2020 15:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkudc6OK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbgKKPoF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Nov 2020 10:44:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726625AbgKKPoE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Nov 2020 10:44:04 -0500
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6982C0613D1;
        Wed, 11 Nov 2020 07:44:03 -0800 (PST)
Received: by mail-oo1-xc43.google.com with SMTP id g4so531752oom.9;
        Wed, 11 Nov 2020 07:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KtgnHEv0ZUDEzDpdBhmj/ZPPcj7et8nJoEnMD6FoA1A=;
        b=jkudc6OKmTxCmblJ37+tr//d+vLS1hdeQHfYvA9QtKIPyg+vR+NAml22QLXNW/Alh1
         dakfA5wKEkQwxH9hNvzUJCVz8lhOWHPPmGlS1j7vVYDfhz2LD37PBM78/D0T6C5lJAJ7
         3+QXfHm4QbljVGTXNzWTFAcyiSjoYoG/3XZmk0sGrlT/5SIf+xOdQJLHoKp5Mzn4d5oN
         ne3W45cAGheS2ACt2wrsit+XkB3K4WHDTTxai1EN57nnBASMmx61HIlCXaTiYgrt5r7q
         Q4hbWO8T29YBgd3vzA0+1MkpcUnzcV+kZJq7bnsn1zGW+kc+Bo4KHQh/6WM23J7DPphI
         wpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=KtgnHEv0ZUDEzDpdBhmj/ZPPcj7et8nJoEnMD6FoA1A=;
        b=ESyqPruqzaTTvijT86OIuw2bUb6do2u2j/GeRCqlmS2YCOVpRjTl7L6nQypN3yLT6J
         SIIRIKH/iUeAUqAvsE+9LnAC5QOLDUWVlZz2j8sBpRvQsgOGOy5lxDvbLC0u5DpgXdtP
         D8PUZhGjALBRgL7lpInwk5kn4cpStJcZkstGRKDRUzeDEMWWryLHBNEtHoBpUr9Xor2/
         TpAfYSKd+zwzlbQNue2woAkqZJOrHDYVMr9js6GUiEiqLES4uHA1nPNosZ9iI+uh9dZr
         6KkZPSc5vvgME8EdmVzCYffXcJiBPcAnSdXQBKRemv7PIHZ+IYrez3rtBGKpNJiSLPG+
         bwpA==
X-Gm-Message-State: AOAM530CUtZdfvsiNHAAWiqbCLGQsIR3QhI3RqzQkWi23wa5DLtMCAb9
        ZsmXamilIMCaU709FTAnFC0=
X-Google-Smtp-Source: ABdhPJw6wo4yfJelx0Tzx3yo4UFtVYSpvfIjFolpBogp/8xxZ1IJslTAOX3YX3VIVi8yO5C3n3FRZg==
X-Received: by 2002:a4a:d752:: with SMTP id h18mr9146032oot.62.1605109443294;
        Wed, 11 Nov 2020 07:44:03 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o63sm587194ooa.10.2020.11.11.07.44.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 07:44:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 11 Nov 2020 07:44:01 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Alexandru Ardelean <ardeleanalex@gmail.com>
Cc:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, jdelvare@suse.com,
        "Thoren, Mark" <mark.thoren@analog.com>
Subject: Re: [PATCH v2 2/4] docs: hwmon: (ltc2945): change type of val to ULL
 in ltc2945_val_to_reg()
Message-ID: <20201111154401.GA151426@roeck-us.net>
References: <20201111091259.46773-1-alexandru.ardelean@analog.com>
 <20201111091259.46773-3-alexandru.ardelean@analog.com>
 <41f86559-9165-40f9-e7f3-3e7f5eca7315@roeck-us.net>
 <CA+U=DsrOTOZr2pmwAH7T6Jt8TZXNsLJBza482tmFOkyGLuGvAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+U=DsrOTOZr2pmwAH7T6Jt8TZXNsLJBza482tmFOkyGLuGvAg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Nov 11, 2020 at 05:28:51PM +0200, Alexandru Ardelean wrote:
> On Wed, Nov 11, 2020 at 4:54 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On 11/11/20 1:12 AM, Alexandru Ardelean wrote:
> > > In order to account for any potential overflows that could occur.
> > >
> > > Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> >
> > Thinking about it, this can only really happen if the user provides
> > excessive values for limit attributes. Those are currently clamped
> > later, after the conversion. I think it would be better to modify
> > the code to apply a clamp _before_ the conversion as well instead
> > of trying to solve the overflow problem with unsigned long long.
> >
> > Either case, can you send me a register dump for this chip ?
> 
> I asked Mark to help out on this.
> Right now I don't have a board around my home-office.
> I"m just pulling patches from our own tree to send upstream.
> Is there a specific command you have in mind for this i2cdump?
> 
> Is the output of something like this fine:
> # i2cdump -r 0x00-0x31 1 0x6f
> ?

Yes, that should do, assuming the chip is on bus #1, address 0x6f.

Thanks,
Guenter
