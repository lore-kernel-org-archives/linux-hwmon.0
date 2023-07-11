Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38EDCEB64DD
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jul 2023 14:55:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbjGKOz4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jul 2023 10:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjGKOzz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jul 2023 10:55:55 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E528E4F
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 07:55:52 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3458a08310aso22427175ab.3
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 07:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689087351; x=1691679351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NOHj/qmcYw6nskkjE8RKDb9CPghG0QuzHmlycmErO7k=;
        b=UAqGemQ5+fR3NqE1iuHNZOYmiRCYtr+lfFL/vlAa543KS13WS3iNlyK260KwuyvrJQ
         oDQLBIWWtOAGxsz1EPlMPeNGOdAUixriKE2ItDSySz8c0lU+mLjKVsYDAcGWhwK8/CkS
         7PiX/dORprzdKayTOhfCChPNll0xVQ08X3v/mkcbzQGA6cPo7/KuIBTGyC1CpB6xCFm0
         F2EiqxlHeQnMw6DnvmXGIUyyjyAYvNUWlZWoYooym3r3QsguLK64Pqsdgz+aoWy9hyFu
         UTUsFzNW9YnuvSxDab/nBF9V/lzVJU+/kJNw2dUz2+6qfFjugcTqHOCpQj6H2YjqcVvl
         oFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689087351; x=1691679351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOHj/qmcYw6nskkjE8RKDb9CPghG0QuzHmlycmErO7k=;
        b=iqWBLYK7hxRHoH/AUjUEjR+4YA4cLzAG8hSV/s7q8ZK3F624/i2QwG8h1K1FbzgC5e
         VzfgJLUK5i9ftJhfVd9SaMjfX+6dTIKvbFQAJlr+pyIe+6BtBw9XkgJLJnTxfELndDUm
         18z4vyns3fJ0CqNwo0G9L7QRT3a4msZeG7sYYhx5kksJPxhKimCilQ8q/l21Iufzu34U
         s9hEPjwFDjqQcov/UpEboD0woB8x/iHB251mM+TcX0AjZStMjiKuj/Gf53yWGscsTDDj
         IMbARQ9BXHOjvFB5C016gJtySZeMXDbXF9clLjWP2OABRE4GnpqmoYbgE85GkcAcQMf6
         QpPg==
X-Gm-Message-State: ABy/qLYDxrh3FIV0uFfQpdjPjsvJp0OFNGVGt3zWUkVllSysoKk2FfXg
        iM+WwGgDGUvv9sNg4RAYFTKnJrL3OjZhwlX3Kt/cWQ==
X-Google-Smtp-Source: APBJJlF+eJdBZOlOB49QOJ5FpF5SkOggxkdoD6E1mtnuZ4LSL2JTrp8Pbfbcny9ON0zp5Ijoyl87nE15mEOaswTpBSA=
X-Received: by 2002:a92:da86:0:b0:346:6dc2:997b with SMTP id
 u6-20020a92da86000000b003466dc2997bmr2950323iln.23.1689087351401; Tue, 11 Jul
 2023 07:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230710162724.827833-1-Naresh.Solanki@9elements.com> <1f4c500b-e706-a090-516d-992b68f44f0d@roeck-us.net>
In-Reply-To: <1f4c500b-e706-a090-516d-992b68f44f0d@roeck-us.net>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Tue, 11 Jul 2023 16:55:39 +0200
Message-ID: <CABqG17jU8HYzOx=OCH6=shJo37MZWRBPydOQsrnDBk3xNaQE5w@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (peci/cputemp) Add Intel Sapphire Rapids support
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Iwona Winiarska <iwona.winiarska@intel.com>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On Mon, 10 Jul 2023 at 19:43, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/10/23 09:27, Naresh Solanki wrote:
> > From: Patrick Rudolph <patrick.rudolph@9elements.com>
> >
> > Add support to read DTS for reading Intel Sapphire Rapids platform.
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>
> This patch touches code outside the hwmon subsystem, so I won't be able
> to apply it without Ack from a maintainer.
Yes.  I'll split the patch & resubmit.
~Naresh
>
> Guenter
>
> > ---
> >   drivers/hwmon/peci/cputemp.c | 18 ++++++++++++++++++
> >   drivers/peci/cpu.c           |  5 +++++
> >   2 files changed, 23 insertions(+)
> >
> > diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
> > index e5b65a382772..a812c15948d9 100644
> > --- a/drivers/hwmon/peci/cputemp.c
> > +++ b/drivers/hwmon/peci/cputemp.c
> > @@ -363,6 +363,7 @@ static int init_core_mask(struct peci_cputemp *priv)
> >       switch (peci_dev->info.model) {
> >       case INTEL_FAM6_ICELAKE_X:
> >       case INTEL_FAM6_ICELAKE_D:
> > +     case INTEL_FAM6_SAPPHIRERAPIDS_X:
> >               ret = peci_ep_pci_local_read(peci_dev, 0, reg->bus, reg->dev,
> >                                            reg->func, reg->offset + 4, &data);
> >               if (ret)
> > @@ -531,6 +532,13 @@ static struct resolved_cores_reg resolved_cores_reg_icx = {
> >       .offset = 0xd0,
> >   };
> >
> > +static struct resolved_cores_reg resolved_cores_reg_spr = {
> > +     .bus = 31,
> > +     .dev = 30,
> > +     .func = 6,
> > +     .offset = 0x80,
> > +};
> > +
> >   static const struct cpu_info cpu_hsx = {
> >       .reg            = &resolved_cores_reg_hsx,
> >       .min_peci_revision = 0x33,
> > @@ -549,6 +557,12 @@ static const struct cpu_info cpu_icx = {
> >       .thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
> >   };
> >
> > +static const struct cpu_info cpu_spr = {
> > +     .reg            = &resolved_cores_reg_spr,
> > +     .min_peci_revision = 0x40,
> > +     .thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
> > +};
> > +
> >   static const struct auxiliary_device_id peci_cputemp_ids[] = {
> >       {
> >               .name = "peci_cpu.cputemp.hsx",
> > @@ -574,6 +588,10 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
> >               .name = "peci_cpu.cputemp.icxd",
> >               .driver_data = (kernel_ulong_t)&cpu_icx,
> >       },
> > +     {
> > +             .name = "peci_cpu.cputemp.spr",
> > +             .driver_data = (kernel_ulong_t)&cpu_spr,
> > +     },
> >       { }
> >   };
> >   MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);
> > diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
> > index de4a7b3e5966..3668a908d259 100644
> > --- a/drivers/peci/cpu.c
> > +++ b/drivers/peci/cpu.c
> > @@ -318,6 +318,11 @@ static const struct peci_device_id peci_cpu_device_ids[] = {
> >               .model  = INTEL_FAM6_ICELAKE_X,
> >               .data   = "icx",
> >       },
> > +     { /* Sapphire Rapids Xeon */
> > +             .family = 6,
> > +             .model  = INTEL_FAM6_SAPPHIRERAPIDS_X,
> > +             .data   = "spr",
> > +     },
> >       { /* Icelake Xeon D */
> >               .family = 6,
> >               .model  = INTEL_FAM6_ICELAKE_D,
> >
> > base-commit: 4dbbaf8fbdbd13adc80731b2452257857e4c2d8b
>
