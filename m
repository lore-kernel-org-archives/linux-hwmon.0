Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA57AC4708F
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Jun 2021 12:44:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC7CC60233
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Jun 2021 12:44:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhFBMqA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Jun 2021 08:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhFBMqA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Jun 2021 08:46:00 -0400
Received: from office2.cesnet.cz (office2.cesnet.cz [IPv6:2001:718:1:101::144:244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 637D2C061574
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Jun 2021 05:44:17 -0700 (PDT)
Received: from localhost (ip-78-45-210-72.net.upcbroadband.cz [78.45.210.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 195BE40006E;
        Wed,  2 Jun 2021 14:44:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1622637856;
        bh=Mp2fhNV+GPHMRuCga7tgGF/EwbDY3WYCCCaKE1SlE6o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=IXyUmuBvcg8M94ueAPnh4sT06qbT84u7W4dYqgK7H98XHw3ytyr7WYQYzYN7FaFuQ
         4fvqskT9Gp0IjhQFs8AzLciy8w5NawQ8K0nbYnIU327oXX9KwviStJ1sLElUbMBT0Q
         AULbPD5aOz+uBRMV+gpYuIeb0ge3x+wkrWADZE4y3LMJaDxrzYWIvs0ANXchuvZPcr
         v8Se0mGCzcaHWXJzlL7t+OJ0WvYpjircF1hXh868StMX+9cLTsHY4M2jdAi/cRrQfd
         AxJYW3hhq+d9Phd0qz9v+sIl2Fh0JVGGJ+MezCqViSfNG+iLsymwJXID82zC/8A8HR
         EChi59wWGgPyg==
From:   =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     <linux-hwmon@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
        <kubernat@cesnet.cz>
Subject: Re: [PATCH 3/7] hwmon: (max31790) Fix =?iso-8859-1?Q?pwmX=5Fenable_attributes?=
Date:   Wed, 02 Jun 2021 14:44:15 +0200
MIME-Version: 1.0
Message-ID: <18b3e371-9e37-4887-8c05-161e6a2dcb88@cesnet.cz>
In-Reply-To: <20210526154022.3223012-4-linux@roeck-us.net>
References: <20210526154022.3223012-1-linux@roeck-us.net>
 <20210526154022.3223012-4-linux@roeck-us.net>
Organization: CESNET
User-Agent: Trojita/unstable-2020-07-06; Qt/5.15.2; xcb; Linux; 
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On st=C5=99eda 26. kv=C4=9Btna 2021 17:40:18 CEST, Guenter Roeck wrote:
> pwmX_enable supports three possible values:
>
> 0: Fan control disabled. Duty cycle is fixed to 0%
> 1: Fan control enabled, pwm mode. Duty cycle is determined by
>    values written into Target Duty Cycle registers.
> 2: Fan control enabled, rpm mode
>    Duty cycle is adjusted such that fan speed matches
>    the values in Target Count registers
>
> The current code does not do this; instead, it mixes pwm control
> configuration with fan speed monitoring configuration. Worse, it
> reports that pwm control would be disabled (pwmX_enable=3D=3D0) when
> it is in fact enabled in pwm mode. Part of the problem may be that
> the chip sets the "TACH input enable" bit on its own whenever the
> mode bit is set to RPM mode, but that doesn't mean that "TACH input
> enable" accurately reflects the pwm mode.
>
> Fix it up and only handle pwm control with the pwmX_enable attributes.
> In the documentation, clarify that disabling pwm control (pwmX_enable=3D0)
> sets the pwm duty cycle to 0%. In the code, explain why TACH_INPUT_EN
> is set together with RPM_MODE.
>
> While at it, only update the configuration register if the configuration
> has changed, and only update the cached configuration if updating the
> chip configuration was successful.
>
> Cc: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>
> Cc: V=C3=A1clav Kubern=C3=A1t <kubernat@cesnet.cz>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>

Cheers,
Jan
