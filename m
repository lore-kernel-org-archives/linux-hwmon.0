Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D41C001DC
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Jul 2023 09:08:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbjGaJIi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 Jul 2023 05:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbjGaJId (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Jul 2023 05:08:33 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D74F4
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Jul 2023 02:08:32 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3a36b30aa7bso3254591b6e.3
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Jul 2023 02:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1690794511; x=1691399311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqOCi2n1NavpFlE8N26eyv2e5UnlllC9f92WXhukPKI=;
        b=cYAJPeYLtVVoiLUwCyjZ8P38cbBUwPis0IrA6N3kL/xfsVxo7qe0AWLuUePHBqoOVl
         6ctaUU6EdYF3voWE7ZmEABrE/xHm4sUfqS9Kv9UiJhwi0YkQk4oRBCYQrhDztsNQp6Jg
         aYs10i8JktYMjQINoMiWuJM8FTf/LCICmGSMLJ5HxNGfEB5ufTTdWvvxa7GRnHfRuLi7
         xgoijvAFN4/5DHx/aTeWekfrA2ukUz96iGfrJ4lw8/YO7fjz/E/syai/5bE9mjN9pxEV
         gcfAO9gYKcC0c1BqdsRIZ3zqIPo0GlPqp6h8Ur2WPTSgFqR632SikI9UDhgQdL55f04+
         jLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690794511; x=1691399311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqOCi2n1NavpFlE8N26eyv2e5UnlllC9f92WXhukPKI=;
        b=jBxMCCmHmFG1LBStr5Uw7nMoUlJvxtdCkJeQrotA2cHIl7rU67esOz52mRMrOuMP6u
         2mRBKdsct+o8bFBSrQCPsPT1yWvCvl3scRlfse6jahULCZM/ZbSMAcxj/vWvyKc4HR0I
         4M1JfQ1KEJ2ZZgyjepRqzPn41b8BmXAVF8uvTSJlFTQ4p46qBpmNXRej/V1vT5BXLr5Z
         LFGF1PUDpg5HyjTt0iD2TGW8QRPvWkoW+Hksh1EzsDtzgWfLdMO51GDBoKdjRCMh+kSs
         W6Sq1P4yOhEanGfhhLJS1W0O82e6LpQ/UDQaNcJVigTyEdjMjKpU9Pc88sUmyka54YQE
         +5ZQ==
X-Gm-Message-State: ABy/qLZTT5TTrZA4puutiqvJMiEVcd9A0OEFYGFPm4U+qR3GWdZk9Wwz
        LR+kLfhQxqoC7auxPzJCCdgIyIFsB+j2q5ZBrF5/jw==
X-Google-Smtp-Source: APBJJlFKWbIu+gOTrcov/jDSicFXjI+6huFpwHlI//frStRCRx/QnMVL/uGQimp7mFbHTx56qYtD7RLRsBe2gRdSUEk=
X-Received: by 2002:a05:6808:f91:b0:3a3:640d:ed71 with SMTP id
 o17-20020a0568080f9100b003a3640ded71mr12058385oiw.10.1690794511632; Mon, 31
 Jul 2023 02:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230728082527.3531940-1-Naresh.Solanki@9elements.com>
 <1cc12337-759e-c932-0303-b1b78e254c27@roeck-us.net> <CABqG17jXyx4GQqa2M7w78r0F99FzsqpNhft3w3jtUGKuBbfCDg@mail.gmail.com>
 <f47d38f8-02e7-3269-2754-300be3d4036e@roeck-us.net>
In-Reply-To: <f47d38f8-02e7-3269-2754-300be3d4036e@roeck-us.net>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Mon, 31 Jul 2023 14:38:20 +0530
Message-ID: <CABqG17huhzk6oV5rJj0GSpAbvqtSyd37CKnSAsFMkjYW0FeiSg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (pmbus/mp2975) Fix PGOOD in READ_STATUS_WORD
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>,
        krzysztof.kozlowski+dt@linaro.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi

On Fri, 28 Jul 2023 at 19:56, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/28/23 04:28, Naresh Solanki wrote:
> > Hi Guenter,
> >
> >
> > On Fri, 28 Jul 2023 at 15:30, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On 7/28/23 01:25, Naresh Solanki wrote:
> >>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> >>>
> >>> MPS returns PGOOD instead of PB_STATUS_POWER_GOOD_N.
> >>> Fix that in the read_word_data hook.
> >>>
> >> Datasheets are not public, so I can not verify, but the code below
> >> only handles MP2973 and MP2971. What about MP2975 ?
> > I dont have MP2975 to even verify. I'm not sure if its applicable.
> >>
> >> Either case, this appears to affect most Monolithic chips, but
> >> not all of them. Please limit the statement to known to be affected
> >> chips.
> > Yes. With what we observed, this affects mp2973 & mp2971.
> > Will update accordingly.
>
> Please also add a comment that MP2975 is likely affected but can not be
> confirmed due to lack of a datasheet.
I have the datasheet for MP2975 but haven't verified it on real HW.

Regards,
Naresh
>
> Thanks,
> Guenter
>
> >>
> >>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> >>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> >>> ---
> >>>    drivers/hwmon/pmbus/mp2975.c | 4 ++++
> >>>    1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
> >>> index 28f33f4618fa..410b6eae6d02 100644
> >>> --- a/drivers/hwmon/pmbus/mp2975.c
> >>> +++ b/drivers/hwmon/pmbus/mp2975.c
> >>> @@ -297,6 +297,10 @@ static int mp2973_read_word_data(struct i2c_client *client, int page,
> >>>        int ret;
> >>>
> >>>        switch (reg) {
> >>> +     case PMBUS_STATUS_WORD:
> >>> +             ret = pmbus_read_word_data(client, page, phase, reg);
> >>
> >>                  if (ret < 0)
> >>                          return ret;
> >>
> >> Please add a comment explaining what is going on.
> > Sure.
> >>
> >>> +             ret ^= PB_STATUS_POWER_GOOD_N;
> >>> +             break;
> >>>        case PMBUS_OT_FAULT_LIMIT:
> >>>                ret = mp2975_read_word_helper(client, page, phase, reg,
> >>>                                              GENMASK(7, 0));
> >>>
> >>> base-commit: a4bb1ce5b9e3ca403c04e20ebeae77fd6447cb11
> >>
>
