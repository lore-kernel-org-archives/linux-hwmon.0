Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263C1390998
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 20:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772484778; cv=none; b=q+t4iVeJI56ksOK5c0r45AlJMAE5rVEfJD9rNzUxXF5d0CquT5z/AZWUUp+5w4IW5MAr9N3DSK4r1xgkOii3ObTVVQm1GucQ1/aqy5HVnVHzlfNBBw3C7oNW/denYRQbKhhvXFft/4e2ALiqGS0NksDErQWynqzXHHC4u7s/ywE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772484778; c=relaxed/simple;
	bh=81rKdok2xQJrb6pDaNYPXsyNgCs3hA6zn+bb6tcBT3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2gGotjfFYdDdkiOdC1TDVCCLkPvsY2yfNAzJ2CFGPose1GaFl82TrMzEiw79AF/6f/stoEw+XDTLSSbkv+JhEsWaBOSZ9Gbf+/wA5/OwyluW0yeA8q5yiNrfAzdyZ0qpwWrMAF72vhrYJ53si4PqndU+nv6Ibo8I390Qu9lKaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTM0B0Gb; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTM0B0Gb"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3597df496f6so1137570a91.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 12:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772484776; x=1773089576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9IV2Xxu4E0Xqkmj46gDwlLqVMHlA6RAodrZ0GIgPlQ=;
        b=bTM0B0GbL0DGDgt1AfV2adeLrtnLyUmssiGGk1Iw+cVmV3QsZihHTXSMit1V0txMS8
         NTeDoMffk/og5MuOmfaKTzN4Vfl9YtWfA3WBORsFChmkHb4IfzDOfYhSGbUL+72rwdiQ
         9RPvFKIPNxi8JFRmnGk1MK6Xy+NlNaO55/FTmOO64dmP9jWOJ7xq1lo3W7EnIr6hE8E6
         yZ0B5tvTNo8qA+Ny6dF9zr1DYVEtDVciWcdXYyKBxyYl2Rm5wnMlHJ/w5ftRThuNEFI/
         /GrZ7V1uFi1WhEgzmWs0g3q2B94c+kMuJaECUz8uBaXcjjImpMaNqQFy5RvbvpHch5dt
         /ehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772484776; x=1773089576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y9IV2Xxu4E0Xqkmj46gDwlLqVMHlA6RAodrZ0GIgPlQ=;
        b=Sm7nU90H4u113eaKyRRqCLWW+zw/fh5lPMG20DL/T+VoNKc8BSS9tDASNbgNvjPzdi
         MFuCSmG2ngV3CNjxVFCUgcBE9Zt8+c7tgzfgvNy+OXy3qeH5xtzRxdqbWjkoCURhOREm
         L7I2M+zxByiGsG839uauxn8adOhRh5xxEQ29jUSEU5qX9kniN1Q3M+eL136EYWvj5CQQ
         xAIIYJ3AX0oXTrDFXgkPcdCwcEHpL8mZKhzVobn8o1GxunvmUDvhpTXBCNFZuiqiakTa
         HHZHknd27VlYx+wfgjRiPQ5byK+mKyegiTT4+MD7lnn8qPaDf5Bjs4ofqqmhP00Y8/5F
         WIMQ==
X-Gm-Message-State: AOJu0Yx4M0U7/5/rRlrfchJ9rnatEpuLdScWAAd5pVHpoaPboy7huUPz
	zV8SpocNamW26Tvs3CloPB6+OiP8Rvs7ogq/qfJ3xLsGnw1z1wDZLrTuHGGfizOi
X-Gm-Gg: ATEYQzwvjwfxGw/sOK3+CehFcrCRu8Z7WLwMO4RQXVkio+mQ1/9fVJm0VTIdYXFlPvj
	5+naTZwuL/VGJSsmZf7lnbOA5+vBRhH6eQEUz7L1HL1mwE/KdqyFsvt2Wq2xS/FpKwZUTYLXLJH
	qHG7mwKvZCMPPyO9hRjFHl+4XJQLlQBKe6+6cX4glkdXTe9ZE18MDdWbX+HWu9OPJ3gCqE83V8w
	p12v1eSBK0ex2KZiE56mVxbMV2ebEVTCibFS2vLESfBm5TROeQ/BFwszxhg3F5L2UezF8gJkB1L
	OccxV2TAAV0vmGHTW/0+CMEjYNtdOzKB0ZpdL9pfzfWDH8Jn+MHaeEPFvM/PjjXzY5Nog/vheyb
	QRWuvptKzVqv+LsOnJCRIgWy+eazYcy4AQIIA18JCa2QhAlf2D+ft7dv1IqdBk3JGf9fytaJScf
	4RzO1sG7zgojcGdOtLvvrAb5mJFi6nh6KMF8+n
X-Received: by 2002:a17:90a:fc4d:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-35965c2280bmr13431147a91.3.1772484776467;
        Mon, 02 Mar 2026 12:52:56 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c39d530sm8652a91.10.2026.03.02.12.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 12:52:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 2 Mar 2026 12:52:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Amay Agarwal <tt@turingtested.xyz>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] hwmon: max31722: use sysfs_emit() instead of
 sprintf()
Message-ID: <159d6fd9-57c6-4488-97c8-8d4b3fa23072@roeck-us.net>
References: <20260302192813.10625-3-tt@turingtested.xyz>
 <20260302192813.10625-6-tt@turingtested.xyz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302192813.10625-6-tt@turingtested.xyz>

On Tue, Mar 03, 2026 at 12:58:13AM +0530, Amay Agarwal wrote:
> Replacing sprintf() with sysfs_emit() for drivers/hwmon/max31722.c since
> it is the preferred helper for formatting sysfs outputs and preventing
> buffer overflows.
> 
Same comment as for the other patch.

Guenter

> Signed-off-by: Amay Agarwal <tt@turingtested.xyz>
> ---
>  drivers/hwmon/max31722.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/max31722.c b/drivers/hwmon/max31722.c
> index 9a31ef388396..6c5c86c75c36 100644
> --- a/drivers/hwmon/max31722.c
> +++ b/drivers/hwmon/max31722.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/spi/spi.h>
> +#include <linux/sysfs.h>
>  
>  #define MAX31722_REG_CFG				0x00
>  #define MAX31722_REG_TEMP_LSB				0x01
> @@ -56,7 +57,7 @@ static ssize_t max31722_temp_show(struct device *dev,
>  	if (ret < 0)
>  		return ret;
>  	/* Keep 12 bits and multiply by the scale of 62.5 millidegrees/bit. */
> -	return sprintf(buf, "%d\n", (s16)le16_to_cpu(ret) * 125 / 32);
> +	return sysfs_emit(buf, "%d\n", (s16)le16_to_cpu(ret) * 125 / 32);
>  }
>  
>  static SENSOR_DEVICE_ATTR_RO(temp1_input, max31722_temp, 0);
