Return-Path: <SRS0=Zrk+=AG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC6DC433E1
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Jun 2020 16:11:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0661208C9
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Jun 2020 16:11:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2mLaHdF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405941AbgFYQLC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 25 Jun 2020 12:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403837AbgFYQLB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 25 Jun 2020 12:11:01 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95EF0C08C5DB
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2020 09:11:01 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id k23so6618283iom.10
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2020 09:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=4ZOpV6j3RVEbwRsdb1sKob49Aje6DdY2Rf9gK3zWqrA=;
        b=i2mLaHdFWCr4htuQBt/KGnQXLDTOdplh1dymSntyt9E2p+MQs6ua/ptbUEp2dLwOQk
         l2RDeaLi1IEyADM1Rhc9ZRiDUCAnI8wr2PhtF6fYSC6qKk+/0fXPK6CZMOfemLZHSU/1
         955/bXT29u1c05aqP2UYX/xuNv1+LqpAa/VU2Jt4yiGjSFGO/lpH7D2Zqt4GXl3hHMmu
         siJT8+MnB06OInJG5+1/r/xpQ/XzjpbmJY+sQrkkWnc2Mm++SW1c6KQE1b3Bz8ciAU/F
         PLQuf+CDqnPVIm8K7WWRz5g1TUoRkw4ZaWjs4vHbprkZqO8sdyV/yKaREtdnkRc+we7p
         sEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=4ZOpV6j3RVEbwRsdb1sKob49Aje6DdY2Rf9gK3zWqrA=;
        b=fboX7haBk5tg+rsuV/SKRzq3nGQiZxSaXAw9GE3JNQ6MJ+Nj95sWa36famDmv80Z7x
         19/EOqHmDsOiR+3BJMkX/8d3iIxOS1oFXP+Zm3RnAe7e93MkdP6erBH66/QH3apN/aeD
         BkGfvzvxf1qwmAV9kglY7eGcE0lUWzKPMKw9EHFL3+YGOh0G1yFT7j5bpk83M7X5S0hl
         8cAIT1IjbnqJA12dwvdSv71+ciCCbOAn7J8wd95ydYRJJSs4QGjQJJD6ZwsosMCDTR7e
         XQ+x6FsMO7/WLkQS6rkTwEdJJdUNq6j1Sd1UfnrGX4BvmhrFErdxVT4KGoyu0m5r2kby
         7twQ==
X-Gm-Message-State: AOAM533xh2WGfxniR+0Z1QCrNEVeWYjEl+Wbv43fRfTxk+GUsiYoNW+b
        Z/82uuzQf8LMR9G1QCcPjtpyziaQkxmUxtrVF+19nloE
X-Google-Smtp-Source: ABdhPJx8G1tR0GK0bP14LtW3KWZ9oBjX0ZJkUbzGQeVszgrf004/hC1TOlhb21hTDuZVSnIno4qzcMQX8kmfNuwBrTw=
X-Received: by 2002:a02:c7cc:: with SMTP id s12mr14162239jao.79.1593101460615;
 Thu, 25 Jun 2020 09:11:00 -0700 (PDT)
MIME-Version: 1.0
From:   Henk <henk.vergonet@gmail.com>
Date:   Thu, 25 Jun 2020 18:10:49 +0200
Message-ID: <CAMFK4TOcpoLPxmbEJxhPHQOQ8B+mQ5EWge-jqKXBRhFcXMCR1w@mail.gmail.com>
Subject: [PATCH] hwmon: nct6775: Add missing voltage input on NCT6796D
To:     linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add missing voltage input on NCT6796D

From the datasheet: the NCT6796D has 16 voltage readings.
Source: NCT6796D_Datasheet_V0_6.pdf page 59-60

This patch adds support for in15 on the NCT6796D.

Signed-off-by: Henk Vergonet <henk.vergont@gmail.com>

Patch:
https://github.com/torvalds/linux/commit/8ebb8a5d1d02d60a098cdf0bb576f810f307d9df
