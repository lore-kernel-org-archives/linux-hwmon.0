Received: from doubleyoutf.uk (doubleyoutf.uk [109.228.47.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B634D128386
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Feb 2024 22:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.228.47.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708553530; cv=none; b=hA/hYUTehwCmqdQXT7AVToPJLt+uNKOwOvNOtFyeikMqq7yLs8+dmraK2kwWORHfY/Gj5cczUFTlh1+EzaLOHA4BuntWe6GGtGteIjLP5yyKdjupr6u2iSI6q7Hs2P08ZjQB8sK5gA5I9BDELiBBX+dkCKUpwPxlcTfjUULNP4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708553530; c=relaxed/simple;
	bh=V3g+aaLHlvodCkrLNl3/FWHgApP1/iUqu4UAzUEtEhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubhTIbPkaCXz76G+XDRULbnpWypfo7jCfIthXXPJxsG9lU0hXNVPO2Q+/z8msCsRAx59UTWDIXk+XtGo2agyDw/yer1sH57hLjWtEQdPvt+ftbs98Ax6zkWY8j3qnu3vxOlmN40k6nA7CRNUVsobqhrtfipEqaB+7k8hvzgvc98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khalifa.ws; spf=pass smtp.mailfrom=khalifa.ws; arc=none smtp.client-ip=109.228.47.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khalifa.ws
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khalifa.ws
Received: from [2a00:23cc:d202:6033::b56]
	by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <ahmad@khalifa.ws>)
	id 1rcunx-00Fuv9-OC; Wed, 21 Feb 2024 22:12:06 +0000
Message-ID: <da0d203a-e22c-472e-856e-18a31a8231dc@khalifa.ws>
Date: Wed, 21 Feb 2024 22:12:06 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nct6775: Fix access to temperature configuration
 registers
Content-Language: en-GB
To: Guenter Roeck <linux@roeck-us.net>,
 Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Erhard Furtner <erhard_f@mailbox.org>
References: <20240221141345.2231350-1-linux@roeck-us.net>
 <bb7eab62-6f83-49af-8ac4-516a991b99bd@khalifa.ws>
 <934b2230-e44c-4332-99c5-71dc64f7a185@roeck-us.net>
From: Ahmad Khalifa <ahmad@khalifa.ws>
In-Reply-To: <934b2230-e44c-4332-99c5-71dc64f7a185@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/02/2024 21:59, Guenter Roeck wrote:
>> Tiny note, i is in the range of 0..7 on nct6798/nct6799 if I
>> follow correctly? Still 8 > 2, well caught.
>>
> Sorry, I don't understand your comment. Yes, i is in the range of 0..7 on
> nct6798/nct6799, which triggers the failure if i >= 2 because the code uses
> the NCT6779_REG_TEMP_CONFIG array to identify configuration registers,
> and that array only has two entries.

Ok, I think I was following correctly, just thrown off by the comment
on the bug report thread about i being 0..11:
> The range of "i" is 0..11, and the size of the reg_temp_config[] array is 2. Oops.



-- 
Regards,
Ahmad
