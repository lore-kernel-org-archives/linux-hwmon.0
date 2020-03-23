Return-Path: <SRS0=TjI3=5I=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF7FC3F2CD
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Mar 2020 16:32:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89E7720719
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Mar 2020 16:32:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ush4roZW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbgCWQcs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Mar 2020 12:32:48 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36070 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727408AbgCWQcs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Mar 2020 12:32:48 -0400
Received: by mail-pf1-f194.google.com with SMTP id i13so7744466pfe.3
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2020 09:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ewa+UVlluObxqJtraKc9Ll2PFkuF884hHebN9qEvK6o=;
        b=ush4roZWH2phefV5nLI7z0+nhE1gpSV6iCNXYqF4apsH1TwE5/yRuu9qVyTNXd/pgq
         tA7tSH7EWqT5W7hiNRNbQ0RHmzaoaUfFa3ZqfrlyS4JCHRf2QASOVmcSmVlWcMa0O0yi
         rXP67jPKon9migavHbQ/XBcl1jIa7bR+jycB2gmBC4MRoO0UGvAFMRrT7vjfm/tyu0/X
         xJwcjkB31e0vErDfMK1KmpyDBei/TZf/x5+tJ9d5mVxH9Juz6xC0eweDCdXODfI3fLMq
         cNG0vSLgV9isUSlXdB4UtI7bmcUQlfGuESN75Paa6ptCsPXMD4SCElKjYK7rgcgFHoN4
         AoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ewa+UVlluObxqJtraKc9Ll2PFkuF884hHebN9qEvK6o=;
        b=pnCFF+d1HM64sTc9TCs+4Gp5gA+ntr0bXXF1AUj1+DiifpJ7dLGh6FsDid864L4s9F
         ILkJit6DPdIatxZInnhpDKlnevQGcdBWKC7oq6S5jBUiwZHPPCcqxntkvZ+pEy73uThY
         C0szEt85qZ73H6I4SQdg/3JXz3pbGaygAvh+baHB8jz22YD2f9sjEaQBH8ql4G3jYaP3
         JpDYxNJfJCkPsjTAs2sdLQAvUevGViXV/XXLUVWNY0U8xpEeqkzt3oVxdIHqtIIzw2Gl
         +whI5D72NqBYOEbu5xCbjBqgbq/Kmknr0aR9CmZhTwX82PmhFyFyThZFqNy9IUGtuQrR
         Ok2Q==
X-Gm-Message-State: ANhLgQ3xMjEMYqz+EaTqucib50wI7rn9bQCltwGWhzehHxcuPGCjipy/
        3mXW+xSjhb68zgZ4Bgfa8Llw3U8w
X-Google-Smtp-Source: ADFU+vvRAKRmyeCyThlHWd+pFY1ZpptTIFbhmqvLVosgWPP8nFNaUuubyKYFLaMPX8RYVJ+OZn/pWw==
X-Received: by 2002:a62:194c:: with SMTP id 73mr25259882pfz.159.1584981166737;
        Mon, 23 Mar 2020 09:32:46 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id mm18sm49067pjb.39.2020.03.23.09.32.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 09:32:45 -0700 (PDT)
Date:   Mon, 23 Mar 2020 09:32:43 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mike Pagano <mpagano@gentoo.org>
Cc:     linux-hwmon@vger.kernel.org, etremblay@distech-controls.com
Subject: Re: [RESUBMIT PATCH 1/1] hwmon: (tmp513) Fix build issue by
 selecting CONFIG_REGMAP_I2C
Message-ID: <20200323163243.GA11913@roeck-us.net>
References: <3218661.LZWGnKmheA@crow>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3218661.LZWGnKmheA@crow>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Mar 23, 2020 at 10:50:18AM -0400, Mike Pagano wrote:
> Thanks for the review, Guenter.
> ---

Please have a look into Documentation/process/submitting-patches.rst.

This is not a resubmit, and above comments should come after ---,
not before it. On top of that, it is corrupted (tabs replaced with
spaces).

Guenter

> 
> This driver requires REGMAP_I2C to build.  Select it by default in Kconfig. 
> Reported at gentoo bugzilla: https://bugs.gentoo.org/710790
> 
> Reported-by: Phil Stracchino <phils@caerllewys.net>
> Signed-off-by: Mike Pagano <mpagano@gentoo.org>
> ---
>  drivers/hwmon/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 47ac20aee06f..530b4f29ba85 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1769,6 +1769,7 @@ config SENSORS_TMP421
>  config SENSORS_TMP513
>   tristate "Texas Instruments TMP513 and compatibles"
>   depends on I2C
> + select REGMAP_I2C
>   help
>     If you say yes here you get support for Texas Instruments TMP512,
>     and TMP513 temperature and power supply sensor chips.
> -- 
> 2.24.1
> 
> 
