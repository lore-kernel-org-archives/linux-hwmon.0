Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B55188920;
	Wed,  6 Nov 2024 01:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730856542; cv=none; b=drWvRkXhdxaxx4aBIDU2/Pz47dVlFO39gxbi68fqGZWJnXvPE4IOtJDDTX+QCBFjT6OP5JsLavl9cwpvHAPgduc/G+iq/VyGoSaVdPCcLci0nhQA/ETXNOLdt4MWUiZTQjdhZAQoUzo7ZoxrsYF1KbrQoaMKPi7D1DlVaHfkYgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730856542; c=relaxed/simple;
	bh=o5Dl+Ekk7PBOSeuj0+Ib82+Q37tovreTS26Ub1zSL/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SCLYwAV/B8NbKnDnByDc/KlR+G+McqLT2amqVkH/Xnofo3pV3O6OvHTriI5//i0GYyzSt6aBwWngXuOM5YO2I6R+jwknLWTZff5y1EevDMkw/k/taUsh0VVwbN8c6Os9iXTF37kgU0TSfyV+xE/omBTPmyGcSM2m0qAW6ZteocU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=nsEPCaag; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="nsEPCaag"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CEACD880E6;
	Wed,  6 Nov 2024 02:28:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730856538;
	bh=rxk1FRnn5JUygOIoLuUm7o31M1LQ3MgnCaC8+hOApbE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nsEPCaagLhbWH6PaqwKuyTtlzqpmPmAQ3s7Ak/IeTVkLfZJnsLXfar/uAfe4FYEkp
	 NjjYIz7gOWbCuj7MwDwxy737MR9sm/DNx6nYKVuMhMm0jRQfWS447t0Y2XMlK5mmpi
	 dhLBlyLfqgAc5KxPda8NrG8as/Z8ljVOgeRTpew5SEx4/q1ef+Q2qjGFuBTwMQIYgJ
	 m0hJA4N0I969hRmqZqziFdAbhiE9fqGQ7QlZpkokXf+vf9yJ6aQrMDpHK50Fcl4hk5
	 fUQdx9nnUCBL1gGyOSSrInZfy+xzUASzu+vtUcCwrtsmZAASsmdgjQq8Qx+KFyibdu
	 3hkFBnaP0AmDw==
Message-ID: <0b32eda6-4071-4707-a8c6-447073638707@denx.de>
Date: Wed, 6 Nov 2024 02:28:57 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document start from dead
 stop properties
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20241105135259.101126-1-marex@denx.de>
 <df2eaf57-a4ea-4378-8f24-a843084eb1d6@roeck-us.net>
 <189cd4b5-005b-4311-a5de-2b376eb0b9d8@denx.de>
 <1a8b0024-97db-4c1c-9d04-45057a2ba800@roeck-us.net>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <1a8b0024-97db-4c1c-9d04-45057a2ba800@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/6/24 1:34 AM, Guenter Roeck wrote:
> On 11/5/24 10:53, Marek Vasut wrote:
>> On 11/5/24 3:11 PM, Guenter Roeck wrote:
>>> On 11/5/24 05:52, Marek Vasut wrote:
>>>> Delta AFC0612DB-F00 fan has to be set to at least 30% PWM duty cycle
>>>> to spin up from a dead stop, and can be afterward throttled down to
>>>> lower PWM duty cycle. Introduce support for operating such fans which
>>>
>>> Doesn't this imply that a minimum pwm value is needed as well ?
>>
>> It depends. For this fan, yes, it does stop at around 8% PWM duty cycle.
>>
>>> Super-IO chips such as the NCT67xx series typically have two separate
>>> registers, one for the pwm start value and one for the minimum pwm 
>>> value.
>>
>> I use plain SoC PWM output to operate the fan. This one needs to be 
>> set to higher PWM duty cycle first, to spin up, and can be reduced to 
>> lower PWM duty cycle afterward without stopping.
>>
> 
> Yes, exactly. That is what many fans require.
> 
>>>> need to start at higher PWM duty cycle first and can slow down next.
>>>>
>>>> Document two new DT properties, "fan-dead-stop-start-percent" and
>>>> "fan-dead-stop-start-usec". The former describes the minimum percent
>>>> of fan RPM at which it will surely spin up from dead stop. This value
>>>> can be found in the fan datasheet and can be converted to PWM duty
>>>> cycle easily. The "fan-dead-stop-start-usec" describes the minimum
>>>> time in microseconds for which the fan has to be set to dead stop
>>>> start RPM for the fan to surely spin up.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> ---
>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>>> Cc: Jean Delvare <jdelvare@suse.com>
>>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>> Cc: Rob Herring <robh@kernel.org>
>>>> Cc: devicetree@vger.kernel.org
>>>> Cc: linux-hwmon@vger.kernel.org
>>>> ---
>>>>   Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 11 +++++++++++
>>>>   1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/ 
>>>> Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>>>> index 4e5abf7580cc6..f1042471b5176 100644
>>>> --- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>>>> +++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>>>> @@ -31,6 +31,17 @@ properties:
>>>>         it must be self resetting edge interrupts.
>>>>       maxItems: 1
>>>> +  fan-dead-stop-start-percent:
>>>
>>> Personally I don't think that "dead-stop" in the property name adds 
>>> any value.
>>> On the contrary, I think it leads to confusion. I head to read the 
>>> description
>>> to understand.
>>
>> The documentation refers to this behavior as a "dead stop" , hence the 
>> property name. I can change it to fan-stop-to-start-percent ?
> 
> I do not understand the need for that much complexity in the property name,
> and I don't think it makes sense to name a property based on a specific
> chip documentation. I have seen that before, where different vendors use
> different names for the same functionality. That doesn't mean that the
> vendor-determined name has to make it into the property name.
> 
> As an example, Nuvoton calls the values "Start-Up Value" and "Stop Value".
> ITE calls the start value "start PWM value" (and as far as I can see 
> doesn't
> have a separate stop value). I am sure pretty much every vendor uses a
> different description.
> 
> I am personally not a friend of long property names. Having said that,
> I'll let you use whatever DT maintainers accept. They may have a different
> opinion.
Do you have a different suggestion for the property name ? Else I'll 
just send a V2 .
