Return-Path: <SRS0=ye16=DH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE58C4727C
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Sep 2020 16:44:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22BE220759
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Sep 2020 16:44:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJR7pVzT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgI3Qou (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Sep 2020 12:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731252AbgI3Qos (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Sep 2020 12:44:48 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96129C061755;
        Wed, 30 Sep 2020 09:44:48 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id s66so2483045otb.2;
        Wed, 30 Sep 2020 09:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=BdJFbidX2Q+FgDn7QgbiPnb2gCRNzP8zJ+JJ+pfdStk=;
        b=CJR7pVzTyV+HPkMYXJGKky+q9AnDJRuaz0UBf5ZeWEiLXzCFwPzMREdgtHG4538F8K
         Fr0PMXsfc7qqRiUhXWmwyqXZgtdq24EiC3xZMyACJWmprf6TUwfwVEeW/xcXxdC9j9Gv
         Cxn0aUIJO5cX5DWzPPCLALLSeVG4ozXCuZBGdC2FqWSr/EpDZb3f4Hn+6b/opm/7Xaer
         6XieFaC+9uCj5Zyv2RlHesgqDQi7PBb8a6q+4VjSPnLQE3QwvNk9rWGwuWOa+aIg6KEw
         qgDt0lxQt9X5Ur3GV/PkzSTjyW4MctQvynfcIAXlT2hr6gwRfBAUiTHd0PjZebokjIdz
         q6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=BdJFbidX2Q+FgDn7QgbiPnb2gCRNzP8zJ+JJ+pfdStk=;
        b=AMadHNNYdbt2daguriKwDWT8Mip4gllIwpS2rnqMNOWNGO6eTzVqmORBR/YSljWvVp
         kwB+cZkkIOO62pkDAVVd02WwjisSoWhkMoUSBglAPNSQZR/DXzedCq/rJtQ4gRXSVWlS
         UtddHfw81pqpWEkNqYtx15xqar1F4fNkQLAoGz2wVNIi9KchdMH/HNtCsyes1WWI/6bj
         LB0HuuXifYt3UZPFOB2wNyAwFsCFPJ4T9NvgJcrIkNSHvAku8PS9ZVo1AE20zCNZzOME
         /Rk8Rpi25YW+QqtmCc2Mv3ihX5T+RF7JiG2ApOF3s7NcYzjwu529e7bOE2xvOL/Hc+Q0
         z9Mg==
X-Gm-Message-State: AOAM532Y0aOBxXuiX46Cx7Qm3y5SV5/F45HTbG9Pr+naqfV9H1BrOMyI
        +ZwRBTeSs/HruV+s+hkXAo1CKrd3pVU=
X-Google-Smtp-Source: ABdhPJxV23TQ/Xc9MViHRQ43awCXWUK4lVVJmbQIEB7YXnc/bv07JjBlgqspamnikmiqT8StJk93YQ==
X-Received: by 2002:a9d:6f06:: with SMTP id n6mr2086089otq.302.1601484288012;
        Wed, 30 Sep 2020 09:44:48 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m184sm418392oig.29.2020.09.30.09.44.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 09:44:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 30 Sep 2020 09:44:46 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     rydberg@bitmath.org, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [REGRESSION] hwmon: (applesmc) avoid overlong udelay()
Message-ID: <20200930164446.GB219887@roeck-us.net>
References: <20200930105442.3f642f6c@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200930105442.3f642f6c@aktux>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Sep 30, 2020 at 10:54:42AM +0200, Andreas Kemnade wrote:
> Hi,
> 
> after the $subject patch I get lots of errors like this:

For reference, this refers to commit fff2d0f701e6 ("hwmon: (applesmc)
avoid overlong udelay()").

> [  120.378614] applesmc: send_byte(0x00, 0x0300) fail: 0x40
> [  120.378621] applesmc: LKSB: write data fail
> [  120.512782] applesmc: send_byte(0x00, 0x0300) fail: 0x40
> [  120.512787] applesmc: LKSB: write data fail
> 
> CPU sticks at low speed and no fan is turning on.
> Reverting this patch on top of 5.9-rc6 solves this problem.
> 
> Some information from dmidecode:
> 
> Base Board Information
>         Manufacturer: Apple Inc.
>         Product Name: Mac-7DF21CB3ED6977E5
>         Version: MacBookAir6,2
>  
> Handle 0x0020, DMI type 11, 5 bytes OEM Strings         String 1: Apple ROM Version.  Model:       …, 
> Handle 0x0020, DMI type 11, 5 bytes
> OEM Strings
>         String 1: Apple ROM Version.  Model:        MBA61.  EFI Version:  122.0.0
>         String 2: .0.0.  Built by:     root@saumon.  Date:         Wed Jun 10 18:
>         String 3: 10:36 PDT 2020.  Revision:     122 (B&I).  ROM Version:  F000_B
>         String 4: 00.  Build Type:   Official Build, Release.  Compiler:     Appl
>         String 5: e clang version 3.0 (tags/Apple/clang-211.10.1) (based on LLVM
>         String 6: 3.0svn).
>  
> Writing to things in /sys/devices/platform/applesmc.768 gives also the
> said errors.
> But writing 1 to fan1_maunal and 5000 to fan1_output turns the fan on
> despite error messages.
> 
Not really sure what to do here. I could revert the patch, but then we'd gain
clang compile failures. Arnd, any idea ?

Guenter
