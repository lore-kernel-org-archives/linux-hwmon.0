Return-Path: <SRS0=ye16=DH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732D7C2D0A8
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Sep 2020 05:03:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10A48206A5
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Sep 2020 05:03:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSU6RtJy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725440AbgI3FDu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgI3FDu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Sep 2020 01:03:50 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED76C061755
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2020 22:03:50 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id n61so585598ota.10
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2020 22:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=274Tj2uJ9WXEaTXi4maq9PeikAbb3QBpaSDwAxcGjkE=;
        b=FSU6RtJy10CV4mbAzlWBFuuX/jKyK/PBrYcLcicP9DCcDmcnfrDe8HauTk28juXJOV
         uFHuwI+BnrDBudz9/fKdGCvhf1H9q4lhtZfpfT/sRYzMdjoQGXveRcdWscpwTSdNtECd
         XYiawV0wPoIhEBLUKn8oz0904Nj2hKOFbMHd0Q5ECmo/SLFLAFYwCHezhYUhB0eWZcmB
         N/xnDVI1sVu7NZBL4w0+p0pnFyBdQYye2FXhNdk179s4PsqGkC8ntebVABK9EnLJo34m
         RJ7Qv6rCqvL/mLYGrd4z6W30RKH4TO6cH6hhdM84qHQMbH9OaEDOZxDk5LaPpRRhjaGg
         MpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=274Tj2uJ9WXEaTXi4maq9PeikAbb3QBpaSDwAxcGjkE=;
        b=CjKjd4ZZdRizw2Hw975tKcGyKrCQhBagAknVad04K4ucnOHTY14XKwr98d+Zmar7og
         ygwRlBl+5OzG0oqPquYbXDUtb5qcYo0xEsXv8lTqNjb2j8ov+flQ8OH7HkkO21V/zl+u
         mWLhOwzMPcP70pKVGXkT7sYe49eUuQk0f75JY8mQf1siRSELNttbEhX7DGflNsSNm7gS
         z7CsDn+iev1eGTkEQfl4T5tzbz3Oph7jnK7Ug659N639tr5jWnwO+2nHi+M01dAVeUTg
         lRMAuCHgSGicmDAQDsr67J97j21tZO1G/bh/F38rHd5iiRgx201SR0FLDZncAvukPEh1
         l+uA==
X-Gm-Message-State: AOAM531oD0f5jgjCTPci9l/YB1RuCdXReDz7aYIzOzgt+MxkYa6jarMf
        sgDIvE15ONyi4pNfg6edrkQ=
X-Google-Smtp-Source: ABdhPJxyIHi9+F40hsLsclk6c4USFaHOcrYcYF/yAr44EYv6PeqJwK3yloIQZcxFMYTNQnDmj+8JzA==
X-Received: by 2002:a9d:2ac5:: with SMTP id e63mr473753otb.94.1601442229591;
        Tue, 29 Sep 2020 22:03:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l1sm123417ooe.20.2020.09.29.22.03.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 22:03:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 29 Sep 2020 22:03:47 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc:     linux-hwmon@vger.kernel.org, naveenkrishna.ch@gmail.com,
        Akshay Gupta <Akshay.Gupta@amd.com>
Subject: Re: [PATCH v2 1/4] hwmon: amd_energy: Move label out of accumulation
 structure
Message-ID: <20200930050347.GA193415@roeck-us.net>
References: <20200929105322.8919-1-nchatrad@amd.com>
 <20200929105322.8919-2-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929105322.8919-2-nchatrad@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 29, 2020 at 04:23:19PM +0530, Naveen Krishna Chatradhi wrote:
> From: Akshay Gupta <Akshay.Gupta@amd.com>
> 
> At present, core & socket labels are defined in struct sensor_accumulator
> This patch moves it to the amd_energy_data structure, which will
> help in calling memset on struct sensor_accumulator to optimize the code.
> 
> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>

Series applied.

Thanks,
Guenter

> ---
> Changes since v1:
> None
> 
>  drivers/hwmon/amd_energy.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> index 29603742c858..9580a16185b8 100644
> --- a/drivers/hwmon/amd_energy.c
> +++ b/drivers/hwmon/amd_energy.c
> @@ -35,7 +35,6 @@
>  struct sensor_accumulator {
>  	u64 energy_ctr;
>  	u64 prev_value;
> -	char label[10];
>  };
>  
>  struct amd_energy_data {
> @@ -52,6 +51,7 @@ struct amd_energy_data {
>  	int nr_cpus;
>  	int nr_socks;
>  	int core_id;
> +	char (*label)[10];
>  };
>  
>  static int amd_energy_read_labels(struct device *dev,
> @@ -61,7 +61,7 @@ static int amd_energy_read_labels(struct device *dev,
>  {
>  	struct amd_energy_data *data = dev_get_drvdata(dev);
>  
> -	*str = data->accums[channel].label;
> +	*str = data->label[channel];
>  	return 0;
>  }
>  
> @@ -253,6 +253,7 @@ static int amd_create_sensor(struct device *dev,
>  	struct sensor_accumulator *accums;
>  	int i, num_siblings, cpus, sockets;
>  	u32 *s_config;
> +	char (*label_l)[10];
>  
>  	/* Identify the number of siblings per core */
>  	num_siblings = ((cpuid_ebx(0x8000001e) >> 8) & 0xff) + 1;
> @@ -276,21 +277,25 @@ static int amd_create_sensor(struct device *dev,
>  	if (!accums)
>  		return -ENOMEM;
>  
> +	label_l = devm_kcalloc(dev, cpus + sockets,
> +			       sizeof(*label_l), GFP_KERNEL);
> +	if (!label_l)
> +		return -ENOMEM;
> +
>  	info->type = type;
>  	info->config = s_config;
>  
>  	data->nr_cpus = cpus;
>  	data->nr_socks = sockets;
>  	data->accums = accums;
> +	data->label = label_l;
>  
>  	for (i = 0; i < cpus + sockets; i++) {
>  		s_config[i] = config;
>  		if (i < cpus)
> -			scnprintf(accums[i].label, 10,
> -				  "Ecore%03u", i);
> +			scnprintf(label_l[i], 10, "Ecore%03u", i);
>  		else
> -			scnprintf(accums[i].label, 10,
> -				  "Esocket%u", (i - cpus));
> +			scnprintf(label_l[i], 10, "Esocket%u", (i - cpus));
>  	}
>  
>  	return 0;
