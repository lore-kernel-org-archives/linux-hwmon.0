Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A37B352005
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 18:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785867155; cv=none; b=MtX5hnk96pCRmKcTSJz5livArR7wsBsuZ8xRMJXiSI4H/VBMqp3kQIljCPOEvOeY9Ujmdgqw9a+DSPzaRMC+CrmtEeXDeOi3tjSD9JQ7SATFbc8V4X10uBK87Wt+a2SJv1eoTxXXG0XXeSiGeXQroS5yqop2AcUJ7eGSnZA2iPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785867155; c=relaxed/simple;
	bh=8nfeFPXZr6ltnKgpkCwdYbUo3ev+v5qd4ZFzrVmE37A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8KqOufVhMB1rHeHI9fZwad9JOjpZykoruvS6hW3S6XYJkRqpjbkogc4lW0SIsaCj8ahTVyiZE1cqNhpmEfZ/4AOKgfrhwY9ay83s0mpbZw/2CJrca+/8toYnxnaTmpUfNRU5Sbx30yAFshu6PLozHGfGAmRAvpt2CH+pNO6/DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=To1I9lPT; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="To1I9lPT"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so111256a91.3
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 11:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785867153; x=1786471953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YTHfj0xWI/bhPzhiRmqle6iUxuIBZbPn4HRI/FF8H+E=;
        b=To1I9lPTVdr1QwpQLtJeTr0EvndAApZrQ0mjk83z1lejSMeW47z28W0EcQUv4kNtx/
         u5spcF6fXyW0eBV1xAE9Qs2ujbS4AM2MDQhiqLMLEnttqNUWD6FtO17z/HRw8UY1FyED
         djOWFzi8c+ZLBLtpYhHVocm0NCSyD2Vdd2d/esu8F1lYR7QLC1ACbuHLBwIL17JYaGMo
         YpgibpS5yXvG+2JloaXj1bVCukBmedPbYTVwTaTNixQTBXv/luz8EkAFovQ1lM7NSMfE
         3fOlfnQHPRA7fbGpETnHmy80BRHhKLt/qJO96Ieht5BcJQVheUfrhDre9Y8BBuncjOy3
         RVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785867153; x=1786471953;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YTHfj0xWI/bhPzhiRmqle6iUxuIBZbPn4HRI/FF8H+E=;
        b=BQnVSxJlWXBDUuNoxjXEJz67SGp8SfV+fqpWzNAJYeQKwxqmm9RZmjmmagEAIRB/tD
         dNfoCxlLKvLomXqirsb9Rbq/Z91+C8Aj1zlLiVJBWxJHdhyljrplyeAT5It7aK8togiv
         2/9xdyrGOFGhXjjz+rEuKoyPjZeFKKQ7fHGbd9Cwevi55OnHu66pnpgNUqXXaDh1L9PS
         jYRi/vJnAPSvDgovnn0jOtDqLns7B2KXWBhtq5fA2KWtH5v7CJrBJjlO85RqO/YupYgc
         OvrtFtgeFBMhSCzjASL9Zfd12jlcKHsaVOA6nzbXXxq2pnqLS+ZyxL0DFQ9S1wLF2sCP
         R5mg==
X-Gm-Message-State: AOJu0YylyBgxuR0XByYXRci4PtxOB41tVXu/0NeQ68i5Ki/tS8sT6ej2
	SPXmpeMdD5wkAFApguCLqLt/C4b95YLPXrrxqEq3dJSBGgX1Y1N706PO
X-Gm-Gg: AR+sD11kc3WokdDor1vZSHpNoF0SFlpR/OS0VlvR9hSzZJJjCQavk9endFx2D10h9om
	Ujr3lPB5lLl2aHe63SUhIAyNjRJNNCIIQm3uhV6VFXzW3SulEfmkqtoMfjw05Xp3+RwM3TrsVnV
	+mlYPLrDfJtF8TuxM8e6WNHXvapMAveQnWtjoPwT5EYF5/z15bgLFc2e5dmgz2ZB4L8oIOkNvZH
	pjiUBdgbJK09rwwoGjFaB1yRk97DhzEb8tdKLuYqfjO74N1wBPLYv8Q89SRvG+2rWGDPy9u9gmU
	M/0ImN9D9YvTqCtUbGZx82s2aVLyT2pMV3vUF1eReTm/RzoC3r6iRyUVLLM6cTc3QSeIxGhWCR+
	mc/pv/dEGE7PX/ftq4nER8AMgAVtWTwpCCPBsNFfpLIwa79qVIy3wZk0Q74SC7jGLAh14nSNP0f
	AABHKNYIqTVmjvV+Uuh8hVJYGGQi7MTrbY1QzbBi8sTJaTtsQ2KGon/c7Ua/oM33KvOGRPaPggN
	48ZuvPTyPuleEHWL7bTHrslA8GxZ9YPh2aHvsMNEEvGTqDa7A==
X-Received: by 2002:a17:90b:3c07:b0:381:cef1:11bb with SMTP id 98e67ed59e1d1-3903c699b5amr636617a91.22.1785867153260;
        Tue, 04 Aug 2026 11:12:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca52d329sm5579052c88.4.2026.08.04.11.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 11:12:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8d30fe0b-690c-402e-98bd-d8e2c3bed486@roeck-us.net>
Date: Tue, 4 Aug 2026 11:12:31 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] hwmon: (pmbus/core) Introduce
 pmbus_read_smbus_i2c_block_data()
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
References: <20260803193535.2286578-1-linux@roeck-us.net>
 <20260803193535.2286578-2-linux@roeck-us.net> <anGlg2E-tcp_6Qkn@nsa>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <anGlg2E-tcp_6Qkn@nsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/4/26 01:45, Nuno Sá wrote:
...
>> +	/*
>> +	 * If the returned data is valid SMBus block data, the first byte
>> +	 * must be the data length.
>> +	 *
>> +	 * i2c_smbus_read_i2c_block_data() may return an error if the chip
>> +	 * sends NACK before the number of requested bytes is received.
>> +	 * Handle this by reading the data length first, then reading the
>> +	 * entire message up to I2C_SMBUS_BLOCK_MAX bytes. This ensures
>> +	 * that requested number of bytes never exceeds the number of
>> +	 * bytes sent by the chip.
>> +	 */
>> +	pmbus_wait(client);
>> +	ret = i2c_smbus_read_i2c_block_data(client, reg, 1, buf);
>> +	pmbus_update_ts(client, 0);
>> +	if (ret < 0)
>> +		return ret;
>> +	if (ret != 1)
>> +		return -EIO;
>> +
> 
> I think the above is ret != -1 is not really necessary (same for the
> below check. i2c_smbus_read_i2c_block_data() always returns the length passed to it.
> The only case where it doesn't is if we pass something >
> I2C_SMBUS_BLOCK_MAX which would always fail anyways.
> 

Good point. I'll drop the checks.

Thanks,
Guenter

