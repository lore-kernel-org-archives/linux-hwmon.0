Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B99C4361B
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Dec 2020 23:14:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42626238EB
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Dec 2020 23:14:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbgLIXOr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Dec 2020 18:14:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727641AbgLIXOq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Dec 2020 18:14:46 -0500
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FAA2C0613D6
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Dec 2020 15:14:06 -0800 (PST)
Received: by mail-yb1-xb44.google.com with SMTP id w139so2943218ybe.4
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Dec 2020 15:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y6zpGeHAUf07hqZ/9i0MWUe9NImW+ZgP79HS6N7nBi4=;
        b=ViHnaSHojHnAvaohNhNd4XU9qH6gf9LGL9WlJSxliolVfN8S3JT0SVOYESaB/AvDwL
         VgjyYcRU6ByrN2RR0HIK8ZV6ONEWbsjv4/YdmeFyL9MMRpfZCv8R4Lz7KaOHUIs8obMA
         Q8ueIUV50LKvW8EcPuPq392UY6LntqQ8NYFthM/y5EPuyaWgTAq6QSgmbZ6OoGEIUt6Z
         msqagJEtIIPFA/wJL6XErMx5M1pkcGpJuVD1tngmb3snJd5kSXVp6CjDC/Ed4sT8P7QP
         1fl5rtF9wGqY+6YKaHWAHe48GEMS6Km01wPo4NsOmWjg30XYdsSW2myHLAITYDAXEgxY
         tJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y6zpGeHAUf07hqZ/9i0MWUe9NImW+ZgP79HS6N7nBi4=;
        b=uPWWC+J676sWMN5jdSBMmYQ4iayNp4U3Lxpb6uK5fy0sSObIEFlly3yP629RzPcGRC
         zT+wtTGP1KY/71i2B/5oPFVp7t9itmKTRciwOzHkvCuqCkjxUl5RH8uWYxD3PBNPyQi0
         Ta7gKkareWEvzSlnnpyaH9CCSfGaK3aed5ms0oc6Z4c5/jgrX+PP0p776RgndQWdRpPa
         X48fVuWiglCjuKDFamQ0xA5H6e6H8JZ4XpUXH0kqj8XDMo7I+WZa09rfCHpHEl6Rw/UG
         KFrbO1/FFQeaUR8keKN49UFna2JpJBEK2rzxL9p6hBFHAV7/9fvQJZ5Z6ZI8LlkJmHnT
         QJOQ==
X-Gm-Message-State: AOAM532NQc3/EVKVGxxPNlFU+gbqTds1+Vpdol1M2mQbFz564rIIS184
        wowh2ojt2eNwpA33/Cn5/nvVOYIwDSGJWGVCy4A=
X-Google-Smtp-Source: ABdhPJxqCqob/iO2CZ01qesj+xuFZdZHCvDORT1IaVhiHxQGTF7fhWRMoBKfnKEd9NMnt0OWUFrJqJemQ1wMebsd0xE=
X-Received: by 2002:a25:318b:: with SMTP id x133mr7117693ybx.201.1607555645740;
 Wed, 09 Dec 2020 15:14:05 -0800 (PST)
MIME-Version: 1.0
References: <a14b8be6-e8b4-c658-2cd6-a2f280be0f99@gmail.com>
 <20201208204059.GA73427@roeck-us.net> <DM6PR12MB4388D95FCC7AD13E3E6AE26FE8CC0@DM6PR12MB4388.namprd12.prod.outlook.com>
 <CAGPDPzDC4zqoeR9dctNfmHv21uB4+NQ5ij7WfeOa2ueT0DY1zw@mail.gmail.com>
 <DM6PR12MB438881D1D0F87627E78310C7E8CC0@DM6PR12MB4388.namprd12.prod.outlook.com>
 <CAGPDPzB_h651WdkZJWSopfTAisHqBjXd1SXat_vMD8EZf7Oy_A@mail.gmail.com>
In-Reply-To: <CAGPDPzB_h651WdkZJWSopfTAisHqBjXd1SXat_vMD8EZf7Oy_A@mail.gmail.com>
From:   Sandeep <sandy.8925@gmail.com>
Date:   Thu, 10 Dec 2020 04:43:50 +0530
Message-ID: <CAGPDPzBRfM0un57qiq5WjN+-EtpEoFcZGfWqrirXg_LHkjSAzA@mail.gmail.com>
Subject: Re: [PATCH] Add support for Zen 2 CPUs to amd_energy driver
To:     "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 10 Dec 2020 at 01:35, Sandeep <sandy.8925@gmail.com> wrote:
>
> On Wed, 9 Dec 2020 at 20:58, Chatradhi, Naveen Krishna
> <NaveenKrishna.Chatradhi@amd.com> wrote:
> >
> > [AMD Official Use Only - Approved for External Use]
> >
> > Hi Sandeep,
> >
> > >> Sure, I'll run that test. I have a 3900X though, which is 12 core, so do I have to adjust anything for that CPU, or just run with the parameters you've specified?
> >
> > I'm trying to get hold of a system to test it myself. In the meanwhile, you may run the following command
> > in the back ground and read the counters (cores and socket) at 5 to 10 secs apart and
> > sum of the diff of core counters should be not be > diff of socket counters
> >
> > sudo ./avx-turbo --iters 1000000000 --spec avx256_fma_t/12
> >
> > You may refer https://www.spinics.net/lists/linux-hwmon/msg08255.html link for more background of the testing.
> >
> > Regards,
> > Naveenk
> >
>
> Do you already have a script or something that I can run to
> automatically gather this information (i.e check values every 5
> seconds, calculate differences and check if the results line up)?
> Doing this manually, sounds like a lot of work that I really don't
> want to get into.
>
> - Sandeep

Ok, I was able to write a small program to automate the test, and it
looks like the following condition "sum of the diff of core counters
> diff of socket counters" is indeed true. Looks like the values are
indeed incorrect sometimes.
- Sandeep
