Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470E4C4332F
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Nov 2022 23:19:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbiKNXTc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 14 Nov 2022 18:19:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237458AbiKNXT3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Nov 2022 18:19:29 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44D4010EF
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Nov 2022 15:19:27 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so15256035pjc.3
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Nov 2022 15:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adWvKq87fdpR7L3JTRCobRxjfuDZYYorZeGomiZLpE8=;
        b=LKESXz3OVQWe1tXiTTZPuJjGyY38d35zm4kS1ILnekWjR4Exdz+DiC47Bo4vC2slT+
         oYqpnA75ECtiFfAoyx6BsVSaAQGP/oc+9wsKXY/tER8azDupb6vztAOXX3vKi/3nYqDg
         hMfJO3w1NY0YUfaRbhdGGkdHKixTr+cnxn8+IVQ4bjHkUd1PBn8xny08yD2SxC4TTdpC
         8SDccNwK8TECq/S4YgeWtbuMPF8Ff3fNbc1/vWH9BhJQ9Go/hzJ9IpI5A8Vqgverk3Ji
         cUlaXCtlHu3k0hvVdMIa43otEh5ptb0py/5YzldISrSim2dfcsPGFU7RhRbKeosbFGZx
         WFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adWvKq87fdpR7L3JTRCobRxjfuDZYYorZeGomiZLpE8=;
        b=cZwGp5T4zRwXRuwOiuYhhKq/utTsVamyzPneuXHFBDwCXIdtXjVAH1AcXsCEI/Y0fe
         cGsIT///tn/GRyO+VGqkyOKIHOX0Ky0rJClecCg8xBXNfUDO8YMrwIhcqh15EB+JSV1r
         zqNNtwvTFgfptN0kneGQH55qResAZD+bvSw4gqqgQjGTsDJWb/d1N0cNw9GXHqV7T/tl
         DPkmORPuAKgJbwX+RzEZhnkizOYT5hHx95saHRZ5bA3O0FfWOYq0ey9UcVY3sGlNmd34
         eRbqXVFiBsr8WJc/XMtnYK5Fk0qpf1psmEyaKWkaK9w47iPVACpPvBGVJPE8kg7xbbWw
         WBLw==
X-Gm-Message-State: ANoB5pkJXw9OtxtRTqa+DSENzN+OmDIDDF/Huk6wmfkHO37VDvL07eNy
        xG7x6/PIeij9M/44hiI77Hg=
X-Google-Smtp-Source: AA0mqf6mEe9Pf9AH4j2kwirtjon5COK0+3iHrY52LAA2tmdEDVKSET7bxTnmoHbAE+34OZvGEPevcQ==
X-Received: by 2002:a17:90a:b292:b0:214:1804:d96b with SMTP id c18-20020a17090ab29200b002141804d96bmr15482558pjr.90.1668467966810;
        Mon, 14 Nov 2022 15:19:26 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p7-20020a625b07000000b0056bb36c047asm7290849pfb.105.2022.11.14.15.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 15:19:26 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 14 Nov 2022 15:19:24 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH] hwmon: (i5500_temp): fix missing pci_disable_device()
Message-ID: <20221114231924.GA2289442@roeck-us.net>
References: <20221112125606.3751430-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221112125606.3751430-1-yangyingliang@huawei.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Nov 12, 2022 at 08:56:06PM +0800, Yang Yingliang wrote:
> pci_disable_device() need be called while module exiting, switch to use
> pcim_enable(), pci_disable_device() will be called in pcim_release().
> 
> Fixes: ada072816be1 ("hwmon: (i5500_temp) New driver for the Intel 5500/5520/X58 chipsets")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/i5500_temp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/i5500_temp.c b/drivers/hwmon/i5500_temp.c
> index 05f68e9c9477..23b9f94fe0a9 100644
> --- a/drivers/hwmon/i5500_temp.c
> +++ b/drivers/hwmon/i5500_temp.c
> @@ -117,7 +117,7 @@ static int i5500_temp_probe(struct pci_dev *pdev,
>  	u32 tstimer;
>  	s8 tsfsc;
>  
> -	err = pci_enable_device(pdev);
> +	err = pcim_enable_device(pdev);
>  	if (err) {
>  		dev_err(&pdev->dev, "Failed to enable device\n");
>  		return err;
