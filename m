Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659E94E36ED
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2026 20:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675418; cv=none; b=cZuQGmGDxHHPrTKrFtyxS20g2Ok/VbX0TKLMF6RCKPmZlpbbZq1Akm5YlhTPwp9z1o9j0zn0V1+DeHXYO9YWa12oV6jS/InFF5qyEE2dXd0Alw235THlc9Og689wxqIuSsZ/O1N/MTRvwJmdCbwMDGt2o6s9gk9WF5JltBLAYLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675418; c=relaxed/simple;
	bh=cy6gryX7xvTwXYc9D0rs04mwUAH67g0vEJ9EZm2av0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eCpQyStBBrUeQ3b23VDSuckckB1Ofx/pNeZFhh0161hN9ONyTclanbdzFp99VJkV17HSIusjiz1BgQSV4PGg0su37b/KUroV1rrQyTmcGpI0r5ujdKru1BgzLPnAcHUxwje4Nx4iXuk+6pGxvk9hzL5sYRsnLS27VNWmfPEBgbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/UKgliG; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/UKgliG"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so306145a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2026 13:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789675417; x=1790280217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YXZn9qln3Av2anrhIoMlqHVX55tm+WemDQSfecUoeU=;
        b=I/UKgliGA0zdPZUgZnEH2FtFVlvhgZEzVd6bDnPPn6fZf9f2o/JmlkMQsQXaJHCPYI
         YM8eaknmTDycUpAPeS9DyZKn1oLVjSE42XY9jV4+OFfkEyULuxBLSQKSdLCKVJIU8Jyo
         QWr8EQRY0mK+Hv5JNsRe38nxfo1T4UhA6h1Vlnk47CfJUELaLRAJ4mMFLmbhqUm5HKO5
         nHU0BvJ9rRe0wKhI0Z8+OCk8kChGzvubNusqTM1betPxaCW+JffIq4LnTXmjPHfN+yOT
         Mk78xKjJpnYZ4AJzL5IphwUcmidgBMqgSYa8aAgaJaSas+1R2uomAFYY02YgYQ6btP+e
         w+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675417; x=1790280217;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2YXZn9qln3Av2anrhIoMlqHVX55tm+WemDQSfecUoeU=;
        b=oZafR6q7XOqr39vIB0Www8hIWy3qUKhC3kqR2LmY/H7nO/ByK/5/JtjQ4Z264cMQ05
         D5NU0BMgGfh1jE590n4z/hnjSiN+ENX8Ys4m3gBkAMWSzRXdNBI2y5eFjUZc8Y7MwvU5
         5TvYuR9DWQleqIQDM5d8qpk6AQZKYs0inbcsVTVBr0xdmmslMFqWje+N2D09bbR/VI6a
         15z9BNUx8cWLG0jBCvFDQ017+oyxWzH7oMkpO6TLrc2E49C+sGqJNXvqekuGGAP2HwZa
         CMmsRp3yiAzsWh0Sezm60/ucJkAIWjurnfldFgdmbNf86uURQH7ULPn+PzMc4iiisTJn
         XFVg==
X-Gm-Message-State: AFuF++lLRCX7GGSZ9vai459oIbhld7jYXvxE5zLFYCGZhD1sGWl7SBBV
	jko/R7FUMOmBXMKsP2a0FqaE/8wSbk7ZYL/yNqDl+B3xOIs1ODqzVgs3N9PjyP9v
X-Gm-Gg: AYBFou3V7f03WmCXGX0VgWcu5X4hyfjULH2+dPkFb8e4hoFksw9oy4FXuOP8d/CQgGI
	Jg5KCxkWp0M/YsNM/TygofW/3xH2r3Ryfcgrs8wpjVb8f014z9SIH1mGkp+vqzB+3h9E9nE/iuK
	p1xlLjl1t05QDkc3uDrQwj8xo9NdV15wmnufb32NNfQstKYK1+qnny7/bf0S7aUEgEMRVcVyh18
	z3WJ2gXRsGljNGLiowodi93YM+iXb7Bp9t8zXdWTtdc1rCfODrtXoEXZJNgvf9p6OxQlIGRfLKP
	ibNQWZhfp4orYyyUr98muYd82Nl2NCLTYENgCs68htjs4OXXCg6JFxPTgqHAz478RCoSXFlI3T7
	pq1nozq79ImmDg4sGyM0240PXT9n/lhOGK1/8XXhj/ywDg6l+5L1xE1S+1rLwxf1v8cbw7ENjMk
	iq1P7RzNtsxcQzfIKy2nT6xCaGXq/IBpuESawyw1/30V5Mxokkz2/G3GYST6gRPCGYdpPz3803Y
	k/wFuejNc0YUQqBlD6pPQ08oybiTRs27rm4NI+hqj2YIBGw
X-Received: by 2002:a05:6a21:140a:b0:3d3:aed2:6f29 with SMTP id adf61e73a8af0-3dd72702d34mr6589700637.29.1789675416705;
        Thu, 17 Sep 2026 13:03:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1e38sm18263572eec.16.2026.09.17.13.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 13:03:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <94109b63-7886-4bd3-8879-5c6740c69964@roeck-us.net>
Date: Thu, 17 Sep 2026 13:03:35 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] hwmon: (nct6683) Enable pwm control on ASRock B850
 Steel Legend WiFi
To: Fabio Baltieri <fabio.baltieri@gmail.com>,
 Johan Dahlin <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260825092546.669450-1-jdahlin@gmail.com>
 <20260825092546.669450-6-jdahlin@gmail.com> <aqwk3JIvOLD3rB_T@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aqwk3JIvOLD3rB_T@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 10:35, Fabio Baltieri wrote:
> Hi,
> 
> On Tue, Aug 25, 2026 at 11:25:46AM +0200, Johan Dahlin wrote:
>> Fan control has been measured on this board: with a fan in manual mode the
>> applied pwm value tracks what is written, and the fan responds
>> proportionally from 337 RPM at pwm 60 to 933 RPM at pwm 255.
>>
>> Allow pwm writes on this board.
>>
>> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
>> ---
>>   drivers/hwmon/nct6683.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
>> index 6825e6c3af34..df28055b1a1c 100644
>> --- a/drivers/hwmon/nct6683.c
>> +++ b/drivers/hwmon/nct6683.c
>> @@ -972,7 +972,8 @@ SENSOR_TEMPLATE(pwm, "pwm%d", S_IRUGO, show_pwm, store_pwm, 0);
>>    */
>>   static bool nct6683_has_fan_control(struct nct6683_data *data)
>>   {
>> -	return data->customer_id == NCT6683_CUSTOMER_ID_MITAC;
>> +	return data->customer_id == NCT6683_CUSTOMER_ID_MITAC ||
>> +	       data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8;
>>   }
>>   
>>   /*
> 
> Thanks for the patches, I tried this on an ASRock BC-250, also NCT6686D,
> and it works fine there as well. The board id is
> NCT6683_CUSTOMER_ID_AMD and all it needed was:
> 
> -              data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8;
> +              data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8 ||
> +              data->customer_id == NCT6683_CUSTOMER_ID_AMD;
> 
> Maybe you can add that as well once you send the v2 of this? (and a
> Tested-by: Fabio Baltieri <fabio.baltieri@gmail.com>). Or I'm happy to
> send a followup myself once this gets merged, whatever you prefer.
> 
> Either way I feel like this list is going to grow, maybe a
> 
> switch (data->customer_id) {
> ...
> 
> would work out better long term here.
> 
Or maybe add a boolean have_fan_control or similar to struct nct6683_data,
populate it in the probe function, and just use it.

Thanks,
Guenter

