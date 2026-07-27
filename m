Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E3D22A4E9
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 18:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785177927; cv=none; b=OwuEu3sVSyctBugvwyGb84pHwffNBnXIy2TxdMnDIUxQGN1BkJ4O5fsvU9pcwnoT4PsklOHh+b9D7S16HEk7lGG43+eTwBtic+BZ01oGsOEUnuP4HbTbjLaFBGEvmapQbr7/gQo1cUGWuJlLjSnQ4723A0Q5DAEx6ryY+pcDfaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785177927; c=relaxed/simple;
	bh=4z1NsjoDz+8NMmdfNXd2JSQjhn+mO1m866wKKXiZrcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bJxuea7XSSoZohz6iulxmfbkT//WAqGhbY9iworgOBbX0UEaZ3TTQiZCWftY0knr79ndNjnQDGEGCQmPIwhvClxWI7ecVquntsqp0ExQhChIxncjPGPOkCzJetJUXu3NtWZfA0Kq8i7y4gywWBYhG8Z9SG2A4bgH/xsKo0eVKRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ReewmUm6; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReewmUm6"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1572987a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 11:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785177926; x=1785782726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dsUXNZMSlKgDJS09Q+caWcCdRKSnktvHf8EG9Cg0fl8=;
        b=ReewmUm6jOyE60tn1Kq3dlNmdS3A6sbFJAksoGHUyQl5PzgKS9g83gmkB0XSzo2TOL
         XFABtrVlb0Bh4dpsxpo3FvOkJsOUEexu+tIkoBcyfInf0syYzGwn+aG1japUKFeiWSpn
         FRvK/kiGyPLVIuyHf9BPMQuusHV9bQegszEDvlx0A4H0gzDNvJHZJQPEo/ju35rByXXu
         b2daFNRSS8Gba/bByR4jkd/0em7CwOFt3CqJ6bQZoJrEVdDdjYtNYC7h2Se2BfD98BHE
         i9URjL7dxz4pFrWRncAJg5tR4MOnEA9cLBmlY6Rq7orgCNzswUP0YHdEEj8X/Yw7wIED
         1CPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785177926; x=1785782726;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dsUXNZMSlKgDJS09Q+caWcCdRKSnktvHf8EG9Cg0fl8=;
        b=ZlceQepz3NmtPWYLBZor/scEAGNgxPC01TjiyAtzteE86S4J1+oaLzMhefcNb5Xg1F
         ydJg1i1Uoq3el/JATcJ/mTdeDyXYg/br8/mYOLxA7Jbp6aSYCNMy6a52lfdzEdqU+dBD
         zb3LhNz+acdl8sVQv2hq7aY5L8hqX2J+CbedVOgk3oWQHapVHtfRkLuJH2Yl/UrKrczi
         Hy97wbFOXB0NqvawO2yc5SKzfWmt6g/fMWZS6djcUh4HOrsjk6QtGjz3qWoweWQ4TIWL
         hCeE9mUkqXBDR628A/eZDEPrHQ1xlK8LkI5Wmn8HSZCU4O0LrgDQFN43qL2U0Sx+BEKN
         h0Dg==
X-Forwarded-Encrypted: i=1; AHgh+RqUvcUFiPd3JpDpsCCqSKcX+O5zWixwXdd13ZsyaBXSP4WHwdZ8mF+83dXtqXXXf8hbbOXfMGfMsGibfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz55A+7EZofw3Hm+Mhw0lPn28owGdn80yFSIHCSJJZ2jvb3dpUM
	5hDpqahT/qYYYYuNJju5VKyqz/5qn8jghYjRysmOuf4fYnACuIGXf9xW
X-Gm-Gg: AR+sD13M6o9CNo+p3YivOwl3DBOw4BOqRfCs/wBTNwyRnEC5L/bso2719fegZTtmW7i
	7wszDb9eO7MQAFqTU5I02K7t9n+fnmfDOkKim079LnCbTFtf0Q1MZ1+ij2cy3l1NGkss1ug1cVf
	6ox5jaaEDdGJOIJIQ7aAsRFF+ZH4PCYFkI39xM9xJBOYWDjxFTtn0Y1smNey0QW1jTURkRe1svf
	U2ukhNcTtIW+6pR5taKDiipAE/mtgGdj7Lkr4zs9XEMhP/hKsNzPWiZG23rP7TPyuTbOVca1PeE
	cNYcDqFyyKfVn/jBsynyLIebyoSHvhabyD8f1FWnlN8FBihH/QK6/NjJO8BN94LY3/O3vLUe9vK
	6C2cSjd+coJYQxyvYY2So6m2RpAFCTOX+gXNyN0LGaa/oFTCw5L6CqKyO/71urF+Urqt+2UukXT
	RwNuXIwNKi6os0LGjcX4rMdR9DAZjSFWF9ZzQDndaUHsos7LvgalY=
X-Received: by 2002:a05:6a20:d52b:b0:3bf:7994:ddc6 with SMTP id adf61e73a8af0-3c67da72a04mr9839760637.25.1785177925865;
        Mon, 27 Jul 2026 11:45:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc549cacsm35100888eec.16.2026.07.27.11.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 11:45:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1210cdb6-29a7-42b6-858f-c64cd959dd28@roeck-us.net>
Date: Mon, 27 Jul 2026 11:45:23 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
To: Dinh Nguyen <dinguyen@kernel.org>, tze.yee.ng@altera.com,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <cover.1784785709.git.tze.yee.ng@altera.com>
 <a79aee37be7067691fd02a3a9cfd134c995e5a95.1784785709.git.tze.yee.ng@altera.com>
 <f49363e9-2f48-410a-9e77-9ad14bece7d4@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <f49363e9-2f48-410a-9e77-9ad14bece7d4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/26 10:02, Dinh Nguyen wrote:
> Hi Guenter,
> 
> On 7/23/26 01:02, tze.yee.ng@altera.com wrote:
>> From: Tze Yee Ng <tze.yee.ng@altera.com>
>>
>> Add asynchronous Stratix 10 service layer support for hardware monitor
>> temperature and voltage read commands in stratix10_svc_async_send() and
>> stratix10_svc_async_prepare_response().
>>
>> Register a socfpga-hwmon platform device from the service layer driver
>> when hardware monitor support is enabled, similar to the RSU device.
>>
>> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
>> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
>> ---
> I've been taking these patches through Greg KH's char-misc tree. I'll wait on your feedback on patch 2 to take this patch.
> 
If with "your" you refer to me - I can not determine if Sashiko's feedback
on the second patch is correct or not. To me it sounds like real problems,
but then I don't know the code well enough to be sure, and I don't have the
time to analyze it myself. So you won't get any feedback from me unless
someone declares that Sashiko's feedback can be ignored.

Thanks,
Guenter

