Return-Path: <SRS0=PqkE=75=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD32C433DF
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Jun 2020 14:58:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0B0520644
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Jun 2020 14:58:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uvt7jMB5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729439AbgFPO6D (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 16 Jun 2020 10:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729239AbgFPO6C (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Jun 2020 10:58:02 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C71C061573
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2020 07:58:02 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id c11so1558916lfh.8
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2020 07:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dUSdmgapkwDNNuL/mjgcxAkZ4a9mt3f/CK+sgIZMr60=;
        b=uvt7jMB5/h9EOnPpMjkiSqGF/6ipdE9dCGwl3bxbndPb1/fmKhihmDLlJeRx/i/iud
         /0tvuK/ZzHMTbVESbqqePMMI1ObN8Xxq4vfOMmPMb+ZYPBoOyUlG9lPO8ZbxJmjwVdW2
         YwBvxzXukYDQ49mtMrmgwfI6G4msFvID/wurJ5arq/8t5P7rMmHJwJo/6TB9vWkASPJ7
         zpJH8U6KAbgJme3Q8gi4IX/Ch6qTRNujt5XzK1dgpqgAfNvinpwc66gSowVfQ1O/dL/z
         wJJ/6r9EdFFNUF+M1+omADUbxmrbGLMlnYTA4p93frkvR2b4B8CxP0ZHI0fkSB6UcSa7
         SJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dUSdmgapkwDNNuL/mjgcxAkZ4a9mt3f/CK+sgIZMr60=;
        b=dqtP5LvA3RTI/N+GpAr1WaPTo1D3am1bL5RCatKSvpRdQ21jFmuxk9P91QN5mW0cyO
         lTenkeorua4Fdflz7jgeQ9thWoaDN64FhMzV1JCNWRWoiaAykC7MySYBSWhqjC6mSPua
         nxMTD9Cxbq3sDHCZekrnAlDStBnlmnOMpzGlquVcg2n8o36Lyqssin2k6KA7CE2/RFk9
         XFHBUmk08oPB/AjmqH9bguNPgTVHMUj9jcnsTsP9+QYzKuU5XfVCfGExa5Y1yR5FY4aO
         SW0WGmcRGyH81nukrVAuN9YkE/lYP0At+Y9YD7uKB4TXjp6WSiz1vJLtXAonbL2LqyeG
         Y+qg==
X-Gm-Message-State: AOAM5330fnA6PmeGRuUQs1FiYnGuHdOneNa/1t0g5b3L7xxT48z716P8
        +qLj5XWFYkCZfmEXyGwPNr/jCoJ5s3cWA467GbI=
X-Google-Smtp-Source: ABdhPJyj9YcDed0X4cbMCAyjJIZ/rZaw1X2R6X9GVAEXJqE4LC/eNllO1ibogUicKPF8hCW0faNR1CeN34gYuC09VRU=
X-Received: by 2002:ac2:59c3:: with SMTP id x3mr1977450lfn.117.1592319480910;
 Tue, 16 Jun 2020 07:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200519155011.56184-1-nchatrad@amd.com> <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net>
 <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com>
 <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
 <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com>
 <alpine.LNX.2.20.13.2005270940400.18802@monopod.intra.ispras.ru>
 <CAHfPSqC6gQzRt-_O-zHTHoSa=vOO064+dfoGrV2abQr=rMvfgA@mail.gmail.com>
 <alpine.LNX.2.20.13.2005271944560.18802@monopod.intra.ispras.ru>
 <CAHfPSqAYBKXJkG21hqjyuRN8X+HqaX5df6ByeSRoMycBeVU48A@mail.gmail.com>
 <alpine.LNX.2.20.13.2006102320180.15859@monopod.intra.ispras.ru>
 <MW2PR12MB2569591CBFFB613E88EAD9F1E89D0@MW2PR12MB2569.namprd12.prod.outlook.com>
 <40def50d-8642-c850-5b23-b0ad4110becb@roeck-us.net>
In-Reply-To: <40def50d-8642-c850-5b23-b0ad4110becb@roeck-us.net>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Tue, 16 Jun 2020 20:27:49 +0530
Message-ID: <CAHfPSqDiTeaFTfsJM22sLAeN+0ZpF=ECoVh2PObomv2R4shRWg@mail.gmail.com>
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy counters
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>,
        Alexander Monakov <amonakov@ispras.ru>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter

On Tue, 16 Jun 2020 at 20:23, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 6/16/20 7:46 AM, Chatradhi, Naveen Krishna wrote:
> > [AMD Public Use]
> >
> > Hi Alexander,
> >
> > The issue does not seem to be in the driver, it is in the register values populated by the firmware.
> > We have tested this in the server platforms and it works fine.
> > I've raised an issue internally to analyze and provide a solution for client systems.
> > I'm still waiting for their update.
> >
> > Guenter,
> > This issue is seen on client machines model ranging from 0x40 and above. Should I submit a patch
> > to support only server specific models 0x0 to 0x3f until we triage the issue for client systems.
> >
>
> Yes, I think that would make sense.
Sure, I will submit that. Thanks for the prompt response
>
> Thanks,
> Guenter



-- 
Shine bright,
(: Nav :)
