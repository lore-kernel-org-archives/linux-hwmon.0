Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398F129D288
	for <linux-hwmon@vger.kernel.org>; Sat, 12 Sep 2026 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789225097; cv=none; b=FdF4lYMUwsw/9If0325TxThXNtNkpqXPgDVkfxWfunxjn5lRzlCe4yxxEwrHL8LGVS+mlIyPHXnPIQoOF+dTcrw/wC5yzzlN1QwtesX5LYyXZigVHsKWCj0JwplGlQLBRyn03sDatuWrrA1/LxWQoAQCNKQbs94KbHewWibCHU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789225097; c=relaxed/simple;
	bh=DwQh+/xadZ9FUW5QShYxj1ADN6uyUnr/Nr2NR81o4E8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nELOIPkVSn0f3fvgkt5hYogqcijQIyQq1IwGIMdpJaJ8SYPXsuNghDVruZO/4IxJnS31/aihi3FOBxqfebHmgiCRLyfnoxalC3oYANXP+dPFQH4WbdovVofEDH+mbhte641oyulMIwGkxnHyUNXTYEhmyc53FWDhAayvTQZJFvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oXorFWqg; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oXorFWqg"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50dc3so345286a12.3
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Sep 2026 07:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789225095; x=1789829895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eg+Cx2mHq8xuMsQFumf2bryL3EVhVNeWJmOvxvc1Pb8=;
        b=oXorFWqgDGyP+nYVgVBAWOn/wU1VBE7qJlC+OkIRA0T/A6ijBSJ/4JtzxAay7P/x+k
         QOxk9PxRxVwkf0D8Nmm4UasqDbB2nHYSW7/x7PJ+I6ETKkMYSkP30CHFEA6VPWIAOgUQ
         8r0S1/O5UnfY0VM6xrXELfpY89N5jCaI3wYnl7O89R3pIAyRm0h1m1ihC8QKssRYYUE8
         d7kJv6CPQj6PhYd6GrUd29udWPQPwazUqLwNtaGCJ4hayoxbgKbdBuxTkekXMBp1rg8u
         4/09INvlynMD9HHHEFghjFlBz/tmgnmKBzVJBhPZEH92oKcfI9z4JPxIiZCEuy9iL2Kh
         LZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789225095; x=1789829895;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eg+Cx2mHq8xuMsQFumf2bryL3EVhVNeWJmOvxvc1Pb8=;
        b=Pv9k5PLRr3p6hmGedgAzDRoeOfMmYyVngqqDDFI+t06qOTvCmo/JWbvQki3YwWxPbB
         VbbwCb4Ml9bzSJDOiAoaJ3htq5xZglFnX+EjVAoJ/3FysrWK+lV1Rz4VNHsoT9YvJhlc
         OmeeNJqYEKhgr/jBaXIJAZHyQ03V/zO4z+/EbS1wSMazC97bq/vUAFaeKThJnHSPF6M/
         z6eZcAkXN3gxgVLsENnLIRcS0qunqN+8OeerqfM8ZnGOIXZtDebOSU3f72zad8/56Iqj
         sBxiJFL9sJ56vUgPb8bWgXkOi0G0eRSlI9SE+AfrlHDCPzfvPiLIpumthp+28t90JT+2
         l1UA==
X-Forwarded-Encrypted: i=1; AKwUvBxG6bvT+RmHWfJbW9u0q9i3FGmuTHCfZmWmO93evM8JzgvqZ2cKgRDArvjH7Il9Zt0qmgvXPPho7zuVEw==@vger.kernel.org
X-Gm-Message-State: AFuF++lk4OVlqPoSibOGhjQdKkmRLyWHlFLpJ+yQY+B2spgbT7oh2D06
	srowDaiTB5Ugqu++Iaaa8RTyg6en+QwaoTuaYRK+br+D9OCpHASc2jEK
X-Gm-Gg: AYBFou1yPe34xE0JYPp4EyJma21wi0SzviakW1oL51Plh6qFBqCXPJnqV3RiSYAh/04
	iDy4xAD0NO692jDfvjaNwHBOOtTliApzcRKoQnpoCq7g6U+sWNLml2IXeDNKNKbO6uSgAGbzRq4
	7w4kQq11hutqbtwQAMa38acq7o+QO4RY0i3z7h3U/tf+wGD7gzqMGxozIf1FGszX5oFDYJ+Zi9q
	hM4pNXpqhDXmONHr4LqL8OqJq231p6MLwbqcIAE7rihfSlm+YS1DXSb5DIMZ8aTnz4ZMbS+CfK4
	gEkTyFsteEXiRp67MI7I6TYW3YmsMvKhqoxj8zHotzUWxEQH0zEeJx4Ueas0ehdrqlfFPt1NTke
	2pSUPzIZha6HNKzDHC3rpdl/hkfFYLFWCVJO9vbu/95GMhOQYYmUvzCBi1Fw5QxaIxjfclMJJvT
	rT4pyvOHvwf3VAtJjX533uMmggey5vbuyXH+ogXHYof6t38OvmTIHTgqNnJDuQKgpGjaAeWjYtJ
	F4wozm9Pt04Dieg5BLyEp1IKu34Y4Pidp5bsu4BFrbEwRRl
X-Received: by 2002:a17:90b:53cf:b0:380:540:d499 with SMTP id 98e67ed59e1d1-39dbbeb3c67mr5634290a91.6.1789225095539;
        Sat, 12 Sep 2026 07:58:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9d554220sm3250791a91.2.2026.09.12.07.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 07:58:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <33b90bab-8562-4638-a981-70f11459d380@roeck-us.net>
Date: Sat, 12 Sep 2026 07:58:13 -0700
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
> Define new cpu_info structure for GNR with minimum PECI revision 0x40 and
> the thermal margin conversion function dts_ten_dot_six_to_millidegree().
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

The series does not suggest how it should be applied. Technically I could
apply this and the subsequent patch. However, it depends on the use of "gnr"
for Granite Rapids which is introduced with earlier patches of the series,
so it will have to wait or be applied together with the rest of the patches.

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter
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

