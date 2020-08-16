Return-Path: <SRS0=JR9X=B2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94427C433E1
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 09:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64E9420674
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 09:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4dnJaKt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgHPJFz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Aug 2020 05:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgHPJFx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Aug 2020 05:05:53 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D1AEC061756;
        Sun, 16 Aug 2020 02:05:53 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id x24so6843120lfe.11;
        Sun, 16 Aug 2020 02:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jUPMoN7h/pC/9XViXu60gRrULLf09hMVz4XNig5mmzg=;
        b=J4dnJaKtlBYjjqPK0m299ipC7xvyb3teTbwNq58Yad7tfxtkhyLQMxP6UE2geNNaz5
         YoI79yBQ9xXvHBtkDFoJ5BQ1+WkE7YIak3Lw/51PzqmVb9eOuUi6F8+r1ZFwd+2DvD3F
         ADGlwJbLNU1Y9WMuqzxcDs87+v5HNQy3Adcwp58vDCemwGICuUt4MeK3kzhD+xI6Q0GT
         AVbC/bpyyagiXYMC+uKj76Mj0WI0jkcUjNQIv+WPt7kBHjLr7VtcaUffevQSRc6R5ZMz
         nnWFQW5+NhTYvGgBUyNALpWsi8VQHY0mz+VaX2tIcXwhxhQ+KtjIA5zNjJK04wWdmMso
         Q7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jUPMoN7h/pC/9XViXu60gRrULLf09hMVz4XNig5mmzg=;
        b=d7Cj/ph6urnJoQ3UrpUezYkAV8W3CFJY6oPy1Nr8Vjl7TLK5w1rQhj4/meHY7Sois/
         r/geelVsBD4jWATicKYSMTY/i+5FxZdkW1j6fNkk7GcymQlVsVTNA/BHtfN4+493i3GK
         6bmS30YMJTn+LR50eC72HV92CskLA2a/YBjNraVBuC3alfDXDaoM8OixMiBMZ+squewA
         oAaR/XWWCqvNzW8xLBb86MRi7Lg1e9K8+w9wONwRO7H/WwB/rjRVyqgjk4yi9yLtr3lY
         V30MyXvAJxoswR6DqELWHABZHKTNdtYSkpcPJTp7ah061otLNXzEYGPQ9Ydc+Adb4HhN
         HtVA==
X-Gm-Message-State: AOAM531ywZi9FIQmkVKw81noVTNoEZDXwEGVPK2hE4Ty2xSNX77yMTZO
        QDwKSTbqsEm4bzzjtn+/diasLVrPOzoPi/9y5VE=
X-Google-Smtp-Source: ABdhPJw6KrLzsPxOudSrX0u9qGO0uw8dCU8z/hb6hR3OF7hbB5RPhQkmzq3JSVkrGIoI8Hoa+RiDd1UG/XsYByCmEOI=
X-Received: by 2002:a05:6512:314a:: with SMTP id s10mr4697478lfi.123.1597568751901;
 Sun, 16 Aug 2020 02:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200816000435.GA11977@roeck-us.net>
In-Reply-To: <20200816000435.GA11977@roeck-us.net>
From:   jaap aarts <jaap.aarts1@gmail.com>
Date:   Sun, 16 Aug 2020 11:05:40 +0200
Message-ID: <CACtzdJ0BD8qKf+2bti+4LAbgUXKS8eRnA026djym2nWtLnm+gA@mail.gmail.com>
Subject: Re: [PATCH V4] hwmon: add fan/pwm driver for corsair h100i platinum
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, 16 Aug 2020 at 02:04, Guenter Roeck <linux@roeck-us.net> wrote:
> checkpatch --strict says:
>
> total: 7 errors, 12 warnings, 13 checks, 714 lines checked
>
> Guenter
I fixed all of the issues I knew how to fix, one error still occurs
but I have no idea how to fix it. I tried but it always ended up
broken some way or another.
If you could tell me whether or not/how I should add myself
to the maintainers file, that would be useful. And I have a
signed-off-by line but it is not recognised.

Kind regards,

Jaap Aarts
