Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3F7351C04
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 17:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557514; cv=none; b=ByqcEAU/DbLG6OBoRT4aI3uIVr66D6Gs1/oNjzGC1Wko7sereDIQ+c5skWrEUqjO22ArBEwBVgGdduSKfglvGPLOm0cCOsEf+nPcc/YgmMNy64DdjxDwH28QvIrT2nTEc+EtawgclJcCC1dxyT6qhvHvUkjLbKuG+blpkOgjJVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557514; c=relaxed/simple;
	bh=3Mb6D2tocPrTRmquT4dzPWGmDh+/5xFplXUicp3vrUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4N9sBSie7uXBkTnWWBubcvfoRtAMWPo9WkDp4Ft0TYV2EgDojfM97jORgMGC152ybkZl5Ic/ZFI2Wzf1n25r8m3tWNGkdOSM8Z6cP5zSGdGL2rZfXUHim3ZPLAMPUZYlGtuAxFfmPm1w3JIXWA+pezdrvNwmNZkPF3WslMc0uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcH92mq1; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcH92mq1"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-bde0f62464cso2039538a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Mar 2026 09:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772557512; x=1773162312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzD5Vgwcny6O0kze8xcPLLdnOR61A/pfmiE5Y4dpuKs=;
        b=PcH92mq1NIdFEDtXHc6XfHZ3WKDJn3YKC2FmBcoiANoM4YleLzIknzAMYuCH4Cuowc
         zaDXvnQMT40HRSd04oRGEc7AIkXnKHX1mdxHBA9Iyg0MsgLcAklb5upN17uf5SzsWyUB
         8KVuLB10KTtNpN3IZm4Nq2fDOFeFdpNDTV3fr8KmXG+jj9YulddQci21SMg6nX00TWS3
         o2JAzfX52UlOHOQm0e4JNZPpW100i8S3SzhDzMUCoGJl0MQFjTvzr20vKvKYKmCdU56I
         QP40ZoPJk6/CiX4+0IqQTt51alwKerGjPHzHd8QlTEYRzrNdop5GKab5RJPmcLef63Vo
         H4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772557512; x=1773162312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kzD5Vgwcny6O0kze8xcPLLdnOR61A/pfmiE5Y4dpuKs=;
        b=Cul7uVJLUJW7VU4ZPHoMlk4gTyURAlNyCBFquLqxJbR9r22YzG7zPgLfsMqEsc7ifn
         BjZDvhOoBY5oOA+jGAdj/XNRui60Hmq60HP7lWIajRT8oJDkfRVwu8fGPSNzILv6ShDH
         S2P74xH0Ac+KbMByPqpJuxMJxZuMfdjXzsYRRQDrCRNagjhb9sQuJFpCxFf4rrqTnBLd
         pQnbf4++t68nQFgbuTBrCXzC0yRCnSw+Jf6oRNzD9wa+PcQvMJnIRvpdZXPESpLMfO6/
         W1Q9Z02qCem2EdeStude2tS8sHTwywNfINiI8RxWiHQ4G0ME011+kzgroXkHPq0rVIx0
         mNRQ==
X-Gm-Message-State: AOJu0Yz+yBSkQszdx5+9i3y8tJ+3w5oQxYYsDFNQdks6P+FEYCyl0pcB
	3YaqgjA1pW9scW7VpK43jqqWziC8A4UxMHiRhe+T/F/4WKbd2AH3W/N+
X-Gm-Gg: ATEYQzzmUfZW4PEZY8JIbcIyDvNDwxa70mvuHpQfbuQ5nPgUQ0TMgSemzzhFrQDqWJJ
	xeiaOk2VexPJoAvmbIviizPpt17RU7VFeGVpzfYt9lecZ26Ya9TaUHSbUGgQ1aEVXJayfDU0B3p
	tTI4PRR+dVNFzh5319Gh+HghqTOAehmd+3D2WM8BCX40PUIQNMiH2Qr4TBDGmzol6f8qY9EDGqe
	Cx0sOOJbJYTOdmq5eUHBHoctKyXfpUsI4lUuTyeSzoMRM2voDYw2T6U76v4rTgG6I3l996q92Hx
	FYdImQouvChX1ZEMpUUF8uqse8smxww6o1ZIbdBN5x0YyntFMvqU0HZlh8mnZ8yM0blDnQHNLZQ
	0+gTrFFdu7sFbtLIdN6sr7RpzbEx9NpBZKkqU+adLWoy6ROOTrmJT8tTuXJc10AefWi2UoFp0nV
	hocnCVM5qgN5mohdPFFirqMENsk5D8G4+i8ITG
X-Received: by 2002:a17:903:2a8c:b0:2a9:484c:ff2f with SMTP id d9443c01a7336-2ae2e41a1d8mr139054515ad.23.1772557512257;
        Tue, 03 Mar 2026 09:05:12 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae45b5201fsm87732495ad.87.2026.03.03.09.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:05:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 3 Mar 2026 09:05:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Amay Agarwal <tt@turingtested.xyz>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] hwmon: (ads7828) Replace sprintf() with
 sysfs_emit()
Message-ID: <a7985f8c-dd0a-4d16-bf32-0fcdc68e70ba@roeck-us.net>
References: <20260303152456.35763-1-tt@turingtested.xyz>
 <20260303152456.35763-4-tt@turingtested.xyz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303152456.35763-4-tt@turingtested.xyz>

On Tue, Mar 03, 2026 at 08:54:54PM +0530, Amay Agarwal wrote:
> Replace sprintf() with sysfs_emit() when writing to sysfs buffers.
> 
> sysfs_emit() performs proper bounds checking and is the preferred
> helper for sysfs output.
> 
> No functional change intended.
> 
> Signed-off-by: Amay Agarwal <tt@turingtested.xyz>

Watch out for multip-line alignment issues in the future.
No need to resend, I'll fix that.

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/ads7828.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
> index 436637264056..a09de9d016ac 100644
> --- a/drivers/hwmon/ads7828.c
> +++ b/drivers/hwmon/ads7828.c
> @@ -62,7 +62,7 @@ static ssize_t ads7828_in_show(struct device *dev,
>  	if (err < 0)
>  		return err;
>  
> -	return sprintf(buf, "%d\n",
> +	return sysfs_emit(buf, "%d\n",
>  		       DIV_ROUND_CLOSEST(regval * data->lsb_resol, 1000));
>  }
>  
