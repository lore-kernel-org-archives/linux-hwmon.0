Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F34C54E94
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Jan 2023 13:42:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbjAZNml (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Jan 2023 08:42:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbjAZNme (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Jan 2023 08:42:34 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056AC6DFCF
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Jan 2023 05:42:20 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id g2-20020a9d6b02000000b006864bf5e658so822258otp.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Jan 2023 05:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSoUHfXuxe1W2bOeVlD6ow0P7LAhGZq3wVFIg9dcw4w=;
        b=Rb5i6bGYwiiUbvqZfgWcB2JEHBVc9u3u1BQ/NzsBcDEykVtNnUobCmDp0e4QF4cVl4
         XoMjg2YkBNuElLRN1q/hVXBLRG209ycsBIBBw1Q9hfPafI+bmW5cHlngg1Z0K/PICuMK
         Iak9BGIgC6wVrFnGgls/+F8VhamDyhxSzgOHR9JV+55xJamvhv5fi2hwpVlgh0a0/zWB
         N4qANVCp9N8zhvLBvaoL/EKaIYetUuQWEQ4CikjYu04FI8a6vr3MltawV2ATBw8ZeLpk
         30ZUQ1c2J9RDkWGPIfSjpU2guMX4YKyLNVLtaPX59ZfPKvEDETcHEuhDKtMxBpNASfZ3
         YIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSoUHfXuxe1W2bOeVlD6ow0P7LAhGZq3wVFIg9dcw4w=;
        b=pSbOpNFWgfpaXwpXancsaCfrQlI5dZO+tjNroSO33+SlJxjf2N3aydKvWhBCvivr/t
         vd/v88Qp6llwSvDT8Jv8nKJcvfs938zbdHCkNF+q36dUcYhte1Z9kW8lpPfATbsDbwMG
         YXUrp8nHS9niT3Yk6rs4ApBY9UQ5WmqzZG1vdt9p6tmsXa7zPT1sVKuRPj7MWHbTZWnT
         shrTzEzdNbLjpT1d5T8KiTPDl51XZqSCk38KJ5v4F/Oe90YnCDJm5goZjDrb7nIU2uij
         +f2su9bxbCAqigvTaAXXBzq5/idiHrBVAcs4X+SzsLkZOB65NwJPBgUNfj0XTYgv5ALk
         Mhyg==
X-Gm-Message-State: AFqh2kohbPm9moY9j+k1CrM5dz6VL30UxQnY87PVslpZgze7toxruYkM
        t40UseksRdxIOuL+HIjHX+jhD/rS9ws=
X-Google-Smtp-Source: AMrXdXvSfMi7bbV8AO5t0IKPBDRJNmbRBRh7OjunjJ6AEWrGBBAP3yTKykbDzKYfiXqC8Xn/oNtqfA==
X-Received: by 2002:a05:6830:3361:b0:684:42a:b3f3 with SMTP id l33-20020a056830336100b00684042ab3f3mr17150329ott.2.1674740539263;
        Thu, 26 Jan 2023 05:42:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bf15-20020a056808190f00b0036508145326sm414470oib.9.2023.01.26.05.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 05:42:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 26 Jan 2023 05:42:16 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 2/7] hwmon: (it87) Disable configuration exit for
 certain chips
Message-ID: <20230126134216.GA1634570@roeck-us.net>
References: <20230126040223.986189-1-frank@crawford.emu.id.au>
 <20230126040223.986189-3-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126040223.986189-3-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jan 26, 2023 at 03:02:18PM +1100, Frank Crawford wrote:
> IT8790E and IT8792E/IT8795E have been identified as chips that can have
> issues when disabling configuration mode.
> 
> Set to never exit configuration mode.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> ---
>  drivers/hwmon/it87.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 7049e81f5af1..c5e46b94f0b8 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -2453,6 +2453,13 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>  		break;
>  	case IT8792E_DEVID:
>  		sio_data->type = it8792;
> +		/*
> +		 * Disabling configuration mode on IT8792E can result in system
> +		 * hang-ups and access failures to the Super-IO chip at the
> +		 * second SIO address. Never exit configuration mode on this
> +		 * chip to avoid the problem.
> +		 */
> +		doexit = false;

Why not just use a feature flag ?

Guenter

>  		break;
>  	case IT8771E_DEVID:
>  		sio_data->type = it8771;
> @@ -2474,6 +2481,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>  		break;
>  	case IT8790E_DEVID:
>  		sio_data->type = it8790;
> +		doexit = false;	/* See IT8792E comment above */
>  		break;
>  	case IT8603E_DEVID:
>  	case IT8623E_DEVID:
> -- 
> 2.39.1
> 
