Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E14C2BA09
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 18:19:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7792613BD
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 18:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233757AbhELSUK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 May 2021 14:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346347AbhELRNQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 May 2021 13:13:16 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18302C061377
        for <linux-hwmon@vger.kernel.org>; Wed, 12 May 2021 10:07:15 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id gx5so36026807ejb.11
        for <linux-hwmon@vger.kernel.org>; Wed, 12 May 2021 10:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=RbbAGXstepVBpScFTiPKoG1u6uzWbH+B9unkoR6/QM8=;
        b=lN8f/ZcCWC2dDhyHUvpVSMlufi3njJZxVFOy6RaW7dvIbTqQrLTDT2bCpkQ8HWvSdw
         lEHCieGQ1ZL9Xfj8MSZ47LYkp+kp/mePHKSX7zMR36BX8VCTAvkqDQlpZ8FenVP9n8bW
         O5WmD7c/UzSlcdKPZc3ozE1T3YmVl5l9AyZKnOs2oE7Oui/wDDxKnUE9N7t6/phMgEcu
         A28FSxku2AqItslQ71CFHTRHXJSeHeypJVhIwdkOv2u5KCjvdvUlG6OwQY8HeMUbEzUm
         uEY5Wg2Cij19QDtIEp5tfteF5PVcjSinPbCtXwo34PQ/+V6jekdnSaplX53SB7s/2XsM
         U23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=RbbAGXstepVBpScFTiPKoG1u6uzWbH+B9unkoR6/QM8=;
        b=Dw/XXG0g/nWVDwNIJtCvUB0uXkGyfFZerhNajGg4E88IEyAXdGqUVzc9fPbOVNmQRq
         NvpdkOh4ZU+QgFQe1F2Cw1xQ0z7ypa/sT2jHQXDYYuxMQxWjQJ5KsYj+6iiuNi7DvbdZ
         gpLmvmcqX29pPOWw7uA5UfIaUozRcQ1XyOX2wCZiV8bVlla88EslZ6UkOOUJGByrZ5wG
         JQsnRYwKoEDe4Ex7OTi+/h37yBxhG28A2LLURxdVTE3EqBXhwJvseRdhJk13q4BvBu2Z
         HUA++OLPqJfptrlsNkG1fYaizpPgOHE5tWTBI996Gp9xOh+bqZXZhp7JyyuUjuwqc560
         6rbg==
X-Gm-Message-State: AOAM5309sulzmEN7IzkqZhfw/c5UV44zdnkDyVKEFjPRT1rbcSpVw6KE
        ZVPiI/nTqmqN1mXrDnoTlLrUV+e/k09T5TJ0DABK1w==
X-Google-Smtp-Source: ABdhPJyOH9hGfRE+ZQ9A/CQByIjQhZWgTgLkd2DfEZOoBpPDZnZQFEm1t5CEudnnBfEaWtTsJyP3lQNLvaV82qUtEIY=
X-Received: by 2002:a17:906:eca9:: with SMTP id qh9mr38303738ejb.258.1620839234543;
 Wed, 12 May 2021 10:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210512170418.2432278-1-linchuyuan@google.com>
In-Reply-To: <20210512170418.2432278-1-linchuyuan@google.com>
From:   Chu Lin <linchuyuan@google.com>
Date:   Wed, 12 May 2021 10:07:03 -0700
Message-ID: <CAKCA56BWYCU64JzRfEhWyveDjpQh+db5oOz_MvhddKPF-cx+yw@mail.gmail.com>
Subject: Re: [PATCH] Enable adm1272 temperature reporting
To:     linchuyuan@gmail.com, Jason Ling <jasonling@google.com>,
        Zhongqi Li <zhongqil@google.com>,
        Guenter Roeck <linux@roeck-us.net>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Please discard this one.
Sent by error.

Thanks,
Chu

On Wed, May 12, 2021 at 10:04 AM Chu Lin <linchuyuan@google.com> wrote:
>
> adm1272 supports temperature reporting but it is disabled by default.
>
> Tested:
> ls temp1_*
> temp1_crit           temp1_highest        temp1_max
> temp1_crit_alarm     temp1_input          temp1_max_alarm
>
> cat temp1_input
> 26642
>
> Signed-off-by: Chu Lin <linchuyuan@google.com>
> ---
>  drivers/hwmon/pmbus/adm1275.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index e7997f37b266..0be1b5777d2f 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -611,11 +611,13 @@ static int adm1275_probe(struct i2c_client *client)
>                 tindex = 8;
>
>                 info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
> -                       PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
> +                       PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +                       PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>
> -               /* Enable VOUT if not enabled (it is disabled by default) */
> -               if (!(config & ADM1278_VOUT_EN)) {
> -                       config |= ADM1278_VOUT_EN;
> +               /* Enable VOUT & TEMP1 if not enabled (disabled by default) */
> +               if ((config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN)) !=
> +                   (ADM1278_VOUT_EN | ADM1278_TEMP1_EN)) {
> +                       config |= ADM1278_VOUT_EN | ADM1278_TEMP1_EN;
>                         ret = i2c_smbus_write_byte_data(client,
>                                                         ADM1275_PMON_CONFIG,
>                                                         config);
> @@ -625,10 +627,6 @@ static int adm1275_probe(struct i2c_client *client)
>                                 return -ENODEV;
>                         }
>                 }
> -
> -               if (config & ADM1278_TEMP1_EN)
> -                       info->func[0] |=
> -                               PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>                 if (config & ADM1278_VIN_EN)
>                         info->func[0] |= PMBUS_HAVE_VIN;
>                 break;
> --
> 2.31.1.607.g51e8a6a459-goog
>
