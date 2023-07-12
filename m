Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E12CEB64D9
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Jul 2023 08:49:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbjGLIt1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Jul 2023 04:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbjGLIt0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Jul 2023 04:49:26 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08293CF
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 01:49:23 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-76714caf466so622177585a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 01:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689151763; x=1691743763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6asCIJZfh89X/Pid3ai0oXZDotleMvJEDvS2yZNbiic=;
        b=BVmcnc4SJ4NNyAlLwbkYhFQsxpIE/2gt8dFBgtENtVwmo5KP/TuO9o+JVHkuWbAqRV
         rkOvgo+eB6VMX8332YE21U4AXOR1NPYhs/HJOrvrNl6zZtKqi82E0dIV8zuA9NWnEqJu
         1hlqBFuGx+tz8rmEG8cH77x8GEntkyjJX0qrV5Y9pJyxsPjpASMAJ7MHukrFv9TTa85W
         dOM+QqJSMSUf3LJozf/rjD/aOQFYdmK/16ZW9MyNLbjQWxh80tKUB81SFmTdWzDzAG0E
         3ilJ/ic+HknUn8rbAaMJQozGahvbyponRv0CfVi2dLsL7P2HEdqCdQCAwT/q+hTX0J+V
         hEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689151763; x=1691743763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6asCIJZfh89X/Pid3ai0oXZDotleMvJEDvS2yZNbiic=;
        b=P2Fxl8Ap8rzZF+K/8G7vYeGXmDvQ5z6qfutUdza7mW9M2TVliw5PtD2EKlfGPXGqmu
         ow4bc8ajU/sKtNnG52eiJ+EPbFnSIyOOjKKmhbeQlDaQAcPaaYAa3fHqK3QN2E0m8vJc
         yISAw364hjtH7+U70QH952XoyKixpX45W+s+QPtjnrU4kB4iitfYqFWnDp/CUA9g640U
         7Q6xMvMUKc4y7f9uEjETzZRJEGnG+F+0Jn4uvBir9tCHC2x5ivy1LnejE+IZc81A3khE
         hVsGzAHO8oxa/PmWn6w8Njx6HJFAytV9tCkR61OKdSyfoIfk5bN36jmb90O/q2WTFp28
         VHQA==
X-Gm-Message-State: ABy/qLaLjjqNSl7tZT+uL3V9e22IyGIBgXAbCPsAfmvHlrCetu/QXzKQ
        /uaRQurVpRNnXbfdhFRcjV4vU0UCIWd/BbPz3vBi7w==
X-Google-Smtp-Source: APBJJlF72vy+DxMvN0aXWMy3infWehyApUye86ZMGblUGpIBDBNTDFaMkN4MymHVU2YOFBQEcRz7PWbxFRxdfoCgR7U=
X-Received: by 2002:ae9:d613:0:b0:765:381a:3487 with SMTP id
 r19-20020ae9d613000000b00765381a3487mr17442349qkk.57.1689151763171; Wed, 12
 Jul 2023 01:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230711160452.818914-1-Naresh.Solanki@9elements.com> <36752432-52e7-22e1-a2de-332749aa15a1@roeck-us.net>
In-Reply-To: <36752432-52e7-22e1-a2de-332749aa15a1@roeck-us.net>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Wed, 12 Jul 2023 10:49:11 +0200
Message-ID: <CABqG17gswZCgtc7ECZK=AJ8S3=QRQ_HW2ZmS=cLUSrq=63qOSQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] peci: Add Intel Sapphire Rapids support
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        iwona.winiarska@intel.com, jdelvare@suse.com,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On Tue, 11 Jul 2023 at 21:46, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/11/23 09:04, Naresh Solanki wrote:
> > Add support for detection of Intel Sapphire Rapids processor based on
> > CPU family & model.
> >
> > Sapphire Rapids Xeon processors with the family set to 6 and the
> > model set to INTEL_FAM6_SAPPHIRERAPIDS_X. The data field for this entry
> > is "spr".
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>
> Please version your patches and provide change logs.
Yes, I missed that. Will be updated in the next patchset.
>
> Guenter
>
> > ---
> >   drivers/peci/cpu.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
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

Regards,
Naresh
