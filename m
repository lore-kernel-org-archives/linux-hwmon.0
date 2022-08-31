Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12507ECAAD1
	for <linux-hwmon@archiver.kernel.org>; Wed, 31 Aug 2022 14:28:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiHaO2U (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 31 Aug 2022 10:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbiHaO2N (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 31 Aug 2022 10:28:13 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE52E2A26C
        for <linux-hwmon@vger.kernel.org>; Wed, 31 Aug 2022 07:28:10 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id m10-20020a17090a730a00b001fa986fd8eeso21234641pjk.0
        for <linux-hwmon@vger.kernel.org>; Wed, 31 Aug 2022 07:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc;
        bh=OtM1Z44jy94uhzgK9Ckaw6XYgSFwvQu/NWvzCgrHipY=;
        b=Dv+vyOfMuHORQXq8WUbwReMkPseeey2RVhyGzO7/sykFWrQC8PrbTjOimtM5OV7LX3
         1BTrkOCrM87sKDv4X3g/qut30ERvpOzknVmpz0AYCRmDqDWhZgWwcsv+Qic1SmSFV/W4
         X9Iv2GG1K8c6uSAxteHxHvg1eeSgtdWPABCBftVEMnhF3bnXqFpPCa8dstOcA9GCfQ1c
         dEHF/LPNHrpVFy2dUECh5zGZ1op3liLDKTQwe/KpD1/77dPSII8dPvN0JXcwFHH2I4Ko
         s6Kxsz6OmkhOoH5Gw7kdX9km2MGuZXHYjWPm8DVGZigdIy+H6eSKEOF5xF9tivolh9fI
         0eWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc;
        bh=OtM1Z44jy94uhzgK9Ckaw6XYgSFwvQu/NWvzCgrHipY=;
        b=8RRIXKyn/CGq3xRKaI7rFuPUj+UjnC5xxt2vZbyMZtbDI8D8ZyftTb/zD4zm6MOKRT
         1W1rtAG+IFzJDy59SexWWKDwaBKkYp9q2TPDY+cFLEcbmfN1tYAoCtcaWLg+J/io5sqm
         6dBr2JixyFz8Qf1GPFMc7PINf1+twvzZq722sfomnRAqjZPEleOPNOOUOSc55jXwWxh+
         gUANBYg7RyHQ0nEXamB1gMuJTI0IOf8eUn+AA3mShLel+58P8RwF1k/F58PnpM6mikKy
         bCoY1skpdmnFEiLJkkM8POWLNDDYOSmBbKV0iDanR9Bef1bvVQzenooNYqruGf+mkZBQ
         UYKQ==
X-Gm-Message-State: ACgBeo0IWr0WeTYD96eQrKy0JFlIbuaOYFSpAf69tnbNwLF8Xl8QaUcf
        DnMsKnVtK5gz2wZlPZiwTLI=
X-Google-Smtp-Source: AA6agR6h3ce7/tcqpktwlGe6qj6D9QYZmJyQKzsPJsPZeX21G+nUt+pd38kxuAkOHqLZSPTzEDQ9gg==
X-Received: by 2002:a17:90b:3889:b0:1f5:88cd:350d with SMTP id mu9-20020a17090b388900b001f588cd350dmr3606573pjb.9.1661956090339;
        Wed, 31 Aug 2022 07:28:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2-20020a170902f14200b00173368e9dedsm8506349plb.252.2022.08.31.07.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 07:28:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <06ee9484-7c9c-caa7-4b9c-95e673e914bc@roeck-us.net>
Date:   Wed, 31 Aug 2022 07:28:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] docs: hwmon: fix make htmldocs warning
Content-Language: en-US
To:     michaelsh@nvidia.com
Cc:     linux-hwmon@vger.kernel.org, vadimp@nvidia.com
References: <20220831125237.44142-1-michaelsh@nvidia.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220831125237.44142-1-michaelsh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/31/22 05:52, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>
> 
> Fix WARNING: Title underline too short.
> 
> Fixes: 25e11ea6ead1b ("docs: hwmon: add emc2305.rst to docs")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> ---

I squashed this into the original patch.

Thanks,
Guenter

>   Documentation/hwmon/emc2305.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/emc2305.rst b/Documentation/hwmon/emc2305.rst
> index 854edab99595..2403dbaf2728 100644
> --- a/Documentation/hwmon/emc2305.rst
> +++ b/Documentation/hwmon/emc2305.rst
> @@ -13,7 +13,7 @@ Supported chips:
>         https://www.microchip.com/en-us/product/EMC2305
>   
>   Description:
> ------------
> +------------
>   This driver implements support for Microchip EMC2301/2/3/5 RPM-based PWM Fan Controller.
>   The EMC2305 Fan Controller supports up to 5 independently controlled PWM fan drives.
>   Fan rotation speeds are reported in RPM.

