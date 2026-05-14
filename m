Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E98C2DF15C;
	Thu, 14 May 2026 02:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778726416; cv=none; b=jJntrvCM0J4o/szYk8qXDFJrrFtF5DON3p8lMFxx+YJe7HiGJEdJXxDqGNQkypzp49wx4VVkM4SZDi6PN3vUuaTlFk4hMXKxcclgiIJOkZog2ZIO2dG2Dz/koqHQdlNzqjOyJTWRq3w5H2ylUt8bZoXgGWysj85Dzcxv3AHnvmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778726416; c=relaxed/simple;
	bh=lVuF7qeGY5NRmi8B8faninN5ZgbHa74vn9aAT2HHRXY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dRp5iFJQuKvSc4MSHbDJn9qT0mpfWOdu84sxkzNlCLcPjEXAFpi20SSjlFJnaxXMpumR4xjFZreR6FQb5+2M4pTWMNQaNgRqHeZrJXObF7LBPCLxqwONUc/Op5l1Y5DmVJNaPUL6RN0zDA7mTXoDlAF67LrakF7NJgqRI6P12ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=t+jzDyRs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Qk86Sact; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="t+jzDyRs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Qk86Sact"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id E702C1D0005A;
	Wed, 13 May 2026 22:40:12 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Wed, 13 May 2026 22:40:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1778726412;
	 x=1778812812; bh=Bp5WYxy+KBFw1pXOxkE4VX1/R9ROXkt/3sDASssXZvU=; b=
	t+jzDyRsf5AeX8E+8NMVdM1WuIm6R3gHlBHMHO5oDPAFBa8HGjY2ZGBPwbprKnaU
	syaPT78B25eU+rREW4iBahK39XS8xTnrYUnJIsTshCwQAByYTczU7W29sZ926Fbl
	huCksiJ7yH3cLNaR+DFDH+pN0VVJ/g72eQIoKvOJ3a20wn6TgkidfCiF1o2McUz4
	3GsMHG/xi2DXCMooNBDmKnq1EjY4aW/TZ1ql/RLkKyDbIgBq1JnVDuVtNsN2LDpJ
	mTYlz8wLetpqFMEJRuh1+36JZhwG6gVu2x5QKZ4UzUlBxsLmq51ch7FD3t37Mlnn
	T9TvA7zLnIlhX23XYF1xBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778726412; x=
	1778812812; bh=Bp5WYxy+KBFw1pXOxkE4VX1/R9ROXkt/3sDASssXZvU=; b=Q
	k86SactfcuYNZ7sjgp7vZ3egyf753nLmxpqWcs3s6Mtdqqmlfd8+Eu/3cxsZwkQT
	cJvMxjiPVYIIx1q9bxo7x8XNuk/fkB3zCrXVshoU1g1d2zxlK3+GmfRNjqdnknYH
	kI7qV58CnAdKKyWf9xBOxhUe2GolVXPZnx8Vl6jBIJE4UZsXF/HOtTGrxIcIo3u2
	v4djsiTar9AF4sUX8Bb7SBSf8Z86Zt5fYjpuK6BjhROPSN+khKRjUdh72ub6hOgk
	R4dqAm9cNM7YYIexdEsKQqii1f6Kv1LV8Dhxej5HxI8N0xr6Jl6MyCbcSMmtOb0N
	oanMRrSNkK404bWzrYRkg==
X-ME-Sender: <xms:DDYFau-yiIYeKENDahpxrM5n1NyIlc5D6yS1qOhv9ft_456ZLCzYuA>
    <xme:DDYFapi92SpVdlPmFU5xAp0kVfURy1-oYRv4RynTv7NLX0Sz9_p31CAtrlgP2DuDU
    z8pEqpExHrMYshkRj0dXkbGnyv9W4X2DSPnsrBkIRfjV9paFGzSYeU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdeifeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvvefkjghfufgtgfesthejre
    dtredttdenucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhn
    qdhlvghnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnhephfeuvdehte
    eghedthedtveehuddvjeejgffgieejvdegkefhfeelheekhedvffehnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvg
    hnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheprhhhpghkihhnghesudeifedrtghomhdprhgtphhtthhope
    hlihhnuhigsehrohgvtghkqdhushdrnhgvthdprhgtphhtthhopehlihhnuhigqdhhfihm
    ohhnsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:DDYFarHBu2FnBxiZ4oRTzImfotWZ_eqSK0gqX6jTgKdX4APGtvw9sw>
    <xmx:DDYFajzMuKjqlgiuIbPkmiZ_JULsOvNPGUh2pHLouIorLcTbkod6zg>
    <xmx:DDYFagrxZ7UQPN3PCv86N6Gp1SNUSp_hVDapTvLlOL73pBW5Shya9A>
    <xmx:DDYFatiDNZwhBU9mWkAbHB5qpM_4GR8ngZHIfXMHdobDXQLX2zcQwg>
    <xmx:DDYFai9iPL0rM22gpmzLuTMEVv2HszIPf4q8DmfDTKKkZwvEg4n3JEl->
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6F0202CE0072; Wed, 13 May 2026 22:40:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AIcHjEfE2a4N
Date: Wed, 13 May 2026 22:39:52 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Guenter Roeck" <linux@roeck-us.net>, Kean <rh_king@163.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <1d6239f3-6383-4262-97b5-01c289dc5e7b@app.fastmail.com>
In-Reply-To: <6377419e-da4c-4b79-86f5-25417fe6db06@roeck-us.net>
References: <20260514011411.4167069-1-rh_king@163.com>
 <20260514011411.4167069-4-rh_king@163.com>
 <6377419e-da4c-4b79-86f5-25417fe6db06@roeck-us.net>
Subject: Re: [PATCH 3/3] hwmon: lenovo-ec-sensors: Use devm_request_region for
 automatic cleanup
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Guenter,

On Wed, May 13, 2026, at 9:36 PM, Guenter Roeck wrote:
> On 5/13/26 18:14, Kean wrote:
>> Replace manual request_region()/release_region() with
>> devm_request_region(). This lets the device-managed framework
>> handle I/O region lifetime automatically and fixes:
>> 
>> - A double release_region() when probe fails after acquiring the
>>    I/O region: the probe error path releases it, and then
>>    lenovo_ec_init() releases it again on the same error path.
>> 
>> - A release-after-free in lenovo_ec_exit() where release_region()
>>    was called after platform_device_unregister(), which has already
>>    released the I/O region via the platform device removal path.
>> 
>> - Missing release_region() in lenovo_ec_probe() on the DMI match
>>    failure path, which leaked the I/O region.
>> 
>> Remove all manual release_region() calls that are now handled
>> automatically by the devm framework.
>> 
>> Signed-off-by: Kean <rh_king@163.com>
>> 
> Why this empty line ?
>
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>
> How do I know that this review really happened ?

The reviewed by's are correct - I can confirm I did review these patches before Kean pushed them upstream. We did some internal review first to discuss the issues he identified.

We sometimes take this approach with the platform/x86 patches. We can do it separately next time if preferred here.

Mark

>
>> ---
>>   drivers/hwmon/lenovo-ec-sensors.c | 13 +++++--------
>>   1 file changed, 5 insertions(+), 8 deletions(-)
>> 
>> diff --git a/drivers/hwmon/lenovo-ec-sensors.c b/drivers/hwmon/lenovo-ec-sensors.c
>> index b0f2a04ce679..ea74bddbad5a 100644
>> --- a/drivers/hwmon/lenovo-ec-sensors.c
>> +++ b/drivers/hwmon/lenovo-ec-sensors.c
>> @@ -519,8 +519,8 @@ static int lenovo_ec_probe(struct platform_device *pdev)
>>   	if (!ec_data)
>>   		return -ENOMEM;
>>   
>> -	if (!request_region(IO_REGION_START, IO_REGION_LENGTH, "LNV-WKS")) {
>> -		pr_err(":request fail\n");
>> +	if (!devm_request_region(dev, IO_REGION_START, IO_REGION_LENGTH, "LNV-WKS")) {
>> +		dev_err(dev, "Failed to request I/O region.\n");
>>   		return -EIO;
>>   	}
>>   
>> @@ -541,7 +541,6 @@ static int lenovo_ec_probe(struct platform_device *pdev)
>>   	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') ||
>>   	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') ||
>>   	    (inb_p(MCHP_EMI0_EC_DATA_BYTE3) != 'P')) {
>> -		release_region(IO_REGION_START, IO_REGION_LENGTH);
>>   		return -ENODEV;
>>   	}
>>   
>> @@ -579,7 +578,8 @@ static int lenovo_ec_probe(struct platform_device *pdev)
>>   		lenovo_ec_chip_info.info = lenovo_ec_hwmon_info_p8;
>>   		break;
>>   	default:
>> -		release_region(IO_REGION_START, IO_REGION_LENGTH);
>> +		dev_err(dev, "Unsupported platform type %ld\n",
>> +			(long)dmi_id->driver_data);
>
> This is not documented in the commit message and, on top of that, pointless.
> It isn't even noise, it is just pointless (the default case can not be reached).
>
>>   		return -ENODEV;
>>   	}
>>   
>> @@ -608,10 +608,8 @@ static int __init lenovo_ec_init(void)
>>   		platform_create_bundle(&lenovo_ec_sensors_platform_driver,
>>   				       lenovo_ec_probe, NULL, 0, NULL, 0);
>>   
>> -	if (IS_ERR(lenovo_ec_sensors_platform_device)) {
>> -		release_region(IO_REGION_START, IO_REGION_LENGTH);
>> +	if (IS_ERR(lenovo_ec_sensors_platform_device))
>>   		return PTR_ERR(lenovo_ec_sensors_platform_device);
>> -	}
>>   
>>   	return 0;
>>   }
>> @@ -619,7 +617,6 @@ module_init(lenovo_ec_init);
>>   
>>   static void __exit lenovo_ec_exit(void)
>>   {
>> -	release_region(IO_REGION_START, IO_REGION_LENGTH);
>>   	platform_device_unregister(lenovo_ec_sensors_platform_device);
>>   	platform_driver_unregister(&lenovo_ec_sensors_platform_driver);
>>   }
