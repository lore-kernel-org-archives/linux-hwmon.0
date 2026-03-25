Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51C63E3156
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 15:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454199; cv=none; b=HeYqYWnRH5a/lOzIsvu0HRbAzNJx66e4Ac8agbbKLK2e9v6hOAa+FjD/XyIQYh8u3u6WYqI764OCMKiw1kx0fMPLwg/5aHpV4mrYJh6/Sc4yntoNqp5uvj4yXA/5Orzta1I7t4wlSObBczAFlCD/QsCmNwb0IrinKh6kWNrd2h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454199; c=relaxed/simple;
	bh=MnLF2BW092870m8JOS99TONuPLd/v+VfS+gOcj7gBh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U37wcc94kuFkX8lIQyXJHeEApgzkscUzgargKPLzSnL6laMAbQSMwG6t5h756kr54hgumi/ue/x69izuTJzy+cbR6atJMVUqZhRVNKZGTXhTOdypnvj/bYtz73MBd41d6C88hkvDMjhRUHsICJ6nVW26HWVIkhtZS3LgeD4XWso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oaFg8W4G; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oaFg8W4G"
Message-ID: <2ea6547d-aa47-4333-b569-3a10a8fa9988@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774454185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tQbS9O4uUPm842EFQgAPtKP3lK4OJ+Bqn+4TFNMt+zw=;
	b=oaFg8W4GdtE6xdQxNy3f73/+QiRIMGb5MowHLggo6ur5z7y6QZZkrrNayjoC30urQrwCsA
	1mM4OijQKW1DugI8WQA9D9MUHETAM0XkFoLJvIqQoVELmrLwmHoQOqWJ6e3Pp9pEWnCTeL
	az7N+FGjS9BtehgeMk7MlcE83BxSdAo=
Date: Wed, 25 Mar 2026 15:56:20 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next 3/3] dpll: zl3073x: add hwmon support for input
 reference frequencies
To: Ivan Vecera <ivecera@redhat.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Michal Schmidt <mschmidt@redhat.com>, Petr Oros <poros@redhat.com>,
 Simon Horman <horms@kernel.org>, Guenter Roeck <linux@roeck-us.net>
References: <20260320105915.149068-1-ivecera@redhat.com>
 <20260320105915.149068-4-ivecera@redhat.com>
 <964752ec-8e6d-444a-aad0-80da3acb2dab@roeck-us.net>
 <7dbb5130-72cf-49d2-bfac-3439deb1b2e3@redhat.com>
 <20260323154825.1a2320c4@kernel.org>
 <50a1671c-9901-426a-97ed-bf36400fe9a7@roeck-us.net>
 <6f1e98b3-4b86-4b7f-8c91-d8d5721aeb25@redhat.com>
 <8486ce6e-ad2a-493d-b734-b40e8db9213e@redhat.com>
 <20260324143654.4dcec5a0@kernel.org>
 <9f169bf2-1d1f-4f7f-9f9f-0b90d06673e0@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <9f169bf2-1d1f-4f7f-9f9f-0b90d06673e0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 25/03/2026 11:19, Ivan Vecera wrote:
> 
> 
> On 3/24/26 10:36 PM, Jakub Kicinski wrote:
>> On Tue, 24 Mar 2026 13:59:19 +0100 Ivan Vecera wrote:
>>>>> In the hardware monitoring world one would have min/max attributes and
>>>>> one or more alarm attributes. I never heard about the idea of 
>>>>> reporting
>>>>> deviations, and for typical hardware monitoring attributes it does not
>>>>> really make sense. What would be a "deviation" of a temperature/
>>>>> voltage/current/power/humidity sensor ? Such attributes typically have
>>>>> an operational range, and they are allowed and even expected to
>>>>> fluctuate within that range.
>>>>
>>>> Ivan, my take on all the above is that using the HWmon interface 
>>>> here is
>>>> stretching it too much. I think it would be better to move debugfs
>>>> and/or netlink events.
>>>
>>> I'd rather avoid debugfs... My proposal is to expose absolute measured
>>> frequency attribute of dpll-pin and follow phase-offset-monitor
>>> functionality:
>>>
>>> So:
>>> * add real-frequency attribute to dpll pin
>>> * add real-frequency-monitor attribute dpll device
>>> * user will be able to enable/disable monitoring by enabling/disabling
>>>     real-frequency-monitor feature (similarly to phase-offset-monitor)
>>>
>>> Thoughts?
>>
>> I don't have a strong opinion. IDK where to draw the line between DPLL
>> and "random functionality some devices may have". We have 3 DPLL
>> maintainers, let's see what their majority opinion is..
> 
> I think that line has already been crossed by temperature reporting,
> which has been there since the beginning. Actual frequency measurement
> is, in my opinion, much closer to the DPLL world than temperature 
> reporting. :-)

Frequency measurements are DPLL-world properties indeed. Temperature
reporting was added as it has some influence on the stability of DPLL 
devices as well as on any oscillators.

> Anyway, I have the relevant patch-set already prepared, so I can submit
> it if you want to see it.
Feel free to submit, I'll be happy to review it.
