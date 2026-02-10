Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EED826ED35
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Feb 2026 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770736379; cv=none; b=WuhOatyADf/4vRrvkidcJ0lfL0KGv3WTYe3fe25fiX1TbaE1t+wkZvL2Zq/W2e4k9fRTryhRVglNFCGxd4bF+b+Baqus13LB94WG+5gRRxbYFXoEuRhx8qQKLozjHGmsBq6GWWfhYLYkFQyEoQYB5e/lFI19W8GDJLct181bRi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770736379; c=relaxed/simple;
	bh=ujTMw5OZHbZh10WeFW61t2hTTQT4Vze0CVoiCixRuLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcTHJytuiqygwsT42Uc592YT0XKIghVosveURgZSk1yeMbtixM0lREADRP05BoZH92RUb68kgLk63tRBWeP7AOpoFLeTAjNjvkz4V/8V65ryBaQhxWX8LjjbOHmlo1UP+ivNXqdLYlJv1x3PXOsAlmpkjFK4IocEcoOiPcem8Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gq1+VRoT; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gq1+VRoT"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b740872a01so1917668eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Feb 2026 07:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770736377; x=1771341177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fAxxTmaAkGZtVBPyg8LKag6i7qhLx1ugcDwEBREgoo8=;
        b=Gq1+VRoTiMopHK3zsF2BPmu9MBUTXcRcaD8fhqo6ynet/F3tjMqGRcsT8PDEUXVuIa
         jI4jU++1jT6fqicKJQ7hv5imghOST3tNnflvvsyfICUMyC/FPsn5KYkHFY5mlqLDIF3q
         n9bU1aD+Yt+u40ZF7DVZbv+a3yb01qOHH8CavY6AVluCnsAI7pwvWDGlojxnK1JL/ZNU
         rpNGVmVmmdqgoccY7uDw+6i6atYvl7+0KemBLZA+ZvdvYUBSuTGnppSdKKQofaXy7s7j
         t9rAcU5U8ItxhSEFCQSywuz5Xwcg4hpWtH6Y6M0ZoUg1uGzwHcrA4MdnjnTZYJ2wfdyU
         8FVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770736377; x=1771341177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fAxxTmaAkGZtVBPyg8LKag6i7qhLx1ugcDwEBREgoo8=;
        b=hwtDwUtnrlYg75XrDdKJdKAVgO6JNVOrdSbKkQPQNRmYXZo9IjzFPBHvn1ebgAgjxs
         5TIhmEQIyTCfYGDscBXF5dZb/VeQyBDsdsHPPvYvZ6x53HlA54qnloC5sM/oq053PN3E
         IO+3+xkTb57mFiKQHSrI8O0Szm1OdFnKzhK5kRhrW8gib58ZnxqvSHrU/ABfIKYE7a5h
         1FTbQv7P6WZNACozkuPf7HmNg4d/9U9zqwELeDE0oeQHWmNb+XIeNtwdq4f+4T5fxyb6
         UxtVBDDsN7tAaVmFgcIBNLGgQl7BYSf6k5m/TbLv+7B27hYrLyzgIncLz7ng9RQ8U4XO
         Cvng==
X-Forwarded-Encrypted: i=1; AJvYcCUkRUxSqwkdvNvzEGSwTUNDcQPpjBb80g94yAeQO3J3sTnNEJQzdKhiXz9SdaAxIyTpI5txHBAsrvLO0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAjtMi/3EJZ2cxC3sfL1ulYBN73nrFzpOvJVwRxdSvXzPGoWGz
	bOB3ashrBg2xowQ3yWLSMd6m03M0ihpMnO9VPLzacQZ8Tl38ugZ4eKT3
X-Gm-Gg: AZuq6aJjrzpBNyfA3bkZQqAka6wklWSt5hqNhOGVyS0aHtUQsQHI/AeBG0R0lOBLs0K
	o3+kW+oQ74fpQi/QmeLmsOJwyPvGM2zkWIQ9PXbxLwkkLJhfAfjWyK0USd2EQFy25Xr/5vokeQe
	MQuLv0UvE6KCNRFyCpjYUXC4Jcs7Qa3jGyRED63Sq2LbvIh2bWW2HGiWD/DB1kREtvr35X7pY4A
	A5qWK5RR9FOyW39IYbmUTOUPSNu03XoVXS0q0g6v6SEovp7zKOeHC2mFM0CU3P+P8qG9o9t0QBB
	UrluHxZJEulhqw1Zu0jARtQ0qQuNjtFbqQ5JHBWEhT51chSKgCluHbTV5RRoxdgza4fD4ocDO4s
	OO0RMWGT521JzoXOut3hwhGhOyC0zXy0rKVXr1QH3q58VyA+W+QXlZi/Bg29Y7zYpERoWKQgnrX
	IQN4wuTxGm1/JGUVPds0fGn5WTPJmRGvHFErIf
X-Received: by 2002:a05:7300:caca:b0:2b6:ab62:ae74 with SMTP id 5a478bee46e88-2b85683314cmr5728590eec.35.1770736376765;
        Tue, 10 Feb 2026 07:12:56 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba6baef3aasm5675049eec.25.2026.02.10.07.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 07:12:55 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 10 Feb 2026 07:12:53 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Carl Lee <carl.lee@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	peter.shen@amd.com, colin.huang2@amd.com
Subject: Re: [PATCH v3] hwmon: pmbus: mpq8785: fix VOUT_MODE mismatch during
 identification
Message-ID: <3f44923f-f411-4712-870b-b0348e4fe8b0@roeck-us.net>
References: <20260210-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v3-1-84636ccfe76f@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v3-1-84636ccfe76f@amd.com>

On Tue, Feb 10, 2026 at 03:26:34PM +0800, Carl Lee wrote:
> From: Carl Lee <carl.lee@amd.com>
> 
> When MPQ8785 reports VOUT_MODE as VID mode, mpq8785_identify()
> configures the driver for direct mode. The subsequent
> pmbus_identify_common() check then fails due to a mismatch
> between the reported mode and the configured mode, causing
> device initialization to fail.
> 
> Override the reported VOUT_MODE to direct mode to keep the
> driver configuration consistent with the reported mode and
> allow successful device initialization.
> 
> This does not change how voltages are interpreted, but avoids
> a false identification failure caused by mismatched mode
> handling.
> 
> Signed-off-by: Carl Lee <carl.lee@amd.com>

Applied.

Thanks,
Guenter

> ---
> This series fixes a device identification failure on MPQ8785 caused by
> a mismatch between the reported VOUT_MODE and the driver-configured mode.
> 
> When the chip reports VOUT_MODE as VID, the driver already treats it as
> direct mode, but the mismatch causes the common identification code to
> fail. The patch ensures the reported mode is consistent with the driver
> configuration so the device can initialize successfully.
> ---
> Changes in v3:
> - Drop patches 1/3 and 2/3 from the series.
> - Pass through non-VID modes unchanged
> - Add clarify code comments
> - Link to v2: https://lore.kernel.org/r/20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-0-3744cd9b2850@amd.com
> 
> Changes in v2:
> - Combine DT binding and driver changes into a single series
> - Fix VOUT reporting by forcing direct mode for VID VOUT
> - Link to v1: https://lore.kernel.org/r/20260203-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v1-1-67b041e2f762@amd.com
> ---
>  drivers/hwmon/pmbus/mpq8785.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> 
> ---
> base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
> change-id: 20260203-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-f48049e8411e
> 
> Best regards,
> 
> diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
> index 1f56aaf4dde8..87bd039c77b9 100644
> --- a/drivers/hwmon/pmbus/mpq8785.c
> +++ b/drivers/hwmon/pmbus/mpq8785.c
> @@ -47,6 +47,33 @@ static int mpq8785_identify(struct i2c_client *client,
>  	return 0;
>  };
>  
> +static int mpq8785_read_byte_data(struct i2c_client *client, int page, int reg)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VOUT_MODE:
> +		ret = pmbus_read_byte_data(client, page, reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		if ((ret >> 5) == 1) {
> +			/*
> +			 * The MPQ8785 chip reports VOUT_MODE as VID mode, but the driver
> +			 * treats VID as direct mode. Without this, identification would fail
> +			 * due to mode mismatch.
> +			 * This override ensures the reported mode matches the driver
> +			 * configuration, allowing successful initialization.
> +			 */
> +			return PB_VOUT_MODE_DIRECT;
> +		}
> +
> +		return ret;
> +	default:
> +		return -ENODATA;
> +	}
> +}
> +
>  static int mpm82504_read_word_data(struct i2c_client *client, int page,
>  				   int phase, int reg)
>  {
> @@ -129,6 +156,7 @@ static int mpq8785_probe(struct i2c_client *client)
>  		break;
>  	case mpq8785:
>  		info->identify = mpq8785_identify;
> +		info->read_byte_data = mpq8785_read_byte_data;
>  		break;
>  	default:
>  		return -ENODEV;
