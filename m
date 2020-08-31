Return-Path: <SRS0=8ZHx=CJ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91B0C433E2
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Aug 2020 14:31:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B328020767
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Aug 2020 14:31:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZS45UVYS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgHaObP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 Aug 2020 10:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgHaObO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Aug 2020 10:31:14 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DADB6C061573;
        Mon, 31 Aug 2020 07:31:14 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id n3so73013pjq.1;
        Mon, 31 Aug 2020 07:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3iYwaau/E02Yl4SUD432ID8c60UPLzH/EAniF7efX00=;
        b=ZS45UVYS53O8vNWpag80zDeHI2jSC4YBs4R9uUNsXZdplX6y2cIwFk8XBTS14ChK7X
         GcVJEMtEb3DRjEXKGn4T/67aiH8joKBjlxzTXuftxkYk+M34N/7iVBOEnNGFjE+0mdtv
         eKXle3G0DMbVR//3Eh9MumsGoH2BIPGr59mFJ9d3P4clR0hiinqPXv+cE8GfEah+SIy/
         h1uRUmY5umWEK2X1RqtI3Av0JptwXUzUyD2VwPJDQKduL0/PkBqxGUj1k55KuvWdrtav
         vZ5cR3g/mfxOKObSRbTWaOXhpvVrP4TGnEUnsyMzn65wSNHr65BBYtNMEca9Vqw7dLUm
         IOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=3iYwaau/E02Yl4SUD432ID8c60UPLzH/EAniF7efX00=;
        b=NZOT7N2UHDmaT0Va1oYqPgkcSSUiu5vyqujy8RTKminGGVZW7AxDj+k7wg9Eo2Tw6x
         /jPXRFp2tOvnpFtBxgvbNcy6XOB7droaGm2S6P8MuvmCXZBRG+1g/ajgvWhKSgLCCvHr
         +frnBQrfK/nPGGNaalt8La9eAgIvaqSHgzqkGgoIk9aKiUmxsFdf0vqxcKVbkcusFaZU
         p0D9gtGrEtVutK+hnVPVxi8tCyw6tS5Y46iUGWhGPTmuSHiR40zCV7VBWtlSBbqE4qtz
         BqhyQUVHnOzRCKIhbSQiJUa+QClskTQmSSuRIHug3/3u48k4zU4akMkFQPdXYgE4yfmg
         LMjw==
X-Gm-Message-State: AOAM533WnYkj0qAEwziOsVdNemvc1GEoxYLrRksVpzaR3dKU59BADJzs
        jG7ktBmS9k561AOFq4H4f18=
X-Google-Smtp-Source: ABdhPJxxtULCL3yBX9bnCXc0lDQK99o7ABrSuhgdh5repIVNE/Ffoc2zt2mcE2pOB+Rb3f0iu5ZYUQ==
X-Received: by 2002:a17:90a:d712:: with SMTP id y18mr1594572pju.79.1598884274057;
        Mon, 31 Aug 2020 07:31:14 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id kb3sm7183877pjb.41.2020.08.31.07.31.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Aug 2020 07:31:13 -0700 (PDT)
Date:   Mon, 31 Aug 2020 07:31:12 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: replace impossible fallthroughs with breaks
Message-ID: <20200831143112.GA70762@roeck-us.net>
References: <20200831113958.GB514373@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200831113958.GB514373@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Aug 31, 2020 at 02:39:58PM +0300, Dan Carpenter wrote:
> It's impossible to reach these fall through statements because all
> the possible values are handled.  In that situation it's cleaner to
> use a break statement instead of a fall through statement.
> 

Makes sense. Applied.

Thanks,
Guenter

> Fixes: c947e51cf803 ("hwmon: (adt7462) Mark expected switch fall-throughs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/hwmon/adt7462.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/adt7462.c b/drivers/hwmon/adt7462.c
> index e75bbd87ad09..634a44591c7f 100644
> --- a/drivers/hwmon/adt7462.c
> +++ b/drivers/hwmon/adt7462.c
> @@ -435,7 +435,7 @@ static const char *voltage_label(struct adt7462_data *data, int which)
>  		case 3:
>  			return "+1.5V";
>  		}
> -		fallthrough;
> +		break;
>  	case 2:
>  		if (!(data->pin_cfg[1] & ADT7462_PIN22_INPUT))
>  			return "+12V3";
> @@ -493,7 +493,7 @@ static const char *voltage_label(struct adt7462_data *data, int which)
>  		case 3:
>  			return "+1.5";
>  		}
> -		fallthrough;
> +		break;
>  	case 11:
>  		if (data->pin_cfg[3] >> ADT7462_PIN28_SHIFT ==
>  					ADT7462_PIN28_VOLT &&
> @@ -531,7 +531,7 @@ static int voltage_multiplier(struct adt7462_data *data, int which)
>  		case 3:
>  			return 7800;
>  		}
> -		fallthrough;
> +		break;
>  	case 2:
>  		if (!(data->pin_cfg[1] & ADT7462_PIN22_INPUT))
>  			return 62500;
> @@ -589,7 +589,7 @@ static int voltage_multiplier(struct adt7462_data *data, int which)
>  		case 3:
>  			return 7800;
>  		}
> -		fallthrough;
> +		break;
>  	case 11:
>  	case 12:
>  		if (data->pin_cfg[3] >> ADT7462_PIN28_SHIFT ==
