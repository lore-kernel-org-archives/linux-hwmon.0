Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01083C433FE
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Dec 2020 15:23:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC64023AAC
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Dec 2020 15:23:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbgLIPWj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Dec 2020 10:22:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgLIPWg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Dec 2020 10:22:36 -0500
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30E2C0613D6
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Dec 2020 07:21:55 -0800 (PST)
Received: by mail-yb1-xb42.google.com with SMTP id k78so1611824ybf.12
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Dec 2020 07:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/7/OdgK2Ys8F+hRGs9PV1AuM3a/GCgCRICVhRFb5RLE=;
        b=JcDRJ7+s/Y2NF5bGPzoxQJ+C2roT2TJx4P+qExRCE0Su3cmzwOINCWrvCHS3qcIVu7
         I1HC7Bbsay8o/0FGpOHWynHoL/k3xfFo4XU7TKrE0hfE48r8E214wv2lbOdocysHlDVq
         ZlEM2vZdHw4/m+3VlDpTRvObfGJoMCxAYs3/1+d5xvQN5+4qsVm2cpV5o4BxJbwds06O
         b7WrnGoRfmB0b3Umv9507OtB/F2CE2rWz3+vYJUmOFPf+yk1AkPmdLZ92gfjM6F+fTrQ
         J/WY93NH2Pzg2+4xl7YCocZwXrHdkU+8O39ecn0G4jhWr1+7KixbnXxWCvxCW40vq2Pp
         OCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/7/OdgK2Ys8F+hRGs9PV1AuM3a/GCgCRICVhRFb5RLE=;
        b=IQ/s51oscd1GuTIcAOmT2ZH9vv3gaaAK2qaXYqYXLV/c8PFsMpoBuNKF69lFQ2Uykf
         cIHgTVgWQPvfhk0nX4YbWaY2pyQ4H3wlvgUdk/iXvtivt9MUclGcBrqVmknGNZ6zWJaR
         tDcdl1i1/YbOT99lIHTfeLLb477MxJyUc1apV2py5PddRJlZ0vrEUaR6gs5p6AbIS3UY
         hihIk/HRCCuXsrmatc64wgmSZVp1rqIf0v/wdVVHOL75KkTTEbxEkJRgwYaXezC0K0UL
         bHZZHhX78MalgxW2RWzPV44jmolUZ6hIz4ZKOxePhVwLNKRI/pPlGYFjSHh6TFSY7A2D
         URkw==
X-Gm-Message-State: AOAM530zgs2HceUeJj5K7D2+auRt5S6+m/IkjqOosLpLGvA6hWs/bVtC
        NrojRKtpOcRUbd+OZGQRIODy/IXfVvG2FV5k7mQ=
X-Google-Smtp-Source: ABdhPJzNFQra8G32oy6WXE4CuBfGtSi5i8S3/4Nh8IRQ33UPxhFov8nLVSPsaHRPBNCgt37bPaYLz9Sq9ncwBh/bEBE=
X-Received: by 2002:a25:be84:: with SMTP id i4mr3981583ybk.103.1607527314962;
 Wed, 09 Dec 2020 07:21:54 -0800 (PST)
MIME-Version: 1.0
References: <a14b8be6-e8b4-c658-2cd6-a2f280be0f99@gmail.com>
 <20201208204059.GA73427@roeck-us.net> <DM6PR12MB4388D95FCC7AD13E3E6AE26FE8CC0@DM6PR12MB4388.namprd12.prod.outlook.com>
 <CAGPDPzDC4zqoeR9dctNfmHv21uB4+NQ5ij7WfeOa2ueT0DY1zw@mail.gmail.com>
In-Reply-To: <CAGPDPzDC4zqoeR9dctNfmHv21uB4+NQ5ij7WfeOa2ueT0DY1zw@mail.gmail.com>
From:   Sandeep <sandy.8925@gmail.com>
Date:   Wed, 9 Dec 2020 20:51:39 +0530
Message-ID: <CAGPDPzDSB99V1u_aRbNFpogvShbSzjU6h+Bn0ENHkBBr12FHXw@mail.gmail.com>
Subject: Re: [PATCH] Add support for Zen 2 CPUs to amd_energy driver
To:     "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 9 Dec 2020 at 20:23, Sandeep <sandy.8925@gmail.com> wrote:
>
> On Wed, 9 Dec 2020 at 16:33, Chatradhi, Naveen Krishna
> <NaveenKrishna.Chatradhi@amd.com> wrote:
> >
> > [AMD Official Use Only - Approved for External Use]
> >
> > Hi Guenter,
> >
> > >> This patch will require an Ack from Naveen; support for this model was previously removed due to inconsistent results; see commit f28e360f2903
> > ("hwmon: (amd_energy) match for supported models"),
> > I could not get hold of a board with the mentioned processor.
> >
> > Sandeep,
> >
> > Earlier, we noticed on some of the family 17h processors the core and socket energy counters are not well calibrated.
> >
> > While running avx-turbo work load https://github.com/travisdowns/avx-turbo as below, we noticed that for a given time,
> > the sum of the energy consumed by all the cores in a socket is greater than the energy consumed by the socket itself.
> >
> > Can you run the avx-turbo test, with following options and confirm the results ?
> >
> >   ./avx-turbo --iters 10000000 --spec avx256_fma_t/8
> >
> > This will run AVX code on all 8 cores for about 1 second. To run it for longer, increase the --iters argument.
> >
> > Regards,
> > Naveenk
>
> Sure, I'll run that test. I have a 3900X though, which is 12 core, so
> do I have to adjust anything for that CPU, or just run with the
> parameters you've specified?
>
> - Sandeep

Ok, I ran the test for both 8 cores and 12 cores - in both cases, I
can confirm that the sum of the energy consumed by all the cores in a
socket, is NOT greater than the energy consumed by the socket itself.

- Sandeep
