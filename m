Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDF5C00140
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Aug 2022 00:20:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbiHKAUr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Aug 2022 20:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbiHKAUr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Aug 2022 20:20:47 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B460F74E04
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 17:20:45 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d20so15145939pfq.5
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 17:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc;
        bh=Vp3RrdFHwY/1ZWVjDvcPrxw5Az8GR60/frKTdvF2mzM=;
        b=bWyT5TmfaZSivi6gP9c49pyQMZ4vSXidrjFTShqTCYD8XGRA4fUCdqE87QQNf0qqfA
         3/xdyWYTvLU8a2zOvovn8ArcxkIDtfGc2+qN+kGNvmZkT0197bRDrminH+rDk+Tj/8nv
         kL6m/Z1cKNwNgg+s3O8GtMpqkmJVSCKnZg997HJ0LtlzEfXjNTaovVUaSxSNF06O6nlX
         Hl5bvKsy+iaqs79Zpq3pej/8CYbasXDGl8uY7Kv5fW+lXrPdKVwrvEIlM/paPDtTGrTO
         ZEN6H5t97rE4iShvnfDa12dtAcnIQfIBseaPvunbfiGA1ZhNkTWpGFvZAsUTGFSTxEn8
         7gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc;
        bh=Vp3RrdFHwY/1ZWVjDvcPrxw5Az8GR60/frKTdvF2mzM=;
        b=YXLGhTCykXaveFzXeys63vpGb6JcmNc3OsacmcSZNbkeiFAYS5MdZ/Ngvm1u4HAG+j
         Z1orQSumHf6W4KGPD/MYAnTCcrZNOheMp95io94hDXN+IYCn1UMYiDt/H4s0s/dlNWxy
         HzwwQWlcdWC6ObrRCuGSVjJ9nrYIa+6q7OnqstF10tcE63ZVTmGUVNWND7jL9fJzUPNm
         6dICbNic2D6CbYj8tide81BhBg1bZqHOD9xLODHmhOQ5rcr9vOt/R0JanXEJVO3u7DMs
         6ATjTZBxfFdbm3ZjC+BOndhpE7RtzM8RZAWBjkanTBLkdROmJPzJDhNVTkzsR3tMuoAo
         Qn0A==
X-Gm-Message-State: ACgBeo30sMCDLGJe7wRS2cT3doJx12LA0B8BlSg1LyiJ8ny1Wt3GQU4C
        QftY15Wisw63xmQ9QVM/eNDYLMBVwdQ=
X-Google-Smtp-Source: AA6agR41l4wyc5wnoXh8OrpneYd/dLsgt37qshpjFCqP0n/s7ronW5baYe/zZfQ0OxMvKl32fvPizg==
X-Received: by 2002:a63:6c87:0:b0:419:b667:6622 with SMTP id h129-20020a636c87000000b00419b6676622mr24216378pgc.495.1660177245184;
        Wed, 10 Aug 2022 17:20:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g6-20020a63fa46000000b0041c35462316sm10466562pgk.26.2022.08.10.17.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 17:20:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 10 Aug 2022 17:20:42 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zev Weiss <zev@bewilderbeest.net>
Cc:     Armin Wolf <W_Armin@gmx.de>,
        =?utf-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: PROBLEM: NCT6775: suspend doesn't work after updating to Linux
 5.19
Message-ID: <20220811002042.GA1558125@roeck-us.net>
References: <YvLJ9TQeXP/miUgT@hatter.bewilderbeest.net>
 <03c9bdca-846e-cd47-f628-6fc38bd0c27b@gmail.com>
 <YvLg/tuMEn9Mc1Tp@hatter.bewilderbeest.net>
 <c3c24f03-1c77-2b12-d499-4589e8d72f59@gmail.com>
 <YvMMRm0rA5q+Gjtj@hatter.bewilderbeest.net>
 <2974b75e-bd89-3fe2-bcf6-96a9943905d9@gmx.de>
 <c53405c8-5a1c-9a68-2135-b8460b915091@roeck-us.net>
 <YvNKI1ADmFYEsurd@hatter.bewilderbeest.net>
 <e1086de8-e58c-0aa2-cc42-6ea8958c795e@roeck-us.net>
 <YvQ3iMpRjEkvZ/Av@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvQ3iMpRjEkvZ/Av@hatter.bewilderbeest.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Aug 10, 2022 at 03:56:08PM -0700, Zev Weiss wrote:
> > 
> > I thought about calling it in probe, but I don't really like it because
> > it would slow down boot.
> 
> True, that's a fair point.
> 
> > Let's introduce a namespace (say, NCT6775) instead.
> > Change all EXPORT_SYMBOL_GPL(x) to EXPORT_SYMBOL_NS_GPL(x, NCT6775) and
> > add MODULE_IMPORT_NS(NCT6775) to nct6775-platform.c and nct6775-i2c.c.
> > This will ensure that the exported symbols can only be called from the
> > nct6775 code.
> > 
> 
> nct6775-core.c currently has DEFAULT_SYMBOL_NAMESPACE #defined to
> HWMON_NCT6775 (and the platform and i2c drivers are using
> MODULE_IMPORT_NS(HWMON_NCT6775)), so I think that's already in place -- I
> guess we can just leave it as is with the patch that's now upstream then.
> 
Excellent, looks like we are all set.

Thanks,
Guenter
