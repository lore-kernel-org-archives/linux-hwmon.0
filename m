Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124AD1DF97A;
	Mon,  6 Jan 2025 19:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736190132; cv=none; b=rS52JDD8Ei4nBHtpbZlfsJZafh2tl8LLLKILKAuDS2XRP+ZLCPsuJHl2cZf0joAuw01yDlVMcyexSAsfjoCW1DFRYUWc2PrlO1mn+2qVB2VrHQvYV8TXk7IeOyqD4L5ydBxK5acynZtuv6rOerundsSwNyw3RqCmsp/Epu5wwQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736190132; c=relaxed/simple;
	bh=i8yNwb/HzvpkaTSwP6193OCu/9qJd5EM11BonVFsRLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Y0sRKWsLU12uW5dkgSVLXvDJEfAk29szZe2L03o+FpIzWPj5qn1/UGqiD6qd0nG390L4Z6EjfPqOc4LyYgxuh+6iL+P0KYnPOtH2euU3N5YntwudwILRamdGCjESbKTWLUiWc40RcHe2ufLApn2RL0iT0k6A6YZTvusENb7fGXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlAVQ139; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlAVQ139"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21634338cfdso15540155ad.2;
        Mon, 06 Jan 2025 11:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736190130; x=1736794930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAhmYXsX2kla4nBkLvW4Hyi2aA2gDgjaSkEwaI3Nur4=;
        b=ZlAVQ139aWz6j3JUrcfSEQ9yKYXAP5q0d6gVqZ4hI/6cPW7+C5UHg5eAOI4yzgJtql
         hAPnBqNsbKF++0pol4X7nfKVOpl5mR939lPgvvIqw1/Lw5ZEbnoPtjZPYdbAUtlw9gQn
         pSxEQM7fS+hiQI3THTZHYAgIshnNtVDqd5p9QAyyRKP9Qh+1RfcuuPwQFq0+R5+knpBe
         HT/ET5r8eaPxNwuuEmtLCBw1m3mKcZ5LLxMMx6s+eATP1RDMWR+f7G0tqWlu+rdQVKP4
         7c+PRUV6G8rTEKRkK6rMbMkXX4ARWV3u9v+l5Zbbtft9WAVYclRDFbRW1wtiPQMxTkqt
         Bs+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736190130; x=1736794930;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAhmYXsX2kla4nBkLvW4Hyi2aA2gDgjaSkEwaI3Nur4=;
        b=nerF79s/5+bPQn6mj74kF9iElkBZ96kGa/J13hWkYSkpX0zxsw79JQe5jOwv0mCboW
         thurmin4ov1xT9Rs6saFwAjwIZBI9IKIUjBG9ljODV/ZqxQO/6uI8B/mVCyl2SSf9T06
         xjERHxPSqtFstTQ2NoIDxRWQnzrWRG27z69yAaEintKrM1aNGwsoG2xntnMKATYuEwOS
         XIFcRlhN1fQNdSE3CVGKiZ88dTBM/ps3UuxOlrmR+ifJTHkDBv5nsh6gza0l4Ztoxuwv
         7XlNW6uX9dZ0eP8mt5k3YOfcU4wJZku48YzNwk3sFIna+Xsq92oWKPXvsgAIjG7bo0TB
         bWaA==
X-Forwarded-Encrypted: i=1; AJvYcCV1+gpqFa9DDFZAdoZ7WuPeJGyUwVhq9WSHNWQCKKRIZNwrLDZLH/t09SS1Lbf1bOzw8gwIozAEsljzDw==@vger.kernel.org, AJvYcCXTyLdDSVeSmcpnTs8xPep9OV+cKROFklCsNRfgPHE4coDoGBaCP1w46iSLURU6aAy/pDJT0tqM2ZuQptdF@vger.kernel.org
X-Gm-Message-State: AOJu0YxgPuuvT1AY49j74+XK+ypbaXwGig5x8213iejMlA/AfxOMftlh
	TXHA5lFMtwT65l51Sba5gQ8MN/tfH6JsKyInzZHCFguOKB5MliUn
X-Gm-Gg: ASbGncv5mKpgrfxyf8bbNGWgCK3/nw3zmEO2av2xpymds9W8zAFenMMHyuSTX3F5MAF
	fRKC9GHH/RxTn23Y1UjxpmWJ9JZbyx4x/d3RPw/z/uBPCgwvzNIOCbNGSkx83vFm3Vgwt7fCe7I
	EfSYPWbMRIP5IrbyTBlQjpGlBkPKfRu/PC26l7OHrwnxrhQUeL05vB0cEfKfpqm+Omk3H7NV6yz
	0pRRBD0oUV63+F6pjGbDZDbbkL/N2Q0oF76elPGuaWkxuoPfNOZCzhOtg/r8tt2LsPwfrjHriOw
	GvNEP7k+iubhPskZjEs2wYPyG8zl4w==
X-Google-Smtp-Source: AGHT+IFIHIIZiXXOAwBwAsJYyjD0kJFf6/fHA6cDZy1R57DskE/KzFbyua6Ud9S9MKxMURHUyR7a+Q==
X-Received: by 2002:a05:6a00:a91:b0:726:c23f:4e5c with SMTP id d2e1a72fcca58-72abdd20f88mr84285090b3a.1.1736190130340;
        Mon, 06 Jan 2025 11:02:10 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad84eb34sm31879240b3a.87.2025.01.06.11.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 11:02:09 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c3be75de-c399-473e-a4ff-725159392f4f@roeck-us.net>
Date: Mon, 6 Jan 2025 11:02:08 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon/adt7470: allow 'fan*_{min,max}' to be reset to
 '0'
To: Adrian DC <radian.dc@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250105195521.3263193-1-radian.dc@gmail.com>
 <20250105195521.3263193-2-radian.dc@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250105195521.3263193-2-radian.dc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/5/25 11:55, Adrian DC wrote:
> Tested with the following script and values

The patch description is supposed to explain the reason for the changes,
not test results. Test results are useful, but only appropriate after "---".

Guenter

> ---
> 
> {
>    # Access hwmon
>    cd /sys/class/hwmon/hwmon1/
> 
>    # Set to 1 => 82
>    echo -n ' [TEST] Set to 1 : '
>    echo '1' >./fan1_max
>    cat ./fan1_max
> 
>    # Set to 1234 => 1234
>    echo -n ' [TEST] Set to 1234 : '
>    echo '1234' >./fan1_max
>    cat ./fan1_max
> 
>    # Reset to 0 => 0
>    echo -n ' [TEST] Set to 0 : '
>    echo '0' >./fan1_max
>    cat ./fan1_max
> }
> ---
> 
> Signed-off-by: Adrian DC <radian.dc@gmail.com>
> ---
>   drivers/hwmon/adt7470.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index dbee6926fa05..712bc41b4a0d 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -662,11 +662,15 @@ static int adt7470_fan_write(struct device *dev, u32 attr, int channel, long val
>   	struct adt7470_data *data = dev_get_drvdata(dev);
>   	int err;
>   
> -	if (val <= 0)
> +	if (val < 0)
>   		return -EINVAL;
>   
> -	val = FAN_RPM_TO_PERIOD(val);
> -	val = clamp_val(val, 1, 65534);
> +	if (val) {
> +		val = FAN_RPM_TO_PERIOD(val);
> +		val = clamp_val(val, 1, 65534);
> +	} else {
> +		val = FAN_PERIOD_INVALID;
> +	}
>   
>   	switch (attr) {
>   	case hwmon_fan_min:

