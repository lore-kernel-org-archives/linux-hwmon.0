Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3567C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Oct 2021 16:49:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1DD2610CF
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Oct 2021 16:49:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbhJTQwJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 Oct 2021 12:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbhJTQwJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Oct 2021 12:52:09 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30243C06161C
        for <linux-hwmon@vger.kernel.org>; Wed, 20 Oct 2021 09:49:54 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id x192so16236241lff.12
        for <linux-hwmon@vger.kernel.org>; Wed, 20 Oct 2021 09:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IOdWtSL7/26YG/E7X5+U7QmZ/wOmRVmoFWssnqUWGa4=;
        b=j1GayWZ93xM5QWyR/JLKgf4xz7GB17Q6Gu8fl9WkGpkjjaReEZzAtdD3Qz9Fec5bF+
         P9AhtNx9psecdAq+VTHHIIUpouXGQ1ju65OQ5jDJ/WBqBFsbykwWFUA0PMQfKAbfKWO6
         gzlPQI1j3F3qhgQi42w+k2AoGY5e/tb7FN4EuRd92OjhLuIaKk5EypuGXxownY1uVOyl
         D2BwFsTFG6zsgkqGh4a3Vmbs6uH4tn42sZL10judaFu0mb1j1v/NrKkLoXsxQFG090Cy
         7NZs8Qf3stKa1SGFUtsHSb/8oLMIzeIuCViofVVRPXA89iNHUHITjjwNPLf6+RcU6xfd
         tPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IOdWtSL7/26YG/E7X5+U7QmZ/wOmRVmoFWssnqUWGa4=;
        b=TmyeZFgMiV7M/xwsNgL1CvI5hng4eNxEmDAs+wC3EL91DXO1aLG465uoR9SSZ1yZzn
         x6HUqXdDVkrDQsMgB+mYsh2jCksOMP08Sicyu0587hjD9g0qBLzjm20hyAN5oHJBrbj3
         J99BYhU/ArW0JQevwnaQxbwJZx0+Ju3KPAK62oSWwnr7rkuhoyqeHvjZgrU8ILF4zFcF
         pr+YT0KOCBWOomth4jsVbveA+RFcSM9hWyjQgpD3m5I+PuDRdqUqll/7pjCKzUrnd8Kp
         zeIIr3NdvnMfM3meNJIjTpyoNnVX4YhiQC3rpEvAwpZMwxQEX1P1HVGCDROc1mIHVLiy
         Qi/A==
X-Gm-Message-State: AOAM533kDvcnL9WaJbkzJJjXzF4dIMe8A6DNH18UwWTkbo8WGiIvW/Kv
        KjkWHOrK8UEwq5dG6uWKS3ArrpddRnQcoKFH957lGZCL+1v4zA==
X-Google-Smtp-Source: ABdhPJx5BWtVC4EkQcBZclMK3+NammoVJz1rJxchsvvww/JtbQZtriy3kjoebjiJcrtsHGq/OTcswKQNxY9GneGCEgM=
X-Received: by 2002:a05:6512:404:: with SMTP id u4mr381580lfk.21.1634748592290;
 Wed, 20 Oct 2021 09:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211011012212.91357-1-osk@google.com> <YW2l5yTj2Adc+Kjz@robh.at.kernel.org>
In-Reply-To: <YW2l5yTj2Adc+Kjz@robh.at.kernel.org>
From:   Oskar Senft <osk@google.com>
Date:   Wed, 20 Oct 2021 12:49:36 -0400
Message-ID: <CABoTLcTgbSKVH5+RoBsUdTUMbm59ePCbHbuJiFDQ17yvU1azrw@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: hwmon: Add nct7802 bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Rob

Thanks for the review comments!

> > +patternProperties:
> > +  "^channel@[0-3]$":
> > +    type: object
>
> I would move the 'additionalProperties' here. I think that's a bit
> easier to read.

Following the same thought, I also moved the 'additionalProperties' on
the top level up to above its 'properties'.

> blank line

Thanks, I added the missing blank lines. I'm not sure what I was thinking.

> > +            channel@0 { /* LTD */
> > +              reg = <0>;
> > +              status = "okay";
>
> Don't show status in examples.

Oh yes, you mentioned that before, I'm sorry. They're removed now.

I sent a PATCH v8 with the changes.

Oskar.
