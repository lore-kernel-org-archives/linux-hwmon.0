Return-Path: <SRS0=dESa=X3=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FF2C352AA
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Oct 2019 13:36:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9AF0721D7B
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Oct 2019 13:36:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uF0bPRzh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbfJBNgZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Oct 2019 09:36:25 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34010 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbfJBNgZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Oct 2019 09:36:25 -0400
Received: by mail-pf1-f193.google.com with SMTP id b128so10356718pfa.1;
        Wed, 02 Oct 2019 06:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NvlA4der8VEmnNF8hhRvmlInmrmtcpBlJIhVCUHL7Ik=;
        b=uF0bPRzhgeXmeZYhI0Zw/miC+j/Gt/TjczdeCmAPuUlas8OKRYwA7st2HmEf70aQ/s
         gnOPfBY/eTQDmk+bz7J8W6NsAROdlu0aCiT2stYS2UhgCK1DI0GVtDsYxinWK1//isu1
         S2eyxNRFeeXP4xHbdMV+GqZ1WuWzKqk3Bvs2wev1g/uTWGnan3FTe77IXfpGsqOAoIBD
         gWXXKdjaeCjywwjkovGd34s+CjuhVYL/QwgCBtxADURWL3VpCwlkvhQQ7WnmFuws/9BD
         IPxDAdRQeujfiwgAoFptEbBChBX+JtYP5vb4Y6Um6AmtoKcYyWDjRWvhG7B8jyutOe7n
         hf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=NvlA4der8VEmnNF8hhRvmlInmrmtcpBlJIhVCUHL7Ik=;
        b=Y9REg63IXy9ap3HDLO9raRnPxrSv4LoqCP6fsWij3O382Aed2Abtm0Ug+FftXjwH48
         ksVQNAYYdzzO1XAPeZiFBmJFYis0J/q0FaSBY5fjytj93YXEkIb5dOXeMYUcFJrFtjsi
         yjBLhtO1ycgBPi0iuW6Z1BfCpqgjZHH6QIBq0Dph4Q87IwMrvN9y73Br6KK6QhLPxKbj
         KVTs0hlt/PbTenUENkQZZcCkayBmAh/oaPIIUs73gXs/ilNSKv60uwQ9b7pqPTYr7/X9
         20r9GqksiOLvjONCeICg9Od48yD/tkykToBtkNaFXtMligW+YhR6FMvS6fVmhprHQHsv
         +R7Q==
X-Gm-Message-State: APjAAAW8Es7FLyZWaD3Atj5lG+oveUbIuskh7SnzjTfcZ2p+sI10Gwmj
        uRFkxbZBEvvx4SVgDlV4q95Rgbd/
X-Google-Smtp-Source: APXvYqyTMG6ZbdhOkTxLEGWf+LUbuMx5pbcNlbhLTlvICs4Vs1OxoYHCoV55mF5kkiLYsSo/c5VSpA==
X-Received: by 2002:a17:90a:9d86:: with SMTP id k6mr4275325pjp.105.1570023384314;
        Wed, 02 Oct 2019 06:36:24 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r28sm22580865pfg.62.2019.10.02.06.36.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2019 06:36:23 -0700 (PDT)
Date:   Wed, 2 Oct 2019 06:36:22 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Lukas Zapletal <lzap+git@redhat.com>
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RESEND] k10temp: update docs and add temp2_input info
Message-ID: <20191002133621.GA18799@roeck-us.net>
References: <20190923105931.27881-1-lzap+git@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923105931.27881-1-lzap+git@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Sep 23, 2019 at 12:59:31PM +0200, Lukas Zapletal wrote:
> It's been a while since the k10temp documentation has been updated.
> There are new CPU families supported as well as Tdie temp was added.
> This patch adds all missing families which I was able to find from git
> history and provides more info about Tctl vs Tdie exported temps.
> 
> Signed-off-by: Lukas Zapletal <lzap+git@redhat.com>

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/k10temp.rst | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/k10temp.rst b/Documentation/hwmon/k10temp.rst
> index 12a86ba17de9..fc9d2a5ad57d 100644
> --- a/Documentation/hwmon/k10temp.rst
> +++ b/Documentation/hwmon/k10temp.rst
> @@ -21,10 +21,16 @@ Supported chips:
>  
>  * AMD Family 14h processors: "Brazos" (C/E/G/Z-Series)
>  
> -* AMD Family 15h processors: "Bulldozer" (FX-Series), "Trinity", "Kaveri", "Carrizo"
> +* AMD Family 15h processors: "Bulldozer" (FX-Series), "Trinity", "Kaveri", "Carrizo", "Stoney Ridge", "Bristol Ridge"
>  
>  * AMD Family 16h processors: "Kabini", "Mullins"
>  
> +* AMD Family 17h processors: "Zen", "Zen 2"
> +
> +* AMD Family 18h processors: "Hygon Dhyana"
> +
> +* AMD Family 19h processors: "Zen 3"
> +
>    Prefix: 'k10temp'
>  
>    Addresses scanned: PCI space
> @@ -110,3 +116,12 @@ The maximum value for Tctl is available in the file temp1_max.
>  If the BIOS has enabled hardware temperature control, the threshold at
>  which the processor will throttle itself to avoid damage is available in
>  temp1_crit and temp1_crit_hyst.
> +
> +On some AMD CPUs, there is a difference between the die temperature (Tdie) and
> +the reported temperature (Tctl). Tdie is the real measured temperature, and
> +Tctl is used for fan control. While Tctl is always available as temp1_input,
> +the driver exports Tdie temperature as temp2_input for those CPUs which support
> +it.
> +
> +Models from 17h family report relative temperature, the driver aims to
> +compensate and report the real temperature.
