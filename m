Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1FEC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 01:09:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 647D961019
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 01:09:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243687AbhIXBKx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Sep 2021 21:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240863AbhIXBKw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Sep 2021 21:10:52 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B86C061574
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Sep 2021 18:09:20 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so11037352otq.7
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Sep 2021 18:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Nn4LiHHwcNMI62J+2wVC1YtHlFjv2ViB8kngTBnsXos=;
        b=eONdDff9Sh/D7MJ/zRAeQYZWAyJ6c4534emE5WMcExpaE1jNtz75suJmkzAbNPyBkF
         LP5L2EWv00HxwCsKW7O41DkI44p5egGYuwdSQsQAzaj1WinmY8NLFS5XaUNJ368n9Tqs
         9j59h8I4WCh6ovVlZAsb+xUhhRyqDMPYp9sS3zProvCKSwX1aWx+Ar9+668dBYHvUzbe
         OCzwU9UeKuzVQFbD0lJ8uuLQJuUwKLQbv/RaTtAa8j2P/JYcxzz+wCp5GXKhzFRJNlpH
         egON1C6toxW7eHaaSQlQxMVSJYTQif/r6/io82B1zHJojG/PReRQB0qYlOWPid0IkrJE
         wBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Nn4LiHHwcNMI62J+2wVC1YtHlFjv2ViB8kngTBnsXos=;
        b=o7oDPmlVXelr8NNaUU6JYXrEW1CiRNeZ/rV9G4BNTUDx4AOflbIbHi3PCdaVuha4wO
         5Ff+hyp51lqRDKwI2Zw/d7jKxeYfotbfxGeTZc5Mvmi8yoBjc+vGwKbb4Ox92TrKWq3F
         U92ifgPOH5KGyNNYQB7DQyUb6AmRAij1uUurK1WqdzkxlEgEZIrlZ1tRkZaOCTjktqOw
         s2rGtJQuudQVLVUyQ8hsraHXtocKAZeN/gnygoC9MHB6hl9DH2lPFCDuNHQgqpUbKT8i
         g8ZPNY5KALrOMj8yfcYVXZ43g7DDYDpXsJdMXtCUVhDUUefwtYvdc4IWi7MCklypRzS3
         KyiQ==
X-Gm-Message-State: AOAM531VeyKI2VVLzTGgKNral4P8hACh/6WVSEczDbM/oW00QwunD1l8
        LASFCiIyr+ZWW2B96twX3D41XXXWneE=
X-Google-Smtp-Source: ABdhPJyCsq70jAurz/ggx9pcy8ol9jIxfCiSYIpuFSqjhmY5OD+cOI3rmeGL0B7yQS1O3l8i7n/JUQ==
X-Received: by 2002:a9d:5887:: with SMTP id x7mr1488463otg.331.1632445759794;
        Thu, 23 Sep 2021 18:09:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f13sm1739934oto.49.2021.09.23.18.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 18:09:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 23 Sep 2021 18:09:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH hwmon-next 1/1] hwmon: (mlxreg-fan) Fix defect reported
 by Coverity Scan for linux-next
Message-ID: <20210924010918.GA3029562@roeck-us.net>
References: <20210920174119.1080488-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920174119.1080488-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Sep 20, 2021 at 08:41:18PM +0300, Vadim Pasternak wrote:
> Fix counter limit in 'for' loop in mlxreg_fan_cooling_config().
> The issue found in the report on new defect(s) introduced to linux-next
> weekly scan found with Coverity Scan - memory access violation.
> 
> ** CID 1507571:  Memory - illegal accesses  (OVERRUN)
> /drivers/hwmon/mlxreg-fan.c: 560 in mlxreg_fan_cooling_config()
> 
> >>> Overrunning array of 160 bytes at byte offset 160 by dereferencing
> 	pointer "pwm".
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

I just applied a similar patch. I added you as Reported-by: to that patch.

Thanks,
Guenter

> ---
>  drivers/hwmon/mlxreg-fan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index 35228ed112d7..feab9ec6a6ca 100644
> --- a/drivers/hwmon/mlxreg-fan.c
> +++ b/drivers/hwmon/mlxreg-fan.c
> @@ -554,7 +554,7 @@ static int mlxreg_fan_cooling_config(struct device *dev, struct mlxreg_fan *fan)
>  {
>  	int i, j;
>  
> -	for (i = 0; i <= MLXREG_FAN_MAX_PWM; i++) {
> +	for (i = 0; i < MLXREG_FAN_MAX_PWM; i++) {
>  		struct mlxreg_fan_pwm *pwm = &fan->pwm[i];
>  
>  		if (!pwm->connected)
