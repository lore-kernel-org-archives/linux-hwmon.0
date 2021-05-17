Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F21C43470
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 May 2021 15:04:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23C7561029
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 May 2021 15:04:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241776AbhEQPFm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 May 2021 11:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241110AbhEQPC6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 May 2021 11:02:58 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B51DC0611E1
        for <linux-hwmon@vger.kernel.org>; Mon, 17 May 2021 07:23:42 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id u1so3138199qvg.11
        for <linux-hwmon@vger.kernel.org>; Mon, 17 May 2021 07:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FMvVQsTd8FgrSSqiOf8koQ9n7Eb2Q9wm3WxCXXUK8N0=;
        b=AWjltcQcrLmJZfWIaVXeo5fGTXaA/BSEUkKPn8pK2algtPK0i2TUsp9nX1A5u3mwHm
         9uZmR4oibY1C1upztEXf3FvjhklXc3zFWW+AOL2eppQRJAk2ldOYdpJyeJ7oFtfgrMRq
         IlU0wOQPUmeJlh6F4rcZ8OVmzktQeU01d7krTCI7Vhp2OdvsZ2IN3ymLIFOmYs8TI3i7
         uCtNAZNozyvuK/d6NfUpebEPf92qzUbdetSvpv3azgu4QfNpSrfvRFSE6EvDVj9+SbH2
         TAtu4HWfzh3YV8YDKN1xmEeZNKrouX2gTdTuPF6sJSwOFy/VuRofSkQfy0UY8oXQDUdn
         xGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FMvVQsTd8FgrSSqiOf8koQ9n7Eb2Q9wm3WxCXXUK8N0=;
        b=nlrIg7n3RoKPVTURD0AwRgWDoE7eTaNNLWj7rZuIlNoDJZI30spRiMd0D9CsZrHjlB
         0ggJHGLEokIfqX0atkm2/elkkeb2zoNVYCa7fT5fubq9fcRxgB3vxHWEbmmdl2DvOPV4
         oX4IqPWP6DY+jNkpfmLDo+O5c/k/9985xUSKjJzsuOAzhap7sfvVepBrhPl/O/IDnEw9
         ckzyD6BT3bwVe/V5r2k1bIytxzju35evNDkw+V8BdgnbZGg/Nz6FsqoOggbNMt81LLTD
         sNlUWzY8qJwcisQp5/DbgKI6bWFTNjRVfN044tlEF+QbuKAYlNRzhZDKVDomSyDF/NkI
         E1yw==
X-Gm-Message-State: AOAM532gM+8J4jNfMnyqYv2I26Td65Fw0xXZKaDQymeBwjFf8Bsljzt0
        Sw3cyXGZhwI1GAVJNFmcTccEt0WA1So=
X-Google-Smtp-Source: ABdhPJxdqsw5UWdTcWXbIfVw+3ZvvO0IrPj0bOPnbCnparxQ7ysQmZUWjfyZvMSLbByDU1AZ9iT94Q==
X-Received: by 2002:a0c:f6c4:: with SMTP id d4mr175985qvo.54.1621261421194;
        Mon, 17 May 2021 07:23:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w196sm10498377qkb.90.2021.05.17.07.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 07:23:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 2/2] k10temp: support Zen3 APUs
To:     David Bartley <andareed@gmail.com>, linux-hwmon@vger.kernel.org
References: <20210517064131.4369-1-andareed@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <4c4ec605-ef8d-d722-ce5a-eb7652990816@roeck-us.net>
Date:   Mon, 17 May 2021 07:23:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517064131.4369-1-andareed@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/16/21 11:41 PM, David Bartley wrote:
> Signed-off-by: David Bartley <andareed@gmail.com>

There should still be a description (not just a subject).

Anyway, I'll only be able to take this patch after patch 1/2
is in the tree.

Guenter

> ---
>   drivers/hwmon/k10temp.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index 5ff3669c2b60..fe3d92152e35 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -450,6 +450,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   		switch (boot_cpu_data.x86_model) {
>   		case 0x0 ... 0x1:	/* Zen3 SP3/TR */
>   		case 0x21:		/* Zen3 Ryzen Desktop */
> +		case 0x50:		/* Zen3 Ryzen APU */
>   			k10temp_get_ccd_support(pdev, data, 8);
>   			break;
>   		}
> @@ -491,6 +492,7 @@ static const struct pci_device_id k10temp_id_table[] = {
>   	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M60H_DF_F3) },
>   	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F3) },
>   	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_DF_F3) },
> +	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M50H_DF_F3) },
>   	{ PCI_VDEVICE(HYGON, PCI_DEVICE_ID_AMD_17H_DF_F3) },
>   	{}
>   };
> 

