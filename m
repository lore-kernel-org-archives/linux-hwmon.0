Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DD8C77B73
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Apr 2023 05:33:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232009AbjDTFdP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 20 Apr 2023 01:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233784AbjDTFdM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Apr 2023 01:33:12 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5AB26B2
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Apr 2023 22:33:04 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id c9so3790827ejz.1
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Apr 2023 22:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1681968783; x=1684560783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJVC98QYgVO5xnuQwE5GmGiDe7U5RkqIcikyFxfYAVk=;
        b=e+VESYo/xNSiP1FkwoH+/rGV8BGOsFMbAAIvgjLn3gR675gDWh/sGHe0s6fpzf/GF9
         ulqroFuZCKarvKdf11NUNdg9yRwVoNbIiFZAkXiyLGD576aZ7KLGFJGWjnjRhpLzs0+K
         sUUDVOO037UzwdAb6cFfam12O00xdObF7d6+G5is3/2LSEPPboPlNMzH4tOAytwPTse0
         pNOFdOwuM7yV1CIYQasvKeyt4xHParAtGcPXOj4SZVslyAWFJQl2Rl0rD+BxD53Cx2RA
         LVD3p+Svv2mULsc4lISfXLr9ufjlL+fVAvnDYmfcJHJpMiK4yhpg0k9J3H0LBQoQL1Op
         PKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681968783; x=1684560783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJVC98QYgVO5xnuQwE5GmGiDe7U5RkqIcikyFxfYAVk=;
        b=LtC9h7bLA4LrWlzIZQ5pSsnu9H4vq1+s/1jFmNpLARJ90bPftipwBkU5UYU60v5tlO
         /lkdTmebWolwGcyKeBD68Qzb68fc2SymUO5g5tLh2uM/AuZyla5kSiOCVRfOo4kBYLaK
         8cUhpQDPAg5Wh3RP+sl10+NCEno2bRaR0RGECD55igZkbAS5Mo3H9JSQkKd6R50ci6Ya
         aock/7KZmUtYT8IwYNwwa9iuMoYVe+dw1ZWm9uHgMqt80WjfKEoTy9ubtvegx7y/9Fzg
         2RjnJDfnhwv0Trn5FqERonKzMO/cvb5wamKFNxgm2Z1bnN6wxso8J/cwnmwiKbUkn0O+
         0ghQ==
X-Gm-Message-State: AAQBX9fuuzRU6h49hNq4P4S42h8cqU5RrjXo/Yj6F5o0tTRk5MGz5r/s
        oTHPLaRlupo1w/k9x3zclcdT6agumCZgu5DxWKCOSw==
X-Google-Smtp-Source: AKy350bkJamRIp/B0PDfHXNay3lltuaJoSnsn7OFsFgY8084+LGKIYTb/LftIeHE5AuSU+cikDFg98MBQCbd4UTuciE=
X-Received: by 2002:a17:906:841:b0:87f:e5af:416e with SMTP id
 f1-20020a170906084100b0087fe5af416emr139871ejd.7.1681968782950; Wed, 19 Apr
 2023 22:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAMGffE=65we13bDe=iOkkefF4PrNBNg96qi=ebU7nCs=GA6cCw@mail.gmail.com>
 <MN0PR12MB6101B5E3BCCB7B3BA28B9269E2629@MN0PR12MB6101.namprd12.prod.outlook.com>
In-Reply-To: <MN0PR12MB6101B5E3BCCB7B3BA28B9269E2629@MN0PR12MB6101.namprd12.prod.outlook.com>
From:   Jinpu Wang <jinpu.wang@ionos.com>
Date:   Thu, 20 Apr 2023 07:32:51 +0200
Message-ID: <CAMGffEniDCMc89D=G2bwn8_O9eep1X7Q3CYGrBaV6bTuX3KLdg@mail.gmail.com>
Subject: Re: k10temp show over 100 degrees temperature on EPYC Milan servers
 from DELL and SMC
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "clemens@ladisch.de" <clemens@ladisch.de>,
        Guenter Roeck <linux@roeck-us.net>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Apr 19, 2023 at 3:33=E2=80=AFPM Limonciello, Mario
<Mario.Limonciello@amd.com> wrote:
>
> [Public]
>
> Hi,
>
> > Dear experts on the list,
> >
> > We've noticed many of our EPYC Milan servers from different vendors
> > (DELL  and SMC) show 100 degrees, eg
> >
> > sudo sensors
> > k10temp-pci-00c3
> > Adapter: PCI adapter
> > Tctl:        +117.5=C2=B0C
> > Tdie:        +117.5=C2=B0C
> > Tccd1:        +67.0=C2=B0C
> > Tccd2:        +65.2=C2=B0C
> > Tccd3:        +63.2=C2=B0C
> > Tccd4:        +63.8=C2=B0C
> > Tccd5:        +67.2=C2=B0C
> > Tccd6:        +63.5=C2=B0C
> > Tccd7:        +64.2=C2=B0C
> > Tccd8:        +64.8=C2=B0C
> >
> >  sudo lscpu
> > Architecture:                    x86_64
> > CPU op-mode(s):                  32-bit, 64-bit
> > Byte Order:                      Little Endian
> > Address sizes:                   48 bits physical, 48 bits virtual
> > CPU(s):                          128
> > On-line CPU(s) list:             0-127
> > Thread(s) per core:              2
> > Core(s) per socket:              64
> > Socket(s):                       1
> > NUMA node(s):                    1
> > Vendor ID:                       AuthenticAMD
> > CPU family:                      25
> > Model:                           1
> > Model name:                      AMD EPYC 7713P 64-Core Processor
> > Stepping:                        1
> > Frequency boost:                 enabled
> > CPU MHz:                         2479.705
> > CPU max MHz:                     3720,7029
> > CPU min MHz:                     1500,0000
> > BogoMIPS:                        3992.43
> > Virtualization:                  AMD-V
> > L1d cache:                       2 MiB
> > L1i cache:                       2 MiB
> > L2 cache:                        32 MiB
> > L3 cache:                        256 MiB
> > NUMA node0 CPU(s):               0-127
> >
> > We've seen such high temperatures even on  idle servers.
> >
> > We are running LTS kernel 5.10.136, but checking the git history for
> > k10temp driver, I don't find any missing fix.
> > My questions are:
> > 1. Is it normal to have such high temperatures for tctl?  can we trust
> > the value?
> > 2  Do we need to worry about such high temperatures?
> >
> > Thx!
> > Jinpu Wang @ IONOS Cloud.
>
> It's fixed by this patch that will be going into 6.4.
> https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/=
commit/?h=3Dhwmon-next&id=3D1dc8e097967b69a56531c9ccb70b854771310e85

Hi,

I tested on affected server, the tctl output looks normal now.

Thx for quick reply.
>
> Guenter,
>
> If you didn't already send your 6.4 PR, can you please add
> Cc: stable@vger.kernel.org to the patch in your tree?
>
> Thanks,
