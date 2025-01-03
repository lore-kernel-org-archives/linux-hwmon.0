Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA7E1CDA05
	for <linux-hwmon@vger.kernel.org>; Fri,  3 Jan 2025 09:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735894921; cv=none; b=KAGdyNBQLocZ6O8WVl52AvLFUZeO+cs7br97b29cpsEVpgV3GJkrnMkuINzfsUlBibx6Agpub5EQrZcTW2j0CEE9EMJOHgmEV59IKmLK5Zjp3ICgfmcSKuHGuSvyEx4lz8J0OHF7a5e2hCDmwjpPkpbnyS6rDQMIIRhUEtDVFGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735894921; c=relaxed/simple;
	bh=/mGozPGNvKINRX1PyrsxQVMBvDTTJeX/0m9g30EkIFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YJ5cilw/w3Bc8NEwpD76HnV2mOSNNGMZo0JaSA8dlsd9XXuWb9cUziYQWy1d3zkwoQ5mUarSvGVUMmf5QtWRlzfqLByC4BksfyqVk3abtgALHhpYOhccvu9U1mQpR+V9xIIQiqeuJXuVxnckvBwUAhjPyjGurCHTEvySWYVsDd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=ahI7gnjH; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="ahI7gnjH"
DKIM-Signature: a=rsa-sha256; b=ahI7gnjHXx4JFbSFEqWt0e+Md43h3ZnqOFMnH9EFtC3A54zSzsD5mUKYCEv9wRdM0nr2i4LuRe25dzIiV/gZ9k0uMF8sEyqnie4nM4XYzH0v+HWmFKKK0yJbMO/s6c14UUkn6rAL9I/pxyjXhUMyXYwNdAEo8Z3fyvlggP7Fle2+IE7mdtXgvgMZNuyoCaruxwsB3nOnroDclvGLugJKsbNPVQMG9j7cBQvBfWinZVeUBT9PWarHRAfZpo65AQYzKBpDnOLRwB3MHU64B62Sx8huao91gLjGKbMQNlafRmhZmSueKmEaKRnUGrynlKKjqc/s0qHdpAT6b8ukida34w==; s=purelymail3; d=purelymail.com; v=1; bh=/mGozPGNvKINRX1PyrsxQVMBvDTTJeX/0m9g30EkIFA=; h=Feedback-ID:Received:Date:Subject:To:From;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-hwmon@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1561401815;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 03 Jan 2025 09:01:32 +0000 (UTC)
Message-ID: <25a1b5bd-437c-4136-84d4-e1eab264d062@korsgaard.com>
Date: Fri, 3 Jan 2025 10:01:29 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document default-pwm
 property
To: Krzysztof Kozlowski <krzk@kernel.org>, Guenter Roeck
 <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250102175041.822977-1-peter@korsgaard.com>
 <b3b8aa28-24d3-4952-a8d3-7019ad4c63de@kernel.org>
 <348cda09-cc54-4d29-975c-ab28241d8372@korsgaard.com>
 <e31c51dc-4e35-49fe-9838-207e2fb273ce@kernel.org>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <e31c51dc-4e35-49fe-9838-207e2fb273ce@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/25 09:10, Krzysztof Kozlowski wrote:
> On 03/01/2025 08:59, Peter Korsgaard wrote:
>> On 1/2/25 19:22, Krzysztof Kozlowski wrote:
>>> On 02/01/2025 18:50, Peter Korsgaard wrote:
>>>> The pwm-fan driver uses full PWM (255) duty cycle at startup, which may not
>>>> always be desirable because of noise or power consumption peaks, so add an
>>>> optional "default-pwm" property that can be used to specify a custom default
>>>> PWM duty cycle.
>>>>
>>>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>>>
>>> That's v3, not v1. Also mention here shortly how Rob's comment is addressed.
>>
>> It is? Then that wasn't from me, and I don't right away see anything
>> related on lore. Can you give me a pointer?
> 
> It is trivial to find your v1 and v2 in lore, so I assume you just reply
> here to waste my time.

Sorry, I indeed apparently did send a v1/v2 ~1 year ago, I must be 
getting old. I didn't look that far back in lore and for some reason I 
don't have the changes in my local tree anymore, hence the reason for 
recreating the commits yesterday and sending a new v1.

Looking at lore, v1 used target-pwm which Gunter suggested I changed to 
default-rpm while explaining that it cannot be a generic property:

https://lore.kernel.org/linux-devicetree/b717da30-1d4c-4e09-b98c-4aa41a235234@roeck-us.net/

Which I then did as a v2, that then didn't get any additional feedback:

https://lore.kernel.org/linux-devicetree/3aa21a01-c994-4b36-8893-181e55a60c5e@korsgaard.com/

So if we agree on default-pwm, then I can send an update (a v4!) with 
the typo in the example fixed, OK?

-- 
Bye, Peter Korsgaard
