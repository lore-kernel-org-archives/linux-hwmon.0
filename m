Return-Path: <SRS0=Tm2X=XW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BBDC4360C
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Sep 2019 15:01:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D32C321A4A
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Sep 2019 15:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569596477;
	bh=4aPl6ZQCla9oJbEYa25DYq7U9qw3Pb7aQS5TKZhaCl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GngSfODqCVFJSjePskXoCPT0gUm7Zj9UYmk30fEl3GxwP/CjY/9sM76ZtxAHkpUtJ
	 2x28uiG4a5ozxSQ8p0q+AlwgmnG432Kh42xxFKcY0C18WxhGaKuEL6cX0dCc3DuAur
	 7jUD3K/k+L8SOI5VnHgpvKDrvTE1DVM79aAmIUMs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbfI0PBR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 27 Sep 2019 11:01:17 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40734 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727952AbfI0PBR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Sep 2019 11:01:17 -0400
Received: by mail-pf1-f196.google.com with SMTP id x127so1753247pfb.7
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Sep 2019 08:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=iwywjeDVM8AUXGeKWR8/wgyVViur6euGe/EV6CXLnA4=;
        b=MgVlDxWRU+oc6wXdSIr8X9QwNY7ZA8lFlW12LZpyyZ+qakG9UuEFYOB5gLWE3b7Avy
         /cr+mwm2+WXe5GALb6pppYdhBs4qy/6exHRXQB4zHYe6F/v2mRRyEYulGYqCB/VmC7Ck
         uCpX1xLv5t6sUtL07bXRO5Ckh5Ru/7m0QaPQ/uWlQDi9iVgfAoUAhGmYZDrtEKc1peUZ
         UqpZs6t6CnvWUnTDjrFKdRWy/HkbZ+LR/nU+lORjiMUwU4t6Cdx1CPNI3e9u0zogKvMU
         l0LCNekaIf6PyBhBTCncPrA87qaK29b/e0uHRsq1gh/PSM0UwUzbMAR/+s5G0uEStIAc
         jeRQ==
X-Gm-Message-State: APjAAAUHuKh0fN0Rvvtuc6XT567uF4ix2ekbmaWOyc8rx/fD1qSN/MZU
        Ir/I6XfxLLl1alsLCaL9azu+WA==
X-Google-Smtp-Source: APXvYqxCiNCa9+/WHmk6ynVp+bPUVj9CZfNwljUVZCSHmmBcwDkub/iysw40+Wm+iTSfFTH0pY7V8g==
X-Received: by 2002:a62:1cd2:: with SMTP id c201mr4896904pfc.51.1569596476331;
        Fri, 27 Sep 2019 08:01:16 -0700 (PDT)
Received: from localhost ([2601:647:5b80:29f7:1bdd:d748:9a4e:8083])
        by smtp.gmail.com with ESMTPSA id x68sm3785991pfd.183.2019.09.27.08.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 08:01:15 -0700 (PDT)
Date:   Fri, 27 Sep 2019 08:01:14 -0700
From:   Moritz Fischer <mdf@kernel.org>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     devicetree@vger.kernel.org, linux-fpga@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Moritz Fischer <mdf@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/3] include: fpga: adi-axi-common: Define version macros
Message-ID: <20190927150114.GA2146@archbox>
References: <20190926103925.194973-1-nuno.sa@analog.com>
 <20190926103925.194973-2-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190926103925.194973-2-nuno.sa@analog.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Nuno,

On Thu, Sep 26, 2019 at 12:39:23PM +0200, Nuno Sá wrote:
> Add commom macros to "parse" ADI HDL cores version, in terms of
> major, minor and patch.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>  include/linux/fpga/adi-axi-common.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/linux/fpga/adi-axi-common.h b/include/linux/fpga/adi-axi-common.h
> index 7fc95d5c95bb..5bc5603e6bc8 100644
> --- a/include/linux/fpga/adi-axi-common.h
> +++ b/include/linux/fpga/adi-axi-common.h
> @@ -16,4 +16,8 @@
>  #define ADI_AXI_PCORE_VER(major, minor, patch)	\
>  	(((major) << 16) | ((minor) << 8) | (patch))
>  
> +#define ADI_AXI_PCORE_VER_MAJOR(version)	(((version) >> 16) & 0xff)
> +#define ADI_AXI_PCORE_VER_MINOR(version)	(((version) >> 8) & 0xff)
> +#define ADI_AXI_PCORE_VER_PATCH(version)	((version) & 0xff)
> +
>  #endif /* ADI_AXI_COMMON_H_ */
> -- 
> 2.23.0
> 

While implemented in an FPGA I'm not sure if this needs to go into
includelinux/fpga/.

I'd suggest to add this to the actual driver for now, and once you have
multiple users you can find a common location.

Cheers,
Moritz
