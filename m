Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DD13438B5
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Jul 2026 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915867; cv=none; b=VvBtjOU591GcOTTWaVetss4XUq1rAlSIVdJJ+iXOUMA41uYhk/ny1hXzQdu/wMBa5nWJ5EDm3u4Auk3NIeK74vYdLXWuMZ53QXrFbzET5Ih2D70Uto1lfjvyoyoqAADmi7R9eb+8PPlGifSeAspo8dUWqXwSzQKzkU5vE5k1Kb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915867; c=relaxed/simple;
	bh=WjX6Uv6PwaQ78oIsHVOsGi1i4g+J/hD1ZX6kfwXpHoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pvAurlRlHMBKR4zWS4j9HYoKCRKcW+1FqYymTU84vsNasNrz7RQMzVwCNc9wGAbJNqi0JRzoGd4b0CrPMJrBdWpwPa0AfdLwbCik0ZJVwMW8axOAnZC7PYZ15hH1jv2N4dHzT5ouz9qwhfRAHNgOXr5Cd99nHEWo5TPkpj9KhUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJnFtCaL; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJnFtCaL"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84794e800f4so364209b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Jul 2026 07:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782915866; x=1783520666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cQgE5Coeqhf4kFtxJ/8eUiYVdplw0+IBrf+l7oeSMjE=;
        b=XJnFtCaLSV2bv8m2YP8NcQeuzF2zKi8y1XSs1fG3HAzYKxaCKNyf3rB0HDyfFvGX+R
         mz3wrlnNNCNxKgsesAciCJoGxstDGsHiBgKkHnXEZi52Q/DgH9rI8xIFqjJB1Arrs/t0
         3KUu6kKAE7WKswf6yrD7q5U5F+AktYWezMVfaV8VLBEy9/08UPo9JYU6dGEjjvJF/Hff
         hOhyQRo9R/HFaFzQbXj3RmBHo8gdFPcG+b7hXb1/SZpUBBSUWXy2IrTb8oqiddVCrfLD
         1rN6RtGGl0TvgSkeubKfQs3z7TzusB56qbXCb1EnpnEf7W8N1Y6P1tB1nuNESIp/RRGI
         ZKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782915866; x=1783520666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQgE5Coeqhf4kFtxJ/8eUiYVdplw0+IBrf+l7oeSMjE=;
        b=ji2DG9OJGFvGOPs7Vjet4t35Axz7MkXn0uSAzId4vVygO0zKMM5+RN8avwrL2NuQ6G
         vLJbVG5AkkBgc8BY8ky3y7XfwpJ8tOiT3r9JInTtOqKHYFw2gv5WOF/LEG7mtz/wzBZ0
         AjkYNXZWE98MetyZnE8GrpB0AzDuTxYQVb3q06LKJGeCEf6HGm/ljwENK18Bq6+XncvE
         td/3oBQokm8MWxzeJceXdxNzwa3kRAehuD3X4Q/10hYJu7cvueY8pssN1+5Ed9okB/+n
         29mddRyskNjwjWwXPXO86Oi/qgCZFW3P5ZNQVatOMqPg3xTXEmxR5N2cDIh8oAmfsY+8
         tpSQ==
X-Gm-Message-State: AOJu0Yzy4vrImdiKVBsXoBCk3Q4E0gjntCl7WplpNg6ENVr7hcL5ic5s
	G/ZgbXxaJIFxZtNQ0fSVun575Y1xYW36MNc7+mkohQ+7h39tSD/2TwPz
X-Gm-Gg: AfdE7cmnwYUsGmrEt+xF+zghs1JF3gosmBOmWzId+wvX6ShTa0YhjBUUBkHy5b7ueBx
	f1uttgU9lqsPv4UBRabYLFxN3qhShVESVtr5YaaQmfr0zAQqwHr4UAOQRawPLexMyJfpObKOkyP
	7k78MuVbgdxlLT+Ttp62a7kRA6Nf2VZXx0gjg1s9GHJZGVHQEBV+4NROT7bowUOLYNq9Scztn9J
	WtcfmZuOhslLpGdbPg1LGS+ACCky6yf31KKdhKU52xwx5LbPcf+NVDqYPJo1mRbTPLi0wLaj9jV
	qJmb4NIjFhpGYeh7wyvquvHyHkB2w6b4faeP7JB9abzcgcLkzXj59GG2gmI4dAM0OA1ZeEYx3b4
	57n+KUiQtjeCjd8/pEkwsBEHCVlabYuzN8dSF/u53RHSb8LGdTWRpvI+RBuJ2cS+MzaChEh1XaR
	EVnQP7DMnMY+5Rr66qAGrkhCOtH8khaQDSxzKciidcHahENL/p1zfb5GE0nHKQlw==
X-Received: by 2002:a05:6a00:2986:b0:845:e3af:dde9 with SMTP id d2e1a72fcca58-847c51415e4mr953263b3a.38.1782915865802;
        Wed, 01 Jul 2026 07:24:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a0003615sm4160058b3a.17.2026.07.01.07.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 07:24:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <648a6df5-56ae-4e50-b1be-5ebc834d6866@roeck-us.net>
Date: Wed, 1 Jul 2026 07:24:24 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hwmon: (emc1403) Add regulator support
To: Svyatoslav Ryhel <clamor95@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260619103153.216444-1-clamor95@gmail.com>
 <20260619103153.216444-4-clamor95@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260619103153.216444-4-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/26 03:31, Svyatoslav Ryhel wrote:
> Add support for VDD power supply for this sensor. It is required on some
> devices for the sensor to start up and work properly.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/hwmon/emc1403.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
> index ef1ccb40ed6c..d14bd90ce424 100644
> --- a/drivers/hwmon/emc1403.c
> +++ b/drivers/hwmon/emc1403.c
> @@ -19,6 +19,7 @@
>   #include <linux/mod_devicetable.h>
>   #include <linux/sysfs.h>
>   #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>   #include <linux/util_macros.h>
>   
>   #define THERMAL_PID_REG		0xfd
> @@ -660,6 +661,12 @@ static int emc1403_probe(struct i2c_client *client)
>   {
>   	struct thermal_data *data;
>   	struct device *hwmon_dev;
> +	int ret;
> +
> +	ret = devm_regulator_get_enable(&client->dev, "vdd");
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to enable regulator\n");
>   
>   	data = devm_kzalloc(&client->dev, sizeof(struct thermal_data),
>   			    GFP_KERNEL);

