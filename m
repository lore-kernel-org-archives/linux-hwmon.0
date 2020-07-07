Return-Path: <SRS0=Tvco=AS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2BEC433E0
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jul 2020 06:24:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E217206CD
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jul 2020 06:24:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlnObFoA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbgGGGYp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Jul 2020 02:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgGGGYp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Jul 2020 02:24:45 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32FFBC061755
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2020 23:24:45 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q4so12812357lji.2
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2020 23:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CGUGbKeIbvbM4NCl83ZOeM6GtXw7xJTsV93idIssyC4=;
        b=FlnObFoArztMEtA0QlUZSLG4AeD7zT8xRRzbfEzQ+OOtm7/e5txfhD9fw8fV87W0EZ
         8mNb5Vuo67OvSJ3VDDdwEHKhafvvOONrvqycdU7NMLNl6I2lvTvyCJ8pQJ+/YS2pAqWa
         YvuWSBPxhKf6bgNZPJ/UvXd90x+sM5kxopOfmfmZwDeHI+IIKvbmnszRm9Y+jcy+VcjG
         i2m86ocdpOEWtyvAKN4GUr6YEQLDd1x0YqdrOLfR0CWgwVzYkgCIQjKm94HouWbUx/vi
         kmPU2AFkGpMAUIw0Bfce2K3odHWJAthgAMsFFDOe6oKXsHBvrELU09CF9pv/lEvSwyrC
         ujIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CGUGbKeIbvbM4NCl83ZOeM6GtXw7xJTsV93idIssyC4=;
        b=neqBeI6/R1GkeoVEz9qA/fDrDp2dP/stuR7HL9QgvyglYonnUp1RV701RPs7K2EG19
         n6CrkClQobNtvPPkdna7cfRE0Hoc+pHgFlFCwbFvJKzOHaJ+vF4TxkWMQIJ5o0JUs05g
         l2Qc3B5iCtEJYuEVnzVmsWOMGRRQWh1IedXpFZ4Bbhe5g2J2xAlmTea102mE1EGT+pln
         XZvwG92CwmWjBxwVTlWkTe2nQm6FIkRRgQjWb6KL08LfU5bs3yCse7NqjICZ72SENxxm
         wMmKsok96t+OvJ2NRjcfI3H6ySdcvTJ2XRDIcKydIImfZE5I+M4qwYrrA2ADsU+eLGpt
         /zTg==
X-Gm-Message-State: AOAM530KHwZi/BfJulSwzcLirHSqmPsmKwcHuVwT2qFJDIxk5GAJSIAN
        U0rafBM8gK67sjpoXhPZDewBobTUT9n3FbRLsmY=
X-Google-Smtp-Source: ABdhPJzzQz/bRy54tQzuJQv0PKNRGtoTyCC8AunHwVpnG56vvOqoS+9uUb5WUqt99DsVPZczw8SdIv4zvNRUi30s9vA=
X-Received: by 2002:a2e:8191:: with SMTP id e17mr27460724ljg.339.1594103083605;
 Mon, 06 Jul 2020 23:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200706171715.124993-1-nchatrad@amd.com> <CAHfPSqDfWs+LiYo7KdVKKQ6fP0hDyCHtVhwHMiG3Sn7=aHhLBQ@mail.gmail.com>
 <5eae0fda-53cf-47d5-c857-c30bbb924ccb@roeck-us.net>
In-Reply-To: <5eae0fda-53cf-47d5-c857-c30bbb924ccb@roeck-us.net>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Tue, 7 Jul 2020 11:54:33 +0530
Message-ID: <CAHfPSqAjTr1Tj9a8VxppUfgO7k5aL-EbiPEQsVpSp=yMYKQd+A@mail.gmail.com>
Subject: Re: [PATCH] hwmon: amd_energy: match for supported models
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter

On Tue, 7 Jul 2020 at 09:25, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/6/20 10:20 AM, Naveen Krishna Ch wrote:
> > Hi Guenter,
> >
> > On Mon, 6 Jul 2020 at 22:47, Naveen Krishna Chatradhi <nchatrad@amd.com> wrote:
> >>
> >> The energy counters of certain models seems to be reporting
> >> inconsisten values. Hence, match for the supported models.
> > Actually, the supported models could be of family 0x17 in a range
> > between 0x30 ~ 0x3f. I did not find any macro or usage for a range
> > of models. Could you suggest to me if i've missed an existing way to
> > provide a range for models.
> >
> So, do you want me to apply the patch as-is, or are you going to send an
> updated version ?
Please take this patch as-is, i will update the supported models when ever
i get a chance to test on them.
>
> Thanks,
> Guenter
>
> >>
> >> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> >> ---
> >>  drivers/hwmon/amd_energy.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> >> index e95b7426106e..29603742c858 100644
> >> --- a/drivers/hwmon/amd_energy.c
> >> +++ b/drivers/hwmon/amd_energy.c
> >> @@ -362,7 +362,7 @@ static struct platform_driver amd_energy_driver = {
> >>  static struct platform_device *amd_energy_platdev;
> >>
> >>  static const struct x86_cpu_id cpu_ids[] __initconst = {
> >> -       X86_MATCH_VENDOR_FAM(AMD, 0x17, NULL),
> >> +       X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x17, 0x31, NULL),
> >>         {}
> >>  };
> >>  MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
> >> --
> >> 2.17.1
> >>
> >
> >
>


-- 
Shine bright,
(: Nav :)
