Return-Path: <SRS0=dIDE=DJ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624B0C4363C
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Oct 2020 16:55:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2181A20719
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Oct 2020 16:55:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHSNGU0a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgJBQz5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 2 Oct 2020 12:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbgJBQz5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Oct 2020 12:55:57 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82E38C0613D0
        for <linux-hwmon@vger.kernel.org>; Fri,  2 Oct 2020 09:55:57 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 60so2012537otw.3
        for <linux-hwmon@vger.kernel.org>; Fri, 02 Oct 2020 09:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=IVd9j5JYFjRr8HxhCNRo6Fz4Y2WC8uCgtXFWTEgaJSI=;
        b=dHSNGU0aIdj/UFPFM5z6XsyPuu1bAxPhyox9l0zbe74M6fMyjpTCzQkJtaLadXf+e6
         vUE6dMMsxJGW2ojXRUa7DKGic/0Oz2w0TSzF/h+oc4tUX801+TzsrJW/Kcdjm7/pZc2Q
         RVGj3LrPmRkE9MLe+vNyAZzOoIcqcr4RoaGlGepw04v835kqtT5/27MaJvrWJw3tFiNn
         46O1BHpnKmtGZ7geAb/WJj+xZbxZvi7N6rj0APL4zUfxwfnjxqFhn5u6hiMLcFIwBViU
         Nw0KhiRYb9x3AOGHN/fWx1lQJU066bxLJIkaFFfexgL1I9rou0BexVo+qNAMaDkngCze
         cIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=IVd9j5JYFjRr8HxhCNRo6Fz4Y2WC8uCgtXFWTEgaJSI=;
        b=hLwZWStEEEU341Ce07lRdeD29sW5RPBg3jInnkUGXXinLjnPGWaLJi10UyRq/8XKtk
         G/QVpHW5C2qDnjFZWSRrBdkWulR+hmBT1ZbZUY2+1K/R/T4TCjsOmV5+Va4xP4Qhg92Y
         2YrLTIBAIVpzMBl0UcEiYfoOfvkNo/tXQybkjKb7AjmHoTLb18PIQN7ZOUy/ESs4yKeZ
         7z5mGUhIfn8yMUOngHpbO8JWp36mY7DBvfwk2JCT2h55gnyURiZRcvrJJKJC6NdC+bNu
         jO4sY4/l8jCMKDPNrU4S9getp97XAtin8pGBFV8O27oBYmUl6SLsT7X+9LW+jcZ7AxIT
         VItg==
X-Gm-Message-State: AOAM533HRlNba1+LYSUKvPMM1Nijupc+Fy0nn1DEbaIOTHKvIIlUlfla
        MGq6g4+iIHOk1W5LisuTBCw=
X-Google-Smtp-Source: ABdhPJwWSTH9u4rpkJUaXev6nLRbY0YHSXwUW6hmGi1DBiJXK/DRdm3ueSiwtN7B+UfZtX6ruc5bTA==
X-Received: by 2002:a05:6830:48:: with SMTP id d8mr2266726otp.272.1601657756961;
        Fri, 02 Oct 2020 09:55:56 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q14sm477333ota.41.2020.10.02.09.55.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 09:55:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 2 Oct 2020 09:55:55 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Steve Foreman <foremans@google.com>
Cc:     linux-hwmon@vger.kernel.org, Guenter Roeck <groeck@google.com>
Subject: Re: [PATCH] Fix max34440 OC fault limits
Message-ID: <20201002165555.GA48791@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Oct 02, 2020 at 04:35:38PM +0000, Steve Foreman wrote:
> The max34* family have the IOUT_OC_WARN_LIMIT and IOUT_OC_CRIT_LIMIT
> registers swapped.
> 
> Signed-off-by: Steve Foreman <foremans@google.com>

Nice catch.

Applied (changed subject line to use hwmon and driver prefixes,
changed comment to C style to match rest of driver, use tab after
defines).

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/max34440.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
> index f3971ceaef9a..eb6e7bb5327d 100644
> --- a/drivers/hwmon/pmbus/max34440.c
> +++ b/drivers/hwmon/pmbus/max34440.c
> @@ -44,6 +44,11 @@ enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
>  #define MAX34440_STATUS_OT_FAULT	BIT(5)
>  #define MAX34440_STATUS_OT_WARN		BIT(6)
>  
> +// The whole max344* family have IOUT_OC_WARN_LIMIT and IOUT_OC_FAULT_LIMIT
> +// swapped from the standard pmbus spec addresses.
> +#define MAX34440_IOUT_OC_WARN_LIMIT 0x46
> +#define MAX34440_IOUT_OC_FAULT_LIMIT 0x4A
> +
>  #define MAX34451_MFR_CHANNEL_CONFIG	0xe4
>  #define MAX34451_MFR_CHANNEL_CONFIG_SEL_MASK	0x3f
>  
> @@ -62,6 +67,12 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
>  	const struct max34440_data *data = to_max34440_data(info);
>  
>  	switch (reg) {
> +	case PMBUS_IOUT_OC_FAULT_LIMIT:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   MAX34440_IOUT_OC_FAULT_LIMIT);
> +	case PMBUS_IOUT_OC_WARN_LIMIT:
> +		ret = pmbus_read_word_data(client, page, phase,
> +					   MAX34440_IOUT_OC_WARN_LIMIT);
>  	case PMBUS_VIRT_READ_VOUT_MIN:
>  		ret = pmbus_read_word_data(client, page, phase,
>  					   MAX34440_MFR_VOUT_MIN);
> @@ -128,6 +139,12 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
>  	int ret;
>  
>  	switch (reg) {
> +	case PMBUS_IOUT_OC_FAULT_LIMIT:
> +		ret = pmbus_write_word_data(client, page, MAX34440_IOUT_OC_FAULT_LIMIT,
> +					    word);
> +	case PMBUS_IOUT_OC_WARN_LIMIT:
> +		ret = pmbus_write_word_data(client, page, MAX34440_IOUT_OC_WARN_LIMIT,
> +					    word);
>  	case PMBUS_VIRT_RESET_POUT_HISTORY:
>  		ret = pmbus_write_word_data(client, page,
>  					    MAX34446_MFR_POUT_PEAK, 0);
> -- 
> 2.28.0.806.g8561365e88-goog
> 
