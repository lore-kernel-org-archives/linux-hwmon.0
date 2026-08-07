Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135E4378D70
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 21:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786136826; cv=none; b=ddXlMisWHGOJNdxYf20gFXIexbrZL04JRISlceTt1we3mDf2A66EJzOpOEuMc9DhXEBpTmdGiEWR9FP+RSjeKUaNzM5TQtdwVzhixmwpx28qCgqWb1qlHvp+PmMipdXt1IKCEvV/9QlDfhGD1AbkkUQav3jgnBbJmmXxpasIGlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786136826; c=relaxed/simple;
	bh=qLca5mPrycZt6ozG3WNcrfP3sx0HQ9R6ID2aO9Xm26I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8j4Tj71nSwlQOkd8iXQBn7cWt8Xv7P25pvc1aL/EuC5s06zVhGNsT4ELxrORDJAMTgBM75d6VcNYloyabNVGrXA0xcJl1dInjWkYyAemdz/LBR/Kd1hzAqAQkaPvj1jD6uX+K9kYWMa0O5BM2+VjB/RyU+pUxSc0XzJ7dTliWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3a6SxIE; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3a6SxIE"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so2998841a12.2
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Aug 2026 14:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786136824; x=1786741624; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1OqfWPK4p2/OMAeeeFT0yxrTuq3EwlujpCKP5u7mo4=;
        b=h3a6SxIENAxoFeWfAIbDvH9rucbH36nHmbAm+hbAEiBGN+QH4604BFZK1y4OP/c/io
         67Fu02UWacWSmLEvNdCmhqGCUCN2/QFIty/ZHJuILJGbz/QO7lofzNj6SE8sCP2IkFLF
         90HOMzFQ6uvlgfIRPvSmqmJDJqhi+3f/2OBeGexjI/wgVya+stLIGqSxPtMJvWVkrQlF
         bPrW+Cd8EEnSYC8cJPOSrxBrs2pDSPsbJ6GhNvXJifOCdF+fXx2pLuIiRy9n7m6bXSkR
         NSsNi0+srSK8yTwDaOWLVwmB9r+MTwPtBskT+B8HXZTo9gAu4X3oT96RCklea6ct043W
         LjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786136824; x=1786741624;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1OqfWPK4p2/OMAeeeFT0yxrTuq3EwlujpCKP5u7mo4=;
        b=B9Z+Q4Ukh99NI53Qp5GmN9mCv4y4MzYNCS36uahKvuqlCHDxozFHmdXLqXZQxaRU+m
         FuMXe57zEQ6tL0z8Ow9TZskxMEwXU/d6pZ8/xlgVQtvbXzbbBbRdJuAA0VyrQ9HhDJqm
         8G5VZNN9gU/TpfVTLE28dZnj/4yQv0W4JYt0JzFcKjxLQEl6Mz1HJqvP80ytFyzp8+kq
         F44Lb00zd5ZKPn/6POXHAQKYkn9tJ5shcjmG+9EQm+V5SLzkN9Jz6MW1JMI572g/lpKo
         n3KPK2qMvlLQ5pwYz1+zcIfHJdvEIRvi6HgIbpt0yPtrJ7b/43CZVQnE6t9/FJbJk+eP
         panQ==
X-Gm-Message-State: AOJu0Yyd4yerubzDv9pGRrnsG4NVte0at4yZIboy96RZCXiSqOYT8+XF
	RJhmi1bzk6Kt/Nfov0esRr4lfensDnlEijArVReU0nogGMeGPLshPwn2
X-Gm-Gg: AR+sD10wYjLgRZ6j8fIVqj7KCNBbpShNA7T9LwOeL3+wa0xb+XNXtG+JJSWuHyeDTQK
	UkCZ5Y7ijGqiNetejqK43Cw7BlnbImE7i2aO7/6oplMlTkh0esOz/ScsQV9+RtVKlVat7DoO52G
	2kuoUO8xC9EbH1aJjyZpyytGRrRtUqFlYFKD+6ztN37154gWS/tgjTwnl2hIRuNhfJAvEt8rURd
	P8h6E+IkVZN2yEu2tRi79jn0X2v697agaCJzFPpricUHwl4fRCIUU1iuSgIHZLM6tuVkaC8ELRH
	L+Ckstmm32zDOM03CUHYRULmLVsswIpZ41fBfgcAnOfAHnOFrjkasqBYNxetvxSZyXTaMgMnlAI
	10kx86Sawr7W4N/VteDJA2OYwdWhoNGgeI1Zr0x497jXG0F1sBhWWNMUj/8YBVSQ/W5DT581k0E
	5tlF7uua72IJludcilnmeqiS2GY2hoGZAwRxTHMzFWTANT4Tg+YkpUtsnSaqRoUVtfCTnVr9uaw
	MZddrsf81IVvA==
X-Received: by 2002:a05:6a21:710f:b0:3c3:9c4e:de3a with SMTP id adf61e73a8af0-3cb85df09eemr31815552637.6.1786136824287;
        Fri, 07 Aug 2026 14:07:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb883d9sm10848606eec.15.2026.08.07.14.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 14:07:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 7 Aug 2026 14:07:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (core) Constify PEC device attribute
Message-ID: <8e66abf5-cd2a-4324-a328-6e3baad7199d@roeck-us.net>
References: <20260807-sysfs-const-attr-hwmon-2-v1-1-d16341379a97@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260807-sysfs-const-attr-hwmon-2-v1-1-d16341379a97@weissschuh.net>

On Fri, Aug 07, 2026 at 10:06:17PM +0200, Thomas Weiﬂschuh wrote:
> Mark the attribute structure as const, as it is never modified.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
> This should have been part of commit 5d27101b6f1c ("hwmon: (core)
> Constify device attributes"). If you do a rebase anyways, maybe you
> could fold them together.

I'll do that.

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/hwmon.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> 
> ---
> base-commit: 611f4cbac429c09a7db4bb2aebf64e3423109639
> change-id: 20260807-sysfs-const-attr-hwmon-2-43bd646c0c67
> 
> Best regards,
> --  
> Thomas Weiﬂschuh <linux@weissschuh.net>
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 90ceb815f43e..3297ed6daec1 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -341,7 +341,7 @@ static int hwmon_match_device(struct device *dev, const void *data)
>  	return dev->class == &hwmon_class;
>  }
>  
> -static ssize_t pec_show(struct device *dev, struct device_attribute *dummy,
> +static ssize_t pec_show(struct device *dev, const struct device_attribute *dummy,
>  			char *buf)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> @@ -349,7 +349,7 @@ static ssize_t pec_show(struct device *dev, struct device_attribute *dummy,
>  	return sysfs_emit(buf, "%d\n", !!(client->flags & I2C_CLIENT_PEC));
>  }
>  
> -static ssize_t pec_store(struct device *dev, struct device_attribute *devattr,
> +static ssize_t pec_store(struct device *dev, const struct device_attribute *devattr,
>  			 const char *buf, size_t count)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> @@ -390,7 +390,7 @@ static ssize_t pec_store(struct device *dev, struct device_attribute *devattr,
>  	return err;
>  }
>  
> -static DEVICE_ATTR_RW(pec);
> +static const DEVICE_ATTR_RW(pec);
>  
>  static void hwmon_remove_pec(void *dev)
>  {
