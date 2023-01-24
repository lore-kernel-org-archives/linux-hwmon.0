Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C4FC25B4E
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Jan 2023 14:00:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233962AbjAXOAL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Jan 2023 09:00:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234178AbjAXOAK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Jan 2023 09:00:10 -0500
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C32E47433;
        Tue, 24 Jan 2023 05:59:48 -0800 (PST)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-15eec491b40so17685938fac.12;
        Tue, 24 Jan 2023 05:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FkwV3BU2RnZYkqWJ6kRwLVBd/NDUL22RH3FJMPUDwVM=;
        b=qnqeEyV1eoRwZfM3J7RFFjfA7QF68Yyaz9CDVilGuYkT0Gi6KtONnbZDU/wpmJGKFI
         c4lbgmk9vcz+OTIfNyRM2m4OZE0ZjGollqQBYOUZWa4ItWiaM8FGeZihGkOHngK6ce9T
         pfMLny/6ngvsdyK4dsG/YK9etezgCSx58WnKLkd8X6oVWLWrXRq6ZdlObRo1o0qSTNp1
         yfQdEWzqO2TDoZLkA4edNCuWRtpBrtNvopTirCJ2uAVxvEsjpW/+CfNh2UDjVDe94pb7
         NG3ZGBzi8UCkE5Vf5Unt89nHo4O4maqFmol1rSfZW+I9cDWO4pMxjHxT56frrwjja7jO
         g6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FkwV3BU2RnZYkqWJ6kRwLVBd/NDUL22RH3FJMPUDwVM=;
        b=SSWdBBc5lVlDSSTQcixnXY4GLO9McNWkO3BywGqzhkl6ke89nTx3vH1gEPaITVnRei
         caYamc5HZyuMKuj9db1s2cBnOvoatLJswLeTxF5QqInTw98JS0HLhzGZFr8iaj/89SG0
         nt7sKuVGRDrDsEqrLxEXPSoJ6RLBhfYb4oq8y0qAbu+N5CfDFKFYbJ2xvzPy80qcFK2P
         WbB8Pi9edq3zBYpSDGAjIegr/FMEG6xaKRBCzY0R3+HqZeTo7doQQuoDC85L1mBylpPV
         TFQz824Tn3bhXbd3/E20L578V0ly89uTW0EnvTJTKw/XN2aJlyuS8JnKNn+h+t9DquNT
         zQcA==
X-Gm-Message-State: AO0yUKVqu0IjjSuqh8bN/I3+IxsOMaXC6xDwb7M3AbiZhXfJxGYf6E7m
        DIofW2YLorw7HImBcKvilAKYTqCrlyI=
X-Google-Smtp-Source: AK7set937BnhL2n78KIjY8isSUkljjM33ax43UPMxuTkXV5A4KNTYjfUEIUVj3ivc25GAAY/oc+47w==
X-Received: by 2002:a05:6870:40c6:b0:163:1b65:e459 with SMTP id l6-20020a05687040c600b001631b65e459mr903821oal.23.1674568782735;
        Tue, 24 Jan 2023 05:59:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id pd19-20020a0568701f1300b0014fd25bd3b5sm820444oab.0.2023.01.24.05.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 05:59:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 24 Jan 2023 05:59:41 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mario Kicherer <dev@kicherer.org>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/3] docs: hwmon: add docs for the NXP MC34VR500 PMIC
Message-ID: <20230124135941.GA37393@roeck-us.net>
References: <20230118123019.3041303-1-dev@kicherer.org>
 <20230118123019.3041303-3-dev@kicherer.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230118123019.3041303-3-dev@kicherer.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jan 18, 2023 at 01:30:18PM +0100, Mario Kicherer wrote:
> Add documentation for the NXP MC34VR500 PMIC.
> 
> Signed-off-by: Mario Kicherer <dev@kicherer.org>

Checkpatch notes that the SPDX license identifier is missing.
I copied the one from the source (SPDX-License-Identifier:
GPL-2.0-or-later). If this is not what you want, please let me know
and/or resubmit with the desired license identifier.

Thanks,
Guenter

> ---
>  Documentation/hwmon/mc34vr500.rst | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/hwmon/mc34vr500.rst
> 
> diff --git a/Documentation/hwmon/mc34vr500.rst b/Documentation/hwmon/mc34vr500.rst
> new file mode 100644
> index 000000000000..c9e3b44fb04f
> --- /dev/null
> +++ b/Documentation/hwmon/mc34vr500.rst
> @@ -0,0 +1,30 @@
> +Kernel driver mc34vr500
> +=======================
> +
> +Supported Chips:
> +
> +  * NXP MC34VR500
> +
> +    Prefix: 'mc34vr500'
> +
> +    Datasheet: https://www.nxp.com/docs/en/data-sheet/MC34VR500.pdf
> +
> +Author: Mario Kicherer <dev@kicherer.org>
> +
> +Description
> +-----------
> +
> +This driver implements initial support for the NXP MC34VR500 PMIC. The MC34VR500
> +monitors the temperature, input voltage and output currents and provides
> +corresponding alarms. For the temperature, the chip can send interrupts if
> +the temperature rises above one of the following values: 110°, 120°, 125° and
> +130° Celsius. For the input voltage, an interrupt is sent when the voltage
> +drops below 2.8V.
> +
> +Currently, this driver only implements the input voltage and temperature
> +alarms. The interrupts are mapped as follows:
> +
> +<= 2.8V  -> in0_min_alarm
> +>110°c   -> temp1_max_alarm
> +>120°c   -> temp1_crit_alarm
> +>130°c   -> temp1_emergency_alarm
