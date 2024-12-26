Received: from smtp2.math.uni-bielefeld.de (smtp2.math.uni-bielefeld.de [129.70.45.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D447A13D893;
	Thu, 26 Dec 2024 22:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.70.45.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735253788; cv=none; b=FpHsJCjsZIsOHbtUUkJTGwM8bZGVMLu6DXN6FYagfsi/4JM50qp+i4Id9oy5MXGrJulxI4PBev/z1ZE99oHCat8RkL5BSQ335p7+8zfP/zoBCF8zdSEhBNvmV9cjYslErOEDSq0XmdIB60oWB/yDdz34KL0+R99HxVqa369CrNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735253788; c=relaxed/simple;
	bh=545+1UtJp9yUeMDzSVfaq9IU+DQj9MTW0D52wto46Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AutJAWts+nvqiVy3miOB89IsM6ohTFmYA9K2KqaTk+fEGDfsJFYXWtwMRPEFxlFQ/V0tHINtoUIfNAKfIzINfKjKLNEJfXavL0Ur+xbFFR+C7CeFh2iLob02sjXpcFw4byieImki0iajOryomvtvJYwmsdoCRzEFwU4NB4nSpSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=math.uni-bielefeld.de; spf=pass smtp.mailfrom=math.uni-bielefeld.de; dkim=pass (2048-bit key) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b=G0Bwh6qe; arc=none smtp.client-ip=129.70.45.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=math.uni-bielefeld.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=math.uni-bielefeld.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="G0Bwh6qe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=math.uni-bielefeld.de; s=default; t=1735253776;
	bh=545+1UtJp9yUeMDzSVfaq9IU+DQj9MTW0D52wto46Ow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G0Bwh6qed5YTMxvZAoUh4rAZ0+c84ZeYv4ZXOUf6vd3X8sRpeVkMP1ZG7/Ay5gfhq
	 wm16Ne2U7XgbitxWSAjfuPh3GQtjZg2PQvA3Zwq4XlL9CSk1sAhHPFxK3txsGkMXfi
	 t3+aqoQCXqTqoK3/JOYdPdll7S6kf58eLlg5ojzDHIX34GmSehWwoWelhG2RSWa0L7
	 jakYwz5sCmiJ6ii53oPcNOzjFc1ovBI5hmbA8bc5gqAV5wFvc5S+szI2pAsyY0rxb1
	 hNMV9YsAjtrGEOJ8zgYAZngytYDToXhA/TGSoV4M0iVH4e+sT5riN6dTUMjZ1sXU7j
	 eX79x4op2KDsQ==
Received: from [192.168.2.10] (58-32-133-N4.customer.vsm.sh [170.133.32.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp2.math.uni-bielefeld.de (Postfix) with ESMTPSA id 2D34920567;
	Thu, 26 Dec 2024 23:56:16 +0100 (CET)
Message-ID: <7284955a-fadf-497c-a7e4-6c261c84d32a@math.uni-bielefeld.de>
Date: Thu, 26 Dec 2024 23:56:12 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] hwmon: (oxp-sensors) Fix wording in code comment
To: Guenter Roeck <linux@roeck-us.net>
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
 <858c2a5b712eebdf2fc7c9c6e3a2d2f832a68dfc.1735232354.git.tjakobi@math.uni-bielefeld.de>
 <51006199-1de4-4bda-b579-181e19bd66e4@roeck-us.net>
Content-Language: en-US
From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Autocrypt: addr=tjakobi@math.uni-bielefeld.de; keydata=
 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
 JRHWPGCL3BhOxQ==
In-Reply-To: <51006199-1de4-4bda-b579-181e19bd66e4@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/26/24 21:52, Guenter Roeck wrote:
> On Thu, Dec 26, 2024 at 06:00:18PM +0100, tjakobi@math.uni-bielefeld.de wrote:
>> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>>
>> Despite what the current comment says, the register is used
>> both for reading and writing the PWM value.
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>   drivers/hwmon/oxp-sensors.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
>> index fbd1463d1494..8089349fa508 100644
>> --- a/drivers/hwmon/oxp-sensors.c
>> +++ b/drivers/hwmon/oxp-sensors.c
>> @@ -46,14 +46,14 @@ static bool unlock_global_acpi_lock(void)
>>   #define OXP_SENSOR_FAN_REG             0x76 /* Fan reading is 2 registers long */
>>   #define OXP_2_SENSOR_FAN_REG           0x58 /* Fan reading is 2 registers long */
>>   #define OXP_SENSOR_PWM_ENABLE_REG      0x4A /* PWM enable is 1 register long */
>> -#define OXP_SENSOR_PWM_REG             0x4B /* PWM reading is 1 register long */
>> +#define OXP_SENSOR_PWM_REG             0x4B /* PWM control is 1 register long */
> 
> I think that, if anything, this is more confusing than before.
> "control" is, for example, enabling or disabling pwm management,
> setting automatic or manual mode, or setting the pwm polarity.
> Together ith the next two defines, "control" would suggest that
> PWM_MODE_AUTO and PWM_MODE_MANUAL are set through that register -
> which is not the case. "value" maybe, but "control" is just wrong.
Noted. What do you think about "target" then?

My main point here was that reading implies that this register is 
read-only. Which it clearly isn't. And the documentation (which could be 
certainly be improved in general) should reflect that.

With best wishes,
Tobias

> 
> Guenter
> 
>>   #define PWM_MODE_AUTO                  0x00
>>   #define PWM_MODE_MANUAL                0x01
>>   
>>   /* OrangePi fan reading and PWM */
>>   #define ORANGEPI_SENSOR_FAN_REG        0x78 /* Fan reading is 2 registers long */
>>   #define ORANGEPI_SENSOR_PWM_ENABLE_REG 0x40 /* PWM enable is 1 register long */
>> -#define ORANGEPI_SENSOR_PWM_REG        0x38 /* PWM reading is 1 register long */
>> +#define ORANGEPI_SENSOR_PWM_REG        0x38 /* PWM control is 1 register long */
>>   
>>   /* Turbo button takeover function
>>    * Different boards have different values and EC registers
>> -- 
>> 2.45.2
>>
>>

