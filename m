Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D230C432BE
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Aug 2021 16:44:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 570CE60F14
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Aug 2021 16:44:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbhH0Qpd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 27 Aug 2021 12:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbhH0Qpd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Aug 2021 12:45:33 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E2EC061757
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Aug 2021 09:44:44 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id q11-20020a9d4b0b000000b0051acbdb2869so3684772otf.2
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Aug 2021 09:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=CT59uNSuzYfeNo3EgjlVASYA+oI+29Lr1USkS0J8RjY=;
        b=qEr9N9FkEkFj3r6wPGDED45t3zzbTRXzQDS2f+L8nWPS1kJ9EMijXJZvrXFAt7iXj9
         1Q8eZyKsrnhkKwSJE6F5ZS778apvkhDJg86sGQEACwCmhUBwZfBLQ6hMjNqjKZzh057L
         5y8Lfo+lChoFi1Rg5PBY9rnotp3LQ1sEGJYwF2ku8/qFxBkU4S7oLcbSp5IzKRFaH+Ev
         pMJTUWdtPh7gWEMhCKrhBPL+Tw7B1bOaVdbSM9u0lJJB2+Uj4wMl8qJWGklamb+LlJDE
         gWM6XLQ9GRI7rpcNSJiu6/xaLEoNzrJjdCW1UCeengdhSgv+UTvgLO/QYu75saAuWhVA
         npSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition;
        bh=CT59uNSuzYfeNo3EgjlVASYA+oI+29Lr1USkS0J8RjY=;
        b=fGv0rr4ZONRhmsMjYc7r4GB/b4dHTwyRGK30oHnOeA0vtFpJB+TS/6uweWMfb0V7zG
         T0ZxsEGIztzsL55dP3oboV5cXwHFJw3IRnxigMZAweU+bYksqnly/eERFNsxScBpDZ83
         R2BmlfDSptwMiIgVZORi7HR1wwTARSTjl8xMH4sKQxfseel6X0zdZM0cSXSMiT6QYLDk
         MZCsVWRmXett5tdxBrBNjuhigMCVHeD4Ek6LpMoSOtAiQj5ah4Uw3+BfVGjjnWq95Wl2
         I1K14th1SBQyaSGlgGiah7AGDcAZBgZw+F7PFF9x+3QZIZDpKVVfwmTAMvlj4kbl4vC3
         DUlg==
X-Gm-Message-State: AOAM532BPiaRHx9w4j303d0HWwaDdeIQdRnGOymQ7EpDxvbogg0JPr1p
        S9iJYjB7ilkAfLpoh+WP+68=
X-Google-Smtp-Source: ABdhPJxOMruFphbJK5UF9+egXpQrax6HUO6L++8ESMgKeX8tFp6gHG6xS/d1gIEfZ4o++XVFRv4rbw==
X-Received: by 2002:a05:6830:2904:: with SMTP id z4mr8739087otu.121.1630082683753;
        Fri, 27 Aug 2021 09:44:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r1sm1294167ooi.21.2021.08.27.09.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 09:44:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 27 Aug 2021 09:44:40 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Clemens Ladisch <clemens@ladisch.de>, linux-hwmon@vger.kernel.org,
        Gabriel Craciunescu <nix.or.die@googlemail.com>,
        Wei Huang <wei.huang2@amd.com>
Subject: Re: [PATCH 1/6] hwmon: (k10temp): Add additional missing Zen2 and
 Zen3 APUs
Message-ID: <20210827164440.GA1751163@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Aug 26, 2021 at 01:40:52PM -0500, Mario Limonciello wrote:
> These follow the rest of the existing codepaths for families
> 17h and 19h.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/k10temp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index fe3d92152e35..1d3c8d319941 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -437,6 +437,8 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  			k10temp_get_ccd_support(pdev, data, 4);
>  			break;
>  		case 0x31:	/* Zen2 Threadripper */
> +		case 0x60:	/* Renoir */
> +		case 0x68:	/* Lucienne */
>  		case 0x71:	/* Zen2 */
>  			k10temp_get_ccd_support(pdev, data, 8);
>  			break;
> @@ -450,7 +452,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		switch (boot_cpu_data.x86_model) {
>  		case 0x0 ... 0x1:	/* Zen3 SP3/TR */
>  		case 0x21:		/* Zen3 Ryzen Desktop */
> -		case 0x50:		/* Zen3 Ryzen APU */
> +		case 0x50 ... 0x5f:	/* Green Sardine */
>  			k10temp_get_ccd_support(pdev, data, 8);
>  			break;
>  		}
> -- 
> 2.25.1
> 
