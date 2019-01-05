Return-Path: <SRS0=8Zs/=PN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC886C43387
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Jan 2019 17:43:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A95AF213F2
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Jan 2019 17:43:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5H5NWtX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbfAERnE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Jan 2019 12:43:04 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42958 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbfAERnE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Jan 2019 12:43:04 -0500
Received: by mail-pf1-f195.google.com with SMTP id 64so19787040pfr.9;
        Sat, 05 Jan 2019 09:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Uu4Q4YzxndDcy6Wp8xYTRTGSWykdwfVoM2daBTgUlIU=;
        b=k5H5NWtXL0LFBGCwhP75S9CkCJn2bjtS112UqcwyslF8ANeHJ5Lhcq9zsa2jk7UYTn
         VIfR8qoFGPgaGjpeQ8Bgo8GoBHAQmSKM/OYfYb/axMrMBEknJuCIgGvKwOIgoxeFZ51j
         W4mgklg/5Q2asl73kVyzhsCihO2NCNeJtYrBJgSckKdD6nx0I9wQXojOzi24D5Hdc7D7
         E3sdWU6fcL7qICZrrZiMUxyHxFwiWkKJPh1FgZggBZoa7d6qpLwO6PLroBpO9i9wznjy
         Tj5ZRIxnhnfV/Q3zDy8V0wx9s8+GJA0bh7kJNj5nKHIBGNnaCmHmYxF0qQGPWJ7Ilvqu
         xkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Uu4Q4YzxndDcy6Wp8xYTRTGSWykdwfVoM2daBTgUlIU=;
        b=f/au1V6DO7PVUlDvAamDiwoJaxBuZKX8E1HWWHahIxwdt+QSdWW1pIAWuOJ+4buYCY
         cJXXht8UzpNpWQzPMPmmy1c4zMvlrD+G5cPAh/XXa29iZAW5vhX9lUyJxaYVCuHqco/T
         sHKNotH60ZUioqsgLdEem/Q7JLjcsLyPgHmzVJjeHPAzykb3jvWgOW/1WqfaJbNpL6GW
         3cV/lYPo1bLaJ2P4vE8wUk4eVE0aSZ7yF0pSoI0qInQWbJ1640rBUpdJEyfjJ2vU+f0R
         2oMFlSupgyiT1QRBxT5KK7r6rG9NsKhmdCp76kq/UxGkYmYAxtmn/liC2rNJ8F7PizUk
         dl8w==
X-Gm-Message-State: AA+aEWaOQX1A/0rIsGk6qLmYcjrySu8Lp9i2KfdyJDATlyR+dmxNbJol
        lAubaiAQM5c9BUiVt1sbt5iR/kaG
X-Google-Smtp-Source: AFSGD/V9L3nrC7yb+BMfvDbz8605HR5zvE6+WFr1d5R7dBOB3+8TyiHOYGjK7/BVRE0cUeiF7OKUCw==
X-Received: by 2002:a62:5716:: with SMTP id l22mr58347130pfb.16.1546710183470;
        Sat, 05 Jan 2019 09:43:03 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h74sm117828049pfd.35.2019.01.05.09.43.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Jan 2019 09:43:02 -0800 (PST)
Date:   Sat, 5 Jan 2019 09:43:01 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Chengguang Xu <cgxu519@gmx.com>
Cc:     jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: fix typo in Documentation/hwmon/f71882fg
Message-ID: <20190105174301.GA13667@roeck-us.net>
References: <20190104142722.24824-1-cgxu519@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190104142722.24824-1-cgxu519@gmx.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org
Message-ID: <20190105174301.1MUzl9rNX3vXB3iZ3p33NtI4PIt9k3oaSkMcSNOC2fg@z>

On Fri, Jan 04, 2019 at 10:27:22PM +0800, Chengguang Xu wrote:
> Just fix a typo in Documentation/hwmon/f71882fg.
> 
> Signed-off-by: Chengguang Xu <cgxu519@gmx.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/hwmon/f71882fg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/f71882fg b/Documentation/hwmon/f71882fg
> index de91c0db5846..4c3cb8377d74 100644
> --- a/Documentation/hwmon/f71882fg
> +++ b/Documentation/hwmon/f71882fg
> @@ -94,7 +94,7 @@ Note that the lowest numbered temperature zone trip point corresponds to
>  to the border between the highest and one but highest temperature zones, and
>  vica versa. So the temperature zone trip points 1-4 (or 1-2) go from high temp
>  to low temp! This is how things are implemented in the IC, and the driver
> -mimicks this.
> +mimics this.
>  
>  There are 2 modes to specify the speed of the fan, PWM duty cycle (or DC
>  voltage) mode, where 0-100% duty cycle (0-100% of 12V) is specified. And RPM
