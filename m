Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D5F1F80C4;
	Tue,  5 Nov 2024 22:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730847068; cv=none; b=tJYjYvDIUpdYRaoirDaXAJAHLgqBY5CmttbrnOZSzcavjT8Wp2BeUPEt7EN3w9VhP+GXlUcZsC4+dQw9qQUd4EJM7TqdP4173Rf+ODJOKQgkAbDzTHcpXL5rQQpXip0eYOGt9sx2r1Gb+qsDbHNHAbw8i/MDPhQSALw5ujS5MHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730847068; c=relaxed/simple;
	bh=HlIONDNA1t3+ZPN1PzL9A8B7qmPhytUNjkO0D0S1Pdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFQCN2fxDg2oEthUZeJvSZfPzFVuCNyNVw20DfgQQ3kJbyo2H+ay5StdpoKGBCX2EEz0bp/L1Rk/hUriWZ02/T5PKWqNZ9WOeHJowDahRigWTte0EfhR3QHzlgizQCkhq6FWYyDyS1JjcxjJ7SrELj14bU5Tw98h+DCEEKVgLYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=bdVdSP9J; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="bdVdSP9J"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5F0E68913F;
	Tue,  5 Nov 2024 23:51:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730847064;
	bh=QJbjxWwn8r9p0hZhE55oTnvFAp33HZRnMv/SBKFlkMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bdVdSP9JbzkQzI/gbzedTng9+y6ZJGeesbYX7G55Fxr3xCFD/Ibd26rsFNtBH5W3t
	 pba2aRkaGBUZbgSdr8rFgqo8wwL5C7zOaucViu2YjOIfG4KxV1igu1BRpf4fOMVRWm
	 lEiCDijgU9DNN31rKjgT/uEuv0Bu6ll/e0D+fuM7HcH+vJlU9vmixvqyyP2xcOyx4n
	 nSdEikvoiH1NgP8433si68pTe53p87jGENkqACu2RIULqQNv29b/SAIsme18JUQZ6K
	 /RR/+O0taegWz8DZj7GV0xfliisMHL1DGnkKyJP/S5HOhFueF/yBVFNlfVMUsBNCbM
	 2RQBcp9Rag0Mw==
Message-ID: <189cd4b5-005b-4311-a5de-2b376eb0b9d8@denx.de>
Date: Tue, 5 Nov 2024 19:53:53 +0100
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <df2eaf57-a4ea-4378-8f24-a843084eb1d6@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/5/24 3:11 PM, Guenter Roeck wrote:
> On 11/5/24 05:52, Marek Vasut wrote:
>> Delta AFC0612DB-F00 fan has to be set to at least 30% PWM duty cycle
>> to spin up from a dead stop, and can be afterward throttled down to
>> lower PWM duty cycle. Introduce support for operating such fans which
> 
> Doesn't this imply that a minimum pwm value is needed as well ?

It depends. For this fan, yes, it does stop at around 8% PWM duty cycle.

> Super-IO chips such as the NCT67xx series typically have two separate
> registers, one for the pwm start value and one for the minimum pwm value.

I use plain SoC PWM output to operate the fan. This one needs to be set 
to higher PWM duty cycle first, to spin up, and can be reduced to lower 
PWM duty cycle afterward without stopping.

>> need to start at higher PWM duty cycle first and can slow down next.
>>
>> Document two new DT properties, "fan-dead-stop-start-percent" and
>> "fan-dead-stop-start-usec". The former describes the minimum percent
>> of fan RPM at which it will surely spin up from dead stop. This value
>> can be found in the fan datasheet and can be converted to PWM duty
>> cycle easily. The "fan-dead-stop-start-usec" describes the minimum
>> time in microseconds for which the fan has to be set to dead stop
>> start RPM for the fan to surely spin up.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Jean Delvare <jdelvare@suse.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-hwmon@vger.kernel.org
>> ---
>>   Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/ 
>> Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>> index 4e5abf7580cc6..f1042471b5176 100644
>> --- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>> @@ -31,6 +31,17 @@ properties:
>>         it must be self resetting edge interrupts.
>>       maxItems: 1
>> +  fan-dead-stop-start-percent:
> 
> Personally I don't think that "dead-stop" in the property name adds any 
> value.
> On the contrary, I think it leads to confusion. I head to read the 
> description
> to understand.

The documentation refers to this behavior as a "dead stop" , hence the 
property name. I can change it to fan-stop-to-start-percent ?
