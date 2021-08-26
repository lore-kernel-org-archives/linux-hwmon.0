Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEAB8C432BE
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 20:07:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A732F60FF2
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 20:07:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232128AbhHZUIR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Aug 2021 16:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233028AbhHZUIP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Aug 2021 16:08:15 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFFA1C061757
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Aug 2021 13:07:27 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id x9-20020a056830278900b0051b8be1192fso5069737otu.7
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Aug 2021 13:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Zc5DVJn2w2ktaVI3bC8QUp41iw/oY5QlUck70Dm7mXU=;
        b=pYDhH72Me5StKeXUwNFqMW6mIy8HwVDnbUK7PXcYc+2er+qD5+tFYVC/rSjWut7CBF
         wC07sGMMzNfpPn4McV0GGfF7yjCYQj9fygu9O3u0pfU/GWvlOA+lmrJhHkNrrLDP8Uue
         siEqeg7EVLS10r7QvH5QAYuMqy7u2zO0ywRt3HyhfUV8ls5arcvDoOAFv8mkHsCRoxP1
         AP5t2sU1O6NhP1H5rARgx8viZaMR3Eq9oyXXZK6Dr19zoTGT72YE/SQI1YoteY5uH/Ez
         e7bMD/huc6ZlvRreBzJUHyt1tO5Eotm+mfpnYIDxr4ubcKTBlsX7EHvZaSwPlZtQiJJ5
         vGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zc5DVJn2w2ktaVI3bC8QUp41iw/oY5QlUck70Dm7mXU=;
        b=Nt6loBjm6TG7sTHkZS86qZQe49j3wFFBWmHDUJXgGPm0pmal/HVlrDx8+sVgRHMzaQ
         OR2o3hp+0H4jduSEf6VXl0BTTOyyLVhxFsD/6o5r8XkWr+NB3IAkexs/GqR/MtZBUFEu
         brnj/1exg+A1pw5OILmTN6x14sH0WF7UfUty8l8uYqeBfNrSTvi/sm+u1tXgoyusIx2U
         0agdSTNHWTScdkieceqPCmKNtXmyk3V9vA5dWnFnuoYMUF+wsMQ4Al9JEvyrhd5refP+
         rN31DYf25dgmj4lAuhO7Gv/49AECmz8HD7kLMFi+acpUNeP9RlPivzQpwhAWA7RqIoHy
         KyjA==
X-Gm-Message-State: AOAM533p4SXtvxvFh/JHbU28FWtVrAgK6SbW9vEF4K/1aDLCIInS0gJe
        V8zfrhP+MZtWJGy7+9wetM8=
X-Google-Smtp-Source: ABdhPJwmliieuPSi9ArVDrM0uwrxGt/FQ2r/y/+UFFlHbOkfhAWcKPcjOwMJ2ONLQ5PLzXJd3O3QFA==
X-Received: by 2002:a9d:62c7:: with SMTP id z7mr4858298otk.157.1630008447366;
        Thu, 26 Aug 2021 13:07:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bi41sm838167oib.54.2021.08.26.13.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 13:07:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 2/6] x86/amd_nb: Rename PCI_DEVICE_ID_AMD_19H_DF_F3 to
 match specific model
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Clemens Ladisch <clemens@ladisch.de>
Cc:     linux-hwmon@vger.kernel.org,
        Gabriel Craciunescu <nix.or.die@googlemail.com>,
        Wei Huang <wei.huang2@amd.com>
References: <20210826184057.26428-1-mario.limonciello@amd.com>
 <20210826184057.26428-3-mario.limonciello@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <1c357df7-08c4-4126-08c5-af45c1d6dcfc@roeck-us.net>
Date:   Thu, 26 Aug 2021 13:07:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826184057.26428-3-mario.limonciello@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/26/21 11:40 AM, Mario Limonciello wrote:
> Upcoming changes will introduce a different model in family 19h, so rename
> to disambiguate.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   arch/x86/kernel/amd_nb.c | 2 +-
>   drivers/hwmon/k10temp.c  | 2 +-
>   include/linux/pci_ids.h  | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
> index 23dda362dc0f..cf41fd7faad7 100644
> --- a/arch/x86/kernel/amd_nb.c
> +++ b/arch/x86/kernel/amd_nb.c
> @@ -57,7 +57,7 @@ static const struct pci_device_id amd_nb_misc_ids[] = {
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M60H_DF_F3) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F3) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F3) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_DF_F3) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_M01H_DF_F3) },

I'll leave this up to the PCI/x86 maintainers to decide (personally I don't
really care one way or the other), but we already do have more than one
family 19h entry (M50 below), so this rename isn't really necessary.

If the rename is done, it might make sense to rename PCI_DEVICE_ID_AMD_17H_DF_F3
as well for consistency.

Guenter

>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_M50H_DF_F3) },
>   	{}
>   };
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index 1d3c8d319941..9e704338230d 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -493,7 +493,7 @@ static const struct pci_device_id k10temp_id_table[] = {
>   	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M30H_DF_F3) },
>   	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M60H_DF_F3) },
>   	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F3) },
> -	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_DF_F3) },
> +	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M01H_DF_F3) },
>   	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M50H_DF_F3) },
>   	{ PCI_VDEVICE(HYGON, PCI_DEVICE_ID_AMD_17H_DF_F3) },
>   	{}
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index fb1185155394..b2425a1574c7 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -554,7 +554,7 @@
>   #define PCI_DEVICE_ID_AMD_17H_M30H_DF_F3 0x1493
>   #define PCI_DEVICE_ID_AMD_17H_M60H_DF_F3 0x144b
>   #define PCI_DEVICE_ID_AMD_17H_M70H_DF_F3 0x1443
> -#define PCI_DEVICE_ID_AMD_19H_DF_F3	0x1653
> +#define PCI_DEVICE_ID_AMD_19H_M01H_DF_F3 0x1653
>   #define PCI_DEVICE_ID_AMD_19H_M50H_DF_F3 0x166d
>   #define PCI_DEVICE_ID_AMD_CNB17H_F3	0x1703
>   #define PCI_DEVICE_ID_AMD_LANCE		0x2000
> 

