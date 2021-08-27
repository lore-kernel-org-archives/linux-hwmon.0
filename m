Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C16C432BE
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Aug 2021 16:48:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6875D60F35
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Aug 2021 16:48:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbhH0Qt0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 27 Aug 2021 12:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbhH0Qt0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Aug 2021 12:49:26 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81AABC061757
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Aug 2021 09:48:37 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id q39so10285017oiw.12
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Aug 2021 09:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=YrtmyI0qBKGV52TQK4NPfOaak1LrQJMv2nkkcBjxzDs=;
        b=m2BxHvu6jl6dEHLTe4G96BD8be5FtK7+Hr+qoGnu3rE3knedA2v0E1LJSCWyU1lxl1
         tv/bNvZMYPFvzkKXjWeVLcgjdmJ11GlCQSiZ2riXQ260hqcIjtsUoQfN2pLM2XKsppQG
         JFEc5yCD3G08yQaQT3tYPlTfCDMGyGMHHzJyefMKCq8pvMAYHCrOSB+I35rg35FX6jY5
         DEiyKXkMDBve07ofD5slI4/e5sZLtFFtiVJ9hHLHOr9NV3MxaNcl8n5g2M8Z+f/l1nyh
         58+3CDagef4lx9aEdWFf7ROfqHv2guCy/XSzLVb4FpyEpHDvM9H8P3/ptz6A0clAmM3+
         VflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition;
        bh=YrtmyI0qBKGV52TQK4NPfOaak1LrQJMv2nkkcBjxzDs=;
        b=cF75ZvrUPdEU4QZbAeXBVve4NsNWF1tqCTQ+gcYo4E36poW1dU+KkUHYtXA/eWKRYZ
         qSHki1k5zngDHmK3sRCp7bToQXJrna098LhTv8BZuqJ8teJHChJDnWm7t1H7whbAfD+P
         ++ynxLVd2HOZWDFoQiQ9EdoBVvL59B29qCzl9RVil04Fux+wyLAQ3HqayouJrwaIRCSj
         vBqmWyQlF9ZRGfjjkNeCZ82QbqsplYN5xDDUahjLtQ6jah0tfBtqRDjgXYdVjmpZuQwT
         W3LKDMJ8kwV/ev/r01H7JSL2STa32M9H627+FygJQtSn+o//JkTbxv/XcNr4AIhmAxOf
         /rRw==
X-Gm-Message-State: AOAM531uiSM7xd9a/PjkNsVSrJhk/XjxgRgLYrOv5SDDJiGwu/u/PSqO
        ++vZRR2dTDYBG64Yc0Oix6Y=
X-Google-Smtp-Source: ABdhPJxtj7xGl9Uxu6T+k0/L8Z2OhWQIFjpv4O/NYBxR7Qz6GMao9g/LKA99IGCeXxxKHlF0YCtehw==
X-Received: by 2002:a05:6808:46:: with SMTP id v6mr6931944oic.61.1630082916906;
        Fri, 27 Aug 2021 09:48:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 14sm1383258otl.78.2021.08.27.09.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 09:48:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 27 Aug 2021 09:48:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Clemens Ladisch <clemens@ladisch.de>, linux-hwmon@vger.kernel.org,
        Gabriel Craciunescu <nix.or.die@googlemail.com>,
        Wei Huang <wei.huang2@amd.com>
Subject: Re: [PATCH 5/6] hwmon: (k10temp): Don't show Tdie for all
 Zen/Zen2/Zen3 CPU/APU
Message-ID: <20210827164835.GA1754417@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Aug 26, 2021 at 01:40:56PM -0500, Mario Limonciello wrote:
> Tdie is an offset calculation that should only be shown when temp_offset
> is actually put into a table.  This is useless to show for all CPU/APU.
> Show it only when necessary.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Applied.

I won't apply the other patches of the series because they either have issues
or need approval from x86/pci maintainers. No reason to hold up this one
or the first patch of the series, though.

Side note: I accepted this patch because it _seems_ like hwinfo64
does something similar. I do hope, though, that the assertion made
in the patch description is correct and that this doesn't miss CPUs
where there is a (logical or real) difference between Tctl and Tdie.

Guenter

> ---
>  drivers/hwmon/k10temp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index 41d9c0c0a1f1..e8ec0e36fc3b 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -435,7 +435,6 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	} else if (boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18) {
>  		data->temp_adjust_mask = ZEN_CUR_TEMP_RANGE_SEL_MASK;
>  		data->read_tempreg = read_tempreg_nb_zen;
> -		data->show_temp |= BIT(TDIE_BIT);	/* show Tdie */
>  		data->is_zen = true;
>  
>  		switch (boot_cpu_data.x86_model) {
> @@ -457,7 +456,6 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	} else if (boot_cpu_data.x86 == 0x19) {
>  		data->temp_adjust_mask = ZEN_CUR_TEMP_RANGE_SEL_MASK;
>  		data->read_tempreg = read_tempreg_nb_zen;
> -		data->show_temp |= BIT(TDIE_BIT);
>  		data->is_zen = true;
>  
>  		switch (boot_cpu_data.x86_model) {
> @@ -478,6 +476,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  
>  		if (boot_cpu_data.x86 == entry->model &&
>  		    strstr(boot_cpu_data.x86_model_id, entry->id)) {
> +			data->show_temp |= BIT(TDIE_BIT);	/* show Tdie */
>  			data->temp_offset = entry->offset;
>  			break;
>  		}
> -- 
> 2.25.1
> 
