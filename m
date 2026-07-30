Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62685417D7E
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 15:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424266; cv=none; b=jPFXMVmnOsBlgUIZ4wxI+lWGPyjokMd3QuadXKh5sMkqM4CcptBU5KIALApt69nzQ7nyzOFktfM6VDwTCeLLglpRYq2cYSACK4Gu3pIKR2d/heJtOk9Tzloha+8/g1F+ly62DR1PIoe5grCk6l4XWsCX4tAgsUi/l0aT1p20N3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424266; c=relaxed/simple;
	bh=F5cDlmmaU5YiEDLodaR019jRhp+mbsp9hYQy41TO3cI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMFaJyEC0IY+/fYZPYX1OayMtlt/GWXuA33wLKpC16TlqWE8c1v6WhW1VMDXBDmtoxmn+Bczj1e1AWxAV4Vnciw55858vZInempE2nIUW7Ynk3vB3BY+Dd4sWdC4InUirA/OvsKHUvMZ81WsaGabEigJj0Bg2T3p+QEor3pb9VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmMGy7hV; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmMGy7hV"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1316775a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 08:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785424260; x=1786029060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3AtAeMvB7ZMtK3nRoTe2cnXsW8WPJwBbelRG5gH7yw=;
        b=DmMGy7hVCIu9NOkONX0FrJn7WwMFT5233pIIYgMGgRhtvMfwh4J3yD+qptOSlfEKoC
         xI+QrMcQnpB5oxqHtXwA9xyCIPrFxj04UH2JwUjtBvl5hc+ACP4PyO/hrUIm+KrWdffX
         SduUVpZYb+F9DBEZ1A7WxiTr/EuvgBY+wPD3LL1LtiNTKZSFpVZgXUwtYKtC1/X/7GXP
         9a2SsTk0xkXwbzbyTi4k9/iyn61tABl7H+uv4i7zvZOuiLvJwowYADdJ7cjxFVQi/Xty
         ur8y5SueyfW1hOH2dP4J3JixfvBeXTBbFVJXZ/Ddz2SqTqZnOn67+n1ClHTQ9yTI0z63
         e69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424260; x=1786029060;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n3AtAeMvB7ZMtK3nRoTe2cnXsW8WPJwBbelRG5gH7yw=;
        b=cU3T7oWP+GtSVkPqvclUFxUi+AhiQXIUzitX641caO1xTiAVkrZmG4lZwq6Z8HfaPl
         MVCMndcnrgekWPGopGLVxkEx619SvEQmbH1S7mdzvro/CNrEq1ComktInvO5YJVy76Dk
         FBhgmbe3vsFZCjC/DgFUCCsitMLRfFD6G2OjJsFBVc3aGNRi0z2Vq8QaxJ94SlkBTfs8
         Xx6MxHELbztDWuQpnnx87qe43kUrWE9+4g6I3aIkpjLN672XBkeJAt6ES8kshDBiiYvo
         lqET9rcCUMm4Tzi8MmknY5QFgsSREQPWZ7JSzw7Yl5bv4XerwaEO/Op7L52Q+5degriQ
         DU0g==
X-Gm-Message-State: AOJu0Yzcb60XPh2Ynf+wcJLnEaP9vxBg/AsIE4T+eL7AeLyN+bPDXTcw
	nX4ga5XSd1V0s6LnUbkrXAQdiGrbKCpAlXykNtYE10Z74H/s73QeBsDa
X-Gm-Gg: AR+sD11GXgyQgca7baCS8POawYrbQkxArwJ3qdeCSACBKlamHYXOoAYzKFWTRXIDzOl
	zgxn74L4ne8B/9ACpXF0eK7EOcC8D+GFwTNGi+U3ToR5YzvJpw6BMl07laKf+jQVs3UdSTNDlTv
	MMGf3tXuhBu72TBwhTb43wM1pE29tokZwf/m7C1QN6r71gtzIfcIkNCpEuNXVRTB8huAl2ci6qB
	3yHLRsw4h8TCRa89vd8QE6L3a0aLnGKL2f3IH3b861YY3JNESSW2dM2f//WveYtxARDUWcopqTl
	CBe6MhH/kUP4bwsB+OKjMQj8OWk5j5iTWZ55iPU77SLqxZ+3nir4hX2snnjCfdULCt0SmA9hHy6
	g5UEl4jxAA8f86tVi5c5hejkOwAqHg4k7wov+HORXfodUwJwCf6yw++RD0wjP5idLU3cd+Nhqxn
	3dyuzbBfOjtrkdTyj2dlJH43Z/v16jbJEN7QiJWVcU9eEryO+xXefcAXBYy4p0j3g+bGkqpPgFj
	vNl+I8WMUwoDkRVX0teFHmr+zaC+duu5pwtrw==
X-Received: by 2002:a05:6a21:7106:b0:3bf:76d5:4cf2 with SMTP id adf61e73a8af0-3c9008abc85mr2649509637.40.1785424260100;
        Thu, 30 Jul 2026 08:11:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504927a7bsm24202861eec.0.2026.07.30.08.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 08:10:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ca894ac0-7c6c-45bd-935c-660cc6c16aef@roeck-us.net>
Date: Thu, 30 Jul 2026 08:10:58 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: (lm90) Switch channel parsing to fwnode APIs
To: sashiko-reviews@lists.linux.dev, Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260730091409.10544-1-flaviu.nistor@gmail.com>
 <20260730094350.95BDF1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260730094350.95BDF1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/26 02:43, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] Switching to `device_for_each_child_node_scoped()` exposes a critical pre-existing bug in the core `fwnode_get_next_child_node()` which causes an infinite loop and double-frees if a device has both OF and secondary firmware nodes.
> --
> 
> --- Patch [1]: [PATCH v3] hwmon: (lm90) Switch channel parsing to fwnode APIs ---
> commit 39e5cdd2d72333fe0fa7b34c25ad27651948158c
> Author: Flaviu Nistor <flaviu.nistor@gmail.com>
> 
> hwmon: (lm90) Switch channel parsing to fwnode APIs
> 
> Replace OF property handling with fwnode in the probe function to read
> the channels properties, improving the driver compatibility since this
> method is not limited to Device Tree only.
> Add also the needed headers for explicit include and clean up related
> function naming.
> 
>> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
>> index 4b9c0ccdf2609..03779c1a251a2 100644
>> --- a/drivers/hwmon/lm90.c
>> +++ b/drivers/hwmon/lm90.c
> 
> [ ... ]
> 
>> @@ -2739,18 +2744,17 @@ static int lm90_probe_channel_from_dt(struct i2c_client *client,
>>   	return 0;
>>   }
>>   
>> -static int lm90_parse_dt_channel_info(struct i2c_client *client,
>> -				      struct lm90_data *data)
>> +static int lm90_parse_channel_info(struct i2c_client *client,
>> +				   struct lm90_data *data)
>>   {
>>   	int err;
>>   	struct device *dev = &client->dev;
>> -	const struct device_node *np = dev->of_node;
>>   
>> -	for_each_child_of_node_scoped(np, child) {
>> -		if (strcmp(child->name, "channel"))
>> +	device_for_each_child_node_scoped(dev, child) {
>> +		if (!fwnode_name_eq(child, "channel"))
> 
> [Severity: Critical]
> This is a pre-existing issue, but switching to
> device_for_each_child_node_scoped() exposes this driver to a regression
> in the core fwnode_get_next_child_node() framework.
> 

Interesting report, and quite possibly valid, but not caused
by this driver.

Guenter

