Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD89C433DB
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 Feb 2021 04:28:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD0ED64DD1
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 Feb 2021 04:28:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhBLE2Q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Feb 2021 23:28:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbhBLE2O (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Feb 2021 23:28:14 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9100CC061574
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Feb 2021 20:27:34 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id e5so7301386otb.11
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Feb 2021 20:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZCPLjQ0tetH4zY0aZPRPB/xut1vCOPDu0eYVB66aZq0=;
        b=W/XRSHSDCAwsh6K63lVjLCWk29a+6ubf8n6k4IF0OEjBdGbK6nBhM6iVZb+ih8m8WG
         4rx8mqO2Vq8RML5cW0WoQsRUHmmMfv8JCbBwCbuFeFmUqOI1YYl8+7rEt+D7hbzcwAvy
         q13gHmBMRygtJMMQyS+u5qXuxfok0fmuUCsXD7z5PIYk5eaSUcU+xnL5tuxCn+a6bPC5
         84AR8QSS4hZYEuJjWmLMDEhpCAKhelZdRzNwqH/vWVWV4awDpLA64XIjsFL43W4BP/GF
         cksOI9DU6KrE55Ih/wgLw0UW9pL4O3v5B2iJW5ruP64NRWYqIXLiPQdgDIW0geWSTaKi
         MaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZCPLjQ0tetH4zY0aZPRPB/xut1vCOPDu0eYVB66aZq0=;
        b=HRDSyX1eGOlrfoOR8pr6kFcW6vYzO2ccKPPyNH38NZMZ6wojywoGLpWizFK44T/4Di
         H0qpZNdHAEDvKHbSsRlJtrbZGttjromP2eRJXuc9dKBTwb4bw77yTduEo0C+Iy6ILiLP
         jXgYY19KEBytePjeyfctyg9Dq9XVQEWpylPSoWLE3rsWJVdfyYMaQInYKbkJwuO5z6y6
         2UKeBVKMm73HFQ/AlXLkakV9YmNia1y2/3SejZFncEjVMNjJCmzV+6c8lSjHy039CxCJ
         0TWxPfL18aftOk+/7uMNfqiV/pgW29fHXKUzoz1Yp08KPrT0suBGnkkG5kY9y2mY3o5h
         E4wg==
X-Gm-Message-State: AOAM530BBQMgbYi/p/6obbjIK3QUl16Fgr/w5RNE5QZK43DZnZXHoD+U
        PhnI9WMhFJh99MzKUBsiKvM=
X-Google-Smtp-Source: ABdhPJxGxWKVp7qpJnntA0itDpvzA5Kc6HANfnvn7MLgQs9qL4t3lq17pol8IL8ASnuw6Y4yzHeYAw==
X-Received: by 2002:a9d:4f0b:: with SMTP id d11mr881582otl.208.1613104054073;
        Thu, 11 Feb 2021 20:27:34 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w134sm1630730oia.56.2021.02.11.20.27.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 20:27:33 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 11 Feb 2021 20:27:32 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc:     linux-hwmon@vger.kernel.org, naveenkrishna.ch@gmail.com
Subject: Re: [PATCH] hwmon: (amd_energy) Add AMD family 19h model 30h x86
 match
Message-ID: <20210212042732.GA104319@roeck-us.net>
References: <20210211172054.246276-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211172054.246276-1-nchatrad@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Feb 11, 2021 at 10:50:54PM +0530, Naveen Krishna Chatradhi wrote:
> Add X86 CPU match for AMD family 19h model 30h. This is necessary to
> enable support for energy reporting via the amd_energy module.
> 
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/amd_energy.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> index 822c2e74b98d..a86cc8d6d93d 100644
> --- a/drivers/hwmon/amd_energy.c
> +++ b/drivers/hwmon/amd_energy.c
> @@ -333,6 +333,7 @@ static struct platform_device *amd_energy_platdev;
>  static const struct x86_cpu_id cpu_ids[] __initconst = {
>  	X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x17, 0x31, NULL),
>  	X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x19, 0x01, NULL),
> +	X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x19, 0x30, NULL),
>  	{}
>  };
>  MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
