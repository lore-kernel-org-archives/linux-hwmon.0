Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EF039AD5B
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 13:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778594122; cv=none; b=fGgzHnSRUfIOAuDThdxtVdsj7gVW6zm2Y8JRErhNXoabnU0gOtXACBCAI2BMpnp9u54aGRKn5CNk4+HWUG/v02A/pvjPypJwmPNh8NmlFMJjz7jWQs4IzFVZ/9KO7nmiLtCleZGeeFLRiOpZIb5ggNrHbjgloygrqkIoH6rN4V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778594122; c=relaxed/simple;
	bh=WV0Jj2uYN+LDi0YrhfsM1rMAqeYq5r16T4MRZ5bboCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z+jRFFl/bJznV9rdfrs4iQ2NlbS9TUFtoI/21pEhefH3BJcqPN2ofZIiS+aRlxDB3CZi/fqcut/S3Owx/xma9PspnjzHLqwg8pAn63tdluc7M+chUBmEdaw1dYGl5dJ/QHfa6UB5CDNqgEOxQBmmvCbnWXG598Yiaxw8G+EKaN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZpUF04b; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZpUF04b"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ba6485d219so36143755ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 06:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778594120; x=1779198920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=i1vAUH1Xc/CeVIjxxykjK48OMEfxWKrZOx+2D03GO68=;
        b=qZpUF04bprIBOxcElXaccYIqaLLfNrE/lUzX4vGgcInwVh4TEOozBhJqX3x1lOUTs0
         AjB7Gx9RV+dOicqULXjgSquXy2Dwqos0awvgZRGmICG6Ejh/MmLHJcVy0ncuSVpxBzso
         BjZ6j6P3oGxagKHmwa+QGPtsEG2bEfc17fUSoNxdsXnwWYUqPCqtSA+c5BHXdqZ7qkko
         gEufGsD6scYpmTsMunM10Gtbkv6SS8BP/QnO9eIlvJEUmSJS8fiLpOAcLrxnZAlxXptm
         Fv2Y0LhyJep2zpolpnwX7qv5tF/0Ur8s8sks7DxXMM+1R7F3uq6quStk+SDOs7c/PVQG
         WPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778594120; x=1779198920;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1vAUH1Xc/CeVIjxxykjK48OMEfxWKrZOx+2D03GO68=;
        b=pRfUDWsH6FV9OC28G5RSToWdQIzdRbfmdMl1N+cCyjLg7tno87INPV/u1Kk6OTAe1I
         +DughepmjZcDlGeTHuEZoZHo3gC9a+bXOc4VHYx9+BOLMs3zQQDOuBtBYYfh9Yyw69vU
         RUMiMnh4L4eFS4VYqUUMELPx5cnoi0HYtn95ORdIw7Z6G+4YPtzKjoaaqX9rfSRoMJJb
         dqgfnhcyi7aJDHpfurLWIRITvFxnfKqTK2GNL5Eg7GmOzX53LhwlDrQWAHOPKGPjbMFY
         9/RDGznt7j6FxFJX378uKZv2DBkKCliYGuRlkTqMJCufWl5iqMgGNDLTRK6iRx2fVmDh
         OmVQ==
X-Gm-Message-State: AOJu0YyC5Uu01JgjN9tX3yHjwHikJTNRodprAkUlqBirtD1kreBT96YI
	ml0qKmIx0J7h0TpgPPqocRMc78ck+h29TG/Q69iRV0qkS324NU2iYtfXx2TmjA==
X-Gm-Gg: Acq92OFBnkGSbMA2A92kB+yyzvDCNzMtKICo3Kkx+TtLiYz7TxXPJz8IGOfjy0pH4h3
	Q2T9slVNMVO6BTg9v1wz7hhH2mLTmLwVaioVGaMBgXTMjTEsJuZ+BUxFb9ZmvtF6vqYcdV31gyl
	GFp9VKIc3QrZbEtodfGDbBjoWEFEsxGbPdLsWXyBanlnOgPyu3kVzDk3MlHTarFqGXW7Ffu2e9x
	JtY+EGRoS1HMZjs7aDOpEMRyTJmy/pgNUOfAm9E4I1GOzXNYhTHhpeW3nb3zlQcRiJyTR3/E7oJ
	r39oNDF3AmE9QOxOMRrY0lObInVeVoCVUxRUrRkRhlArLx3OL8uAomdwXryLafCrBqr10K+SCLO
	BmCKEmkkZaz7t5MQTpwfiXrXEFOO6n5lmlXMG5wh/0iYZelfkPX8UwFKOK305S+jKQMzsn3TK0A
	9eM4vQTlPRXf7EjKyRpDSNmcKKkwdIkbaR+px0lAaqYHv3ChK+I/gTF1L7vUVQOmcmsz83X39Q
X-Received: by 2002:a17:903:1b10:b0:2b9:f55e:1c1b with SMTP id d9443c01a7336-2ba78f50707mr291111935ad.5.1778594120465;
        Tue, 12 May 2026 06:55:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e374besm142579725ad.47.2026.05.12.06.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 06:55:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <52651031-9dc4-4c8c-b14c-7c1f645f9af6@roeck-us.net>
Date: Tue, 12 May 2026 06:55:18 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 2/5] hwmon: (pmbus/adm1266) add clear_blackbox
 debugfs entry
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>, sashiko@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, Guenter Roeck <groeck7@gmail.com>
References: <20260511-adm1266-v2-2-7a6d34f0de5d@nexthop.ai>
 <20260512005252.763EAC2BCB0@smtp.kernel.org>
 <DIGK0X9I3A0U.2A2QP1GD1983O@nexthop.ai>
 <eaf93149-a7cf-4a11-8ccc-8aa1b1e83b7e@roeck-us.net>
 <DIGMFKP4POUI.2ZTJ4UM3GJW02@nexthop.ai>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <DIGMFKP4POUI.2ZTJ4UM3GJW02@nexthop.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/26 03:20, Abdurrahman Hussain wrote:
> On Tue May 12, 2026 at 2:19 AM PDT, Guenter Roeck wrote:
>> On 5/12/26 01:27, Abdurrahman Hussain wrote:
>>> On Mon May 11, 2026 at 5:52 PM PDT, sashiko-bot wrote:
>>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>>> - [High] The debugfs write handler `adm1266_clear_blackbox_write` performs an I2C transaction without acquiring the required hardware monitoring locks, violating hwmon subsystem guidelines.
>>>> --
>>>>
>>>> commit ab9c19373562d58415e28511b037545cfd278c2a
>>>> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>>> Subject: hwmon: (pmbus/adm1266) add clear_blackbox debugfs entry
>>>>
>>>> This commit adds a debugfs entry to clear the ADM1266 blackbox buffer by
>>>> issuing a block-write command to the device. This is needed when the
>>>> device operates in single-recording mode to preserve fault history.
>>>>
>>>>> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
>>>>> index 7b8433226176f..31aefa8fc75f5 100644
>>>>> --- a/drivers/hwmon/pmbus/adm1266.c
>>>>> +++ b/drivers/hwmon/pmbus/adm1266.c
>>>>
>>>> [ ... ]
>>>>
>>>>> +static ssize_t adm1266_clear_blackbox_write(struct file *file, const char __user *ubuf,
>>>>> +					    size_t count, loff_t *ppos)
>>>>> +{
>>>>> +	struct i2c_client *client = file->private_data;
>>>>> +	u8 payload[2] = { 0xFE, 0x00 };
>>>>> +	int ret;
>>>>> +
>>>>> +	ret = i2c_smbus_write_block_data(client, ADM1266_READ_BLACKBOX,
>>>>> +					 sizeof(payload), payload);
>>>>
>>>> Does this I2C block write need to be protected by hwmon_lock() and
>>>> hwmon_unlock()?
>>>>
>>>> The hardware monitoring subsystem guidelines require drivers to implement
>>>> locking for attributes registered outside of the core registration functions,
>>>> such as debugfs entries.
>>>>
>>>> Without these locks, could this write operation race with other multi-record
>>>> transactions? For example, if this clear command is interleaved while
>>>> adm1266_nvmem_read_blackbox() is iterating through multiple records, might
>>>> it corrupt the read sequence?
>>>>
>>>>> +	if (ret < 0)
>>>>> +		return ret;
>>>>> +
>>>>> +	return count;
>>>>> +}
>>>
>>> Good catch!
>>>
>>> Will use pmbus_lock_interruptible() in v3.
>>>
>>
>> There is also "guard(pmbus_lock)(client);" or "scoped_guard(pmbus_lock, client) { ... }".
>> Guenter
> 
> Thanks for the tip! Does that mean you're ok with losing the
> interruptibility, since there's no DEFINE_GUARD_COND for interruptible
> variant?
> 

Yes. If anything, I'd like to drop the _interruptible variant entirely.
I only keep it for historic reasons.

Guenter

