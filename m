Return-Path: <SRS0=cB4w=AE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA92C433E0
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Jun 2020 14:03:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8B3A20720
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Jun 2020 14:03:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNAmswDt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732732AbgFWODF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Jun 2020 10:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732730AbgFWODF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Jun 2020 10:03:05 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26BD1C061573
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jun 2020 07:03:05 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id cm23so1543049pjb.5
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jun 2020 07:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=jMoFAToMDg+lotTVOU5AnXVuta2czv/olJh4qsNbtuc=;
        b=jNAmswDtYoipSw3rsKPdcQRRSpUjDUGTk7rfWJi+KlhEHCpdfqYkCw1+H9WFeEprgQ
         s99N27/YT+9GPMu2sfjwy+t8VodeGssEoNb83bYyCeXO4Tg+A8MJOsJph8Le9GuaqbEO
         UJUKm/soneHBakoJIK7UsU4B2VJ/ljFy9JunXn0hRZzzUg23sHC++x8ol8HQtZhw3q6o
         S1Okgf0bH9Zg4zn9R0EOPsn2HtIOs7TFWaIwa6LX2AA6qKv3Wzc+e6iyb5QlmdCBHs0d
         GqUwURLv3AFEP8Gr5veJuaR59MgFhv0i/5IT6Zydp+pDyKwtaxQiqMw9Y6H/VMf7eAZ3
         d1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=jMoFAToMDg+lotTVOU5AnXVuta2czv/olJh4qsNbtuc=;
        b=tQz5n2ri06hrXKIxZismJrziAHd1rg3pYFkcRdu/v8bex6WnytQghuNBGeKlXALuzj
         kyhx6RSeDpIatQsJsHT0K8BTat+OO4OZYOjU7KZJhtEqBWv0JFZ/6bk5U/LfsXu3IkV3
         XQ/mZjaZ5DWTVhrPIWEbgqa1IyiMgPnH32ATW19wV1mMaaaD9NMMRnZz5tuO7U2+64qZ
         mki4z83wHbR9aIklsN4Om9wbdkfkvlznlbRGRsajHi1VafNACAjKdR0aqx1bC+oSeLSg
         UZbVn3A6Wp1z2WsWi/yIBSER6EeSDMaYdPfVdNdNYmWJdYgNiSodI4cObKjh2dO8EmfE
         IUIA==
X-Gm-Message-State: AOAM533sCph22rhG+jLpBw7tUUGUjC3O9EALgpZMcvt+9zv1RotC6dhC
        n3qDMbba2L/yfPUHRLFELhQ=
X-Google-Smtp-Source: ABdhPJwQOy4kYeC2vX8R9voWdvMjg1L9/JLnLnsHCRBbJLIotKFom7r7aVbX3Tlt9+QcD9/tDB17PQ==
X-Received: by 2002:a17:90b:801:: with SMTP id bk1mr23288788pjb.28.1592920984570;
        Tue, 23 Jun 2020 07:03:04 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g17sm2563990pju.11.2020.06.23.07.03.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 07:03:03 -0700 (PDT)
Date:   Tue, 23 Jun 2020 07:03:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jan =?iso-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>
Cc:     linux-hwmon@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
Subject: Re: [PATCH] hwmon: (pmbus) Fix page vs. register when accessing fans
Message-ID: <20200623140302.GA73558@roeck-us.net>
References: <449bc9e6c0e4305581e45905ce9d043b356a9932.1592904387.git.jan.kundrat@cesnet.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <449bc9e6c0e4305581e45905ce9d043b356a9932.1592904387.git.jan.kundrat@cesnet.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jun 23, 2020 at 09:47:39AM +0200, Jan Kundrát wrote:
> Commit 16358542f32f added support for multi-phase pmbus devices.
> However, when calling pmbus_add_sensor() for fans, the patch swapped
> the `page` and `reg` attributes. As a result, the fan speeds were
> reported as 0 RPM on my device.
> 
> Signed-off-by: Jan Kundrát <jan.kundrat@cesnet.cz>
> Fixes: 16358542f32f hwmon: (pmbus) Implement multi-phase support

Applied.

Thanks,
Guenter

> ---
>  a/drivers/hwmon/pmbus/pmbus_core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 8d321bf7d15b..e721a016f3e7 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -1869,7 +1869,7 @@ static int pmbus_add_fan_ctrl(struct i2c_client *client,
>  	struct pmbus_sensor *sensor;
>  
>  	sensor = pmbus_add_sensor(data, "fan", "target", index, page,
> -				  PMBUS_VIRT_FAN_TARGET_1 + id, 0xff, PSC_FAN,
> +				  0xff, PMBUS_VIRT_FAN_TARGET_1 + id, PSC_FAN,
>  				  false, false, true);
>  
>  	if (!sensor)
> @@ -1880,14 +1880,14 @@ static int pmbus_add_fan_ctrl(struct i2c_client *client,
>  		return 0;
>  
>  	sensor = pmbus_add_sensor(data, "pwm", NULL, index, page,
> -				  PMBUS_VIRT_PWM_1 + id, 0xff, PSC_PWM,
> +				  0xff, PMBUS_VIRT_PWM_1 + id, PSC_PWM,
>  				  false, false, true);
>  
>  	if (!sensor)
>  		return -ENOMEM;
>  
>  	sensor = pmbus_add_sensor(data, "pwm", "enable", index, page,
> -				  PMBUS_VIRT_PWM_ENABLE_1 + id, 0xff, PSC_PWM,
> +				  0xff, PMBUS_VIRT_PWM_ENABLE_1 + id, PSC_PWM,
>  				  true, false, false);
>  
>  	if (!sensor)
> @@ -1929,7 +1929,7 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
>  				continue;
>  
>  			if (pmbus_add_sensor(data, "fan", "input", index,
> -					     page, pmbus_fan_registers[f], 0xff,
> +					     page, 0xff, pmbus_fan_registers[f],
>  					     PSC_FAN, true, true, true) == NULL)
>  				return -ENOMEM;
>  
