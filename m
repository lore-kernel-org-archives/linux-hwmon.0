Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFF91D5CC9
	for <linux-hwmon@vger.kernel.org>; Fri, 14 Aug 2026 03:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786678657; cv=none; b=d1e39DKjTA9YXuPuTc4NBPeFY42D/rczoZZBxT55pQRzHRaHiq1cgIEg+JVQVDkmasHzdm4JFLvQmEd3HeRku/iREFJt4qu4dpgOEAvkwvAquhHfhdYsTeJ8atCkYxDoWCRAvtJjsC4NgsbVMkn/6WifrMwz7OEMvSVwRZqlrk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786678657; c=relaxed/simple;
	bh=Gh50MbzdLtX+mK2Yt6fidAkNrV+DeiO14r0locCwQqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKXnKVRaae15/wd9/z0KDZK3UpZF0LO9UgOYIdig0IJNsGEzob+4dIeLGXNfPIuickitwUiiC4GPLRgXddJXlUZgk4McYaSC+vtTsxksomzMByoO4AROOo9UMfBDAvV+2EzeZmzxB6aeRNf0vwwRpOBts4C+AxZpzZ3y4FpubUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJoqcErF; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJoqcErF"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e7109321dso409321a91.3
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 20:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786678655; x=1787283455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4veYhoT5KlsNKZAjQUA1mEqfCzZnluu0H44MxzYL4Rg=;
        b=NJoqcErFcGWVH+DApiAEkixkyg/koIOkJ0nOrpj1ZWyKbGL7ZDWkObsH6+lLR+qHBl
         Hj80lIIUZtUU0OP4ppgJicETMqTamEV83CA8NtciFO0i3cc9zxdaLO7zJUQrVEtwYx90
         oBc1mrm1dFdtSIFNrB2aC8//DgBrQWbWpRwiNpGd2GKC57fi4FoIFe3qePBcYZljn2Jv
         Vs9zPI+YQl3+t08cKPyN9EHQbpn2W9jPbka4OQ36CUCz0t2AptZPP6s2dpz4AwVlvXD3
         3hLgoAYQ7Rro87/n1XxYd/M7n4+0A/qn7ztBq2fh24n0I1PdkNyYsyhURWTmHNZ+6A0K
         Op2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786678655; x=1787283455;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4veYhoT5KlsNKZAjQUA1mEqfCzZnluu0H44MxzYL4Rg=;
        b=XCOSXqALLQ6xbDvCL2GjVcLygW/jB0HiLFi6NbNcWRxacG+pGiOxIOcbexoMvHRSUI
         waJmI5sccpwN5c9o9RWEEiMB3YtJroJ3EDkp7+auy9pkjE9DYexgmr2oED//wKfGYDwW
         JK+AbLfVmv903AVZycJoRb2HyxqVo3v6/y7J32QaMJi4h0tOs050OStWV96mAlsv6zSO
         CsbmstCT84DwpRecGUY5UMIh92Dp0Q8+/wJSBAvcOIH8U/f0I048Elzgh/cdt4BwGh1U
         7EQCo/ElNSweBlWNKwj3fs6jDt6uKZr+DO1fugX04kMs2MJZhBu/Y4duEb/Idu79Qp55
         ZMcw==
X-Forwarded-Encrypted: i=1; AHgh+RqRP6TWK+/wA2mY0BbF9sZcXMeH3bUn8mDN7YpceXKeCkWxn6uU1n/VhB2MWVTa5Q+kYHhUHhuwlPQvZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yywp33cPartvAXw0dZxl0Wq88oN6E7XLGMOgN8Cm+SqhWp8vdXO
	+2U/CaG8/uRkhdpn4WB2ltJ/bVrqfwPCMojq+R6oQ3nASRZDi8ODH+E+L+M++g==
X-Gm-Gg: AR+sD11r2gGzoRJGahy8SWpM9BH4XHy4tNDWtHmuBU3dpELMwdjJoa0evy5dO+f7PMi
	jcIG8Kfqa35FeUE7i9CLpoFfOAatcNqNYF6+qX5ek3u7BHO4CYju1nXrmsWS+lrCZm96aXD6VQK
	CqVkm0hJOMS1Dhx7f9buQxhB6Zk+Rr64YZKdjjGz/YCOJ+ENS4PZqj0nwKw4okImTz9DSerfpru
	3B5NbvOIzd/yXgpDHiY2E0PkBUhfMWG2AENTyzFYkFN8kccW/8JZn+1zCfb9Wk4+NPQ3DxkR3Uk
	932DYiITohXmN72tEC6Gj0P5b9lQwDydCTSVRqAIuwH46Jm6lBYj7k1ymM2Bg+uMUDKCaqmFkr2
	r4Qfso2S2vtmDv9MhdzeTkHlzME9y1vr9TxCO/GMln2VjN85dHsf3irsl0oWz74z8TG3jnE+Aog
	rbEhNmwdaeaG6A8wyGVSboy3OokG2pE5WX8jpgPmais2x3+qjN0dS41QbKgePxpLwAPB4xrhBuV
	g==
X-Received: by 2002:a17:90b:5606:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-3933b81d0aemr2774393a91.5.1786678655243;
        Thu, 13 Aug 2026 20:37:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea96947dsm641034a91.1.2026.08.13.20.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 20:37:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 13 Aug 2026 20:37:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Gabriel Ford <gabriel@gford.dev>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	"open list:K10TEMP HARDWARE MONITORING DRIVER" <linux-hwmon@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: (k10temp) Add per-CCD temperature monitoring
 for Zen5 Turin
Message-ID: <e43113f0-4723-4ca4-a13c-1d80d0373990@roeck-us.net>
References: <20260813170232.3841-1-gabriel@gford.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813170232.3841-1-gabriel@gford.dev>

On Thu, Aug 13, 2026 at 05:02:08PM +0000, Gabriel Ford wrote:
> Add support for per-CCD temperature monitoring on Zen 5 Turin (EPYC 9005)
> CPUs, as they fall into a separate model range with a different offset
> and a higher maximum CCD count than their desktop counterparts. As such,
> this patch also updates the driver to support CPUs with up to 16 CCDs.
> Tested and working on an EPYC 9555P.
> 
> Signed-off-by: Gabriel Ford <gabriel@gford.dev>

Seems safe enough. Applied.

> ---
For next time: change log goes here.

Thanks,
Guenter

>  drivers/hwmon/k10temp.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index de0760dc597d..43cade8c3631 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -207,6 +207,10 @@ static const char *k10temp_temp_label[] = {
>  	"Tccd10",
>  	"Tccd11",
>  	"Tccd12",
> +	"Tccd13",
> +	"Tccd14",
> +	"Tccd15",
> +	"Tccd16",
>  };
>  
>  static int k10temp_read_labels(struct device *dev,
> @@ -243,7 +247,7 @@ static int k10temp_read_temp(struct device *dev, u32 attr, int channel,
>  			if (*val < 0 && !data->disp_negative)
>  				*val = 0;
>  			break;
> -		case 2 ... 13:		/* Tccd{1-12} */
> +		case 2 ... 17:		/* Tccd{1-16} */
>  			ret = read_ccd_temp_reg(data, channel - 2, &regval);
>  
>  			if (ret)
> @@ -384,7 +388,11 @@ static const struct hwmon_channel_info * const k10temp_info[] = {
>  			   HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL),
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>  	NULL
>  };
>  
> @@ -515,6 +523,10 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		}
>  	} else if (boot_cpu_data.x86 == 0x1a) {
>  		switch (boot_cpu_data.x86_model) {
> +		case 0x00 ... 0x2f:	/* Zen5 Turin */
> +			data->ccd_offset = 0x1F0;
> +			k10temp_get_ccd_support(data, 16);
> +			break;
>  		case 0x40 ... 0x4f:	/* Zen5 Ryzen Desktop */
>  			data->ccd_offset = 0x308;
>  			k10temp_get_ccd_support(data, 8);
