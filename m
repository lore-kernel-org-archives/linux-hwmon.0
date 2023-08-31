Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93CAC83F17
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Aug 2023 08:56:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241235AbjHaI5B (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 31 Aug 2023 04:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239146AbjHaI5A (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 31 Aug 2023 04:57:00 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC7EBCE6
        for <linux-hwmon@vger.kernel.org>; Thu, 31 Aug 2023 01:56:57 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bdca7cc28dso4399215ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 31 Aug 2023 01:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1693472217; x=1694077017; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GFSqNDPkeaHQR4IVBJ1wtH05it7jXcUWJdQhCPiuhFU=;
        b=ayuNNWsG/sehQYIkEhKh0bPs4XTwjv2y2X+kRWB3sHQgk1I4Gc8kaYGjGV2Ohrs9Hb
         m3Mi31zK0qVm1DW9ioxvCXSuQw0cRpE6BbKMFh4do9W0SAulShPhRDVagKCXHX9B0NSR
         4BghnpTWdU2XnpUN3JZ8zlwqqQ92YDkqAsNGFFvjwdCLBUA1YcfQrsLwbRzL2KDGhLW6
         YsLiWxbaR3woF7QBMxl6u1x4nYA7ZQV3s0B2PO4YQcwnVqqOi8G1KPVrjmABpEQXA+gS
         I9Mpa/svGip5NYMvihpN5XTgJ75QmIGj2/0prfhdCaJTbr3zugnE+1dont8mqJi3TnA/
         WolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693472217; x=1694077017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFSqNDPkeaHQR4IVBJ1wtH05it7jXcUWJdQhCPiuhFU=;
        b=Pg+0/jemYraILuPg9ZxwWz46D0seZMXK2jaMuw2VkRZRQeDgBcOAb4gGTfqDI1T49C
         o+c2ahSx+tUVisUrOqsqJrZtBje7FpTHpHIbAhOqqYppSnP+ebEneoNIV+jLGy5FzIhB
         FrBjFIEUg0xDOpZ4h7qceLzPsfJ0aSvvJXzRcxZ+bA/O461Z+ZbicPjZTKxFAT9YJhWp
         MLmwP4uA13sGRj44bk9uGPszbEfwS6cDIxEkX2uQJVbBGbOavt1gY47kVEFJx/Hx3hEm
         bTKS3AhQ6fn6WHfmolEVrgsdR3FjuP/RvUR5TIlxuEjF+JfL8pnEtyHx6wwwv0Cy1w9+
         IT6Q==
X-Gm-Message-State: AOJu0Yzur7jKNCcY35w65w+3httddj2TZgzDr83NFoeaNZr1JkAou+0Y
        mAn4JD1T/Gqz6LBXHA2BkNa3bo9U3pO/7bMRyLHN0g==
X-Google-Smtp-Source: AGHT+IHvvswip25U6YKteyOygNkgxG1DFzTx9idjU9EotOhI8666Cl6ge6BrbiYNkQsHjmLdjQusf7pYrurulvmtVPc=
X-Received: by 2002:a17:90a:8043:b0:268:2523:652c with SMTP id
 e3-20020a17090a804300b002682523652cmr4261818pjw.31.1693472217352; Thu, 31 Aug
 2023 01:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230830111319.3882281-1-Naresh.Solanki@9elements.com>
 <0bfbbbb3-6144-fc9a-c8ab-423a8865591b@roeck-us.net> <CABqG17ig1VRJYqbrOvPKAYS8iUFwY9J3tYcgYGtnnXw+vrnoRA@mail.gmail.com>
 <1efe9234-a97f-6df2-c47d-e153dc362599@roeck-us.net>
In-Reply-To: <1efe9234-a97f-6df2-c47d-e153dc362599@roeck-us.net>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Thu, 31 Aug 2023 14:26:48 +0530
Message-ID: <CABqG17hhPUjSKoAxVFKAmrZfQ0TpTRWVpoe-CrRAu0i7jt=JFw@mail.gmail.com>
Subject: Re: [PATCH] regulator (max5970): Add hwmon support
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, zev@bewilderbeest.net,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi


On Thu, 31 Aug 2023 at 01:02, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 8/30/23 12:14, Naresh Solanki wrote:
> > Hi
> >
> [ ... ]
> >>> +                     /*
> >>> +                      * Calculate voltage from ADC value and MON range.
> >>> +                      * ddata->mon_rng holds the voltage corresponding to the maximum value the
> >>> +                      * 10-bit ADC can measure.
> >>> +                      * To obtain the output, multiply the ADC value by the MON range (in
> >>> +                      * microvolts) and then divide it by the maximum value of the 10-bit ADC.
> >>> +                      */
> >>> +                     *val = mul_u64_u32_shr(*val, ddata->mon_rng[channel], 10);
> >>
> >> Why do you use mul_u64_u32_shr() here but a direct shift above ?
> > There is possibility of overflow due to large value of ddata->mon_rng
>
> Does the right shift guarantee that the result fits into 32 bit ?
Yes. Value in ddata->mon_rng can go upto 26bits, & ADC is 10 bit.
The 10 bit right shift(part of calculation) makes sure the result
never exceed 32 bit

Regards,
Naresh
>
> Thanks,
> Guenter
>
