Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8861292CE
	for <linux-hwmon@vger.kernel.org>; Sun,  5 Jan 2025 16:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736093484; cv=none; b=App3M05amMmry+9UIHO+JDjk4g0AcOC7VIOHm4TugFW9/unVDY3xIaccqtVGK7tAq13WBqVJ1p1+fZQRfaCZrOzggCRl0GfxYynmeWeRBxnzcqYa5MGwKgCF9xKdbSwAZmNSYFlOpClnoPYt+p1Twjvjpa3KUaeUZu5B4bo76oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736093484; c=relaxed/simple;
	bh=uuT0h2ot2kFkbKpeUUiai5f5E+OKMZVTq8EPMLhiVn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cu6EpNfoYt/6ON8LU9WB+4aoc3JYZ+CI23lXI+i7U5fMsoJdRVP1JA88f7ZPj33NbEWPm9iMb+i8w6gRPZSha2nvXNRr3kbXfFgQWxA7JJ9mBAt+mMFHPGd8nFwxvkqRYWvubeQNLnYszJSOkaQ7YANNMIrUwnJStfdBsG3Soj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=Z31mJT4R; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="Z31mJT4R"
DKIM-Signature: a=rsa-sha256; b=Z31mJT4ReeLaIii/8UrnFcxUKXLKkHyVMjgtBrVEni6RsAeJfGJ+1yd+ffZp6vNMJrNAGahepfE/3/seB+jwmu8pC8d0ObT0mxiCTIhLAnTeu1wxrfdl55rNDx3/8dhFEnK6C6YuVCT2JiZZ0O0VyTxmdmwFzUpaYNra8ufrNTuXSsypK1fvd+Qd6EHlayDOdMUuE+rNI35jmmJevOmQoHKNCMekLv+hSEIYf7RiMIYU4LdthEqnHyRt+Uyh0OMU4Sk44NpIQDFlf5CSp1OSXPq5GekYTWDS6cskbsb0FJKhTz8xDQJEuh0dWSRbp21dzHsRozIXIeWRe68RW8Szzw==; s=purelymail3; d=purelymail.com; v=1; bh=uuT0h2ot2kFkbKpeUUiai5f5E+OKMZVTq8EPMLhiVn0=; h=Feedback-ID:Received:Date:Subject:To:From;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-hwmon@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1502571710;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 05 Jan 2025 16:10:45 +0000 (UTC)
Message-ID: <dbf7cdd3-c5ab-4801-be85-163124b8a898@korsgaard.com>
Date: Sun, 5 Jan 2025 17:10:42 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pwm-fan: Document default-pwm
 property
To: Rob Herring <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250103101448.890946-1-peter@korsgaard.com>
 <20250103195810.GA2624225-robh@kernel.org>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250103195810.GA2624225-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/25 20:58, Rob Herring wrote:

> I still don't agree. Quoting Guenter:
> 
>> The two values are also orthogonal. The fan rpm is fan dependent.
>> Each fan will require a different pwm value to reach the target speed.
>> Trying to use target-rpm to set a default pwm value would really
>> not make much if any sense.

> But RPM is ultimately what you care about and is the fan parameter
> that's universal yet independent of the underlying control. RPM is what
> determines noise and power consumption.
> 
> There's 2 cases to consider: you have a tach signal and know the fan RPM
> or you don't know the RPM. If you have a tach signal, we probably
> wouldn't be discussing this because target-rpm would be enough. So I'm
> assuming this is the case and you have no idea what RPM the fan runs at.

Correct, no tacho.


> The fan-common.yaml binding is a bit incomplete for this. What you need
> is some map of fan speed to PWM duty cycle as most likely it is not
> linear response. I think there are 2 options here:
> 
> Use the 'cooling-levels' property. Fan "speed" is the index of the
> array. So you just need a 'default-cooling-level' property that's the
> default index.

I am not sure I what you mean with the RPM reference here? The 
cooling-levels support in the fan-pwm.c driver is a mapping between 
cooling levels and PWM values, NOT RPM value.


> The other option is define an array of (fan RPM, PWM duty cycle) tuples.
> Then target-rpm can be used to select the entry. We already have
> something like this with 'gpio-fan,speed-map'.

Where should these "invented" RPM values come from when there is no 
tacho signal? That sounds backwards / complicated for the very trivial 
"what should the default PWM value be at driver probe time" use case.


> There's also no definition of the minimum RPM or duty cycle in the
> pwm-fan binding. We have min-rpm in fan-common, but that doesn't work
> without a tach. A map would help here as well

The minimum PWM is presumably 0, E.G. signal always low?


> This problem to me is similar to LEDs. Ultimately it's brightness that
> you care about, not the current or PWM duty cycle to get there.

The use case (as described in the commit message) is to drive the fan 
less hard to limit noise and/or power consumption. The input to the fan 
drive control is a PWM setting, so it IMHO makes sense to specify that, 
as that is the interface provided by the fan-pwm driver - E.G. you boot 
up and tweak the pwm1 property in sysfs until you have a value that 
suits the noise/power consumption requirements and stick that value in 
the dts.


> Finally, whatever we end up with, it should go in fan-common.yaml. That
> supports PWMs too, so whatever we end up with is applicable to any PWM
> controlled fan.

What makes this "default-pwm" (or whatever it will be called) more 
generic than E.G. the recently added "fan-stop-to-start-percent" / 
"fan-stop-to-start-usec" properties added to pwm-fan.yaml by commit 
80bc64201e78 ("dt-bindings: hwmon: pwm-fan: Document start from stopped 
state properties")?

-- 
Bye, Peter Korsgaard
