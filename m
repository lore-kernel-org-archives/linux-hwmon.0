Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF7EC001DC
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jul 2023 16:11:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjGOQLu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jul 2023 12:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjGOQLt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jul 2023 12:11:49 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC6A2D51
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 09:11:49 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-666ecb21f86so3031840b3a.3
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 09:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689437508; x=1692029508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6A8p5WORrJEWSbeHsgNyx9iAjwqG07xIpFJ7h3Kxcc=;
        b=NkLG6iI5q30npbll1DgIHv2JdpWklCWvEVZgIZbqHLM9NjlTlC2z184ow4hkMjF33Y
         Kik2cMRmF7Kp1zm5gUsuQlOfxJCXkHfC0VKgRVifSAKPPV+xSOP4PNl9PIJsXfoLD+Rt
         rf5y7TceJcJeO0t+gJwuEDXWMjlHf2uVxCqyBtpJcJ8evHE4nXpO0/ytU9n8D7mMu7VC
         1C8UZc3C+eJLH1ydKHlJGi4/Af9StVEWoU4mJsnkrSyJuiUTia3ahU5T706uqERCHumW
         ljb1v2pgjB/6A2s9WDZmPAjZ5hcXM7pod+jYEQ0gA+kDD4Rk63e630Woc09lA7BMLxPJ
         thnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689437508; x=1692029508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6A8p5WORrJEWSbeHsgNyx9iAjwqG07xIpFJ7h3Kxcc=;
        b=gCSQjVB3PhEOIAC4A8FyIFvo1RMbnggMwdfCt7/4oGzQUedF9NxqBAeiXt7budNVK5
         Y1k2VFvhNCG89UZmtdZF1bk2Dz2EpnZmbmeSrP7Sna6i70V6x7O3v1L3SKmKxTR7NVzY
         ebuAAH6K0M+vx7WhSD1l8xWhEBBNRaQZK8O1IXVD8uYUse49nzAJUkeCYbB64/K8+faT
         A+1kNWlhEGSHvFf314RrF1SXwbSFYK/ipbKwoLG67Ek0ptXL+JHgbsgZwLzg4NZfCD/g
         fna7s6r3U5TnKzhkQ7Zxv29AwNZjWzALyqzHOIlgZhFyEgywn/2Rb0YMYmiI7c6u3axl
         wi1g==
X-Gm-Message-State: ABy/qLamY0IGveuPio0MlKKUWMhyoaPdR5iUaeC7/5R74SVy8pdzZjzo
        KTpJMLc1A0d+nRoN+sqO3/bTI+Jpx4I=
X-Google-Smtp-Source: APBJJlHF+40EdiQiOULQzAEUJ2GygJjpqXzwHr7/rxTvZJh5NXnsS28rNxHcYSLh/BTDTNAu5e7gUQ==
X-Received: by 2002:a05:6a00:1394:b0:675:8f71:290a with SMTP id t20-20020a056a00139400b006758f71290amr10600500pfg.34.1689437508520;
        Sat, 15 Jul 2023 09:11:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a12-20020aa7864c000000b00666e649ca46sm9021668pfo.101.2023.07.15.09.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 09:11:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 15 Jul 2023 09:11:46 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Fix register for nct6799
Message-ID: <9837f701-2333-4ff1-81d4-91b6b9e2f861@roeck-us.net>
References: <20230715145831.1304633-1-ahmad@khalifa.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230715145831.1304633-1-ahmad@khalifa.ws>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Jul 15, 2023 at 03:58:31PM +0100, Ahmad Khalifa wrote:
> Datasheet and variable name point to 0xe6
> 
> Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>

Nice catch. Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/nct6775-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> 
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
> 
> diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
> index ada867d6b98a..a409d7a0b813 100644
> --- a/drivers/hwmon/nct6775-platform.c
> +++ b/drivers/hwmon/nct6775-platform.c
> @@ -586,7 +586,7 @@ nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio
>  		int creb;
>  		int cred;
>  
> -		cre6 = sio_data->sio_inb(sio_data, 0xe0);
> +		cre6 = sio_data->sio_inb(sio_data, 0xe6);
>  
>  		sio_data->sio_select(sio_data, NCT6775_LD_12);
>  		cre0 = sio_data->sio_inb(sio_data, 0xe0);
