Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238E2C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Sep 2021 17:58:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0491F6109E
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Sep 2021 17:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbhIBR7F (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 2 Sep 2021 13:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhIBR7E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 2 Sep 2021 13:59:04 -0400
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA4BC061575;
        Thu,  2 Sep 2021 10:58:06 -0700 (PDT)
Received: from zn.tnic (p200300ec2f0ed100e05ac297e005b15d.dip0.t-ipconnect.de [IPv6:2003:ec:2f0e:d100:e05a:c297:e005:b15d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5E7F71EC0501;
        Thu,  2 Sep 2021 19:58:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1630605480;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=ozQt5Gy4kayvtL83tQlAaKIfBj0i9OvDuHoGy4V3BhE=;
        b=Uyt9r2OYmO6wmftAvs1nGd9Bs3kL4dTBQRnTLTuXC3RZik4kqXb8A/izQI0tWiJ5ZcauWG
        b57c8jnYks6ivdYjJhpU4Ix1kal59u/hSKBr6OKG7pYgM7HDs/kkjyDbqLG2gEJIFJGW1V
        3ZaO7n9biQg7bMYsINnCAma4CfypDX4=
Date:   Thu, 2 Sep 2021 19:58:36 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        x86@kernel.org, linux@roeck-us.net, yazen.ghannam@amd.com,
        mingo@redhat.com, nathan.fontenot@amd.com, lewis.carroll@amd.com,
        Ingo Molnar <mingo@kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 1/3] x86/amd_nb: Add support for HSMP mailbox access
Message-ID: <YTEQzIVfY/A1uy32@zn.tnic>
References: <20210902174155.7365-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210902174155.7365-1-nchatrad@amd.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 02, 2021 at 11:11:53PM +0530, Naveen Krishna Chatradhi wrote:
> On Fam19h server CPUs from AMD an HSMP (Host System Management Port)
> mailbox interface is added to monitor and manage the CPU parameters.

Mailbox? Hmm, that rings a bell. There's drivers/mailbox/ with a bunch
of drivers in there. Those are

"Mailbox is a framework to control hardware communication between
on-chip processors through queued messages and interrupt driven
signals."

I wonder if that HSMP thing can be wrapped like a mailbox driver...

If not, I still don't like it being slapped in amd_nb.c where it would
be built in on *all* AMD hardware which is kinda too much.

You could make it a separate driver module called amd_hsmp.ko which
loads only on the appropriate hw and uses amd_nb.c for detection only
like the other drivers, for example.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
