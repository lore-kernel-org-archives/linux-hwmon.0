Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3452D739C
	for <linux-hwmon@vger.kernel.org>; Sat, 12 Sep 2026 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789226032; cv=none; b=oPbWDduXoZOojZXCjsLsNFLZ3FEs6V5Kokj0JBldWZKbnYXzLJlaRLjksD5Ybcr6RMNoqV9qSauImJwDXbvDbEeni8ORQbNh9633E5vu/4nweTsjeiCw6TLw6wURPKgDLsYVikls/Km9TIl6mctugHlufoSDSmftDYt1IMEJ/MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789226032; c=relaxed/simple;
	bh=nkzZC4O3ba+qnaj9PyoG2dWmmfwTuprT6RMLwOebYh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gM/j7pWSAnW7N/bRaIfGRwizYpb/I9MXQYYdkKkxiEjydbYXmtTLuvDRqpKU4iMj+IlZoBiIEqPkiq576QrqIXZ3R7tgOTqtximgZlcjKpBhvri3zOUiZyqNbkWWiD4RaIzmUqegjzs2jMxh9AoDWHlD9PAAtNHTBSGS993+jDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0ipokmm; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0ipokmm"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so792130a91.0
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Sep 2026 08:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789226029; x=1789830829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZJ+Pa3NsYZTQTTHYy8H/tv0MO/NVxIE9LyyFhhiPi8=;
        b=o0ipokmmlTflHvxBa4P57AV63fufbCWCZdMjnJc6qGFV3BOg6H6B7m6rd2SM8JRhHu
         hWAx2HYdz7vsv0qYbg9Ix0VR0DuyjBagnZoUAw/rmMSK/ddpdiL6+c0zkRW+jZeUQ2MW
         2PqlialXAtFVA21Eri37CiX9OPIETXgJldQJN/IKh2U5DFpoQObkg1ooFH76b+ztdR14
         36EuOi3N6WvT+Pg6bmoKdnGDVdKq2D44mKeS/iyf/VX5wJ01J5xgpq9Wk1x034MMo3iN
         gSTPotz5cwMBSE3G3zRim8a/24z6k12EoUOZ1sltMAR6uqYTdsCQIlMFm1PZshCAs5B6
         Of2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789226029; x=1789830829;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NZJ+Pa3NsYZTQTTHYy8H/tv0MO/NVxIE9LyyFhhiPi8=;
        b=jYmPjMMTJdg1pJVdXAhKErZvGmbrebvDM8hpT/a3xMfNyBvHBVBXYtKf+Fml4N4qzz
         gUUGK36x3ZxNDr9CWGOBL8p4usOzm/jRfV+rfk+ujiRLBJIoQeC5vswtELoJtn8eQW0Q
         5+E6F8EO08IcnvG+P06gzCt64xNBkBmCmXC/es8e79QVSihUK0jNeG69q/RJ3i8VteoX
         SFxYcenVeXNGBm+NOPyRsPDEsKUozW2SPuQ26JXVQuVL/c5Wfgvjdchbqwc030+GBf65
         X4rlRfa9vw6UA0jPSNacZi91hCdUZGF6zjiYmNwJ94LyDzDB5zk9YUC5+zY17GY6bQsR
         VoiA==
X-Forwarded-Encrypted: i=1; AKwUvByF6QTU9acA4S1/cLLtj2smtfeV0x9hwfACC6R9ty1Iv7RMDmpN5BL70QLyP1k0UVjnItyjRLhSqCg8PQ==@vger.kernel.org
X-Gm-Message-State: AFuF++ndbW2190NIy8KawCPMPe41/uEWWskHKWPLBKy8CETo/t2cwnEP
	s5C0GJhKDP6dTEIREvtuHloX46h+U/Cl2dsELgqD0WXkUkeRRKX4YHbn
X-Gm-Gg: AYBFou0kPKX1czdtumns0mvdqs8FS6FJ3VZYE4FvT7wLec/KHe+OGuTeqnGPdWNaph9
	PdYyqMhJUiSYgxtjLVBEtTomeGsjmlkilVJiCDxPyv4tYcu2iv/OW3zCS/i1DY44IIKsJ7Z8V4z
	LYUcMkzWTrcFv/kjbFvMgGrKKwiVtFYFMcg+2e/q4KD9s20bKI5P8H6RbGCOp32HY9xWEAs3Inn
	6jJnspasCDxggWDp2CQyX4ixoTRJQpQbEo9WXvLc0iZ8eIrVfLqQjOVYB6pxlTdDbU8uNYTazvu
	2S4kt6KmoWvMBCosu4r/80aWhORhtBW9YqPJBJ5AvlwFNXKQiQ+kWWlaPLGU9OjxlrLEuHHsJx3
	FJzbUxGM8i/wFAIHFpY6kRtRIgd10YFDl+fb6mwpHPUCrEN5Ult1vvQt7YJ5ZSpRgglv2ltNxSM
	Y4ZpuPHwLBshub/JfmBBdzh8SJexqvzqAF4qwMOSgij6HDjy+l0SOUfPqFmR84TF9plTN11ZSFV
	FoMZ+7qjBaFNtz7d2aYxO1wfBmqKFf+YMdWJRBY2Pwnkk0nY234bEpb0pk=
X-Received: by 2002:a17:90b:3147:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39d9bee5d69mr16001778a91.10.1789226029163;
        Sat, 12 Sep 2026 08:13:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39db41a7adfsm5718476a91.1.2026.09.12.08.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 08:13:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b47789a3-731e-44c4-a954-e9352529cdf5@roeck-us.net>
Date: Sat, 12 Sep 2026 08:13:47 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] hwmon: (peci/cputemp) Add support for Granite
 Rapids (GNR)
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Iwona Winiarska <iwona.winiarska@intel.com>
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
 <20260903133408.110847-6-changhuang.liang@starfivetech.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260903133408.110847-6-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 06:34, Changhuang Liang wrote:
> Add Granite Rapids (GNR) CPU support to the PECI cputemp driver. The GNR
> platform does not support the core mask scan via PCI local read, so
> handle this case explicitly by returning -EPERM and skipping the core
> mask initialization.
> 

After reading the next patch of the series: Are you sure that this is
the case, or is it possible that Granite Rapids just uses a different
access mechanism to provide the information ?

Thanks,
Guenter

> Define new cpu_info structure for GNR with minimum PECI revision 0x40 and
> the thermal margin conversion function dts_ten_dot_six_to_millidegree().
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>   drivers/hwmon/peci/cputemp.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
> index 457089c561b4..43e52a6db79b 100644
> --- a/drivers/hwmon/peci/cputemp.c
> +++ b/drivers/hwmon/peci/cputemp.c
> @@ -339,6 +339,17 @@ static int init_core_mask(struct peci_cputemp *priv)
>   	u32 data;
>   	int ret;
>   
> +	/*
> +	 * Some platforms (e.g. Granite Rapids) do not expose the RESOLVED_CORES
> +	 * register over PECI - per-core temperatures are simply not available.
> +	 */
> +	if (!reg) {
> +		dev_dbg(priv->dev,
> +			"resolved cores scan is not supported on vendor-family-model 0x%x\n",
> +			peci_dev->info.x86_vfm);
> +		return -EOPNOTSUPP;
> +	}
> +
>   	/* Get the RESOLVED_CORES register value */
>   	switch (peci_dev->info.x86_vfm) {
>   	case INTEL_ICELAKE_X:
> @@ -543,6 +554,11 @@ static const struct cpu_info cpu_emr = {
>   	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
>   };
>   
> +static const struct cpu_info cpu_gnr = {
> +	.min_peci_revision = 0x40,
> +	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
> +};
> +
>   static const struct auxiliary_device_id peci_cputemp_ids[] = {
>   	{
>   		.name = "peci_cpu.cputemp.hsx",
> @@ -576,6 +592,10 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
>   		.name = "peci_cpu.cputemp.emr",
>   		.driver_data = (kernel_ulong_t)&cpu_emr,
>   	},
> +	{
> +		.name = "peci_cpu.cputemp.gnr",
> +		.driver_data = (kernel_ulong_t)&cpu_gnr,
> +	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);

