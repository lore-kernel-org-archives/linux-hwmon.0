Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE447C433E0
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Dec 2020 21:13:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 899BE207D0
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Dec 2020 21:13:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729003AbgLWVMs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 23 Dec 2020 16:12:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgLWVMr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Dec 2020 16:12:47 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FAA1C061794
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Dec 2020 13:12:07 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id o17so502416lfg.4
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Dec 2020 13:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b2/GHWUOy02TYFKt2ISlCf0ceP1W8ZkUKJeqjGb1qN4=;
        b=TXZtlZ0liq+UQrrLVTqXzyBUxhiXk67IXLwQ6XGxfp5OZjLVBMmMo/C8/RFnizNX1S
         jotF9rWlBGOPADhAP5tVngmHL22vnlYRth9kNo/goSWpjj6oDkRothwXjD8TnvFFCy38
         5odEetqklr8GQzaQPnstSSH35lwsltZOM9P3WcB436RgrRQhJ1emOwm4cOVLM281n64H
         KHYWyyP0hXmnyTJZ4gcod5E7n8Z/QSd0fJOeqpXXDsbjZhpPDU32FY/+FcYqeSeOx/i8
         Bubm9AWXZq0MRAGzRVApct5vFojy7CVyVGc9UvX5uG2uS1pfQMa8N7D9Dx57NLhIRYG8
         Wz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b2/GHWUOy02TYFKt2ISlCf0ceP1W8ZkUKJeqjGb1qN4=;
        b=ouiUYodFzdYwLwN7E7Ha6b5ojgZ/D22tfcCIX5qZAvfvzi5ZfGBGE9xIRwIUmU8O2F
         dP2oDBU72X4DtdyqYBfHZrdsbCrywUV1RDv7Wz4plnGQVE+Wc9PzG+sbiE93n8YOuSZ7
         JZzMs0KfesRyB2zChi5MLEGCNbgGnXZFTQKfGxpyw0rlPYkp48W63Psu54vY2Wl5NvA+
         EDe6tSoh15/tNlM6Cedh8JZ/fnPq+VMkK40stxFJ/zYuKT1d09TjbDNHhVoIoSoTkVSK
         1u7/cnUlaYBCEpxP6ndauik3+5hL64ZT5t2xJ/Cy62J+qbYn2JkMKEFF8pr2Eun/X9uO
         GmIw==
X-Gm-Message-State: AOAM530L26/afWfI/BKNk/HZ7B+cTZv67ZYtav++PfkPcT2DFWm3LUjZ
        WaiCLLS8qf/oEvtia8tnVO9whePTYcWQv9VLtNYnYH3PTi8=
X-Google-Smtp-Source: ABdhPJyvTp5D2n3XiZacM1EheZ0RYIbbQdvfwhq67WGqV5UzmWHu9EKZyAY/e2vjImvnYSKVw47/mPtBPCVAQ9xy2/M=
X-Received: by 2002:a2e:3503:: with SMTP id z3mr13307226ljz.74.1608757926034;
 Wed, 23 Dec 2020 13:12:06 -0800 (PST)
MIME-Version: 1.0
References: <20201221125521.768082-1-linus.walleij@linaro.org> <20201221190402.GA162140@roeck-us.net>
In-Reply-To: <20201221190402.GA162140@roeck-us.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 23 Dec 2020 22:11:55 +0100
Message-ID: <CACRpkdbLW6MJ_uy5X7GJ0_dfPOC0wYA8wVj4ijcGwCNeOjS9fg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (abx500): Decomission abx500 driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Dec 21, 2020 at 8:04 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Applied to hwmon-next. Note that I also removed the driver
> documentation.

I screwed up because I forgot to commit the changes to Makefile
and Kconfig so this will yield build errors :/

I will send a v2 so you can decide what to do, sorry for the mess.

Yours,
Linus Walleij
