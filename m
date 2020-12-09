Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A75C4361B
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Dec 2020 20:06:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BD99239D1
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Dec 2020 20:06:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729522AbgLIUGa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Dec 2020 15:06:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728197AbgLIUGa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Dec 2020 15:06:30 -0500
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FDC5C0613CF
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Dec 2020 12:05:50 -0800 (PST)
Received: by mail-yb1-xb44.google.com with SMTP id v67so2491625ybi.1
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Dec 2020 12:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UJFbJKS4ao2IYWnP688A2notPvXlz7UasrM6xISzh+8=;
        b=QDiJPF9xycQy1Pj/orhm89DVRY6pFrFjw68vKz5rnAaHraU3S5lkVmMlO8ErQjRbZb
         HHc+iOkyFgKjrZU6JoVoF1kyJRssmNtrtQlLWlsEPw/o+LDmRPdAlluYlielV4ucBoYt
         fUyQ6AcOENrkcK0NMQFSmqT5CSvtAnWnkbq3m1MTc+vNuouXCdkW91VAiIpc6dmrmwec
         0ZG5iXr5olO6PB0OLZ4HWmVnfh+TL3WYbeWKWKk09rdJi6YntF3vzbFsv2ZJe9plLtRU
         4P2Y5gKjklEUgIpoXdghgCmpHDXmFSG7O3MYnYVmCRryZuRexgBz8fqQQYw7yiAEGTgM
         zJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UJFbJKS4ao2IYWnP688A2notPvXlz7UasrM6xISzh+8=;
        b=mc380aq2izAklwmWv3CD9phSC1KpkEPz1Tvm1ZoZGiSXDSaetES69znNmLqm9d5iFR
         +lDvgx8OK/R9XGxxnqf4c0p/K4gRv3n/HtuPpAdj9PpGZS5H/SaCUrg4dEsv3S8XVCT4
         0C69LHM3LgkF9KBcvlI7tePyN0CjLkD5RUDVcvNeeK2blf7/YWN4LjkJHkBkJlwWX4Zf
         gnn3O6aLhEiSO6i8bRva1i8T2aWyg4RqTW1/akqAOrqebXU0hTcsfLUKDvCV1bXSS3c1
         aVrcCRhE/2bIGycjbKnr1HLxeLUpZEgbjNN/qs3Efmu+TLSlsJo5vDsB3Mk/1Scq78Wi
         gCnA==
X-Gm-Message-State: AOAM531ae1xemr/en4JHTn2JOCO6Pwc+kx0gyym+N5xYhRZ9nbIZVCts
        NlEmZBrlECE6L0dPM0I6jGsiwpF2pzB0AT0zNMKHBV8Qea4=
X-Google-Smtp-Source: ABdhPJwPCJVYgl/2NVZsEFtS38iC80imDng5XrFybXI7WfSYAAmQUISQG/gdX6CiN34gkK6AAJ4V9DqLu9nh5XVG438=
X-Received: by 2002:a25:9204:: with SMTP id b4mr5970303ybo.98.1607544349281;
 Wed, 09 Dec 2020 12:05:49 -0800 (PST)
MIME-Version: 1.0
References: <a14b8be6-e8b4-c658-2cd6-a2f280be0f99@gmail.com>
 <20201208204059.GA73427@roeck-us.net> <DM6PR12MB4388D95FCC7AD13E3E6AE26FE8CC0@DM6PR12MB4388.namprd12.prod.outlook.com>
 <CAGPDPzDC4zqoeR9dctNfmHv21uB4+NQ5ij7WfeOa2ueT0DY1zw@mail.gmail.com> <DM6PR12MB438881D1D0F87627E78310C7E8CC0@DM6PR12MB4388.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB438881D1D0F87627E78310C7E8CC0@DM6PR12MB4388.namprd12.prod.outlook.com>
From:   Sandeep <sandy.8925@gmail.com>
Date:   Thu, 10 Dec 2020 01:35:34 +0530
Message-ID: <CAGPDPzB_h651WdkZJWSopfTAisHqBjXd1SXat_vMD8EZf7Oy_A@mail.gmail.com>
Subject: Re: [PATCH] Add support for Zen 2 CPUs to amd_energy driver
To:     "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 9 Dec 2020 at 20:58, Chatradhi, Naveen Krishna
<NaveenKrishna.Chatradhi@amd.com> wrote:
>
> [AMD Official Use Only - Approved for External Use]
>
> Hi Sandeep,
>
> >> Sure, I'll run that test. I have a 3900X though, which is 12 core, so do I have to adjust anything for that CPU, or just run with the parameters you've specified?
>
> I'm trying to get hold of a system to test it myself. In the meanwhile, you may run the following command
> in the back ground and read the counters (cores and socket) at 5 to 10 secs apart and
> sum of the diff of core counters should be not be > diff of socket counters
>
> sudo ./avx-turbo --iters 1000000000 --spec avx256_fma_t/12
>
> You may refer https://www.spinics.net/lists/linux-hwmon/msg08255.html link for more background of the testing.
>
> Regards,
> Naveenk
>

Do you already have a script or something that I can run to
automatically gather this information (i.e check values every 5
seconds, calculate differences and check if the results line up)?
Doing this manually, sounds like a lot of work that I really don't
want to get into.

- Sandeep
