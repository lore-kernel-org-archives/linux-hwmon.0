Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505FA24BCF7
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 16:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203362; cv=none; b=s+bmE4GrQlcfZTqAyLbFJ5BC97FzIOxCqdALPHAKT3WGwco8XJeKF5ahLXX/za3fk4BFBSaK9eJu3kFhWDz6y5o/teQZtixFVfl4tM/Sf7chSlM0BBFWy6kmfx4oMi3LhwtNBpxsrBToytUp4xhr2DbCDT0vR7V37wViYoP3Wm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203362; c=relaxed/simple;
	bh=4Y8Hb+LHVOkA85E5GrD/k63uaKbUaOkhTYdDQyvz0G0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gpRp+dHQ+ypDWG1q8Rrv3e6APwjXwR+o1JyY8SGyyUKJyeMXESOiRi+Qv6YJn7Cag7PZX9XDzMJiXtmKDxJn4JmVGZVIvGVDFMVncrKdZw7C7bvsyOtbYsMSudFKHp1uMvY9iwgDzkzZI/8oxYlKsCSWQiWF5WeVGNqDy112ELI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/5gDkEu; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/5gDkEu"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f53ad05a0so51096335ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 08:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739203359; x=1739808159; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNpLinjrj3EGAD0MLAKjgMLtzL+FGcex6FanaZzhsGc=;
        b=d/5gDkEuIQmDe5FEtFGph3UnUWo7ZbWJnU/7xlVlPW6YUU7HB2BKUOUVw7AvThHNle
         eo4/VLm58qpNEUkKl2KETiKQwXVS2DqeP5+DaARAIH8zLaf/7OBIXQXQf9/AabEg2muh
         3t+ipgF1zUKE4+wxYNG2D7MtmBx7aXdKSYvYAz3dtgISraka3iRko8OYKN7+krC08iRD
         Ij5I4mKTnT1ij3xpor/vYvwvEkkKXW7P8oNxHvxihLHzO0478nuPaFXuNw8SwLPoWb1b
         C+toJkqcaya5hJYIRfG++DlPK4dDHasOaEcZI3O1kBy0cEhjmwXLoK/dOJcPEgkILBNB
         HDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739203359; x=1739808159;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNpLinjrj3EGAD0MLAKjgMLtzL+FGcex6FanaZzhsGc=;
        b=Pkh3QA9T++hCLKqZeo8HGkuAB6SeUoS0lO/4aX0ky+rOYTjwAPVn1AP3SSzG1fV1gl
         5n11k/G2Z1kE7hCUib8jLZiEF1kPxzw957juJuwfNNf2LnFHUDi9qOkXbKFI3ucucbgi
         GOnXlu1Cxhso5q22OeWQoyMJZ8H5ysuB5EP80RYBHn7VYKjlFu9ZvEIcp7neyLW7b0/i
         k+FFETJquEF8GiHHB8tDMe69ErxrJwkCoaTjkUXh1TnizOB0E6rTUKwnQzRNTv/7VsrM
         ViqMttw1uFHRRNFfN8R9B0wXqxZQq5RIga9mSug6hiXu8aQXX2+XWhzOjqIEhC+Ha2Vy
         1t4A==
X-Gm-Message-State: AOJu0Yw0ubxh2fOLqo47sLSDKwWh8uTO9p6bqnZkk280Jadza3/i+0BO
	Vf2yZvu18RAs6B6OiDbLwPnI6/nLjf4iCxfUKD8NH45RuDuK1ylHHEIh3A==
X-Gm-Gg: ASbGncvV2hl5Tv/3RWgAaTMeJp+CLssqSuARCFDdNbItwYPeI8j7u3wbm9w/ffTkHXd
	u/spTZsmbu2dANXSceO1iviiVzYy1FtBJ5pY72fzvf5x12+ZhasY4gJocMRW6u4z4AJJL3rmAjt
	tt4+PwRQul3wmIqOkgAHI3McmlwaPrBe8N8nPGyQk6NAktGyFR2XMnWFOypduMGMjpuTN4CmgFi
	U40g92Jm5Zpm6yFtGwbokl3QTaVG8LLE2nWYFD1UHOfAc4Yv0xBZG9jMEViE8Kh83Y7vS6vRC54
	4NzHbHGUEQOi3FgPuj60t+vGUz5KtycBvfpeYBqW6VLO1PBKIV/y5tD8xT4jLjKl
X-Google-Smtp-Source: AGHT+IHO0bu21X4RRV4sZ3smMAZRaiLIiPuFzocU1vdIuP5F2+UJTP6CH06lWpd1AkUB/2xlHB8RrA==
X-Received: by 2002:a17:902:da8e:b0:212:996:3536 with SMTP id d9443c01a7336-21fb64013a9mr701145ad.10.1739203359221;
        Mon, 10 Feb 2025 08:02:39 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653acfesm79941545ad.65.2025.02.10.08.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 08:02:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <57be3c7e-cc14-40d7-9a41-2d4e6178a534@roeck-us.net>
Date: Mon, 10 Feb 2025 08:02:37 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] hwmon: (pmbus/core) Report content of CAPABILITY
 register in debugfs
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250210040024.2296208-1-linux@roeck-us.net>
 <20250210040024.2296208-2-linux@roeck-us.net> <Z6mP0Mb-2kqumjHh@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z6mP0Mb-2kqumjHh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/9/25 21:34, Tzung-Bi Shih wrote:
> On Sun, Feb 09, 2025 at 08:00:24PM -0800, Guenter Roeck wrote:
>> @@ -3585,6 +3585,15 @@ static void pmbus_init_debugfs(struct i2c_client *client,
>>   	 * assume that values of the following registers are the same for all
>>   	 * pages and report values only for page 0.
>>   	 */
>> +	if (!(data->flags & PMBUS_NO_CAPABILITY) &&
>> +	    pmbus_check_byte_register(client, 0, PMBUS_CAPABILITY)) {
>> +		entries[idx].client = client;
>> +		entries[idx].page = 0;
>> +		entries[idx].reg = PMBUS_CAPABILITY;
>> +		debugfs_create_file("capability", 0444, debugfs,
>> +				    &entries[idx++],
>> +				    &pmbus_debugfs_ops);
>> +	}
>>   	if (pmbus_check_byte_register(client, 0, PMBUS_REVISION)) {
>>   		entries[idx].client = client;
>>   		entries[idx].page = 0;
> 
> New device-specific entry.  The allocation size [1] should also change
> accordingly: s/7/8/.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hwmon/pmbus/pmbus_core.c?id=a64dcfb451e254085a7daee5fe51bf22959d52d3#n3537


Good catch. Thanks!

Guenter

