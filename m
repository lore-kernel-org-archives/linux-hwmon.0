Return-Path: <SRS0=NDU9=AR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21D7C433DF
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jul 2020 17:21:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EA6F2070C
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jul 2020 17:21:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVjVlyF1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729678AbgGFRVH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jul 2020 13:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729664AbgGFRVG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jul 2020 13:21:06 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EBECC061755
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2020 10:21:06 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id e4so46401245ljn.4
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2020 10:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zfh5b659oCcT73ImYNDpZCIDFa4GH0lgqFEkcYDNvII=;
        b=MVjVlyF1auRCo+aQvCYj4sSVSn8aiKUjEfzXg3tAEcegZAOSmW7Jyzow2CtABO4j2M
         icr6+C+ccZjquDKCo4OVihf1VUyMX8dUcvZ1AKAU2wAMSmeTqwQDdDRClArALOB9mI/r
         z60DsIDqPqNR/ow+fa9lXLudS+jGpPnUuxYS+qPf1dp0ShGF0jnrUvGaMHQsXix3MI2Y
         rSmiJy8lTLEdCUR18d05EG7gg0wTD8mY0lzxxt1VbI6g5s0A6LmLwrIL+L098SSaw+Ba
         1GNoaeTYxSa/nLjRvAu/hlKWTHaxHvS4/PhP6l8uby2lyzSZtALKqnX83E8KBaMvqEiq
         TAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zfh5b659oCcT73ImYNDpZCIDFa4GH0lgqFEkcYDNvII=;
        b=Q+/wU2uQex+J5NqUXIgNasv0KXylCibOE4Qv18Gza5HiDr2dx4Af8PaxLRYuZhgO0k
         P+l6AXpAhmx1Bsqv8PgLXq14BEMRKw30tzKyty6UC6UmcojXsTq8vzdc49m46sz/SjUB
         /ZcGoUR2crLqdgjlW27R26H2pPX1lk4PpxhcPSmgUv5zcbIS/1B977WnJCkl75OGmKQE
         bkUal7TN6k/i8BQHA8PNAAFoMqQtlDwuPv9dSPoj8qUMZABrN2zMZL0MCT4QJxQajDQs
         5FLfSYzJzPKJtApkTSeM7bvkdxb50t7EhHXFy4erAaMAi1EUVZHfjJ+SUcE9ofL/Zr9s
         K/0Q==
X-Gm-Message-State: AOAM532zH9qZtAeCt3jJB+Va//aBkMCxQ8G05p34HFhor99XzHqYglMm
        MMh9ossRm3WN7ay6TI7JSOvk7T7+rtjlTjxnaTE=
X-Google-Smtp-Source: ABdhPJxULYGJ9St0GZYs93H6d8EAxwfcGNRcSur6c4wGeNl4f/20RmZBaWZMt6kzdkLx0oXERrhx+G1gLvRcCPoRU40=
X-Received: by 2002:a2e:8582:: with SMTP id b2mr3427293lji.50.1594056064645;
 Mon, 06 Jul 2020 10:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200706171715.124993-1-nchatrad@amd.com>
In-Reply-To: <20200706171715.124993-1-nchatrad@amd.com>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Mon, 6 Jul 2020 22:50:53 +0530
Message-ID: <CAHfPSqDfWs+LiYo7KdVKKQ6fP0hDyCHtVhwHMiG3Sn7=aHhLBQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: amd_energy: match for supported models
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On Mon, 6 Jul 2020 at 22:47, Naveen Krishna Chatradhi <nchatrad@amd.com> wrote:
>
> The energy counters of certain models seems to be reporting
> inconsisten values. Hence, match for the supported models.
Actually, the supported models could be of family 0x17 in a range
between 0x30 ~ 0x3f. I did not find any macro or usage for a range
of models. Could you suggest to me if i've missed an existing way to
provide a range for models.

>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
>  drivers/hwmon/amd_energy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> index e95b7426106e..29603742c858 100644
> --- a/drivers/hwmon/amd_energy.c
> +++ b/drivers/hwmon/amd_energy.c
> @@ -362,7 +362,7 @@ static struct platform_driver amd_energy_driver = {
>  static struct platform_device *amd_energy_platdev;
>
>  static const struct x86_cpu_id cpu_ids[] __initconst = {
> -       X86_MATCH_VENDOR_FAM(AMD, 0x17, NULL),
> +       X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x17, 0x31, NULL),
>         {}
>  };
>  MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
> --
> 2.17.1
>


-- 
Shine bright,
(: Nav :)
