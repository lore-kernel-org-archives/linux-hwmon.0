Received: from mx15lb.world4you.com (mx15lb.world4you.com [81.19.149.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1368B145B25
	for <linux-hwmon@vger.kernel.org>; Tue, 13 May 2025 18:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161648; cv=none; b=dz3+lkFXzJaajZF42o8raIeoeGPt8uIuvrqljX0udJflpC0QbLxmHnF5Ap3ArmK9/ZWjvyGntXbfSsvMgl6LTCvOBofgcjt/4jHY04dDYx12HKFMl2vw26Qex5E7MMxpKZ1V+uOPW7Z32nlPPwK8UmlDnWg0iHpyrwG90DjjNTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161648; c=relaxed/simple;
	bh=oBDifIN5wOcNsdYZxNrPYNGh00IkSUWxtrfKmTlp8Cc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XcsN8B6ck3atn2p71TKgpBYq+qroeW9BnHkAuCetK8+gLjMGhoMk2Jc6z51EJkVmIUewGSiRHRtc+K6PWiqUSArCU0/hYYhtkJTGkxlikyUkmo55xU8m+IQ0L9YXgnkmn+AwkAJPLCVEemnVs/GyUL+XCVXot6JXvnTxFsKvMjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=WY2cwZT8; arc=none smtp.client-ip=81.19.149.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="WY2cwZT8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UXY85wjjAt1hG+mkRVpE6c1w8fVbp2uf20wYHDjmWuo=; b=WY2cwZT8JQgdfFROev4CH0szRv
	5dA9QGNQVLsNy6rrj05vov8iXCBRQMXY4+z9SRlE7ZcqmSGJr3jBsdBgWCvgiEMVSmHzoBE1QdlUh
	X2grOEcavTDLkxIGRK8uTbv/RsslqTm1G++LK/Nig3deACQBFAR+acz0djGajhYJ/Uws=;
Received: from [188.22.4.212] (helo=[10.0.0.160])
	by mx15lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1uEuYV-000000004yP-1bPm;
	Tue, 13 May 2025 20:40:43 +0200
Message-ID: <7cd66ad5-6d73-4b45-a62c-3b7e1d33c833@engleder-embedded.com>
Date: Tue, 13 May 2025 20:40:42 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Add KEBA fan controller support
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 Gerhard Engleder <eg@keba.com>
References: <20250425194823.54664-1-gerhard@engleder-embedded.com>
 <98e26e9c-5b7b-4053-9d4a-a6cec915a56e@roeck-us.net>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <98e26e9c-5b7b-4053-9d4a-a6cec915a56e@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes

On 12.05.25 18:48, Guenter Roeck wrote:
> On Fri, Apr 25, 2025 at 09:48:23PM +0200, Gerhard Engleder wrote:
>> From: Gerhard Engleder <eg@keba.com>
>>
>> The KEBA fan controller is found in the system FPGA of KEBA PLC devices.
>> It detects if the fan is removed or blocked. For fans with tacho signal
>> the monitoring of the speed of the fan is supported. It also supports to
>> regulate the speed of fans with PWM input.
>>
>> The auxiliary device for this driver is instantiated by the cp500 misc
>> driver.
>>
>> Signed-off-by: Gerhard Engleder <eg@keba.com>
> 
> Applied.

Thanks for applying and fixing the fall through warnings of clang!

regards, gerhard
