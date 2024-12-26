Received: from smtp2.math.uni-bielefeld.de (smtp2.math.uni-bielefeld.de [129.70.45.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C12D1865E1;
	Thu, 26 Dec 2024 23:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.70.45.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735254332; cv=none; b=H/t+k3cUpOk9L70NBaJa1NsWQkSglkdQapX1+j0CZy5kiNsgItks0cQlcNT9dS7Yp9hExe6NJGLVUGLcx6CkheK6R9f8h1mKxmplvvDN/i3bBPlBeUQ0iHTjNttzk9P2LqEOluaAojupR6rPYtiHhTR9squTgJ46M1CRtWuWp/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735254332; c=relaxed/simple;
	bh=SQZez2CS8rjUMTtt4/oDKGKBK+PkD8H+HGK6kR7xBuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZaJKbV0oWM9yw5tBQQm7ePl1Z9XAIgbgQ2PAam6Hbl0272Z57TIDx6c0YRJe9Wje+crX69VxjD07awQmMagpmRwgpx0qgOhIHojb7lfxs+sYaIa4/lYckJUR+fX2CksE5GVWZMDqhPPszyesQqzeV94KvCCOF1xZhl4VkuNnBhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=math.uni-bielefeld.de; spf=pass smtp.mailfrom=math.uni-bielefeld.de; dkim=pass (2048-bit key) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b=Pfpuglu4; arc=none smtp.client-ip=129.70.45.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=math.uni-bielefeld.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=math.uni-bielefeld.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="Pfpuglu4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=math.uni-bielefeld.de; s=default; t=1735254328;
	bh=SQZez2CS8rjUMTtt4/oDKGKBK+PkD8H+HGK6kR7xBuU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pfpuglu4Xz3muYBasZxADJV3O43k2ErYwI96SAfZx0Pu4b8t2WTspqREcFT7NDLfa
	 Yf9tKjECSSM001x2sAGPg7AxX/w3DdM+Gaih/McF8cpPmzhxSRp3DSctLKp4WGWTzS
	 1uOD5eVdJxFmJ54rxINkFz7IiJCdT2NZC3O1tdcADDV2lraJO2VkBn7EgIleb4aqA4
	 gHWuV5FUSLFJs9OoCOzGmIiZyMJRXCZ9CX3uwz8DhEsW9JeHNIlPAxkKINIr0VU3di
	 LlaZHvG5FyH5od371TxSQRVuha7rh2HjiRTYnLRQxa1V2O1YVgW4LWZLSzlipHvEiv
	 T+hc2Y97p6RWw==
Received: from [192.168.2.10] (58-32-133-N4.customer.vsm.sh [170.133.32.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp2.math.uni-bielefeld.de (Postfix) with ESMTPSA id D49A620567;
	Fri, 27 Dec 2024 00:05:27 +0100 (CET)
Message-ID: <dc38e8f0-2262-487e-902d-6e13992f0f51@math.uni-bielefeld.de>
Date: Fri, 27 Dec 2024 00:05:27 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] hwmon: (oxp-sensors) Separate logic from
 device-specific data
To: Guenter Roeck <linux@roeck-us.net>
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
 <daa7571b0731e203b5a86e484da8083fd034601e.1735232354.git.tjakobi@math.uni-bielefeld.de>
 <cf3ef6ff-632e-4fcf-9c13-1425e444a0e5@roeck-us.net>
Content-Language: en-US
From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Autocrypt: addr=tjakobi@math.uni-bielefeld.de; keydata=
 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
 JRHWPGCL3BhOxQ==
In-Reply-To: <cf3ef6ff-632e-4fcf-9c13-1425e444a0e5@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/24 22:04, Guenter Roeck wrote:
> On Thu, Dec 26, 2024 at 06:00:16PM +0100, tjakobi@math.uni-bielefeld.de wrote:
>> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>>
>> We currently have large switch-statements in all functions that
>> write to EC registers, even though the bulk of the supported
>> devices functions more or less the same.
>>
>> Factor the device-specific data out into a struct oxp_config. This
>> only leaves logic in the corresponding functions and should make
>> adding future devices much easier and less error-prone.
>>
>> Also introduce struct oxp_data which is going to be used in a
>> later commit to cache device state.
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>   drivers/hwmon/oxp-sensors.c | 517 +++++++++++++++---------------------
>>   1 file changed, 215 insertions(+), 302 deletions(-)
>>
>>   
> ...
>> -static int oxp_pwm_disable(void)
>> +static int oxp_pwm_disable(const struct oxp_config *config)
>>   {
>> -	switch (board) {
>> -	case orange_pi_neo:
>> -		return write_to_ec(ORANGEPI_SENSOR_PWM_ENABLE_REG, PWM_MODE_AUTO);
>> -	case aok_zoe_a1:
>> -	case aya_neo_2:
>> -	case aya_neo_air:
>> -	case aya_neo_air_1s:
>> -	case aya_neo_air_plus_mendo:
>> -	case aya_neo_air_pro:
>> -	case aya_neo_flip:
>> -	case aya_neo_geek:
>> -	case aya_neo_kun:
>> -	case oxp_2:
>> -	case oxp_fly:
>> -	case oxp_mini_amd:
>> -	case oxp_mini_amd_a07:
>> -	case oxp_mini_amd_pro:
>> -	case oxp_x1:
>> -		return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_AUTO);
>> -	default:
>> -		return -EINVAL;
>> -	}
>> +	if (test_bit(OXP_FEATURE_PWM, &config->features))
>> +		return write_to_ec(config->sensor_pwm_enable_reg, PWM_MODE_AUTO);
>> +
> 
> This and all the other feature checks are completely wrong.
> Those checks whould happen once in the is_visible functions,
> and there should not be any such runtime checks. If a feature
> is not available, the associated attributes should not be created
> in the first place.
Hmm, so if the feature checks are wrong _now_, then the board check was 
also wrong to begin with. This is my first time working on hwmon code. 
If we can just drop the checks here (and elsewhere) and just have them 
in the is_visible function -- I'm all for it. Less code is better code.


> If such checks happen in the current code, that should be fixed
> in the is_visible functions. Any existing runtime feature checks
> should be removed.
OK, so to reiterate: We don't want any feature checks during runtime. 
Only during probe time. And during probe we just create the attributes 
that make sense for the device. What we can't decide on the level of 
attributes, we do in the is_visible functions. Is this correct?

With best wishes,
Tobias


> 
> Guenter

