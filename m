Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82B218B48C
	for <linux-hwmon@vger.kernel.org>; Fri,  2 Aug 2024 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722607870; cv=none; b=ZMsgEosW9OxZInNSvxi0bjlYpJvGUXCpoI6SaQoBDV1UI3Xbwmg/2m9qeuTSQ4NFOlYXjemFziE7Icaa/ZsseZpoU7I3bLPRxsuhXLncp9/jrBcNEjW02++D/0Es1REEt6UHA2ixI0g5bTCv9sT0WPxpi0bayfwvAguH9/JtKM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722607870; c=relaxed/simple;
	bh=yPR7IvTs8h3DKW9322WMqO231qY4GKTrEVFY2f9x4gI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qtvwl1ohEEE1L1o6Hdo2XiADbVNPnAytsUd5peG5Y+Hg2+1lDE595QYWF1EfJwFaRT4/YRARbKDgwmVZtkUaanncWnSzlmWw1+hmlEgOPXTkyk7fZYmcSlX+aKiOPA2Gw+l+MG9BzuCclZ1CGdefH9wRn5ymSiBqkGVahlMH7QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHT2FDwV; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHT2FDwV"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3992195d08aso42499705ab.0
        for <linux-hwmon@vger.kernel.org>; Fri, 02 Aug 2024 07:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722607868; x=1723212668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xiKTRlKIv1wxufB8RD0jokR9PiK9GObKeziIuboJVuY=;
        b=CHT2FDwVLDEOLGMIXFeNabD0LJJVlIjQWifC/+hP5hXo1OfrzMBacXTTc22WZUvp0Y
         kkQRk7i0g53jHXBKdab4szSjkeEIHe0DWqjdPNLSgsfFgh1Eys/tdGtWpaouj69nCthL
         vP1naetlAr/x8I9P+vKaRYyyS8n05fIOZ4qR2epEmz6fF0bLplF0Ua3kvi9MceABHZX3
         RZuRVWHm0ou6JHXpFb00haAV9Sx1tBuP7sgJd0A1+Xr/jyPRe4BOTEKfTBTnNKN4oqng
         ZYm7XpYmZvGONIFNDVu9/H8vRFwZA++fSSZajgyHw9mA1+MSyGE9EDAIkeX26eQpfFPx
         3dGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722607868; x=1723212668;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiKTRlKIv1wxufB8RD0jokR9PiK9GObKeziIuboJVuY=;
        b=bjhonhNTyOGxj0hr31tE7bNc5ISxZoNOaA3Shq79quDe9llJkerzP8kwBn1Vo+GH4D
         7gRdKR4YbvYxiXM+JnbFifiwyrkPgVRWPkp6vqspb30XyVwKkDi6aSYmzcY1VsWdpl3n
         u6/5owno61DLXnAEb2ziCSvBw+PXV8psi6x9bNTxR2ChLuRmPIa2JFBzHBw6ljjUPuF0
         Oxw7to2T29A6qYggiqTGZUuKDDsRqB0jXn8ASzXVXCK7lqF+XaCWxTjB7oLXEkXvOuf/
         jIUOrjhUyBoGu2IGM4OjmkyscW6oOdyabDddbf44joY72EIrv3MFE8hD6b/9Wy8r2p05
         b8ow==
X-Gm-Message-State: AOJu0Yw54ZZCaHKH/fMsTnxkl1fTh83MitSxS0uGRSXoRL0iQnqdm/ck
	Luh1vKma29Khz2rGfjt0OUuMKFXmz2fiAg87TNRY1nECCj2hAkIVa4Um+Q==
X-Google-Smtp-Source: AGHT+IEbmomhQFGYWjkB2/F7Of8pZmBPTedhPege6fam7CovZSS5TBJb2SmhV18T/ED4p8Kr2i/+Hg==
X-Received: by 2002:a05:6e02:605:b0:399:4535:b66e with SMTP id e9e14a558f8ab-39b1fb6b767mr39350545ab.9.1722607867911;
        Fri, 02 Aug 2024 07:11:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b7654be293sm1159385a12.91.2024.08.02.07.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Aug 2024 07:11:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <32e4707d-a32a-4649-853e-2112dc22f8bc@roeck-us.net>
Date: Fri, 2 Aug 2024 07:11:06 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] hwmon: (lm92) Update documentation
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240801144918.6156-1-linux@roeck-us.net>
 <20240801144918.6156-7-linux@roeck-us.net> <Zqxqx8bZkYOtzUub@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Zqxqx8bZkYOtzUub@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/24 22:12, Tzung-Bi Shih wrote:
> On Thu, Aug 01, 2024 at 07:49:18AM -0700, Guenter Roeck wrote:
>> Update datasheet references. Replace misleading 'force parameter needed'
>> with 'must be instantiated explicitly'. Explain the reason for the missing
>> auto-detection. Mention all supported chips in Kconfig.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 

Thanks a lot for the reviews!

Guenter

