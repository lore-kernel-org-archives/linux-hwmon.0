Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25064C433DB
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Dec 2020 01:46:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9B8222A83
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Dec 2020 01:46:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgLVBqK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Dec 2020 20:46:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbgLVBqK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Dec 2020 20:46:10 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1FECC0613D3;
        Mon, 21 Dec 2020 17:45:29 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id o13so28282470lfr.3;
        Mon, 21 Dec 2020 17:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=pWOHnkyedFGnfyVoxalADGXLfdGf7ijaBF8UEcICmqs=;
        b=sOAO3Y04WoeC/sysqNZlY9oviUjLGxr//USG6CG8DA8aJ3cnupJGVKiN3ruS/0Rv8R
         Kt6Bx0cpL/wdecZ7fms2mjbde3zWAgvzKKVzAq8otVc7JkNHFTcvj3vepsc/CV0MY3Q+
         iIDjLg01vwM0d+JCDJt2wKPmREwRo1qldoXM5qDu3j0wKlQCv6PRoFEYbv6lFMsZyb7d
         SXmGJgHJVYB5KGoWHx/1A31MMd4XpXwVYTUAxdX9MGHmYYTMG6fRfWRHcPLeirMU19zm
         JOmGTGwJwqlEmlmP40cwlzsC+nr6ZhhXVKpAX/Sc9I9PXF/aXqRn52jzPkXmkgzVcFtr
         flzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=pWOHnkyedFGnfyVoxalADGXLfdGf7ijaBF8UEcICmqs=;
        b=Bv3C8X4LycV5escMjCXROHaYk8C8PeKPnMrwmbAb53VMCt2EWIxXEE1vSnblN87GSm
         8y2WVJ/2sigF0QyR+DHRMCzgUd0t4RLlwc8RUsNhyLYkmuLWSGWpTAseAmxqJm1ktwyT
         e83y2nWkDGwP3Rp2nGim0Up7ZMMihBHmTocTG4+1m1MUQdDETHKVacnV40YU18tRTr8M
         NrWjU50ZuVWuJMuYoKoWOnb7rCMaXSEJsA0UyzZibhBp9edqDReEL1IbI7CHLJx0Mhnd
         ZmkjxV5nKBQqvzVDS/Rsc3JKUZu7FVB36ynqllSthSv8lrifHK6WMmM1sY20A4VxUStE
         dj+A==
X-Gm-Message-State: AOAM532TqjiEoO7Mjvmscgj5NP3Luqsw1GYSHOF/jn8kbPBA2Wut4TRg
        gJtjYGCO39xh3xVw45QbJ8H9cuVKu50KBbt+qw==
X-Google-Smtp-Source: ABdhPJymZXmHXyf7LSX05ukC5WX7Ww4PjzkUcvMIOdMk3FUXgCzTxZUAQUIKxx2tKtrM7TZ0hrv+do1hHtKB4EKSGbA=
X-Received: by 2002:a2e:a547:: with SMTP id e7mr8425929ljn.108.1608601528357;
 Mon, 21 Dec 2020 17:45:28 -0800 (PST)
MIME-Version: 1.0
From:   Gabriel C <nix.or.die@googlemail.com>
Date:   Tue, 22 Dec 2020 02:45:02 +0100
Message-ID: <CAEJqkgiiU7miC13iT6DufjFAsHkNZk6rBAw=KRRnHe47kTZDnw@mail.gmail.com>
Subject: k10temp: ZEN3 readings are broken
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Wei Huang <wei.huang2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello Guenter,

while trying to add ZEN3 support for zenpower out of tree modules, I find out
the in-kernel k10temp driver is broken with ZEN3 ( and partially ZEN2 even ).

commit 55163a1c00fcb526e2aa9f7f952fb38d3543da5e added:

case 0x0 ... 0x1:       /* Zen3 */

however, this is wrong, we look for a model which is 0x21 for ZEN3,
these seem to
be steppings?

Also, PLANE0/1 are wrong too, Icore has zero readouts even when fixing
the model.

Looking at these ( there is something missing for 0x71 ZEN2 Ryzens
also ) that should be:

PLANE0  (ZEN_SVI_BASE + 0x10)
PLANE1  (ZEN_SVI_BASE + 0xc)

Which is the same as for ZEN2 >= 0x71. Since this is not really
documented and I have some
confirmations of these numbers from *somewhere* :-) I created a demo patch only.

I would like AMD people to really have a look at the driver and
confirm the changes, since
getting information from *somewhere*,  dosen't mean they are 100%
correct. However, the driver
is working with these changes.

In any way the model needs changing to 0x21 even if we let the other
readings broken.

There is my demo patch:

https://crazy.dev.frugalware.org/fix-ZEN2-ZEN3-test1.patch

Also, there is some discuss and testing for both drivers:

https://github.com/ocerman/zenpower/issues/39


Best Regards,

Gabriel C
