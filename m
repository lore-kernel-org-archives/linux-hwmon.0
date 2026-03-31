Received: from juniper.fatooh.org (juniper.fatooh.org [173.255.221.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AB23FA5FD
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 17:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.221.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979622; cv=none; b=U5CpoEwnEIpKZu5LkryiLXQRhHv+LwPv01Ec5Wfw897M1HaWNlbfwE0IQMeTWTm+1g6gvjpd1qBHfzha5MyKnSLZ03I2YtBYl11mQ5SPw+iqJGyqXtVNdIa536uJPQOcJqbiS81o1snppUJRrIQaU+U2YGou9+CsbP/dhnhI5bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979622; c=relaxed/simple;
	bh=ZXajsEGFCRRTZtGDPnHZAkMFhMcEHwcW8dayV2h4KWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OciHW1SGsFrF0ObBeQq/C7YwmEhmuoK+jfV/4ZmHDlXEDH1kIZ5D5E8M7T9gNX15d2Tx0CqJmmyGNuD55u+pnB/czxPEjmYxm7qhKke9q4WHbSsZ7Yr3qJ2n0h95On8HhwdV0mcvQFMacdZevdTIl3Yc+ykW+TP6dyeRdG7qgek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org; spf=pass smtp.mailfrom=fatooh.org; dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b=hbn7rkDF; arc=none smtp.client-ip=173.255.221.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fatooh.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b="hbn7rkDF"
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPS id E8409401F4;
	Tue, 31 Mar 2026 10:53:36 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	by juniper.fatooh.org (Postfix) with ESMTP id CE87440261;
	Tue, 31 Mar 2026 10:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding; s=dkim; bh=bF3kp0lgUqHz
	SdCEP2t+WK+iVEw=; b=hbn7rkDFidZ7md1t8lwrOkw0DpOM7deqwqXGDLW6g9U4
	WPdYqsG6y0uT8VdYa2FjTYArYmFK/wnF2EtDGQ7P9m+3Igbq7gb3OHK2BHbuTpb0
	1HVxpGJzh0F/gDnwL8M1/+LZucKEuM5yezm2WTI8BGCopFhpu+FE/KHuzQ85c0c=
DomainKey-Signature: a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=dkim; b=ZBN3Je
	RWsBh4ldgZPlzabIa1GMIMQ3ZOjtkXOxEElSBOQOCRHBFVnu6VI3ZvHVNZKFuAvU
	Nws9RJtUYs6b+Gm/3zJQ0Vq14H+JCmMyGyqQd1a9EPtAwSi30Cl1Chl0ll9DwAg7
	RASoUV9JyF7SLCsNHTPAo8ORWVr0wnUoEjoPo=
Received: from [198.18.0.3] (unknown [104.184.153.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPSA id 8FD9B401F4;
	Tue, 31 Mar 2026 10:53:36 -0700 (PDT)
Message-ID: <7d7aebef-d113-40fe-9471-dd14435a36a9@fatooh.org>
Date: Tue, 31 Mar 2026 10:53:35 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) fix T_Sensor for PRIME
 X670E-PRO WIFI
To: Guenter Roeck <linux@roeck-us.net>,
 Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260330230836.314311-1-bugfood-ml@fatooh.org>
 <20260331051653.332155-1-bugfood-ml@fatooh.org>
 <CAB95QASo+qOfFU3tFgowcvyKSyj6Xt+2dE2dDkFV3YrPYWcLbw@mail.gmail.com>
 <ca943191-5490-4640-a940-0d325ca90f4f@roeck-us.net>
Content-Language: en-US
From: Corey Hickey <bugfood-ml@fatooh.org>
In-Reply-To: <ca943191-5490-4640-a940-0d325ca90f4f@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-03-31 08:01, Guenter Roeck wrote:
> On 3/31/26 03:39, Eugene Shalygin wrote:
>> Hi Corey,
>>
>> you are correct, temperature readings for disconnected sensors are
>> negative (-40 or less).

Thank you for confirming this.

>> On Tue, 31 Mar 2026 at 07:16, Corey Hickey <bugfood-ml@fatooh.org> wrote:
>>>
>>> From: Corey Hickey <bugfood-c@fatooh.org>
>>>
>>> +       /*
>>> +        * The address of T_Sensor can vary; only one of the following T_Sensor
>>> +        * addresses will be used, depending on motherboard model.
>>> +        */
>> I don't think we need this comment in a reverse-engineered driver.
> 
> Good point. I guess similar comments could be added everywhere and just end up making noise.

Ok, I can remove the comment.

> On a side note, this version of the patch was submitted as response to v1, which
> is discouraged. Corey - please don't do that.

Got it; I updated my notes.

I sent the v3 patch now.

-Corey
