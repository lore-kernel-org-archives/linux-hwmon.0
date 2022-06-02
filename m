Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA88EC43334
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Jun 2022 21:06:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239376AbiFBVGx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 2 Jun 2022 17:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239387AbiFBVGp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 2 Jun 2022 17:06:45 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B86295;
        Thu,  2 Jun 2022 14:06:43 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id h188so8100389oia.2;
        Thu, 02 Jun 2022 14:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OGSS4G6T8b5UIlfhMWIfGXfCz9uQ6RG4EIQoIbsWDas=;
        b=UhFI4nFoVExnfnlE6PsDSJEZcUSIRuTuQojKDzy9FRSa55pir8otx0BYW5ceKFCN/D
         X4inbeUHIguOsJkaF/xWqO+4dZc4VTIoq/GPfypz5bAbhlV6jNedAlVcQqXWfPU0SSrd
         LhhOCFm16PSsZPPhlKKfSvzNV8ATZv1kVU4jrjOYnrBxLohEd33yaQyfgB7+we8xXXxG
         l4jfLCSu0FGy99/alUOUqpRXMGyPiHy1+xmC/uykaUCsld0ddXU8+WcwHO8y3F0T2gnP
         XBP3Ezr5JtnaPE9/jhZyalS2ohW/L4narLxknyaSc9ZNDkPtfaXoAOeZHQxhN9SG7odC
         6a7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OGSS4G6T8b5UIlfhMWIfGXfCz9uQ6RG4EIQoIbsWDas=;
        b=ZtKckneLTt7B4yWpVTwqmwY5mei2wGmZfZ8GwLVDVoNarmAJ887wk7IaJmv8uHe2Q4
         kvOdx4E5+djUfrECcqXAjnZqjSxInMVryKrM52DSQjxRqAEF2XBWhUJLV29sG6bF8SxF
         GgZswHoWgG/uTo7qea/Bgg6tbxxLICC0vji6uftwwlT2KLbTkgxf1znOiHRF06fTRHBc
         Y4Pfm4PIpF62jHxQLZcrau4TMsf5yk1/aA7v8qDezXkusgI+9ZOyDVpzhWhvptl0NKCZ
         RBW1UQ43KSoyYCb1lFjwTR8I14t6140+BUS/g3QDV88Wpfxw3fgak2rbec/yQx4U4Oi1
         qQEw==
X-Gm-Message-State: AOAM533nsItp1LiSFL6Dz+PR8TY1lpLjkQbf+Fp9rw8y5+z6Qs+jmwa2
        BUcCy1oSt+jT+QT/pzMX5tO5FpGXQFw=
X-Google-Smtp-Source: ABdhPJwjiWYzs5Hb9OuYBV6T8eEGDuk6TSJfy6h0kHYIi1YrDt3W+wx56tdtap7ICLgRgEU/gLLDcw==
X-Received: by 2002:a05:6808:e8b:b0:322:4c21:6ba3 with SMTP id k11-20020a0568080e8b00b003224c216ba3mr18634531oil.204.1654204002946;
        Thu, 02 Jun 2022 14:06:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id pu7-20020a0568709e8700b000f5e33aaa66sm2521656oab.0.2022.06.02.14.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 14:06:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2195b07f-9f1b-c59f-c4c1-7d12c64fe0a0@roeck-us.net>
Date:   Thu, 2 Jun 2022 14:06:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 6/6] hwmon: (k10temp): Add support for family 19h
 models 60h-6Fh
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        "open list:K10TEMP HARDWARE MONITORING DRIVER" 
        <linux-hwmon@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Cc:     babu.moger@amd.com, yazen.ghannam@amd.com, x86@kernel.org
References: <20220602201137.1415-1-mario.limonciello@amd.com>
 <20220602201137.1415-7-mario.limonciello@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220602201137.1415-7-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/2/22 13:11, Mario Limonciello wrote:
> Add the support for CCD offsets used on family 19h models 60h-6Fh.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/hwmon/k10temp.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index 5f37e2e7833e..5a9d47a229e4 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -449,6 +449,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   			data->ccd_offset = 0x300;
>   			k10temp_get_ccd_support(pdev, data, 8);
>   			break;
> +		case 0x60 ... 0x6f:
>   		case 0x70 ... 0x7f:
>   			data->ccd_offset = 0x308;
>   			k10temp_get_ccd_support(pdev, data, 8);
> @@ -502,6 +503,7 @@ static const struct pci_device_id k10temp_id_table[] = {
>   	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M10H_DF_F3) },
>   	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M40H_DF_F3) },
>   	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M50H_DF_F3) },
> +	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M60H_DF_F3) },
>   	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M70H_DF_F3) },
>   	{ PCI_VDEVICE(HYGON, PCI_DEVICE_ID_AMD_17H_DF_F3) },
>   	{}

