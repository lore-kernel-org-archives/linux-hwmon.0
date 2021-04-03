Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E96C433B4
	for <linux-hwmon@archiver.kernel.org>; Sat,  3 Apr 2021 03:16:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD2B561155
	for <linux-hwmon@archiver.kernel.org>; Sat,  3 Apr 2021 03:16:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234908AbhDCDQk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 2 Apr 2021 23:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231298AbhDCDQk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Apr 2021 23:16:40 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5745AC0613E6
        for <linux-hwmon@vger.kernel.org>; Fri,  2 Apr 2021 20:16:37 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id a8so6565510oic.11
        for <linux-hwmon@vger.kernel.org>; Fri, 02 Apr 2021 20:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4cDrnUm/gOLpuDpGFvDwo5vYW28tkUnX6Z1Eoe8spRM=;
        b=ilREV680qTtb8alkUKyyDP/aSe5Fcf11L1Ah6T67rEfqjfGNS5mNuC4ntwc5D6sjRC
         02pprrSOMKgV9kRmmsUjUe7L0eD+yvwG5RFS1Ffpb4KHvMK4ZN8ReGYr0caamd18c40F
         JNdF9OfL3ViNstxT1VG9A6LBLHxHSRCCvp9g/DYnBNvk4iV1TgeQzsuUioeVDkSrN5/+
         igu/Hs6b38beLiMUoXVm1BjR5XMpOW0R4jBnrWhoj8rVPQtWZp3VchmjtT7ZhKj74Ztu
         YzPRsoaF5L8K473kEdEkqAsa7SzIatrVGnzYcv3fCoe6vS7E8UVLqP1ivVc//dt25xnp
         hcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=4cDrnUm/gOLpuDpGFvDwo5vYW28tkUnX6Z1Eoe8spRM=;
        b=SvYt6GRvr34OeqKQZiaC2bUwFesW9ZJLGYSuC1HQTeJEiKk9tl4deU6BoZ44qZ/mn2
         ghMZUYM/iMpQVS98k4OBqCybIxh4LB6Wn2MSs7RAQg9opY50GhfxyoagtLvbKeLyDjh/
         IKn8wdmwvkXA3yGwKWpWTlxP0ALEbveWq/pccPi1uEx5+tWFrZXIL6sOfRr321qySkuc
         YySW9k46ddjexCKvbJ6tOero+26RC6lXKnBJn56AFykqFay6EjktjwlkV5/2oPkiI8ct
         ABVNNEejOx2ICQOESVhcoWJvGYQLDYx0p6TJ71OxANySpditUy6iRrmeQnfPqoZUHrvN
         Byww==
X-Gm-Message-State: AOAM533v/NF2NWZuXNwJ4u+b4Ybi6icRlje8CGT2gVG2KoySpTuKS2er
        uJDaGK3C1+TSMTt05zN8H/Gkmdd4KZY=
X-Google-Smtp-Source: ABdhPJyf9iEhNs/GqOR2fUXblnnDa0cGSQgAiZEsIuVkP/sXJT+VC78O0/t2VNG5MOiRXCvjm4B8Mg==
X-Received: by 2002:aca:4888:: with SMTP id v130mr12014862oia.3.1617419796607;
        Fri, 02 Apr 2021 20:16:36 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u23sm2097587oof.17.2021.04.02.20.16.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Apr 2021 20:16:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 2 Apr 2021 20:16:33 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     zlukwins <zbigniew.lukwinski@linux.intel.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: Energy counters for PMBUS
Message-ID: <20210403031633.GA230259@roeck-us.net>
References: <ea24de03-1ef8-fdb8-f4cb-9e06a0090dcf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea24de03-1ef8-fdb8-f4cb-9e06a0090dcf@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Apr 02, 2021 at 03:19:40PM +0200, zlukwins wrote:
> Hi,
> 
> 
> I am OpenBMC FW developer. We have a use cases which require PSU devices
> energy counters reading. Looks like hwmon:pmbus does not support that right
> now.
> 
> Hwmon sysfs (https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface)
> already supports energy counter (energy[1-*]_input).
> 
> PMBus standard (revision 1.3.1) provides API for getting energy -
> READ_EIN/READ_EOUT commands.
> 
> So I am wondering whether we could just add this implementation to the
> hwmon/pmbus/pmbus_core.c? Or maybe there are some constraints?
> 

Sure, go ahead. The only reason for not implementing it was that I did
not have access to a chip supporting it when I wrote the code.

Guenter
