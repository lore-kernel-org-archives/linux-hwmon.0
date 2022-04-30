Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDCAC433F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Apr 2022 12:58:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377060AbiD3NBW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 30 Apr 2022 09:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbiD3NBW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 30 Apr 2022 09:01:22 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95886719C6;
        Sat, 30 Apr 2022 05:58:00 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id a10so11150131oif.9;
        Sat, 30 Apr 2022 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JrzcVRiOTtdTztIgt2jm0sav/da1Fi9w94LTpqDYlBc=;
        b=CX3R5GvqmOQe6UtQi4RF+a7C+Cpgy232C/t6uVzxwsY0+/La15jYmNyW3nsXfdFYjo
         w8jZDE48bc5lBE857YTb0sTxC8nFnc9zfIkltI/8q0eNeycLzDSBMICp9tHbcvqXyucv
         Owe/SsO2y4kAz2ep79GuPINalYgPx3O98Y9l2XkacQCTQvoLZ1D85kS1wVmniO3Ga9IW
         gFTkOCrPo+kiZRnAewl2NQwkzssDA/5sNYR+Xqp8HCXuZvrJydcRmXTq7kR3nIq1UxbR
         2J+IGkJZ/j+ESVwnvHUQ06oJXcLShy8AR3ySIUHgK7cufXpoqEm/JqkebePUREeBlzDf
         ajDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=JrzcVRiOTtdTztIgt2jm0sav/da1Fi9w94LTpqDYlBc=;
        b=pvKwzhX/UGZlxfe6uIQdHK4/tffl9Rsv4Orm59S/CSOITX2iFnxF8Hs5cY6Vd88/nY
         MJMQX6EHVXcoQrfdDgO2QCcvs0tXmCYoNMNwK2QgPtoK9fAMego00NScCuBsTJACXnWJ
         Nzbf9VgMG5213m0X/wsOiBJUQDNxOye86UqLfIPlwQpsEq6axgUTujHQWzrxYSu94qKL
         7gaovwuWPsB5aDwB/y7hAEjOify+7zOdujGdngyoxJSlXkfWJq0EKXnE8eGKfhVZ/h5E
         BjGOCfI6er7rMNad8ma8Ya63srgKC+kWrr4jDeVCsh0qRay85Qqx1/0hgQh7GNknyCX8
         Cwiw==
X-Gm-Message-State: AOAM530ZLBL0TOpVB4Xix2wCkGVXlGfQiR1civ+0EZE29H22acJ1oWN8
        0nqoQa6rZXkoSRAz2XHW+7J8SgNHr/O+5Q==
X-Google-Smtp-Source: ABdhPJxpefSoAhMBpyXiHr3two36ghSKpk1L/PJdkZt60mrEz8Whe6YpW8tBWoEG90RyVyXnQ6NYsQ==
X-Received: by 2002:a05:6808:148a:b0:322:6178:ebe2 with SMTP id e10-20020a056808148a00b003226178ebe2mr3522257oiw.7.1651323479952;
        Sat, 30 Apr 2022 05:57:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v15-20020a4ae6cf000000b0035eb4e5a6cdsm1856050oot.35.2022.04.30.05.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 05:57:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 30 Apr 2022 05:57:57 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     michaelsh@nvidia.com
Cc:     robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, vadimp@nvidia.com
Subject: Re: [PATCH v1 3/3] docs: hwmon: add emc2305.rst to docs
Message-ID: <20220430125757.GB1888736@roeck-us.net>
References: <20220430114905.53448-1-michaelsh@nvidia.com>
 <20220430114905.53448-4-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220430114905.53448-4-michaelsh@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Apr 30, 2022 at 02:49:05PM +0300, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>
> 
> Add description of emc2305 driver.
> 
> Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  Documentation/hwmon/emc2305.rst | 40 ++++++++++++++++++++++++++++++++++++++++

Also add to index.rst.

>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/hwmon/emc2305.rst
> 
> diff --git a/Documentation/hwmon/emc2305.rst b/Documentation/hwmon/emc2305.rst
> new file mode 100644
> index 000000000000..258da49d18f9
> --- /dev/null
> +++ b/Documentation/hwmon/emc2305.rst
> @@ -0,0 +1,40 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver emc2305
> +=====================
> +
> +Supported chips:
> +   Microchip EMC2305, EMC2303, EMC2302, EMC2301
> +
> +   Addresses scanned: I2C 0x27, 0x2c, 0x2d, 0x2e, 0x2f, 0x4c, 0x4d
> +   Prefixes: 'emc2305'
> +
> +   Datasheet: Publicly available at the Microchip website :
> +      https://www.microchip.com/en-us/product/EMC2305
> +
> +Description:
> +-----------
> +This driver implements support for Microchip EMC2301/2/3/5 RPM-based PWM Fan Controller.
> +The EMC2305 Fan Controller supports up to 5 independently controlled PWM fan drives.
> +Fan rotation speeds are reported in RPM.
> +The driver supports the RPM-based PWM control to keep a fan at the desired speed.
> +The driver provides the possibility to have one common PWM interface for all FANs
> +or up to the maximum available or configured independent PWMs.
> +
> +The driver provides the following sysfs interfaces in hwmon subsystem:
> +
> +================= == ===================================================
> +fan[1-5]_fault    RO files for tachometers TACH1-TACH5 fault indication
> +fan[1-5]_input    RO files for tachometers TACH1-TACH5 input (in RPM)
> +pwm[1-5]          RW file for fan[1-5] target duty cycle (0..255)
> +================= == ===================================================
> +
> +sysfs interfaces in thermal subsystem:
> +
> +================= == ========================================================================
> +cur_state         RW file for the current cooling state of the cooling device (0..max_state)
> +max_state         RO file for the maximum cooling state of the cooling device
> +================= == ========================================================================
> +
> +Configuration is possible via device tree:
> +Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> -- 
> 2.14.1
> 
