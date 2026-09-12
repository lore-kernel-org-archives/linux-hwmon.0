Received: from mail-pz2-f25.google.com (mail-pz2-f25.google.com [74.125.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD74309EF2
	for <linux-hwmon@vger.kernel.org>; Sat, 12 Sep 2026 15:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789225865; cv=none; b=HTdcHIBiSLNJ+D6cUh5MoWiGYe1+bFK5CHQkRMF8cf5t5hRXSKQfOzDVxgq1uzY0kO/QHpLDNzmfumP45Yzz7D0cL2ngWyTgFIVMVEy6LwTtVF8Ws8u5my3E1OfGMQN7n7hGelyogQ7VMyNtUKl8u03+EmafppZUJlrqIfQng2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789225865; c=relaxed/simple;
	bh=454gOSjSPXq1dlADuv5BT6iCdaMAuIelnQuaGmfZOwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Il3u8MXdMOiVHR/3Wh8RD1jIid/r+TEv62F9bYRZ6WneaM0VRDr/QHt7Kiei0GEYCgxp9y4xu9z/AVza0KUcZ/+uQw5YyCNyVklAHKqqqQFU6CHWFE7dLJtIB213qZtp9lDgavLDyOhQYXMxvBGWIT5xGtPh/8q8qRkgQKncqGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoIAAmjm; arc=none smtp.client-ip=74.125.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoIAAmjm"
Received: by mail-pz2-f25.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso781882a12.2
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Sep 2026 08:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789225861; x=1789830661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwWJbmOTPaeL9kmJZ34Rm916nOQbLgwTXi0dTNNuCMI=;
        b=CoIAAmjmk2S4f/ZChAm9MrULOCt9GzJbPZGWEvs4kVTg6NmoiSgAvE3VMn7FENX3xg
         0u6WzJY1HQHdpiWoh1RlRDsPA0N+UrCZrRxNYs//El8JW4sqJDJEhCXBJahTWuV2S8in
         Cs58/vJU7hhcQiqpXZfb0pVjcmYo98jgk7cFz0ZfTQMuBeXRdc5hooJikho8crOuaNML
         F0taJtqbdAy8PLJh/NczDm+Ns8H9/F+HUSaahvL5zC1XAe0nE6PLnZyDTcYfs1bC5pIF
         zds1qLtBTuKph5vJ2etshSpq6ubHe4SXxvtFLCc7E+gQlArfEVRTpRyRAIadrQYZPnZG
         hiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789225861; x=1789830661;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lwWJbmOTPaeL9kmJZ34Rm916nOQbLgwTXi0dTNNuCMI=;
        b=dWQs1SRTPVxN6R0CNLUAQkYEhExJViOpK50kjl8fD03jD6sOI1BYzBx2zkhlXlqGi0
         OLXTSmfFUlVW6KLUO2DiNwL75qEmP1976OqYliSNgLSAZipIgSDQcuoge0IW5IrSDE/y
         vP36VbGvFcbhRkNS782cwziBbmL4ohyDkgIywFga/POyTzDpPHfMhkRycIW5qDvnqdMY
         ptDVwms3TP6Xn7Xj/dpQ3YuE58v4kjBeThjM4g5Rh6MTlXhkAbh1FA/4w6bG70wu7/LL
         Aw8srQFS6Weznc5KjZ+WelwnKOMujjdb/2xi5GOOk2JoS2mSnSC5tOSeAZIbPqKn1n44
         o2WA==
X-Forwarded-Encrypted: i=1; AKwUvBw7HeIR7vx3wqZ9Zp6+ru6Hij8OgceuT8OXaJ594fVGsKMshsG4OSh8+ajk3i+5MdSyWp+axdwWQlsdSQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lGvi69babSKeAQlRrPTeJC0PBmXlV7FjI0LtW317StV9nkDZ8Z
	/WNH15Y0eaAalrUFd5qyVWlR044cCrFZ+FoRIazvSS+n4+yDGNk11MRG
X-Gm-Gg: AYBFou1IhhwM0FRVtJMB5OlYatpKEeI3d62OXfIvlq7+w8yXsVdesHx4oAWz4J0vpUI
	gVoTrvad0no2XLD2d/5RnNiwirBOD1ZzZ9wxpPYvbOE0aofem+5jw6rhg364DR7nzJSi/AZqXE3
	E6PZ+3y/i64M+Sx5TDk00eQCcdTOGfmsjCFD7vUbSW4mAMF/AW2Dy7gL9vo4rVZEHp4ERstvvLq
	3PdhT4SY8okLgNqIYCG5z1BksCJBZb/i9gZ3jPOrhmNmAwDwhAg43x+UVMFZFYGAi69EajBlMwM
	6hEDROHl6SbHJgnBP1PdGMfOzsKF9Cfk+Nu3W2sXm7CJvts8Pv2w8/48kNKr+u9jvmCfWzjLmXr
	VxckhJR6hMui8CVgp0Y/Be3qwX2IGSx0K2PKBpf5EWqJg8K4s2K8+uRv7St+h7QPRdmWvBLIfLq
	uowAq5Nzy2sGvk8ri2z6CzzjwxgbihOPxi0VN0iEnbMl5AroIqU47WtZP6DdDG3tlA8dqYo4P05
	f8zNPofoiFbE8DTStLwjW+TDWtvu2rt4wN7mUI0AJ6Jrc2p
X-Received: by 2002:a17:90b:1f8e:b0:398:b88c:2b7b with SMTP id 98e67ed59e1d1-39d9bd9917cmr18150781a91.8.1789225860997;
        Sat, 12 Sep 2026 08:11:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994cf9a6sm10595547a91.10.2026.09.12.08.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 08:11:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c89f582d-57fe-40d5-835b-5e5ce38daccb@roeck-us.net>
Date: Sat, 12 Sep 2026 08:10:59 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] hwmon: (peci/dimmtemp) Add support for Granite
 Rapids (GNR)
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Iwona Winiarska <iwona.winiarska@intel.com>
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
 <20260903133408.110847-7-changhuang.liang@starfivetech.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260903133408.110847-7-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 06:34, Changhuang Liang wrote:
> Add support for Granite Rapids (GNR) platform in PECI DIMM temperature
> monitoring driver.
> 
> The GNR platform has different DIMM topology from previous generations,
> with 12 channel ranks (CHAN_RANK_MAX_ON_GNR) and 2 DIMM indexes per
> channel. Define these new constants and update CHAN_RANK_MAX to use
> the GNR value since it represents the maximum across all supported
> platforms.
> 
> I am not sure whether it differs from previous models, but on GNR,
> requests to read DIMM temperature thresholds (DIMM_TEMP_MAX/
> DIMM_TEMP_CRIT) via PECI are rejected with completion code 0x90
> (invalid request). To handle this, the read_thresholds callback is not
> defined for GNR, and the visibility logic is updated to skip exposing
> the max and crit temperature attributes when thresholds are not
> supported.
> 

Are you sure this doesn't just require different parameter conversion
when calling peci_pci_local_read() ? The translation from dimm_order
and chan_rank to the register number seems to be different for each
architecture.

> The minimum PECI revision required for GNR is 0x40.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>   drivers/hwmon/peci/dimmtemp.c | 36 +++++++++++++++++++++++++++++++----
>   1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
> index bd3e8715dfec..9e98effeb928 100644
> --- a/drivers/hwmon/peci/dimmtemp.c
> +++ b/drivers/hwmon/peci/dimmtemp.c
> @@ -34,8 +34,10 @@
>   #define DIMM_IDX_MAX_ON_SPR	2
>   #define CHAN_RANK_MAX_ON_EMR	8
>   #define DIMM_IDX_MAX_ON_EMR	2
> +#define CHAN_RANK_MAX_ON_GNR	12
> +#define DIMM_IDX_MAX_ON_GNR	2
>   
> -#define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_HSX
> +#define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_GNR
>   #define DIMM_IDX_MAX		DIMM_IDX_MAX_ON_HSX
>   #define DIMM_NUMS_MAX		(CHAN_RANK_MAX * DIMM_IDX_MAX)
>   
> @@ -125,6 +127,9 @@ static int update_thresholds(struct peci_dimmtemp *priv, int dimm_no)
>   	if (!peci_sensor_need_update(&priv->dimm[dimm_no].thresholds.state))
>   		return 0;
>   
> +	if (!priv->gen_info->read_thresholds)
> +		return -EOPNOTSUPP;
> +

This check is unnecessary: The attributes are marked as not visible
if read_thresholds is NULL, and this code will never be called.

Thanks,
Guenter

