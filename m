Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8411BC64E90
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Dec 2020 00:53:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A48420809
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Dec 2020 00:53:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bLQaMJp1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730953AbgLAAxh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 30 Nov 2020 19:53:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727861AbgLAAxg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 Nov 2020 19:53:36 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B3DAC0617A6
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Nov 2020 16:52:51 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id u18so390575lfd.9
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Nov 2020 16:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FDA3bzcAl1VMiQxZ+Tn6nV+nyrVbhZqsOS0EUcBps6E=;
        b=bLQaMJp1qQC2KOL2I6iL1GherOgjFJfBauri2nka89tsNPt5Bh0ecQCRIoct402Cs7
         Su5Gs4RiGbxFERFqE5RCRUWxh7aFlJ0S446GaWbu7Kw53RgeCFPT09Wu/AZDJTsXp3V5
         /aIZLhU3LLq3xHel5jKUJJXVOM3MO7/JHfShzzgM5WboFoxnJwXusDBup9KAqYSe+h+s
         LA08X+6JzTUGQM/swNkWp5b694LZoQ6PVIJmmK3INu4e9g+vIOpr38xmv3Si50p69yQQ
         YmT/LCZ0wo0b/FrgoxCy0hwewI9+kbr5qJbcG4cc42ugUbR8RvbUSEudlW8i+3NF1K7p
         zXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FDA3bzcAl1VMiQxZ+Tn6nV+nyrVbhZqsOS0EUcBps6E=;
        b=EcHLz/6/EYWFlqKP7JIpEM3YwQN3pM9le7G7oCoM56YGHIUqEeu1k+E6mEUDGMSX12
         Gj0KT6Vps90t11ca3ziUhxVsEKxN9dojqZ3r/fMufQU0owLy9EuClx/N8TAuByQUdIIz
         eLu/K3z4pySzNw9Vz2h0V6mvBzEA2GrFBmDXynrPuiYP1gHeA1CgcjDWLgNXhuS5luyN
         CSfuS9Y/CGXxTKrEhsKQcyNIeN8kiViqXshU2hYBBSsG/LGRMFlqqbpiiOsb5kITWi+g
         PZ6lOIIffwy9WAV+Per8Zk2ZXaOVa62/Ccx95tDRri/iDi/JJZzrS86GPsKTtC16R3x2
         LyNQ==
X-Gm-Message-State: AOAM531gq5nj6VPpk6QYXn6PDXWCTHGWgGm/864a2H/65xWCGFcOtT0V
        jK711nH1SZl6p42QPG3mM5NZA0PbzjR9peS/pXmOEA==
X-Google-Smtp-Source: ABdhPJzq9H+ulDA7HSm4XAl+g6++hub/RzXE0knh2b5khTcbijWgrKakyXfzTYuxxP0WOJ7OIDGk9qh8pS+P4H9FSe4=
X-Received: by 2002:ac2:530b:: with SMTP id c11mr80736lfh.185.1606783969610;
 Mon, 30 Nov 2020 16:52:49 -0800 (PST)
MIME-Version: 1.0
References: <20201201003118.2219422-1-anders.roxell@linaro.org> <20201201004900.GA48095@roeck-us.net>
In-Reply-To: <20201201004900.GA48095@roeck-us.net>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Tue, 1 Dec 2020 01:52:38 +0100
Message-ID: <CADYN=9JiKQTPbdGFpA1oe2p_yA0eGmiLj=sTpbEyz41+ngir_A@mail.gmail.com>
Subject: Re: [PATCH] drivers: hwmon: pwm-fan: fix warning unused variable 'ctx'
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     b.zolnierkie@samsung.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 1 Dec 2020 at 01:49, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Dec 01, 2020 at 01:31:18AM +0100, Anders Roxell wrote:
> > When building hwmon/pwm-fan the following unused-variable warning shows
> > up:
> >
> > /tmp/drivers/hwmon/pwm-fan.c: In function =E2=80=98pwm_fan_is_visible=
=E2=80=99:
> > /tmp/drivers/hwmon/pwm-fan.c:167:22: warning: unused variable =E2=80=98=
ctx=E2=80=99 [-Wunused-variable]
> >
> > Remove the unneeded variable declaration 'ctx'.
> >
> > Fixes: 439ed83acc19 ("hwmon: (pwm-fan) Convert to hwmon_device_register=
_with_info API")
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
>
> I already folded this change into the original patch.

That's great Guenter, I missed that. I'm sorry for the noise.

Cheers,
Anders
