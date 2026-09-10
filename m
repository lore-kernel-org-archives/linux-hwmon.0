Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748A11EF39E;
	Thu, 10 Sep 2026 20:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789072535; cv=none; b=sEZ4ZCbrqibyMZJOnWx9rkhErtZnKO6PKyK/WQsiqG2czN0dcOReTidU90p7HyHlhn3JTPcwsXrP20NrTK/I/Pq/rEQdeEhvJIqc3vaLhSJfwOBzeDZbuaWL6tz+K5t7ux7WACMYBMhu5Xt5PDB93qrhzBmULqnU+85cfJv2gGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789072535; c=relaxed/simple;
	bh=pMq8SZhA/Xg3p1YPO/NbwtP4Wm6z5MseFXO6jJEfZuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SFHIkPaX3RxFdUwlwDMtud7KoXU1BRICadlNHNs4R3JPxa5f296pAZNupHOPpDXUTVaZePEakxtBoq8VJrXw7nphtCJxDAlTPAAhGP5PMhqQP8wiogKUL1/HKHT0vuIL5nfLjhmqE5hHnndjKPbf81LAYu64Gk4ghQlmAsfni68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckzh9IDE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckzh9IDE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFACE1F000FF;
	Thu, 10 Sep 2026 20:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789072532;
	bh=ZQnhaXmSgLhv6b/C0ImmE9HKZD9kzA3xPMVL5+NtFDQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ckzh9IDEFqjxyKQRtvPSZY3oXBR0PcbiphmlebE3007MpB8ebh4XIZbjVBFLf09mZ
	 j8nyNmplCzZEBKXfAaF3FIPNwYCb+amo19K41vsbxappGfN6Nj3OTsQhcuWtgsWvwq
	 oxGwOY249Ev/oCICz1qvVpwepcw/crbjBL5qGEOXpUgNhohrNI8ZSwStssLm+B7aL8
	 AHMVYvafztKfTCg9ZqNd2622CaVBMIY784XKmis4v3qKtk+LefxBQwLWCKMiKFeSZN
	 MkX+7slmrXU8ROfXNBye2aHtWSR5W78ibZvt+1+6b76LOCOevyah6cH1ua3Kvz5Kgu
	 NxSVcHeIU+qAw==
Message-ID: <aabc0435-d652-429d-9adc-4dac261d5feb@kernel.org>
Date: Thu, 10 Sep 2026 15:35:30 -0500
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] hwmon: (k10temp) Fix model id range of Zen5 Turin
Content-Language: en-US
To: Rong Zhang <i@rong.moe>, Guenter Roeck <linux@roeck-us.net>,
 Clemens Ladisch <clemens@ladisch.de>, Gabriel Ford <gabriel@gford.dev>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260911-k10temp-fix-zen5-epyc-v1-1-643f5a248ae1@rong.moe>
 <54a5620c-36cb-4dc1-bbd8-9647ff7cb708@roeck-us.net>
 <9334E4DA-5389-49BE-A9FF-48A7FF5C1C35@rong.moe>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <9334E4DA-5389-49BE-A9FF-48A7FF5C1C35@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/10/26 15:07, Rong Zhang wrote:
> Hi Guenter,
> 
> Thanks for your review.
> 
> 
> 于 2026年9月11日 GMT+08:00 03:00:13，Guenter Roeck <linux@roeck-us.net> 写道：
>> On 9/10/26 11:39, Rong Zhang wrote:
>>> Model 20h-2Fh are mobile processors with single CCD. For example, model
>>> 24h is Strix Point, i.e., Ryzen AI 7 (PRO) (H/HX) 360/365/370.
>>>
>>> Including mobile processors in the model id range of Zen5 Turin
>>> processors leads to bogus reporting:
>>>
>>>     k10temp-pci-00c3
>>>     Adapter: PCI adapter
>>>     Tctl:         +54.1°C
>>>     Tccd4:       +148.6°C
>>>     Tccd6:       +148.4°C
>>>     Tccd7:       +149.1°C
>>>     Tccd8:       +149.2°C
>>>     Tccd9:       +149.2°C
>>>     Tccd12:      +149.1°C
>>>     Tccd14:       +22.0°C
>>>     Tccd15:       +22.0°C
>>>     Tccd16:       +22.0°C
>>>
>>> Fix it by removing the said range.
>>>
>>> Fixes: 8440d5aca227 ("hwmon: (k10temp) Add per-CCD temperature monitoring for Zen5 Turin")
>>> Signed-off-by: Rong Zhang <i@rong.moe>
>>> ---
>>>    drivers/hwmon/k10temp.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
>>> index 75a45010d687..3e7e63edc6a3 100644
>>> --- a/drivers/hwmon/k10temp.c
>>> +++ b/drivers/hwmon/k10temp.c
>>> @@ -523,7 +523,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>>    		}
>>>    	} else if (boot_cpu_data.x86 == 0x1a) {
>>>    		switch (boot_cpu_data.x86_model) {
>>> -		case 0x00 ... 0x2f:	/* Zen5 Turin */
>>> +		case 0x00 ... 0x1f:	/* Zen5 Turin */
>>
>> Doesn't that drop _all_ CCD temperature reporting for those chips ?
> 
> Yes, it's intentional. Mobile processors don't support Tccd at all, and
> Tctl is the only available temperature metric on such processors.
> In the commit message there is an example of bogus Tccd reporting.
> 
> Thanks,
> Rong
> 

Yeah; FWIW I agree with this patch.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

>>
>> Guenter
>>
>>>    			data->ccd_offset = 0x1F0;
>>>    			k10temp_get_ccd_support(data, 16);
>>>    			break;
>>>
>>> ---
>>> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
>>> change-id: 7b515a4b-k10temp-fix-zen5-epyc-14334e85a3b9
>>>
>>> Thanks,
>>> Rong
>>

