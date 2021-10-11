Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F701C433FE
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Oct 2021 12:58:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0131B60E9C
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Oct 2021 12:58:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235251AbhJKNAL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Oct 2021 09:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235243AbhJKNAI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Oct 2021 09:00:08 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A05EC061745
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Oct 2021 05:58:08 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id u18so73211789lfd.12
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Oct 2021 05:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sbUATdjWGTZown1ZnIEucnYkDE/lZk0a1R0NRbj82lA=;
        b=GtYZZLTaTPQkCvo3lO0cZCQphiFepZ3f3PaBdPouVzsGLD6C37NXwtFD047gDTf1m3
         gPdReKvq5x2pMRaLPRPSG3cBE8r00uEklejrPGOpdUUHhiB24ubS4jMbIQOemgvy909u
         vXwOU5i5LNSWVd7NtVemXXmaZi8Ogq1R/R9+VwPlsUUD0C+mqGYrr3MaTKPvIaUm3dEo
         FeVFzA5Le5c35LxQKuUQvtROhHmQhzPsU3OfVZL3aPuEDyDVGIou+LH1KPGwiP1qzKKu
         zsinSK9PfNCDoRd8mCxJOk+U0i7LnupuwtbCrJXOy4tAnxlJjShIqPdFjjRAXsgNe0Yk
         nI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sbUATdjWGTZown1ZnIEucnYkDE/lZk0a1R0NRbj82lA=;
        b=c1xYfEJHCvFMMISjfl139LxkYCLuD+inlx3MCkvwocn/ApZp/2FoE4UxDwCO1atjdy
         Wk71E4+b189eMHRhQ5y7i5/HhvUa3pTp5+VvVQ3BL2E13LJ09noG8QWSj/GrPEPJR98O
         niJPAJNH/oxZdyS+OZIvHy45S62JpC1dtG0wqmTzHuuSP6HA+2M9DA99veKmZoRk4TLQ
         QBRy1VASJtQoysZOqfjteepMpmQV5ZVk0UdPncMsf7j95bKpFhk0EOn6oRykGRuRuj7L
         NSZ6RaffVpPx+i1V+Gf6mvgtt3MC/OaYYuCONTf+zvHpacFMfJxqivzuQzi2C9+it0Ro
         NWxQ==
X-Gm-Message-State: AOAM531reweW3KBzHq6okOqVZ14bzbmCL1vQ9+GYLeeZfo/dNX4aiIoL
        mojOh3rnlcrV/v+tCNCvL7JUDeaHbo6tqI5GYFGXSw==
X-Google-Smtp-Source: ABdhPJz52h/hbutZn2DE0KskwGN8fAFPiQ8NYngB6a3i0hvixssroAlKb1VeWAOrglPxrqkCfYLsZfUsdfcF7dJ8d08=
X-Received: by 2002:a05:651c:140d:: with SMTP id u13mr22441766lje.9.1633957085891;
 Mon, 11 Oct 2021 05:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211011012212.91357-1-osk@google.com> <20211011012212.91357-2-osk@google.com>
 <98dcaa85-d04c-7a9c-1901-8786d361477c@roeck-us.net> <CABoTLcTERUpwPSc7fVUAMqs37XCZJhMFbFRT2oyTt_TodE6GnA@mail.gmail.com>
 <518a6ab3-80af-bbe9-69e5-55e6741bdcbe@roeck-us.net>
In-Reply-To: <518a6ab3-80af-bbe9-69e5-55e6741bdcbe@roeck-us.net>
From:   Oskar Senft <osk@google.com>
Date:   Mon, 11 Oct 2021 08:57:49 -0400
Message-ID: <CABoTLcQtfoXCy+j9W6-NxAtWN13yTs322BFtCebbMCZr-cWzaA@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] hwmon: (nct7802) Make temperature/voltage sensors configurable
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter

I appreciate your help with this!

> First, please don't top-post.
Argh, I'm sorry - old habits! The Gmail web UI makes it too easy to do that :-/

> Second, no, submitting both patches was the right thing to do, but
> you should not drop a Reviewed-by: tag if there was no change to
> the patch.
Got it, makes sense. How do I untangle this mess? Resubmit a v8, this
time with the "Reviewed-by:" added back in? Or are you ok tagging the
v7 again. I'm sorry!

Thanks
Oskar.
