Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91456C4332F
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Nov 2022 13:51:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiKTNvT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 20 Nov 2022 08:51:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiKTNvS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Nov 2022 08:51:18 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1125727B06
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Nov 2022 05:51:18 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id d13so771663qvj.8
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Nov 2022 05:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1OKmIM3/qxWiF9Pn6sedsjxhhOzOH3z/We+2pbbUOz4=;
        b=GkqNJi6ttUbZykM1/5srhZgWRhdh3L7V6pjhBzgp/m2Z+VqIew/DY2lXPBjN6xnCd5
         xPveatLTvaOzFoaFQq0juOCEJMrA6tM8Po7Wl6CkHWBwbuzA97Ynw00LFMhI7j87fWhl
         KyGwcplKypvmXCodCxFuUUo/ARMi4NV3+vzzTMnQPtQySrVyWjIPMumo/7pyft2f2Ml0
         VvWcDPiswMehfPe5ysW7tn0MZ/FeuyjJFwRTENJd642xvU2gS1UrJBl19L6Nw6FLk0vr
         VsY/df65S9cqbzzuHNWLdUX40payxyN3+rg10COfhHkfMZknGtMAW2h/2p1PcS4axnyO
         wJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OKmIM3/qxWiF9Pn6sedsjxhhOzOH3z/We+2pbbUOz4=;
        b=lofszO2I+NoY94Yic/chKrzfs36jvnFBnnhCclSgKEKUxXXhIztRnRa2BnqXitVwYE
         EFoSCyKeVKQPUSetI34KYIJ592UEpOdrmETMz+Znmtwk3fH2A5vK0f9lYUwXTmONmFMk
         5HKj1/JI2cLGbbKSUG4Ut0ic+TAvOd1PeGdTwaE6+bkwR2CGqNhWmCDLqqoxhk4inIPX
         TiNPdYz5ig26CIZvI2Rqn7dqotHD5/T985uRtZjhnzFQTn7Pr5BK/O0q04cVXvHPp1wc
         bPfbzMcxPYB7rgvq+k89XvCFFu9Fpooc0e12yxByEE8Wqsu9rY5g8RG8vwE/7h9tCOYk
         Xlkw==
X-Gm-Message-State: ANoB5pmV+1BK98WTpAKzxEossezTA4s3JXibK+xpdWiKjO0DT1wULqeX
        KveeqJe2IIUcRqV4CZthxu7HqRg3zoI=
X-Google-Smtp-Source: AA0mqf41X7Xq/k9V6eTtvyGziTjcC2YoNjIAZIKSlS8X/RhT2j6fDCvxOgpMdhk7hBlh1I5Uhe3N3g==
X-Received: by 2002:a05:6214:5f86:b0:4c6:141f:819d with SMTP id ls6-20020a0562145f8600b004c6141f819dmr3357638qvb.34.1668952277222;
        Sun, 20 Nov 2022 05:51:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ge11-20020a05622a5c8b00b00342f8d4d0basm5276097qtb.43.2022.11.20.05.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:51:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 20 Nov 2022 05:51:15 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     fenghua.yu@intel.com, linux-hwmon@vger.kernel.org,
        jdelvare@suse.com
Subject: Re: [PATCH] hwmon: (coretemp) fix pci device refcount leak in
 nv1a_ram_new()
Message-ID: <20221120135115.GA1787592@roeck-us.net>
References: <20221118093303.214163-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118093303.214163-1-yangyingliang@huawei.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Nov 18, 2022 at 05:33:03PM +0800, Yang Yingliang wrote:
> As comment of pci_get_domain_bus_and_slot() says, it returns
> a pci device with refcount increment, when finish using it,
> the caller must decrement the reference count by calling
> pci_dev_put(). So call it after using to avoid refcount leak.
> 
> Fixes: 14513ee696a0 ("hwmon: (coretemp) Use PCI host bridge ID to identify CPU if necessary")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/coretemp.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> index 8bf32c6c85d9..84a980fa0671 100644
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@ -242,10 +242,13 @@ static int adjust_tjmax(struct cpuinfo_x86 *c, u32 id, struct device *dev)
>  	 */
>  	if (host_bridge && host_bridge->vendor == PCI_VENDOR_ID_INTEL) {
>  		for (i = 0; i < ARRAY_SIZE(tjmax_pci_table); i++) {
> -			if (host_bridge->device == tjmax_pci_table[i].device)
> +			if (host_bridge->device == tjmax_pci_table[i].device) {
> +				pci_dev_put(host_bridge);
>  				return tjmax_pci_table[i].tjmax;
> +			}
>  		}
>  	}
> +	pci_dev_put(host_bridge);
>  
>  	for (i = 0; i < ARRAY_SIZE(tjmax_table); i++) {
>  		if (strstr(c->x86_model_id, tjmax_table[i].id))
