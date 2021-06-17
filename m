Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F080EC49361
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jun 2021 07:11:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D334960FDA
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jun 2021 07:11:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbhFQHN7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jun 2021 03:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbhFQHN7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jun 2021 03:13:59 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3DB2C061574
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jun 2021 00:11:50 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id i13so8679926lfc.7
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jun 2021 00:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BUANB8Ee/CiplzPG/ian6MzVAYJFTlcp32RtRLboIy4=;
        b=TGh9lnwDRC4r2D/SXwalB+Qf43EBz5MPNVlfiopHbfE+VtLWnyijziYqh/ajtlgxY0
         65X+odx4dCkWUDFB5IUaLV7kmyPfkEgJ7N4GQVnBie19xjOmqqSMmU+PgsgLOe/ufo6E
         xRSgr31teSeOu+0uDmmJGIY57mlONbfHk/ZpeE8GRo9LtyQCfXX3U/jqmoYic/w4xHIt
         2McLApRKWS2JAbE949QLeYaBLd/0G5O3ZhoKo0kmKoU5l6VTeJ1UTKk6vaJTIb1owFSk
         g7PnEp3YPNW3ib/U9tAfZAFwvINsOigDJr0PHr9RDkGmfUjBH0+utekSM2T9f59mKkc8
         TKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BUANB8Ee/CiplzPG/ian6MzVAYJFTlcp32RtRLboIy4=;
        b=ieeUC0d8xeba1vitSYcj500dbMbe4Q8l9lO5UfLTjDYgsMJ0fnWQaLZAC+Du9r/5m+
         RN0iDegZT+d80PddXP8DVU/FsjCoyIKMKs5q2NFRI72sIzi2+ow4QNJ8kUpIxMfJp6Jh
         K/fwBxkvNTP+1FRRVcckg11PFfp6GFcat5DE9V+yDo4/XlQKu0pAynjCBsuDZyzVdh7A
         QyKPzC9f8qenISbhXHGsc1OFHQ3UFOg2z3ttoMInamKJsolwXWGJx39sdp9R4UiPtnwJ
         8W+ycQfhbIIM+aFZ+NfSDoFfSvPjvrAFRk1mpUfpeEXJHmz5FjLqVZzCY464xSNJprRV
         NadA==
X-Gm-Message-State: AOAM5300vbnxU/v14uQD9ekJd7IU8et5vS/09pHz8vCEBi15git3KdLe
        QTPQg0YPHnml23WZXuX5ex5y/qF57MFQEwZ6hEs=
X-Google-Smtp-Source: ABdhPJxvEgVLuUJ9+zB8ZTdIEp7r6U6Xqgs0/9WB/LLVxXYZQXuxnjw2Q4XCOdWke8nDHrEcIzxYd+psjtckdek8v84=
X-Received: by 2002:a05:6512:31c4:: with SMTP id j4mr2889130lfe.493.1623913909401;
 Thu, 17 Jun 2021 00:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <CADnvcf+LhxZoZk9eRUahSWZ3xVJLkxcAt3+4dS-JCjV8gZE_0A@mail.gmail.com>
 <2199169.9u6qy3EJ5v@marius>
In-Reply-To: <2199169.9u6qy3EJ5v@marius>
From:   Aleksandr Mezin <mezin.alexander@gmail.com>
Date:   Thu, 17 Jun 2021 13:11:38 +0600
Message-ID: <CADnvcfK1EzyXY83wd7CJYpZ=S9+KnT0ftF9CiYhJScBGXKmm5A@mail.gmail.com>
Subject: Re: corsair-cpro and hidraw
To:     Marius Zachmann <mail@mariuszachmann.de>
Cc:     linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jun 17, 2021 at 12:27 PM Marius Zachmann <mail@mariuszachmann.de> wrote:
...
> I do not know, what your device is doing

Actually, NZXT devices (at least grid/"smart device" and "smart device
v2"/rgb&fan controller) don't have such issues - they use report ids,
and don't even expect request-reply communication pattern. I've just
noticed that something seems to be wrong with corsair-cpro (but
somehow didn't notice the comment) and decided to ask.

> This device uses an echo of the command
> in the answer and if they don't match it returns an error. This could
> maybe lead to a false error when the replies are switched, but is
> probably preferable.

Hm... If the response includes the id of the request, it should be
possible to filter reports in raw_event, i. e. don't signal completion
if the report doesn't match, and wait more. Yes, there is a corner
case, "if a command is not supported, the length value in the reply is
okay, but the command value is set to 0". But timing out (250 ms) in
this case should probably be fine... Actually I have a compatible
Corsair PSU so maybe I'll send a patch.
