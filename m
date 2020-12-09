Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E4DC433FE
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Dec 2020 14:54:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F1EF23406
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Dec 2020 14:54:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732471AbgLIOye (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Dec 2020 09:54:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732465AbgLIOye (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Dec 2020 09:54:34 -0500
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B79C0613CF
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Dec 2020 06:53:54 -0800 (PST)
Received: by mail-yb1-xb41.google.com with SMTP id v67so1558948ybi.1
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Dec 2020 06:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MTdxW1cUnFUtLx3wI2uWV2ULvD3GEkJRMWz4z96b9cU=;
        b=B70Ra6O8tBYbNaowPjUaprE30t02MMdmYQPrmoC49aJ2MwAMKV2E3uE8j3RqvuMm13
         SFDmNNGXAlNmMRVThpFuQn5e2vFMMf0cvondmTnKJMsCvbXLocf+ahMdZolVn49K7p5H
         GvxBjNWF9cuSoOUQhwLxbJD6XMkNbk48NS/HnydRsDDc6fF6mbQDt/D2G/Etdc2WOlu8
         Y0hywUnBYkjnCRx9yyMvOSfg4M6oLxKsW5acOmFvLOS2wDUA6PYL7WQsH/Pt21S+z7NN
         9qH3XIr2ThpJXaAelh0YqmN9Psg5+mXhUqTw6MqUJwzPg69a9EAVvpjDDfJ25aFo7zvp
         rvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MTdxW1cUnFUtLx3wI2uWV2ULvD3GEkJRMWz4z96b9cU=;
        b=BHpIhitoYk0mcfJfrPbXVYAM8bZ8VQ6/kVDG5K39fvBxsiC0W810TTKEexu7mp8E4+
         iqwy3S+laG8zxNj3FZwHlrsLpA5bwvPUJxBMoyqWu3zq3NUb0oM/AdldgnP6RWPlBwTJ
         lKDEjbCKlmqMUIolusQCot/Epa/xXLcWjfoA2eQUc8GTPeepvz7zbDdqcqtsWhvTk5aR
         KtBRodNps3XdyXzYocSolLNA55/P1dxQPikzC/SldsfbqLWtoxIe/gjg5gGYWhoYyzIR
         daMth+kpO7UmKUGGPrBGGAMC1Rm3bNXZaQbCIbVYm5664SkkyA5sqrBuMOaHWzoqDyQ1
         ofkA==
X-Gm-Message-State: AOAM533pYWnpU0zqtzi6m+AfmJeC8T1offuH6NEgQ7CrmTjLxmPMTScU
        J627B2k8A6+onLLJtCci8r2b8ykJwuNmvKKHQD0=
X-Google-Smtp-Source: ABdhPJxMO68Mt42n+jmHkju4GhSn6li+ABPx2FxliGq60flUb2K+4sk97cIoXOfncUMTMKjNvKw5n6HhbzWLq+QVJhM=
X-Received: by 2002:a25:318b:: with SMTP id x133mr3989086ybx.201.1607525633634;
 Wed, 09 Dec 2020 06:53:53 -0800 (PST)
MIME-Version: 1.0
References: <a14b8be6-e8b4-c658-2cd6-a2f280be0f99@gmail.com>
 <20201208204059.GA73427@roeck-us.net> <DM6PR12MB4388D95FCC7AD13E3E6AE26FE8CC0@DM6PR12MB4388.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB4388D95FCC7AD13E3E6AE26FE8CC0@DM6PR12MB4388.namprd12.prod.outlook.com>
From:   Sandeep <sandy.8925@gmail.com>
Date:   Wed, 9 Dec 2020 20:23:38 +0530
Message-ID: <CAGPDPzDC4zqoeR9dctNfmHv21uB4+NQ5ij7WfeOa2ueT0DY1zw@mail.gmail.com>
Subject: Re: [PATCH] Add support for Zen 2 CPUs to amd_energy driver
To:     "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 9 Dec 2020 at 16:33, Chatradhi, Naveen Krishna
<NaveenKrishna.Chatradhi@amd.com> wrote:
>
> [AMD Official Use Only - Approved for External Use]
>
> Hi Guenter,
>
> >> This patch will require an Ack from Naveen; support for this model was previously removed due to inconsistent results; see commit f28e360f2903
> ("hwmon: (amd_energy) match for supported models"),
> I could not get hold of a board with the mentioned processor.
>
> Sandeep,
>
> Earlier, we noticed on some of the family 17h processors the core and socket energy counters are not well calibrated.
>
> While running avx-turbo work load https://github.com/travisdowns/avx-turbo as below, we noticed that for a given time,
> the sum of the energy consumed by all the cores in a socket is greater than the energy consumed by the socket itself.
>
> Can you run the avx-turbo test, with following options and confirm the results ?
>
>   ./avx-turbo --iters 10000000 --spec avx256_fma_t/8
>
> This will run AVX code on all 8 cores for about 1 second. To run it for longer, increase the --iters argument.
>
> Regards,
> Naveenk

Sure, I'll run that test. I have a 3900X though, which is 12 core, so
do I have to adjust anything for that CPU, or just run with the
parameters you've specified?

- Sandeep
