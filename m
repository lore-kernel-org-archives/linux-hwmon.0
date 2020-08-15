Return-Path: <SRS0=mGkJ=BZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05882C433E1
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Aug 2020 22:06:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2A8620639
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Aug 2020 22:06:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhnN+Z+9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729398AbgHOWFu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Aug 2020 18:05:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729648AbgHOWFn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Aug 2020 18:05:43 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0675EC03D1C4;
        Sat, 15 Aug 2020 14:00:40 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id w14so13444628ljj.4;
        Sat, 15 Aug 2020 14:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aEUHVux8podF75099EdSiDpHB6gvV6ZW5+1Tq9t2oHc=;
        b=XhnN+Z+95DqoLCzEMSlJ7VD6x/9+UHP9MvB5yWTDRQFY7GJ7BLnuhgNYcarGxhqDFE
         1aZrTPzWssf0aAvfh6s1X9wI3Bep43LnRtYlOndZ3pfAjrZ2lYgSVFp9eg9KMqWDI8D0
         pDHS5pvX+RFzF/iyjN/eGW90XmKerhotGP0082Xmt1r/LSSEFSJp8jmXY6UBREGVllt+
         cK7GQRQk/yaV5Ed9PV2Y9fZvmjJ07Xz1lv0vAU714eT92goF9HO/joOtgUBVk3/fRLah
         s7K/ju+2bjAE0ick+dFZe/2y5yJw69zuasi4GKv7LRyW0LqmTp8WJjNyAouLhoNnIEDp
         0hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aEUHVux8podF75099EdSiDpHB6gvV6ZW5+1Tq9t2oHc=;
        b=bpVQlxqE4KddJr3QfgaWol8SKgrOHBjO2u4X8arlDgi80GdTh4xRbvEoQqbmbFux88
         Lcn+zKkHdBxht3njoSoURKEl38THOmSzQQbyYQcrMBY259NLimsQBbMCoVYZhmKP/P7D
         8sbNGeAi1DoRW8/Oo1cTS51EXzXYM51NpfvppFWYmz1RE310lqJOgxcf/Iq003cH4Qjo
         tVpFtfn53zXsYtY1zcZzTwPlGAkMd20ZdrnN1ndjB/Xwt2o0f1LQmF08BiTtehe1qbRm
         adq9mhuZnAS8atfk3rArM3DzJicDt4arA52MnL+/jZaQ1RkxXG5cZzfdHpIiLHVaVuY+
         StdQ==
X-Gm-Message-State: AOAM532AQVjdl2Xv/WhV9KS/Se+Z5mLfEWOASxSxMjGjfHliGIaGgI7h
        +lx16x40vLiPv/xa5U7/DGbL5cl3wRDNNoMsqzc=
X-Google-Smtp-Source: ABdhPJy/zYDNJ9BK05LF+dL/HHQOHLTm7T4hmi+Dt0XsDsX6ZxFJ2pH6s2knQ6OgnOb6bmV0Cdzt2MuvV+WVP5jZ2mw=
X-Received: by 2002:a2e:3817:: with SMTP id f23mr3821650lja.118.1597525239014;
 Sat, 15 Aug 2020 14:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200814194202.327141-1-jaap.aarts1@gmail.com>
 <4hk1tR-p2Dc2UbnNVCvFg4AJsucTKOwY0-Kc934bQ8VJSIhiTm-iw1qb03jNb9mGDBqWhXwlnzwB6vxKNLZf6Sv7ozKSigS9IHInXizzmE0=@protonmail.com>
 <CACtzdJ2cPfz7b6bEUsLB5k+JzXFPLLKxxaYRheFPAwV3UQiu5Q@mail.gmail.com>
 <92GG6DNvh8x8K43ZGnot6ASLNHBD7l6R6RiI-4jv-Lfki4_tM3IJxPYbp-xajRqMV84Nyw4sp3hZft36ulU2QnxCyhf52kEr6OYe9iujBTk=@protonmail.com>
 <CACtzdJ0Rdh5L_JEA0GN37AOyYOUGRf4yfbXD+AJCvxZdYdKQcg@mail.gmail.com>
 <CACtzdJ1tgbDVxYkcWstkGkz3=E0BTugUT7B5OrxVo15YPU+M4A@mail.gmail.com> <jFeUSolwYuVcf_sROUuSk8EovBBGXiIIQeL7RsDcdjt7kTszfpNIG6ZqD2COx2u5LPojn2BEthfaMqbHmQwUcwPbYc2U7rqDrJDlTkg2Gf8=@protonmail.com>
In-Reply-To: <jFeUSolwYuVcf_sROUuSk8EovBBGXiIIQeL7RsDcdjt7kTszfpNIG6ZqD2COx2u5LPojn2BEthfaMqbHmQwUcwPbYc2U7rqDrJDlTkg2Gf8=@protonmail.com>
From:   jaap aarts <jaap.aarts1@gmail.com>
Date:   Sat, 15 Aug 2020 23:00:27 +0200
Message-ID: <CACtzdJ03xEMg+F6R+A0O0obS3Sw1wo0WaaZmSdYv-CfQQpb3HA@mail.gmail.com>
Subject: Re: [PATCH V3] hwmon: add fan/pwm driver for corsair h100i platinum
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

oh oops, it must have gotten in my head differently then how I
interpreted it at the time.
>
> I don't recall ever asking about sizes. I said in my previous email
> that I meant "type", not "size". 'bulk_out_buffer' was 'unsigned char*',
> but 'bulk_in_buffer' was 'char*' in the patch. That's what I referred to.
>
> 2020. augusztus 15., szombat 22:44 keltez=C3=A9ssel, jaap aarts <jaap.aar=
ts1@gmail.com> =C3=ADrta:
> > sorry forgot to reply to the question about the buffer sizes.
> > The reason they are different sizes (in theory) is because
> > I get the size for each buffer from usb_endpoint_maxp.
> > I do not know whether or not these are the same. If you have
> > any experience with these functions and know they are always
> > the same I am willing to make them the same size.
> >
> > [...]
>
>
