Return-Path: <SRS0=h57g=XQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EB9C49ED7
	for <linux-hwmon@archiver.kernel.org>; Sat, 21 Sep 2019 11:57:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05C14208C0
	for <linux-hwmon@archiver.kernel.org>; Sat, 21 Sep 2019 11:57:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSfK52rw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405784AbfIUL5z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 21 Sep 2019 07:57:55 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39462 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405770AbfIUL5z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Sep 2019 07:57:55 -0400
Received: by mail-pf1-f196.google.com with SMTP id v4so1664345pff.6;
        Sat, 21 Sep 2019 04:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PKxsHDFmHPsQxmc4wfV//rWUve8tGbS0odSr9dmfP5c=;
        b=kSfK52rw8/suJVsRKOQZy1DHh+NxMk0TKwGnclJ0AYiGTX4rbMAHUL8Wjalb5Gznh2
         8iw1j4ZMP2KIeds/PazetJOzrK3I/aA5KjCwn1FWHxvogyYTyfTOuSZcZ4yGqNmyxUf1
         I2il2nNA7d5QDksk9JKk528thNOFj0UB6FkiUpqMT4dAz1loLlYVYWHr9vvOdTqibddg
         pYjW89srxfeLTI5l6SHzDs6iJ1Mv23HVDRKXsIVt4fxGFolBeHlQCPsMY2SZ8BVRhKEP
         5/YeaKOpKg2PVh7NGyMS4GmUY3VG87JHJu+CSpvC7xnCK8W/tpPKdRKTVb8pLIGF0LJO
         qnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=PKxsHDFmHPsQxmc4wfV//rWUve8tGbS0odSr9dmfP5c=;
        b=FcPRCvSHzm4nhqN6wO/xkCbVTex1xQNIuTDRSV8r0VT/7jMYK19p1dRZ+5xBYcKL4h
         nJqw0Ue1RnDHXmWhSk4ye3u+ff3zzUcV7hucdBiY4U3eIUTNzelUV482gf81h4oLUioI
         lVPyU3t0NQZnHF9OXTcov7UHx407uo5A07u0S67uqy+d4imxEpe8lNryP7ELpqdgZSGn
         4vHcuQg5EEU3EcPn1sjv5UU6tHQ1b+zn03tBNn4Fczfe+IJAcU95sj1B+n+8Ob8NKOYn
         5VxcQd6XLC5RiPFVWiqYsvb7sTKFB0HDzGQskfA6VsjqQXKZWqDPqNo5rEebHqWHR7fZ
         4FgA==
X-Gm-Message-State: APjAAAU3N/FGdNsCg1+a3TRPnasmNREkHLj46KxgMeBhUDkDfCoVwpyu
        oXVeNZMqjVBGfRtsuqJb3lc=
X-Google-Smtp-Source: APXvYqwkE737dDrUJVxTyTpx8nDPqxdBZIurIxHSyY6FScmj9KYFwetcQl4Td8KoKdWcVdhLrUAXyA==
X-Received: by 2002:a62:3147:: with SMTP id x68mr22576597pfx.129.1569067074822;
        Sat, 21 Sep 2019 04:57:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v43sm26863328pjb.1.2019.09.21.04.57.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Sep 2019 04:57:53 -0700 (PDT)
Date:   Sat, 21 Sep 2019 04:57:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Lukas Zapletal <lzap@redhat.com>
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        Clemens Ladisch <clemens@ladisch.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] k10temp: update documentation
Message-ID: <20190921115752.GA22647@roeck-us.net>
References: <CAP80Qm2ORJ4cXukhH8oXeGv-C9LrADa1XyDuyq5LKeV_YaYxqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP80Qm2ORJ4cXukhH8oXeGv-C9LrADa1XyDuyq5LKeV_YaYxqA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 19, 2019 at 11:25:03AM +0200, Lukas Zapletal wrote:
> It's been a while since the k10temp documentation has been updated.
> There are new CPU families supported as well as Tdie temp was added.
> This patch adds all missing families which I was able to find from git
> history and provides more info about Tctl vs Tdie exported temps.
> 
> Signed-off-by: Lukas Zapletal <lzap+git@redhat.com>

Your patch does not apply to the curent mainline kernel.
What is the parent branch ?

> ---
>  Documentation/hwmon/k10temp.rst | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> 
>    Addresses scanned: PCI space
> @@ -110,3 +116,12 @@ The maximum value for Tctl is available in the
> file temp1_max.
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
> 
> diff --git a/Documentation/hwmon/k10temp.rst b/Documentation/hwmon/k10temp.rst
> index 12a86ba17de9..bb2d0a02dc45 100644
> --- a/Documentation/hwmon/k10temp.rst
> +++ b/Documentation/hwmon/k10temp.rst
> @@ -1,7 +1,7 @@
>  Kernel driver k10temp
>  =====================
> 
> -Supported chips:
> +Although the driver is named k10temp, it supports wide range of AMD CPUs:

The above does not add any value. Many drivers support more than one chip,
but are named after the first supported chip. Please drop this change.

Guenter

> 
>  * AMD Family 10h processors:
> 
> @@ -21,10 +21,16 @@ Supported chips:
> 
>  * AMD Family 14h processors: "Brazos" (C/E/G/Z-Series)
> 
> -* AMD Family 15h processors: "Bulldozer" (FX-Series), "Trinity",
> "Kaveri", "Carrizo"
> +* AMD Family 15h processors: "Bulldozer" (FX-Series), "Trinity",
> "Kaveri", "Carrizo", "Stoney Ridge", "Bristol Ridge"
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
