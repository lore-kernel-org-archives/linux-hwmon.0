Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA2EEB64DA
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jul 2023 12:17:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjGSMR6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Jul 2023 08:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbjGSMR6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jul 2023 08:17:58 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A283C171A
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 05:17:52 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-262e66481c4so3617157a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 05:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689769071; x=1692361071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuhhXkXir4voS8gRIBtJkYV+Q76WiKVmML4Bwp3OVzQ=;
        b=VN2la+gdY313z4WUzC82DsEJ9wBoMtyeSH2mhElyVbBo60S9VhRCReD8xRqJ2TyZep
         9PSHM5RabSrfqqtLK1j+qo0SUgqzNWXnOh2CzXAAaMmHRLITmRSs+UQRtiM2c6PHYVRW
         6w0ov4Nq/0dSbye8Vy15WC7tGCC5/Uve8phR1P7NNnsvCwudh7VwOXsylHO+lJ5zR8lq
         HU9CYeG4l9WYAzrwQnH/FCUgOdD4YNdMThnVhDJChXObDPV13o1hPc4HFrZeBnMIm7gj
         FR/vITBKH4zYz2q+N+5d7ApM583VJk8ZCJD/l2yHUnsFx3Tgi5x/9+8ch2nz7IdrdUie
         jQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689769071; x=1692361071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuhhXkXir4voS8gRIBtJkYV+Q76WiKVmML4Bwp3OVzQ=;
        b=JAFPlOEZwEG5YHGpkDq9yfdzZbVnJNHmJK9nkTGmh1tpcMZyEW6gCDAZuhEGNTxjuN
         7snkl3jkZi3hLORNXlX7p8DH63YXO88gLwDkkN4PBWDqxxmnxw8a7ZamKuvqDMevIfAb
         bpNm0pLQNjctsEsU5VM/BnOjq10gd3Fcf1qdWoP7A4FRAFt29umWUvR7YTDk3HsUFEG3
         FuR0lbpr+yPGsRLpRN/iyYsItA5wEM4YlWsfI1wpVJYn/HhZehP7FAh2I7y8B39WKbu7
         Ua1jI0ldXbXoEaNhDnM2R3r37MAodP2S+EJ7UCSL4hj8UlzZY2MeXGSBC8O72qv127tP
         FLsA==
X-Gm-Message-State: ABy/qLbBBeKhEt5Bb51iwX3ziYH5mbLDmkirVQ4URmgJ/KSV74BSHmyt
        o3PlRkydo6BkKgqMFSKG0SBse1Kr9ZT+io27eOQQ1w==
X-Google-Smtp-Source: APBJJlHFeWc9QGjqVC7qDUf6qbm4HxW11xlzgnjByON1Pmpylvr7wULvgzZw0+ykoLhMoB/wrY6jgYsktx9m7ChZRwM=
X-Received: by 2002:a17:90b:108e:b0:264:929:ed96 with SMTP id
 gj14-20020a17090b108e00b002640929ed96mr1664814pjb.9.1689769070641; Wed, 19
 Jul 2023 05:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230712091241.3668454-1-Naresh.Solanki@9elements.com> <c1988d23-c19c-0ec0-9f61-01cbb00ead3a@molgen.mpg.de>
In-Reply-To: <c1988d23-c19c-0ec0-9f61-01cbb00ead3a@molgen.mpg.de>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Wed, 19 Jul 2023 17:47:41 +0530
Message-ID: <CABqG17i9T5e7Foy7L1D=OdPo8uHfQ2xfvEPmxLB6hQY42Yq3Xw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] peci: cpu: Add Intel Sapphire Rapids support
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        iwona.winiarska@intel.com, linux@roeck-us.net, jdelvare@suse.com,
        openbmc@lists.ozlabs.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Paul,

On Wed, 19 Jul 2023 at 16:50, Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Naresh,
>
>
> Thank you for the patch.
>
> Am 12.07.23 um 11:12 schrieb Naresh Solanki:
> > Add support for detection of Intel Sapphire Rapids processor based on
> > CPU family & model.
> >
> > Sapphire Rapids Xeon processors with the family set to 6 and the
> > model set to INTEL_FAM6_SAPPHIRERAPIDS_X. The data field for this entry
> > is "spr".
>
> Please add, how you tested this.
Yeah, sure. Missed adding that. Will update the same in next revision.
>
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> > ---
> > Changes in V2:
> > - Refactored from previous patchset as seperate patch based on subsyste=
m.
> > ---
> >   drivers/peci/cpu.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
> > index de4a7b3e5966..3668a908d259 100644
> > --- a/drivers/peci/cpu.c
> > +++ b/drivers/peci/cpu.c
> > @@ -318,6 +318,11 @@ static const struct peci_device_id peci_cpu_device=
_ids[] =3D {
> >               .model  =3D INTEL_FAM6_ICELAKE_X,
> >               .data   =3D "icx",
> >       },
> > +     { /* Sapphire Rapids Xeon */
> > +             .family =3D 6,
> > +             .model  =3D INTEL_FAM6_SAPPHIRERAPIDS_X,
> > +             .data   =3D "spr",
> > +     },
> >       { /* Icelake Xeon D */
> >               .family =3D 6,
> >               .model  =3D INTEL_FAM6_ICELAKE_D,
>
> It looks like it=E2=80=99s incorrectly sorted, probably due to merge conf=
lict
> resolution?
Will move it to after Xeon D in next revision.

Thanks,
Naresh
>
>
> Kind regards,
>
> Paul
