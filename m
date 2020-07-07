Return-Path: <SRS0=Tvco=AS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76197C433E0
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jul 2020 14:16:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51CBC206E2
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jul 2020 14:16:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sps7tO11"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbgGGOQl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Jul 2020 10:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbgGGOQk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Jul 2020 10:16:40 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF865C061755
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Jul 2020 07:16:40 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u18so3186424pfk.10
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2020 07:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hOSCNBEQwRBsN3I3wpWdJBObZxxyTzpNRbgJykrynas=;
        b=Sps7tO11G/rVY7+KaGjPSqWqwIFTPBr1k+r/pjSYtvG8nmgEvVieicXAYot8TS5GoN
         ERZOrpvd8SNCoeKZPc47wB5nxGD9Xw8/lE52dEkM0ZznXsuwFKjWp4LmYhtA41pAKRWF
         as4Gz443GZ2lluQJoCZmxLwaaZ6EfUxegfkpZ9QxcZPJute491gKgVL14AjOy1zXVb+2
         6lIj1WVA99L8DWclNsxq/x8h0RXP5RKvwsKxSHVqrz8p34U6v9wiq+b7p8FpR/wIfDEW
         FjdBnONPFknM2+SSEVfE9bfKrcWPgx9BEQgPNqgt2BOZMvYjyJpqkixnYBbHQYic7qYY
         vQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=hOSCNBEQwRBsN3I3wpWdJBObZxxyTzpNRbgJykrynas=;
        b=TqpaQzFH+Y5D62jC1+TOxKVB0o3ihS9jXmgJR7uaRbDfMwxSxd+33XcSt33GEf/ljw
         lYH5RrbBojcAhfYwJqn6GGM02USo5cAUft9g9VU7bkUCYLTlHTCUNaWufKOeWNnPOt4p
         f9oaT/wrDefddwQFNWTmBhzhpOZeWf3qOGJSK6bVX1KAXPNXxhRzsoe8AChqNet0zr6L
         int42Iqdb5G31qzWjN5c+P1aDGmfKZmnw8wYaNKG+iiIqlBhGiOnLa/xJ2cG1VvbuLmW
         2lnwfa8NtCYmVix7coAyhKoiRfZ+9/hvMX8/z5srjTwjKiokAW3HKwybpfjLHpftZs2p
         Aq4w==
X-Gm-Message-State: AOAM530G5omNUKRvqvLuYAqNSa4HR49NRsyDHieqNGgrPJpb8/W1KfbE
        y4T+k2PDpajQkBgrnyMK91j/aKuySfc=
X-Google-Smtp-Source: ABdhPJzxlr+rK75RPdRF5ksZ1mPz5c35Q+qf4WtswanZ7FbI74IpT12KHm/9zBKFD/c98B5zNm0TWA==
X-Received: by 2002:a63:ca0c:: with SMTP id n12mr46268918pgi.216.1594131400331;
        Tue, 07 Jul 2020 07:16:40 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c134sm8114416pfc.115.2020.07.07.07.16.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 07:16:39 -0700 (PDT)
Date:   Tue, 7 Jul 2020 07:16:38 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc:     linux-hwmon@vger.kernel.org, naveenkrishna.ch@gmail.com
Subject: Re: [PATCH] hwmon: amd_energy: match for supported models
Message-ID: <20200707141638.GA219827@roeck-us.net>
References: <20200706171715.124993-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200706171715.124993-1-nchatrad@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 06, 2020 at 10:47:15PM +0530, Naveen Krishna Chatradhi wrote:
> The energy counters of certain models seems to be reporting
> inconsisten values. Hence, match for the supported models.
> 
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>

Applied.

Thanks,
Guenter

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
> -	X86_MATCH_VENDOR_FAM(AMD, 0x17, NULL),
> +	X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x17, 0x31, NULL),
>  	{}
>  };
>  MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
