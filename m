Received: from juniper.fatooh.org (juniper.fatooh.org [173.255.221.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6417517B425
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 05:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.221.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775022553; cv=none; b=M8l5DyHz1VHo07hYVqc0UFQbXzN4WUzGgzIezfdg7+NrefFfxXg7tMOJJQ6TEOVuNyrIU5Q6xWHtnOuNNopgBxIoJVVT6Hg9rUj8eJuCPEcv7EpQsPdB8NQkruz5G1ooE4Us2gVfp9Tr003j7n0a32FkNU6SoSJ2HF5yx3Y0Eao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775022553; c=relaxed/simple;
	bh=k3TPPbSssRiB06ddsu/e4xX+1NbVg1s8ECeLICvF4Ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ik6VGFgbNj8UchrwAZUqenY/U2PHEHY9+LL7NZ+qYDAbMZrKHYY6u4TQIyF6rw6a/Bmr58s5gJkIez/XqHuKzInCcLG7jNYxF6ZwVkuoMlm5E6dG6GEXQLki+awP8bHx1byJhLFid8OCp7qHbyftPJ8BsvF0gW3vKqx6Yr9740A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org; spf=pass smtp.mailfrom=fatooh.org; dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b=kjZtHWgN; arc=none smtp.client-ip=173.255.221.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fatooh.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b="kjZtHWgN"
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPS id 3D8C2401F4;
	Tue, 31 Mar 2026 22:49:05 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	by juniper.fatooh.org (Postfix) with ESMTP id F075340261;
	Tue, 31 Mar 2026 22:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding; s=dkim; bh=g+3SDnrAZPBM
	EGaqZRCyKXoz0GA=; b=kjZtHWgNG5qm+ZKWZp68cm+ecLMO7BmmZY+DjXmPknu/
	ZYelLwzfte4RpQvru1bVQH7Z/qcOjA0LxjIfVqKbGpCpqssO2D4qFFxR3S+M7I6Y
	/WuVHvjGE9lSCEK59oj9cU5xggjJTuajs83Sk4lFWiCJgjWFRahmZxdKiNbtUGE=
DomainKey-Signature: a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=dkim; b=Da+hvT
	V1xV7++UtCtYQe2AaO/VyR30Jc/B/gjlyO5HavxlZytjVp8BmNbsJA8ZC+gllFRR
	72kLE4tsXl2/RbCMFHYuimNgY7gbruApSun1J5VAJhPurrOu+PT20jxSuRfHFC6i
	eR7OMB7bij/hT6Osq0BpURFo8olrCPAXPSt4U=
Received: from [198.18.0.3] (unknown [104.184.153.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPSA id 8DF42401F4;
	Tue, 31 Mar 2026 22:49:04 -0700 (PDT)
Message-ID: <ba3c3be8-18eb-4e5c-97ed-9fc23f2ea7a9@fatooh.org>
Date: Tue, 31 Mar 2026 22:49:03 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] hwmon: (asus-ec-sensors) fix T_Sensor for PRIME
 X670E-PRO WIFI
To: Guenter Roeck <linux@roeck-us.net>
Cc: Eugene Shalygin <eugene.shalygin@gmail.com>, linux-hwmon@vger.kernel.org
References: <20260331215414.368785-1-bugfood-ml@fatooh.org>
 <6f1e43e0-14c0-40d7-ba43-95ece77d7176@roeck-us.net>
Content-Language: en-US
From: Corey Hickey <bugfood-ml@fatooh.org>
In-Reply-To: <6f1e43e0-14c0-40d7-ba43-95ece77d7176@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026-03-31 21:35, Guenter Roeck wrote:
> On Tue, Mar 31, 2026 at 02:49:06PM -0700, Corey Hickey wrote:
>> From: Corey Hickey <bugfood-c@fatooh.org>
>>
>> On the Asus PRIME X670E-PRO WIFI, the driver reports a constant value of
>> zero for T_Sensor. On this board, the register for T_Sensor is at a
>> diferent address, as found by experimentation and confirmed by
> 
> different
> 
> No need to resend, I'll fix that up.
> 
>> comparison to an independent temperature reading.
>>
>> * sensor disconnected: -62.0°C
>> * ambient temperature: +22.0°C
>> * held between fingers: +30.0°C
>>
>> Introduce SENSOR_TEMP_T_SENSOR_ALT1 to support the PRIME X670E-PRO WIFI
>> without causing a regression for other 600-series boards
>>
>> Fixes: f7ac3020036b ("hwmon: (asus-ec-sensors) add ROG Crosshair X670E Gene.")
>> Signed-off-by: Corey Hickey <bugfood-c@fatooh.org>
> 
> Applied.

Thank you.

-Corey
