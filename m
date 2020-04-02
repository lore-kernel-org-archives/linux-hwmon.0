Return-Path: <SRS0=8m/r=5S=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AA1C2BA12
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Apr 2020 17:16:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1280D2137B
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Apr 2020 17:16:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M593RqYD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgDBRQT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 2 Apr 2020 13:16:19 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39009 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732218AbgDBRQT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 2 Apr 2020 13:16:19 -0400
Received: by mail-io1-f65.google.com with SMTP id c16so4425725iod.6
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Apr 2020 10:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=ZeUM1Zbxf3DFHiYmqaA0ExB43/d8ErQdiQ3jz9thhKU=;
        b=M593RqYDNsg0MXFTlEXp5sTKDhY7WbjRBOCDILUYgx4Vhl8xLFZZQWqxADhyX73RRg
         5ZGaXDNFieKMag3HqTfC6IsQKUqjF6900d14ctB79Z4SuUJ1XuANi0iBVNX8k734lj7e
         dxs8jdAI2lN6v9HdS5t3se4jsyOIN2z05z+ZEg8Dk9xI3Xk1Q3oQe2i+F5r6b1ERCDiV
         2TPCZn6b719lqCvipVRAwDXeQdMZdUSfe6XAG1kwale7pYo53EbB5IKf3PxFnYa4RNFB
         qB/rql6u0VmATk1Pw1HtZ+b3CaePwk2YelOpGNDMvXT4hgm65CZeap76jJvZao2dONhu
         2WBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=ZeUM1Zbxf3DFHiYmqaA0ExB43/d8ErQdiQ3jz9thhKU=;
        b=MQtTXC9BkqDm2NaptIjZcspqEVqudN2g6Sb4EzkNooJXsI+1WAmozOqYdqctl8a+Lm
         IKGjYfHPoKMT2R7GcIzjZ0nDfc4vHVooCqX+ePNSeJr/K06V+Y2nV/382L//+nxhX+/Y
         KH75zWTeeM17QVNo2ZsyJGqPKvE5hgh6byyTt6FG4Y667MZdEK2wuicgRUJC0bULKOU0
         npj1C+GNjHg4x0C6NXrg2a3PIyo1rz6XAYDccHyaLcelaCEHHDasCqkyq+lBYXrSOEvk
         P4GjitBSokomlfOVXYRLxXro4CsA8GYW0OE7gDV+5IEstQW/PQmleWWDdhM+iYJ+Irzd
         LnIw==
X-Gm-Message-State: AGi0PubwOt6H2zh61d18voafJ27hSoDAXKzpfLPYyU/inTKyT+G+eZyu
        50HoGeAYc2k18rRSZj1flTtWOZeY/mVsiaFNr7tYad+N
X-Received: by 2002:a02:c888:: with SMTP id m8mt3386102jao.51.1585847777977;
 Thu, 02 Apr 2020 10:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <be17c0a111983e886d871db8dc2fc8fbfe8e2da0.1585800134.git.tommyhebb@gmail.com>
 <a7ee8173-bbb8-a68c-8b46-da2174cd08ad@roeck-us.net> <CAMcCCgQ4SQHoSirXFbHU5AjikVnjmULSd73MBSjeyVGDG2j5bQ@mail.gmail.com>
In-Reply-To: <CAMcCCgQ4SQHoSirXFbHU5AjikVnjmULSd73MBSjeyVGDG2j5bQ@mail.gmail.com>
From:   Tom Hebb <tommyhebb@gmail.com>
Date:   Thu, 2 Apr 2020 13:16:06 -0400
Message-ID: <CAMcCCgR=wt8XrEMCGPvSx1BVa=ZxrQseE-HG0HLD5VG9QmMqMQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (dell-smm) Use one DMI match for all XPS models
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Thanks for the quick review!

On Thu, Apr 2, 2020 at 2:15 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 4/1/20 9:02 PM, Thomas Hebb wrote:
> > Currently, each new XPS has to be added manually for module autoloading
> > to work. Since fan multiplier autodetection should work fine on all XPS
> > models, just match them all with one block like is done for Precision
> > and Studio.
> >
> > The only match we replace that doesn't already use autodetection is
> > "XPS13" which, according to Google, only matches the XPS 13 9333. (All
> > other XPS 13 models have "XPS" as its own word, surrounded by spaces.)
> > According to the thread at [1], autodetection works for the XPS 13 9333,
> > meaning this shouldn't regress it. I do not own one to confirm with,
> > though.
> >
> > Tested on an XPS 13 9350 and confirmed the module now autoloads and
> > reports reasonable-looking data. I am using BIOS 1.12.2 and do not see
> > any freezes when querying fan speed.
> >
> > [1] https://lore.kernel.org/patchwork/patch/525367/
> >
> > Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
> > ---
> >
> >  drivers/hwmon/dell-smm-hwmon.c | 19 ++-----------------
> >  1 file changed, 2 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> > index d4c83009d625..c1af4c801dd8 100644
> > --- a/drivers/hwmon/dell-smm-hwmon.c
> > +++ b/drivers/hwmon/dell-smm-hwmon.c
> > @@ -1087,14 +1087,6 @@ static const struct dmi_system_id i8k_dmi_table[] __initconst = {
> >               },
> >               .driver_data = (void *)&i8k_config_data[DELL_STUDIO],
> >       },
> > -     {
> > -             .ident = "Dell XPS 13",
> > -             .matches = {
> > -                     DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > -                     DMI_MATCH(DMI_PRODUCT_NAME, "XPS13"),
> > -             },
> > -             .driver_data = (void *)&i8k_config_data[DELL_XPS],
>
> So .driver_data is no longer needed for xps 13 models ? Really ?


That is my understanding, yes. As of commit 8f21d8e939b8 ("i8k:
Autodetect fan RPM multiplier"), an explicit fan_mult from driver_data
is not needed on any machine where i8k_get_fan_nominal_speed()
works. The email thread I linked from my commit message, specifically
message #13 from Gabriele Mazzotta[1], indicates that function works
on the XPS 13 9333, as it did on all other laptops tested in that thread.
The only other information in driver_data is fan_max, which defaults to
I8K_FAN_HIGH and so won't change for the XPS 13 9333.

Note that the version of the autodetection code which actually
landed[2] (which, coincidentally, was part of the same series
containing your initial XPS 13 support) fixed the bugs mentioned
in [1] and properly tries i8k_get_fan_nominal_speed() for all fans.

[1] https://lore.kernel.org/patchwork/patch/525367/#708707
[2] https://lore.kernel.org/patchwork/patch/532107/

>
> Guenter
>
> > -     },
> >       {
> >               .ident = "Dell XPS M140",
> >               .matches = {
> > @@ -1104,17 +1096,10 @@ static const struct dmi_system_id i8k_dmi_table[] __initconst = {
> >               .driver_data = (void *)&i8k_config_data[DELL_XPS],
> >       },
> >       {
> > -             .ident = "Dell XPS 15 9560",
> > -             .matches = {
> > -                     DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > -                     DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9560"),
> > -             },
> > -     },
> > -     {
> > -             .ident = "Dell XPS 15 9570",
> > +             .ident = "Dell XPS",
> >               .matches = {
> >                       DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > -                     DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9570"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "XPS"),
>
> Quite frankly, I'd want to have this tested on many more models.
> I don't really want to deal with the fallout if it doesn't work
> on all xps a3 and xps 15 systems, especially since Dell doesn't
> support the BIOS interface used by this driver.


What fallout are you imagining? There are two XPS 15 models, 9560
and 9570, that were already matched, neither of which required
driver_data or were blacklisted for bad BIOS behavior., and I've tested
on a 9350 with the same result.

The worst case scenario I could imagine is that one of 9550, 9360, or
9370 has bad BIOS behavior and starts showing hiccups after this
patch. I don't think that's likely, though, given that the list of tested
models includes one from each generation, sampling across both 13
and 15. Additionally, the existing generic matches on "Studio",
"inspiron", "Latitude", "Precision", and "Vostro" indicate that we're
willing to accept the possibility of future breakage in exchange for
automatic detection of new machines.

-Tom

>
> Guenter
>
> >               },
> >       },
> >       { }
> >
>

On Thu, Apr 2, 2020 at 2:15 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 4/1/20 9:02 PM, Thomas Hebb wrote:
> > Currently, each new XPS has to be added manually for module autoloading
> > to work. Since fan multiplier autodetection should work fine on all XPS
> > models, just match them all with one block like is done for Precision
> > and Studio.
> >
> > The only match we replace that doesn't already use autodetection is
> > "XPS13" which, according to Google, only matches the XPS 13 9333. (All
> > other XPS 13 models have "XPS" as its own word, surrounded by spaces.)
> > According to the thread at [1], autodetection works for the XPS 13 9333,
> > meaning this shouldn't regress it. I do not own one to confirm with,
> > though.
> >
> > Tested on an XPS 13 9350 and confirmed the module now autoloads and
> > reports reasonable-looking data. I am using BIOS 1.12.2 and do not see
> > any freezes when querying fan speed.
> >
> > [1] https://lore.kernel.org/patchwork/patch/525367/
> >
> > Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
> > ---
> >
> >  drivers/hwmon/dell-smm-hwmon.c | 19 ++-----------------
> >  1 file changed, 2 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> > index d4c83009d625..c1af4c801dd8 100644
> > --- a/drivers/hwmon/dell-smm-hwmon.c
> > +++ b/drivers/hwmon/dell-smm-hwmon.c
> > @@ -1087,14 +1087,6 @@ static const struct dmi_system_id i8k_dmi_table[] __initconst = {
> >               },
> >               .driver_data = (void *)&i8k_config_data[DELL_STUDIO],
> >       },
> > -     {
> > -             .ident = "Dell XPS 13",
> > -             .matches = {
> > -                     DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > -                     DMI_MATCH(DMI_PRODUCT_NAME, "XPS13"),
> > -             },
> > -             .driver_data = (void *)&i8k_config_data[DELL_XPS],
>
> So .driver_data is no longer needed for xps 13 models ? Really ?
>
> Guenter
>
> > -     },
> >       {
> >               .ident = "Dell XPS M140",
> >               .matches = {
> > @@ -1104,17 +1096,10 @@ static const struct dmi_system_id i8k_dmi_table[] __initconst = {
> >               .driver_data = (void *)&i8k_config_data[DELL_XPS],
> >       },
> >       {
> > -             .ident = "Dell XPS 15 9560",
> > -             .matches = {
> > -                     DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > -                     DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9560"),
> > -             },
> > -     },
> > -     {
> > -             .ident = "Dell XPS 15 9570",
> > +             .ident = "Dell XPS",
> >               .matches = {
> >                       DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > -                     DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9570"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "XPS"),
>
> Quite frankly, I'd want to have this tested on many more models.
> I don't really want to deal with the fallout if it doesn't work
> on all xps a3 and xps 15 systems, especially since Dell doesn't
> support the BIOS interface used by this driver.
>
> Guenter
>
> >               },
> >       },
> >       { }
> >
>
