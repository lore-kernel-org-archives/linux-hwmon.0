Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1FCC54EBD
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Jan 2023 03:41:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbjADDlk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Jan 2023 22:41:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbjADDlj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Jan 2023 22:41:39 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD8B2726
        for <linux-hwmon@vger.kernel.org>; Tue,  3 Jan 2023 19:41:38 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id e17-20020a9d7311000000b00678202573f1so20182401otk.8
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Jan 2023 19:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6zs6+fCAK3ni71daGn3KGJL/3xSTQK+7nK7UwLbctL8=;
        b=ZOaeAkPzsD5PFrhANgbrEUyzFe5LHRmX7V0bBYg77Z3J5itaQs1ZizLosfucm9eJVn
         lpFNwxUL11uSTqR63tVlv4YSRw2xxNWIyG0+fOeKxtMK9Fx818m/NQCYGRYM27Q4yyte
         u4l47WKLWmt4gvQxsP/DhAs3Sl4pHFfKMPf0IjpsySXK9L8AftTVYROQr5CVRhEOnnlv
         7Cevhjw+UPgEQdFW6rlSvIdEiy9x+gGcvlKvDSNviKJ4/Q28/635cOrGS8JRlPr/7rSd
         qXdfErNmrQ4RSD/tIrpsEs888pInoPo5RSR9AYuvGSRvNozKZ28Ai/WrNRvsNGbSbRPx
         B9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6zs6+fCAK3ni71daGn3KGJL/3xSTQK+7nK7UwLbctL8=;
        b=q2FDnBaPJD37i7nPzRJ+roSCnvJLHBpFZYG3eBLpk787O2wsHD0vN7Vn8CSbYF/Nw6
         8+tVOk4BxWcDavYdWmMLEnANzIOFL77DdlgWpWT93qGdxl4u+VbXlgZ3+Nx6cq7KApVX
         qjuuq4wu52XaSGtuAD1C35rZ4AnCeKIKPxdCCFifyzI/e7jFYNk9DiAwJ5CUsgnhU5Mi
         ullDCqMc+xeb4MLiuH43jmkaHdWsInSjGl+lG0aqof5phvEvEp895qbc8rkrs7uCR2mI
         vfaaag8V6OPevrQQgH7v0/m63zswILMsmMXVX3FVRTEwjcUKCp3TgQJUjgbZ/9eA8GVr
         L71A==
X-Gm-Message-State: AFqh2koo8kC1umWWVi8Z1BaRZibygftVSAOD+7iJKN6OBq2Ur6dZek9D
        xJbavurDctYUr6iPjlhLHFM=
X-Google-Smtp-Source: AMrXdXuNLWNXiJw3gxwAEQ0BymPQEoMxSrnjpno1HDoivqzlI+ETrEQA7qsXjFDtkVcNr2A55cA9sg==
X-Received: by 2002:a05:6830:2906:b0:670:9a97:218e with SMTP id z6-20020a056830290600b006709a97218emr22436795otu.18.1672803698097;
        Tue, 03 Jan 2023 19:41:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o2-20020a9d6d02000000b006704589eb54sm15561296otp.74.2023.01.03.19.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 19:41:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 3 Jan 2023 19:41:36 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sebastian Arnhold <sebastian.arnhold@posteo.de>
Cc:     Christian Lamparter <chunkeey@gmail.com>,
        linux-hwmon@vger.kernel.org, Ahmad Khalifa <ahmad@khalifa.ws>
Subject: Re: [PATCH RFT] hwmon: (nct6755) Add support for NCT6799D
Message-ID: <20230104034136.GA228903@roeck-us.net>
References: <184c3523-fb00-b0df-cf29-cc1b171c4ab4@gmail.com>
 <20221230175021.GA1136102@roeck-us.net>
 <c8d68feb-d44f-02c6-0a08-d199cef00b46@gmail.com>
 <20221230214855.GA3881237@roeck-us.net>
 <b31ed9ec-3bd5-e032-ea03-b116ece4dac3@posteo.de>
 <73d1eb21-6cb9-a60f-218b-af129c2cb7a4@gmail.com>
 <3ba37e2d-413b-4d7d-e99b-8e0a53bd7f4e@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ba37e2d-413b-4d7d-e99b-8e0a53bd7f4e@posteo.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Dec 31, 2022 at 11:42:57PM +0000, Sebastian Arnhold wrote:
> I tried to add acpi_enforce_resources=lax, but sadly, it does not solve the
> problem.
> 
What do you see in the kernel log after adding that ?

Thanks,
Guenter

> Maybe Ahmad can help add support for the board?
> 
> Thanks,
> Sebastian
> 
> Am 30.12.22 um 23:58 schrieb Christian Lamparter:
> > Hi Sebastian,
> > 
> > On 12/30/22 23:13, Sebastian Arnhold wrote:
> > > Thank you very much for the patch, Guenter Roeck!
> > > 
> > > I just compiled it using the mainline Kernel as a basis, but
> > > "sensors-detect" still claims there are no sensors detected on my
> > > ASUS TUF GAMING X670E-PLUS WIFI.
> > 
> > Unfortunately, this might be because ASUS has some "new" ideas :/.
> > See this RFC from Ahmad back from October (Author is in Cc)
> > for an in-depth view why this is happening:
> > 
> > https://patchwork.kernel.org/project/linux-hwmon/patch/20221018173428.71080-1-ahmad@khalifa.ws/
> > 
> > 
> > Regards,
> > Christian
> > 
