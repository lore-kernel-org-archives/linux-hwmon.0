Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AB414EC6D;
	Thu, 25 Apr 2024 20:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714076486; cv=none; b=EyCIb2NsZ4d8JlkKgQSMJKbKaEFG5u1TGbPGVQk/5DJofSh2QT/sbwNBD5HvBVeHmRssCo7chcrJoaTHwQ7oGzUuAJyUOx2AAnvjbVyuTIYN10qFSaIdDkfn1xdNM8ZvcCr1CRN2Y7WKUZc3T7kEVoChLKKSI1g52IMhB/otMzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714076486; c=relaxed/simple;
	bh=3kb2tgXlG2mHZpRvEA20vxrzsV18h0c/vg/AGnPi1WY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bp0GPrYUMXSPNfT/GMTpo4wUHSDAAMaEzVjCqvF8ARzdALBs4v4HoNPYd3jDWfcKM+TZ+MuB8KamJ5jzm2OgJbnVkN+Qxv2ODsluM39FmVV73Ugb0p+pUMhF3j+Sglr2QVVsII4b1Vajw4yvV22PI2cjPf1tPQ3oP46uetzmsaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01E89C0006;
	Thu, 25 Apr 2024 20:21:19 +0000 (UTC)
Message-ID: <3aa21a01-c994-4b36-8893-181e55a60c5e@korsgaard.com>
Date: Thu, 25 Apr 2024 22:21:18 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pwm-fan: Document default-pwm
 property
To: Rob Herring <robh@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20240424202448.19033-1-peter@korsgaard.com>
 <20240425161836.GA2779509-robh@kernel.org>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20240425161836.GA2779509-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: peter@korsgaard.com

On 4/25/24 18:18, Rob Herring wrote:
> On Wed, Apr 24, 2024 at 10:24:47PM +0200, Peter Korsgaard wrote:
>> Similar to target-rpm from fan-common.yaml but for the default PWM setting
>> (0..255).
>>
>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>> ---
>> Changes since v1:
>> - Rename to default-pwm
>>
>>   Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>> index 4e5abf7580cc..70f062b30985 100644
>> --- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>> @@ -46,6 +46,14 @@ properties:
>>   
>>     "#cooling-cells": true
>>   
>> +  default-pwm:
>> +    description:
>> +      The default fan PWM to use.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 255
>> +    default: 255
> 
> See my comments on v1. Please give time for other reviewers a chance to
> comment.

Sorry. As far as I can see, Guenter explained why we cannot generically 
translate between a default PWM value and RPM.

Do you still want to move this default-pwm property to fan-common.yaml? 
If so, I can send a v3 doing that.

-- 
Bye, Peter Korsgaard

