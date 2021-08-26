Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB6AC432BE
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 19:50:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BED8460F11
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 19:50:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbhHZTvG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Aug 2021 15:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbhHZTvG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Aug 2021 15:51:06 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E9CC061757
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Aug 2021 12:50:18 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id x9-20020a056830278900b0051b8be1192fso5011029otu.7
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Aug 2021 12:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HTs6CXc31UbeRTlA/f72kT0mQeUgQvRtbJfdKUtkek8=;
        b=R+bbAzeMLnUsu9jCas8gkr4jJ2pAdFm7bUhUW7GDkiNE7JkYe2zjhZpHuvgGFi8ZoD
         E6zPAdf8cFtL6RN8llpnqqBF1BnBHwKz9Xxip+7c9SJ0Fs7AwNWS0WstLsVt6L8IWDE4
         2Q7CQR8G/oHjmyJfQ3O2RUsSbBN/G1E3keiwPAYevQTqAzWRMgko6XkKJO+E1y0iuami
         OZsFe+D8oxxDnbpzz1z1DzW7Jck9v8JjkMe5kDrPdZZGNl6/dTpUL3U90JpU6Sr1f8UE
         UzrQAW4QdNafyYnghbG7fFyW1W5Wp15si2ZVwPEr0XC+xnxnf9x2F1K0CShMWH9s+szR
         XN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HTs6CXc31UbeRTlA/f72kT0mQeUgQvRtbJfdKUtkek8=;
        b=YZ+lVDyjLTvKLnwu2jgL+dRysgC5SDKf90syKDWNTfScjbTb+6UOAhtRByLYW7ZleY
         Wn1vsNK1THNneBC8MPXYPJGzsMkw70BC1P1z+z4iMsqGihaZNdTs7tJ2eJ3aVbFR6S0G
         F7BKAfT/iJ/mnDz3cWFOAnG+omoNqud7/KNVCwHabOJiw/vlpkKIw1Tq9RTHWi/Dz4S6
         cMBpSmlbAYka9o0Hs/T6E/pn+fidxsYtqSRUvZumD4dscDC0vXVL5lITZna91x8zgWwW
         nu0VD1xd6RMLA6IJdFjG5Ctbgnx4e1pTKjaLdTLx0wVch5vLtGhThE7xN6c1VRPnArHR
         9F0g==
X-Gm-Message-State: AOAM532PNcDGf+yzs4zbUn0DGBmuVzAQs2nL8HQly1325TtdCjtBihvT
        8/0CRtbd7GKOFuTRB11QM+mHF19EHEs=
X-Google-Smtp-Source: ABdhPJxs5j9cZXZT5rUVoeIToGNDgtKVsO0k/5Bg3iTf6rGiuMRqzgV2IODWGnqabk1WCirJuUfvTw==
X-Received: by 2002:a05:6830:44aa:: with SMTP id r42mr4684228otv.113.1630007418153;
        Thu, 26 Aug 2021 12:50:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s24sm848198oic.34.2021.08.26.12.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 12:50:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 4/6] hwmon: (k10temp): Show errors failing to read
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Clemens Ladisch <clemens@ladisch.de>
Cc:     linux-hwmon@vger.kernel.org,
        Gabriel Craciunescu <nix.or.die@googlemail.com>,
        Wei Huang <wei.huang2@amd.com>
References: <20210826184057.26428-1-mario.limonciello@amd.com>
 <20210826184057.26428-5-mario.limonciello@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <748dd3ab-2659-f4e5-eec2-baed323fd183@roeck-us.net>
Date:   Thu, 26 Aug 2021 12:50:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826184057.26428-5-mario.limonciello@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/26/21 11:40 AM, Mario Limonciello wrote:
> Enabling Yellow Carp in past commit was initially not working "properly"
> because extra IDs were needed, but this wasn't obvious because fail values
> from `amd_smn_read` were ignored.
> If errors are found, show a kernel warning.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/hwmon/k10temp.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index 5c1aebf7a56d..41d9c0c0a1f1 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -164,8 +164,10 @@ static void read_tempreg_nb_f15(struct pci_dev *pdev, u32 *regval)
>   
>   static void read_tempreg_nb_zen(struct pci_dev *pdev, u32 *regval)
>   {
> -	amd_smn_read(amd_pci_dev_to_node_id(pdev),
> +	int ret = amd_smn_read(amd_pci_dev_to_node_id(pdev),
>   		     ZEN_REPORTED_TEMP_CTRL_BASE, regval);
> +	if (ret)
> +		dev_warn(&pdev->dev, "failed to read core temperature: %d\n", ret);
>   }

It would be much better to change the code to return the error to the caller
(and thus to userspace) instead of polluting the kernel log and (presumably)
reporting a random value to userspace.

Guenter

>   
>   static long get_raw_temp(struct k10temp_data *data)
> @@ -212,6 +214,7 @@ static int k10temp_read_temp(struct device *dev, u32 attr, int channel,
>   {
>   	struct k10temp_data *data = dev_get_drvdata(dev);
>   	u32 regval;
> +	int ret;
>   
>   	switch (attr) {
>   	case hwmon_temp_input:
> @@ -227,10 +230,13 @@ static int k10temp_read_temp(struct device *dev, u32 attr, int channel,
>   				*val = 0;
>   			break;
>   		case 2 ... 9:		/* Tccd{1-8} */
> -			amd_smn_read(amd_pci_dev_to_node_id(data->pdev),
> +			ret = amd_smn_read(amd_pci_dev_to_node_id(data->pdev),
>   				     ZEN_CCD_TEMP(data->ccd_offset, channel - 2),
>   						  &regval);
> -			*val = (regval & ZEN_CCD_TEMP_MASK) * 125 - 49000;
> +			if (ret)
> +				dev_warn(dev, "failed to read CCD temperature: %d\n", ret);

This is a static error. Just return the error to userspace, please,
and don't pollute the kernel log.

Guenter

> +			else
> +				*val = (regval & ZEN_CCD_TEMP_MASK) * 125 - 49000;
>   			break;
>   		default:
>   			return -EOPNOTSUPP;
> 

