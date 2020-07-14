Return-Path: <SRS0=kNNy=AZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4985C433EA
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 10:03:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9879D21D7A
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 10:03:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rUV1opep"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgGNKDi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jul 2020 06:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgGNKDh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jul 2020 06:03:37 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD09C061755;
        Tue, 14 Jul 2020 03:03:36 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id x9so11728322ljc.5;
        Tue, 14 Jul 2020 03:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HXDj3gnUGVFHVcsgX9QO4FSWY0VUn7oLs/BSegJIxMI=;
        b=rUV1opepvZ/zZOcOpJDOu6HSnYJYLeq3Tyd3arPZtOn5AFAiPkBTniswPRx3v6YXi8
         1Tj7rbHpVb+JkpfmI3EqCxox20eVzx6u6p+lkaY19bHjsgwiMmajMaBFEhCd2d8OCyzc
         pXiIarwfbhMmD+4loVOu2oG92dE7Yax9/ys1xsWDh3DJO8fu/D6z/Wk6hhj4JV5i7HvM
         YTTpwb72vTNvMyNzfnhb9aHrhAqYaxAOernkmlnauGnNEeYnSMz7Hz6OJjFP+M2+W3Uo
         NEI0y00E1Pu8xMoUR1cM1WgjfXcDKaLX5CYNMtiLHLMQM011rTOl6ky8GPCLPyRqDhhX
         D9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HXDj3gnUGVFHVcsgX9QO4FSWY0VUn7oLs/BSegJIxMI=;
        b=SkZuD2UvPz6FIlMg+8cI4xjnq6iv8n1dZsqdDp+CcIrTBcdt2mX9g+owWmK7OM2Jfy
         1S/Oa33i2kL462Lf7krs5yblm97NVzDYwVhSPqrv+OeRUOcuHthRbMjdzY+KsV15HNtf
         Ktsjo+8dfv6O8djtOmpwgZwkm14m+tYSkkTZFHrLqQtLzc2Z9tDBjmkGWUzAIvs/DJfU
         1khnV6HqwputknVqGsAZwkmzgL+JKWMqm6f92eH2AgAYswQ3sTUXjqrKvFlSDMg29isQ
         tV2HWo4lJcrVD24nf2fR8wJxhv433tJcPnkysTgA+pboDVbDHyFRfDCd/o1nHmsotdf8
         wKSg==
X-Gm-Message-State: AOAM533oJIQO18DNW8hfBPC/z6nMo7pbiCyNPXCkipBAGRS53rztq5Vi
        37AeV4IxrXqly3rqt1VI+U+sWRqqmW7VPV6ruYGVlNXjAwM=
X-Google-Smtp-Source: ABdhPJy3ZujR4YpO6KeS07MBMKLcbWxcTwzzpkQrWomdyoQaQXUIKCuOnO/huubEjmCOYNqINiAOnVI+ogJ1jMUYQ1c=
X-Received: by 2002:a2e:968b:: with SMTP id q11mr1782079lji.300.1594721015191;
 Tue, 14 Jul 2020 03:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200713193227.189751-1-jaap.aarts1@gmail.com> <2647223e-74c2-8fd6-f649-9e051a7d9d6b@roeck-us.net>
In-Reply-To: <2647223e-74c2-8fd6-f649-9e051a7d9d6b@roeck-us.net>
From:   jaap aarts <jaap.aarts1@gmail.com>
Date:   Tue, 14 Jul 2020 12:03:24 +0200
Message-ID: <CACtzdJ1+1FUaq0TMrUk1tkenOFfxE2Xrsrx1DOnd1P+vZwnSTA@mail.gmail.com>
Subject: Re: [PATCH 1/6] skeleton for asetek gen 6 driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-usb@vger.kernel.org, Jaap Aarts <jaap.aarts1@example.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 14 Jul 2020 at 06:59, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/13/20 12:32 PM, jaap aarts wrote:
> > Signed-off-by: Jaap Aarts <jaap.aarts1@example.com>
>
> I am not going to review code which is later changed in the
> same patch series. Please combine all patches into one.
>
> Guenter

Thanks for the feedback, most guides state you should
split up your changes into smaller patches if they get very big.
Maybe I misunderstood the intent of that?
Anyways I combined all patches, fixed my signoff line, added
a changelog and fixed my subject line.

Thanks,

Jaap Aarts
