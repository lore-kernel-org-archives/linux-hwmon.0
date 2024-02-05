Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF7F3F8F9
	for <linux-hwmon@vger.kernel.org>; Mon,  5 Feb 2024 15:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707148441; cv=none; b=sCTpraHr+pxB83LLXMPDWncEa1ep3uFKtML7y98pQo7P3/zJ73A0jNetCjMvz2YIySw2hAy0EsxzT0h3SRShkTBosk/n9+7dPWSPY22Ixh0n3w5NfacKqOt95qMV0hUBX3vQ88Vaj0G4cBe2hFcchV/oQE4Si1/aaoFBp3yJK+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707148441; c=relaxed/simple;
	bh=0PzwQ7RIMQPCNKSS7SKKlVchmYYVwiICCMzINycFKRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XPleel/cpTzdL4fUwfXjs4S097+1lpCI1hsA5uhQIfILscbQ4ORk2EzqmjuT23miOTkCrhn+0aEZLNhwQuVuSgXmyqZh0ZV0t4eNtx4lahfUogTbhI5b2mPurRBfzFqZKx08w/7ItI6QQnAQgyUGVcbmS4hQb+9ZXevUjy3hsok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRnEn8xY; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRnEn8xY"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-59a1a03d067so1885175eaf.1
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Feb 2024 07:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707148438; x=1707753238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=m/cqcJnpXk97rMJdBIsmS4z7GoxL3OzwnwJcHxbAh8o=;
        b=lRnEn8xYBwjHSGoy1jmbKishT4ApIFI+yM825POUnnkym3YhODq5FXZ4DnjzOnsniu
         D/vTZNYdV4E9RoO7RORiVdQ2EGSYTmtOk9u4NUxGQDWqsuRvGpS1ZrjQObBpSG4n41to
         a9c5LKqALt5D/C2ZxrMFHwtZsgtTNyBTTYOFuff6beijljwTqc7EToPjHWbToRKRI06C
         UUeA64bwYokiQgE0sxIy/YLU5BGA8VzB6pNYnfEroirYJFfmJ+v/qrMZxXE7l047NRUN
         SvMfmkKJwsBtQz1+sIVvHKj/LSaqoXCoMcqRyDIS7JCAodJ2j1Z5dPp1CRNxxaRT2Wk4
         wj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707148438; x=1707753238;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/cqcJnpXk97rMJdBIsmS4z7GoxL3OzwnwJcHxbAh8o=;
        b=bXjPLpcWhEjWHQzvccPkx2xg9spzm/TaDy15pGJ5hPmceAAwTOg+N8CbkU6ujsb5PT
         ElL3CNopQSvaknR1FdCSuQri3RZFCfCMQdCMsdwaMCRMBJ+DQE1n6dUcCcWpruPhWqxn
         Gqv3acRwE+IuAf4MHV/IbFweQwoLGmR+BCeMay+NJOKGMjdyjOLNr4czp4y45G6linXj
         qrTlg/HawKa9YOXxfeCSgqQiIB4T4cOrNYBkV7ixhqYr99gRgnWKm4dEm/wyPJxXJkmV
         XOkgX/tjiTwIAL4q52UIo197sEMhoxJgp2oy9E7d2J6uIPi5CX10I5hahRj7ZCJvyksE
         xG2A==
X-Gm-Message-State: AOJu0YwtQNQjUBnUb8MMlE3O7ErVNLbMN4FRHkppKqUHZknXkefTVqVo
	1pg0S20J0rCMC8etXk9QWiWxYimVAwO+H5H3ez6v5UgHH39lxT87
X-Google-Smtp-Source: AGHT+IFwyheGvTuG3zH0mbLDJxQlpoqm+eeUrgrKBAAbhgOCwj9XhdyGGVYDvJcBMsq2b0kX4sCzew==
X-Received: by 2002:a05:6358:33a5:b0:176:bef2:634a with SMTP id i37-20020a05635833a500b00176bef2634amr265142rwd.0.1707148438047;
        Mon, 05 Feb 2024 07:53:58 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUO6mHMD/B6VMuLnsCHbuyBMv9GZfgB3VXj2Zadgaf2d3HVF6FvBVd+aY1VnAJavMJzvJX8q095IQ9xUjMNg5hkER/hz/cQ5r8SXrN2l/KK6wcRJslEH8QTBcyqbZKOM1B1OCMaeXync/KBbu8eLNxPCZpYhgvoVs7oQ7HgQ22CscZdclX+ICWiNyR9Xg==
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p9-20020a634f49000000b0059b2316be86sm89796pgl.46.2024.02.05.07.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 07:53:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <45b98838-ab26-4c0f-a639-7c5f0df4c49d@roeck-us.net>
Date: Mon, 5 Feb 2024 07:53:55 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [groeck-staging:hwmon-next 13/34] drivers/hwmon/surface_fan.c:87:
 undefined reference to `__ssam_device_driver_register'
Content-Language: en-US
To: Maximilian Luz <luzmaximilian@gmail.com>, Ivor Wanders <ivor@iwanders.net>
Cc: W_Armin@gmx.de, linux-hwmon@vger.kernel.org, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
References: <50af81da-779b-4782-9326-043bc204bfe6@gmail.com>
 <20240205125249.3740-1-ivor@iwanders.net>
 <d96ccd50-9354-4c73-9d8d-021e29e5fcfc@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <d96ccd50-9354-4c73-9d8d-021e29e5fcfc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/5/24 05:03, Maximilian Luz wrote:
> Am 2/5/2024 um 1:52 PM schrieb Ivor Wanders:
>>> Missing 'depends on SURFACE_AGGREGATOR' in the Kconfig.
>>
>> Unfortunately, `SURFACE_AGGREGATOR` is what was in the Kconfig, it should
>> have been `SURFACE_AGGREGATOR_BUS` instead, that's where the missing symbol
>> is defined. I wonder if that split still provides value, but that's
>> off topic for this thread.
>>
>> I see that c3747f28ebcefe34d6ea2e4eb2d3bb6b9d574b5f is no longer in the
>> branch, but 42c88a7d1474b6f6e53acca3522d179d3c9b1c6f is where this is
>> already changed over.
>>
>> Thanks again Guenter!
>>
>> ~Ivor
> 
> It should actually depend on both. Since SURFACE_AGGREGATOR_BUS is just
> a bool, depending on it alone will allow the module to be built in when
> SURFACE_AGGREGATOR has not been built in. Which I assume is what caused
> this issue.
> 

Weird dependencies. Never mind, I'll add the second one as well.

Guenter

