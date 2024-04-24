Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A342113A40F;
	Wed, 24 Apr 2024 20:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713990266; cv=none; b=B1wIAZPl1JqywePBpUxg6ehj0Z8dmsVx+Nfjs8qZ0yuieRIYQ6x1VlXo05LLZ3/XvmNkfsdrHGJSLgaIQi3W3BAu6INDMF0tkLz82QcqbL9JDytse2h532PPLVTgRokkQUvkoaQWlrUDj8z7VjUZkKGGJI4Sy9fF3klM8OclNd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713990266; c=relaxed/simple;
	bh=6Gkp4ODT+3f8fvMjl2bGfCbEag/BQKAkYqn78RIif+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GgNPo5qQ8d2PVjHwaHJltI4iH/v3Y/LAjY6kZuR1xCEU8bx+zIAPfdphtjB95X/gHZoxVnFHrVu674Wre1uR3g2KVVtw4srsevftUve4nrgKI1wNb3rfJZMaFHw1XKYsDLd+aogEcBKIydjlJ1/y7WQaQrMK6xc46E2G09GNoRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0FF240004;
	Wed, 24 Apr 2024 20:24:20 +0000 (UTC)
Message-ID: <d32c1c3c-9e50-4a6f-ba10-468e7e5b6751@korsgaard.com>
Date: Wed, 24 Apr 2024 22:24:19 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document target-pwm
 property
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240424090453.2292185-1-peter@korsgaard.com>
 <8e6977df-e6ec-4c03-bed3-f8ea50d6b637@roeck-us.net>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <8e6977df-e6ec-4c03-bed3-f8ea50d6b637@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: peter@korsgaard.com

On 24/04/2024 16.10, Guenter Roeck wrote:
> On 4/24/24 02:04, Peter Korsgaard wrote:
>> Similar to target-rpm from fan-common.yaml but for the PWM setting
>> (0..255).
>>
>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>> ---
>>   Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml 
>> b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>> index 4e5abf7580cc..58513ff732af 100644
>> --- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>> @@ -46,6 +46,14 @@ properties:
>>     "#cooling-cells": true
>> +  target-pwm:
>> +    description:
>> +      The default desired fan PWM.
> 
> Unlike target-rpm, there is no "desired" here. If this is the default pwm,
> to be set, name and describe it accordingly.

OK, I will rename to default-pwm and send a v2 - Thanks.

-- 
Bye, Peter Korsgaard

