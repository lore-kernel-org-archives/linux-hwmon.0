Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B29C3DA78
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 Jan 2023 18:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbjAQSg6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 Jan 2023 13:36:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231531AbjAQSbp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Jan 2023 13:31:45 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5647F3E63E;
        Tue, 17 Jan 2023 10:01:47 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id x15-20020a4ab90f000000b004e64a0a967fso8162049ooo.2;
        Tue, 17 Jan 2023 10:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q++BI7qEFFq+GqGpGQ3prtgV+9puNAsv2TNTS331SFY=;
        b=obspte2ZcMlOeMDwjjxfeT8PHbu/XF/1Q64Poqrn8/NwM8Zle5LD7f/C1o3dtE1tWx
         lpLwK8J1sKrdrTl/eP6/quSkhaaJOEPDCt24PEcgBfNJWFogAoAG3XL/ljLbcP88msWk
         6KfuzS4b1SnRSdgwakQRwGDCcYMlF1xSCgO/HFHdjY289YdCSH17rAPj0MGgqV78bjKp
         fmvP70q3Wqn2Tzb9mM12ehZkf33QpdpnCENkyaDkJtdF2Jlj82oDCMfz9r8+J1sFCtKh
         ypu7VJ05UxpWnRGP6EXkURT2h1sKX9vtqayaePzy2dW7bpx8effChz71MYjuVX7g5vb4
         DGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q++BI7qEFFq+GqGpGQ3prtgV+9puNAsv2TNTS331SFY=;
        b=GH1XlruJNSb3MXmj6P2q4kSbG/RtTq/hlEWFxfKRSjQQ2X/Od8Zg01pc5pMWow/bd9
         J5LAU57iDkZjfC9NV3D3Snh9Gtl4mhuYbQ1ToUF709uxz461ad/vPx7GGQW+SH3v4K36
         u6tKepmJd+pFUGjoNDqEiIYeHKRgMd21WkLCN+Lp25jN6NYx8kBA5N3LMvByDu0wAAuF
         VjU/+v3aoCICzdy+oqpt2WjxPsqzr6wUjcks4F1i0iY8XqBn6CFzJFkQFZB+IHSURef6
         goQDmRXnt53TiHSxDmSRsMzPYMxaBaeGD/J6IOlS22fUl/okCa1nhZwMdXuum2L0YLuF
         fy9A==
X-Gm-Message-State: AFqh2krjZDdmEvJBltZfm2Pz29ERM3iaCXuWfZjbPGYTRnS8JQ8wcKdb
        +L6vrjDxY0ZQqOvB3HX7X3o=
X-Google-Smtp-Source: AMrXdXtpr9N7GCrNn2rBwA+oQ1FlhNeOREkhjGWU/mdp/qT/NIW1uyQw+5JgFkrdqJdaC+bc5ATJgQ==
X-Received: by 2002:a4a:430d:0:b0:4f2:8f8:d2ff with SMTP id k13-20020a4a430d000000b004f208f8d2ffmr1644822ooj.6.1673978506434;
        Tue, 17 Jan 2023 10:01:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x9-20020a4ae789000000b0049f098f4fb4sm15150375oov.24.2023.01.17.10.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 10:01:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 17 Jan 2023 10:01:44 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mario Kicherer <dev@kicherer.org>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] docs: hwmon: add docs for the NXP MC34VR500 PMIC
Message-ID: <20230117180144.GB2335664@roeck-us.net>
References: <20230117161340.1310936-1-dev@kicherer.org>
 <20230117161340.1310936-4-dev@kicherer.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230117161340.1310936-4-dev@kicherer.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jan 17, 2023 at 05:13:40PM +0100, Mario Kicherer wrote:
> This patch adds documentation for the NXP MC34VR500 PMIC.

"Add documentation".

See Documentation/process/submitting-patches.rst,
"Describe your changes".

> 
> Signed-off-by: Mario Kicherer <dev@kicherer.org>
> ---
>  Documentation/hwmon/mc34vr500.rst | 32 +++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/hwmon/mc34vr500.rst
> 
> diff --git a/Documentation/hwmon/mc34vr500.rst b/Documentation/hwmon/mc34vr500.rst
> new file mode 100644
> index 000000000000..5a8e0cbf4dbf
> --- /dev/null
> +++ b/Documentation/hwmon/mc34vr500.rst
> @@ -0,0 +1,32 @@
> +Kernel driver mc34vr500
> +=======================
> +
> +Supported Chips:
> +
> +  * NXP MC34VR500
> +
> +    Prefix: 'mc34vr500'
> +
> +    Addresses scanned: I2C 0x08

No, since there is no detect function.

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
> +<= 2.8V  -> in_min_alarm

in0_min_alarm

> +>110°c   -> temp_max_alarm
> +>120°c   -> temp_crit_alarm
> +>130°c   -> temp_emergency_alarm

temp1_xxx

> -- 
> 2.34.1
> 
