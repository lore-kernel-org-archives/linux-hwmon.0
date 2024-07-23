Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9E013B599
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 14:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721746127; cv=none; b=mZvpkw0pJk8AAr8UL95nwvvVBlEF7ItzfhRpAaGIjrSE/ocl3sC6EBhZ8CJqEMSBuBDdT+HO9cvxctkCUEsGpjynmF7YFYyVBlNIE/00vNxILr94LPn9wNiTmi5tjTaEJ+kxwz1/Syej/siB/YQNilbHPaI4JUGeN7Rt2lN/iEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721746127; c=relaxed/simple;
	bh=qX9CRHwR+EePgPJbYYRrQLBSwwBC4ErTSip1Pg0rREs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nNHdJYGZyUI26PsgSvL9U8P1PpxvtE1rGhV6CVlhDGWeXn4Lgt2cz7bAbVWzyR2j9QkzkA8CunyPUlFMttW4cWZoYTV0yNDKhG8cMnlrVD9zQCyLJ+wNdkkH2CaUGTEq7PBKKFezeHdQvsX9eQZCHif9nsMPRoPC48leGBL/o2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrjyJcs0; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrjyJcs0"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-75ee39f1ffbso600184a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721746126; x=1722350926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/MqQsXGOEQNV0EWuxuUKh2FiTc6brClhpBLB26tVcc0=;
        b=MrjyJcs0lDaEaLt42HX0zayyflTMjxcQg5GdIfOzEJQMkerUVQr+xJRB7Jr2eC1r9e
         YC48IhvNxuxRPEBKOS7aylDyzcERwb5zVhtde1bCUbRqHHljBgahBxFBixjUH6rDU3Ks
         Qrn5TuGi38wyTYhOkIv7j537+wiAAOpNDBOD3VaGkmTSujM7sGNPhvCu9Vzlh7BpfR7R
         9QmJxQXaxTD5uskmLN9C2ohZSLihFCxvMw19P5MWUGxUG3sLoAz1NiyZNzmTDXtwDZEs
         /IfgvJAxOG+0w0QKrWBpmgtEm9/kbtdSH/q4Oc1BJWEi6hKcwSPewy6ZfKrI4GZSexhA
         DYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721746126; x=1722350926;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MqQsXGOEQNV0EWuxuUKh2FiTc6brClhpBLB26tVcc0=;
        b=MYtdCE63IEU+currj9YDNq5oB3UieK5BfG2cc6aPUnUaVFks11qE5msTknBI6k/VAk
         bjr7EtKCWEbnS/R44+NKPIkkLKH7KDe+05fJ5JPxgMVq3/cjtqj0lK7+/PwpNBZH81h9
         g/LYA+GZ7QylZWcgRgt9+48+oHkCBxghbQRy1NmWAuzbh98Qb3NXrXkycx+mhN5C4aH+
         EMBHsS8zR07svwAI7GgCw5q3TeNMIF5QrOHnPj3aOUdTFpvI2ke0zfdr+xRCNF/aI2Ml
         ySAhsxIiykYvB/aYFuLMphK/IHNbqZ2SnY/zYMSO2m8j0ezEvpgquni6hlhEiukh9h/c
         9NkQ==
X-Gm-Message-State: AOJu0Yzbru2OzG3Cg5EqMkk+VP73VKZuUgQ0yjIdnH+eGqETjdx8h+nI
	96HQJx5M8KL4nQjT6QxwE146GgiLR/x6/Xxut7ZCWQOWSlwpdL+ubRxgNA==
X-Google-Smtp-Source: AGHT+IEtGCipQj5izhQqflaX1XgTu8Xqd8mDtQ2VgIO7SS+z8OoSVwNtB83nbNXmVqsejFenXdzhtg==
X-Received: by 2002:a05:6a21:458b:b0:1be:e265:81fa with SMTP id adf61e73a8af0-1c44f9385c6mr3390624637.35.1721746125693;
        Tue, 23 Jul 2024 07:48:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ccf7b2f300sm9156242a91.10.2024.07.23.07.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 07:48:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e73f56f7-953b-4584-ba9f-0424834cd1e5@roeck-us.net>
Date: Tue, 23 Jul 2024 07:48:43 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] hwmon: (max6697) Drop platform data support
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240723005204.1356501-1-linux@roeck-us.net>
 <20240723005204.1356501-3-linux@roeck-us.net> <Zp9Bh4JgGJX3yhV6@google.com>
 <74c7c412-6f8b-40d7-9f43-d28ae91db5e0@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <74c7c412-6f8b-40d7-9f43-d28ae91db5e0@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/24 07:20, Guenter Roeck wrote:
> On Tue, Jul 23, 2024 at 05:37:11AM +0000, Tzung-Bi Shih wrote:
>> On Mon, Jul 22, 2024 at 05:52:00PM -0700, Guenter Roeck wrote:
>>> +static int max6697_config_of(struct max6697_data *data, struct i2c_client *client)
>>>   {
>> [...]
>>> -	pdata->smbus_timeout_disable =
>>> -		of_property_read_bool(node, "smbus-timeout-disable");
>>> -	pdata->extended_range_enable =
>>> -		of_property_read_bool(node, "extended-range-enable");
>>> -	pdata->beta_compensation =
>>> -		of_property_read_bool(node, "beta-compensation-enable");
>>> +	confreg = 0;
>>> +	if (of_property_read_bool(node, "smbus-timeout-disable") &&
>>> +	    (data->chip->valid_conf & MAX6697_CONF_TIMEOUT)) {
>>
>> s/data->chip/chip/.
>>
>>> +	if (data->type == max6581) {
>>
>> Should be `data->type != max6581`.
>>
> 
> Correct, It needs a bit more, actually. For max6581, the check needs to be
> 
> 	if (of_property_read_u32(node, "resistance-cancellation", &vals[0]) &&
> 	    of_property_read_bool(node, "resistance-cancellation"))
> 		vals[0] = 0xfe;
> 	else
> 		vals[0] = 0;
> 

That isn't correct either.

         if (of_property_read_u32(node, "resistance-cancellation", &vals[0])) {
                 if (of_property_read_bool(node, "resistance-cancellation"))
                         vals[0] = 0xfe;
                 else
                         vals[0] = 0;
         }

should do it.

Guenter

