Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D851C43462
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 May 2021 14:52:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72E8E6108D
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 May 2021 14:52:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241811AbhEQOyA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 May 2021 10:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241535AbhEQOv7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 May 2021 10:51:59 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B165CC061200
        for <linux-hwmon@vger.kernel.org>; Mon, 17 May 2021 07:20:11 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id i67so5848944qkc.4
        for <linux-hwmon@vger.kernel.org>; Mon, 17 May 2021 07:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HW15WkCMvZTI1oUQ1bDyCV/g2NOI5i0hfZZ5QUvI5WA=;
        b=mvYf/F3gXeIxWE14SVqiviQ+90JqCpxZI9mqX6DyEYf8Cfl77iXdo/IJncI5Mmr3L9
         fvfcHkv1dlx6J/az3jANFBbunjE7utXWaVfq5q3zeLiIjLFPJUIngR8TVGBCypPZzsCT
         QRQQ5AoTsxTEDEI7nZydSyGK/tO1YC1Yf3DVJBgOa3WbwKSgRz8KuuiDXqPpF+ZUwkHH
         JkutvtuP5dHb7nMPfg9MLeh14HAVBwbGW0mmS2lD+VSqBbz+9p8sb/8xEZohceVgND1E
         mX09SO150qIn0apNzsbl45w8Cot8OTFokAJfMn86Jac7Jc3jxymAN5FS/QhLrkRjNllI
         3P0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HW15WkCMvZTI1oUQ1bDyCV/g2NOI5i0hfZZ5QUvI5WA=;
        b=RdSYoyXpqYT9YjrSeX9PqvWCH6VzwgvKga1FigtP76YTNE+GBukYiKIj2noaGznLvZ
         BXiPPa32KFEeVdxCkvDHkPRKP8y4N9VIVwTwTO5+Gt/OtKsgiicHuAzDTt4zVXffsBui
         3E3nP5ziZzKzPmxuDO0l83G72MxIVQ77UOyHjMskNFFuONI0WEG50PPr2HjYjZKUsltk
         C1hT1c8X5msbVfUPxk/1SvuWTKhaww3fnmMeVZ8RzOKtbbqYrKCRqByjrS+oBoZYOQZo
         1X9k5a2lLjVD48ylizTs2VsmV2SrlN+igVxl6oiqf+eu8Lls0WLbX2KZo01CPAeahead
         V7+w==
X-Gm-Message-State: AOAM532fooj56N29+oRJaDX6z7UKx1xiiENeLq5QhCkxL9mz51BV04e8
        uZzPbDuGsh8Q3uyqxBOxLyrnVbYt+Qg=
X-Google-Smtp-Source: ABdhPJzEmbavln2xzPTCV9Cd0o8YUtjx0iWGvMP8juLxHZ5dHx8AdoT04NTJfATMOgGVQAaLrDMLuQ==
X-Received: by 2002:a37:42c3:: with SMTP id p186mr61483qka.352.1621261210697;
        Mon, 17 May 2021 07:20:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 11sm10692023qkk.31.2021.05.17.07.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 07:20:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/2] x86/amd_nb: add AMD family 19h model 50h PCI ids
To:     David Bartley <andareed@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20210517063913.4015-1-andareed@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <c620a1f7-6f2c-4ec1-161e-47ac6e2b1307@roeck-us.net>
Date:   Mon, 17 May 2021 07:20:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517063913.4015-1-andareed@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/16/21 11:39 PM, David Bartley wrote:
> This is required to support Zen3 APUs in k10temp.
> 
> Signed-off-by: David Bartley <andareed@gmail.com>
> Cc: linux-hwmon@vger.kernel.org

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   arch/x86/kernel/amd_nb.c | 3 +++
>   include/linux/pci_ids.h  | 1 +
>   2 files changed, 4 insertions(+)
> 
> diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
> index 09083094eb57..23dda362dc0f 100644
> --- a/arch/x86/kernel/amd_nb.c
> +++ b/arch/x86/kernel/amd_nb.c
> @@ -25,6 +25,7 @@
>   #define PCI_DEVICE_ID_AMD_17H_M60H_DF_F4 0x144c
>   #define PCI_DEVICE_ID_AMD_17H_M70H_DF_F4 0x1444
>   #define PCI_DEVICE_ID_AMD_19H_DF_F4	0x1654
> +#define PCI_DEVICE_ID_AMD_19H_M50H_DF_F4 0x166e
>   
>   /* Protect the PCI config register pairs used for SMN and DF indirect access. */
>   static DEFINE_MUTEX(smn_mutex);
> @@ -57,6 +58,7 @@ static const struct pci_device_id amd_nb_misc_ids[] = {
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F3) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F3) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_DF_F3) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_M50H_DF_F3) },
>   	{}
>   };
>   
> @@ -72,6 +74,7 @@ static const struct pci_device_id amd_nb_link_ids[] = {
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M60H_DF_F4) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F4) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_DF_F4) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_M50H_DF_F4) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F4) },
>   	{}
>   };
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 4c3fa5293d76..5356ccf1c275 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -555,6 +555,7 @@
>   #define PCI_DEVICE_ID_AMD_17H_M60H_DF_F3 0x144b
>   #define PCI_DEVICE_ID_AMD_17H_M70H_DF_F3 0x1443
>   #define PCI_DEVICE_ID_AMD_19H_DF_F3	0x1653
> +#define PCI_DEVICE_ID_AMD_19H_M50H_DF_F3 0x166d
>   #define PCI_DEVICE_ID_AMD_CNB17H_F3	0x1703
>   #define PCI_DEVICE_ID_AMD_LANCE		0x2000
>   #define PCI_DEVICE_ID_AMD_LANCE_HOME	0x2001
> 

