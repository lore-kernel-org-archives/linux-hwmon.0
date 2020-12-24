Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94718C433E0
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Dec 2020 00:40:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 587BF223E4
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Dec 2020 00:40:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgLXAkP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 23 Dec 2020 19:40:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727134AbgLXAkP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Dec 2020 19:40:15 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25004C0617A6
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Dec 2020 16:39:35 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id l11so1470948lfg.0
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Dec 2020 16:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+qXCRo50GLccW/2CJEzWR3Um1ywwItZPzYLaiLjSPkI=;
        b=NH93rHoCVjjjoC2GEL/rnsd8Po8eG9iB6O7ZgqHefKrcub1QCsXLEzkG63r/8kCz66
         EeILXBETI2J+ZAbgHpaLrX1XCdd2K8D6tlNw8t5p1AEu9U4BP3ju5NDQK10KoCOKZS/n
         HeyTIYGWlIvEQA5c6ACquNx/rFyYExlzD9eeo8rlnlo1iFU9jStzUxVEyzesgH7sOKtw
         sIg97ShVw97dXzyLenzh+LxuBAKDvbNSa6BUFLhgDeVfFJqH4mUPJC/HEVCtWGTOYCW1
         Mw92QK7zxyq1WsL82O1e9eohiUccgZ7b2qwXwTErmd0rCWXnvgQaS4SgmrepNnpYum5M
         yjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+qXCRo50GLccW/2CJEzWR3Um1ywwItZPzYLaiLjSPkI=;
        b=NYgmwObsPHWe82GYyTrcYvvGe9lBYn8mOUr/CJ/afKcfjYMYDsE5LrRxiFf3vPqLlj
         2lTW+cg39DwTAbr3Puwr+uWwPruNb/9Elaso1GiFk09EZN1lGSnKZYAygrkoJlsc+kFT
         Ls63RF+ot4BZ6mrMUdlc/Ii4L07qzAYWnO6TnRPnmtNN15uk49tLduQlqaay9GTSFd1p
         GjA8Uf9z5sKf/OgDfDtORIaJItZ567uNAiKwX+kFmL6ka7eGVudF9mmjzYJjo8KTGRX7
         TN+rntL6bGs9mCCOsXHV6A3pC1JJT1agcKvzFKy9dqbnap0auawBDi/UeIhpgPiYq5Ve
         VSqA==
X-Gm-Message-State: AOAM531DHasJI7IqM9qC6cUcQGHReC0QjiTh+xiiohqFWLXWOELmYOkV
        IGhekLgffpTk48bf60P128ZlvfWma1BwjE6uQe+JuQ==
X-Google-Smtp-Source: ABdhPJznIhXyMwyqiJdjBsnP8NuXmuEqC0BtW4kTlltlpFUGBhRLo8aYpBgrjUVypUWRYlxnw8teOi+0y99HUQ+Jp3k=
X-Received: by 2002:a05:6512:3f3:: with SMTP id n19mr12478903lfq.586.1608770373641;
 Wed, 23 Dec 2020 16:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20201219224143.686074-1-linus.walleij@linaro.org>
 <6d339a6c-6f8c-4a5e-718b-c90a9fbb8c01@roeck-us.net> <CACRpkdZTVAoDbbJqTJbxv1ZDyAMsB_h9TAdKKbxqBYGp4-b_jg@mail.gmail.com>
 <SN6PR08MB5565DD42F17BA93D362DB95B9ADE0@SN6PR08MB5565.namprd08.prod.outlook.com>
In-Reply-To: <SN6PR08MB5565DD42F17BA93D362DB95B9ADE0@SN6PR08MB5565.namprd08.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Dec 2020 01:39:22 +0100
Message-ID: <CACRpkdaVN9gf4PWh=_UcJ23kC47XChREgiBh-46wV8VRFkUtdw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (ntc_thermistor): try reading processed
To:     Chris Lesiak <chris.lesiak@licor.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Jonathan Cameron <jic23@cam.ac.uk>,
        linux-iio <linux-iio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Chris!

Thanks for stepping in!

On Wed, Dec 23, 2020 at 11:24 PM Chris Lesiak <chris.lesiak@licor.com> wrote:

> I'm the author of commit 0315253b19bbc63eedad2f6125c21e280c76e29b
> "hwmon: (ntc_thermistor) fix iio raw to microvolts conversion".
>
> The 1000X scaling was not to get around a bad ADC driver that returns volts instead of
> millivolts; it was to convert millivolts to microvolts.  The function ntc_adc_iio_read
> needs to return microvolts.

Sorry for my confusion of terms.

I see my mistake, I'll update the patch to scale the returned value
from millivolts to microvolts and respin!

Yours,
Linus Walleij
