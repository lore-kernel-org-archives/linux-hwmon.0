Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD03345CB2
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730129; cv=none; b=HqhXYHl9KInHekOcHyAVTrB9/GTZACOA826Wx7SDtGZRJ0FTh3mcoIghE8EAzv73IWqlbJh2OH7vHzWUw5NqboFiusHHyRxsb0K9dPrK7W1CowmnWGNpVUr8pFZM+s+2nQyW7Xm1v+L5w4HrD1t7wkTB4Wm+3Im8dC8ghsHrcnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730129; c=relaxed/simple;
	bh=4N624d9lqRQyPqTBuK0yAHdY8J5Vr+k1KWa5KhVD8cM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0XkBBKj40RgKv4nGsw8CjlON+rhoLbAk2FGrVFtBAdvhojdruLAw+yeZ51YVipY4rdzUvK0D6b0gs14t67AwE3pbrQsU+ybRFDclf75K0+zLZrKN2EZEk/hmx5Pcw/BlaztXhIU5yZwYkVwfOJmGMbMgqBNLXJ4Wz1p5bxxpfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Edj/gfdc; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Edj/gfdc"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2caed617615so140376055ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 07:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784730128; x=1785334928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aRCmNJsbnwg4KNVWCbwVcXtXXCRPAx5GRMOnxpCWC7k=;
        b=Edj/gfdciK2GbLL6zSz28bsI2OTLQJ0jNEI7TOfjw9ADmZRpF51KFD5vd6tXfj7uKN
         zgJW2HTwHJfVWO4cq1GtgC1S7Xrk2ZKBWFgFIIez2DDncwb7Pxau/xRKlxf/tibcxMVc
         UPm5R27E+gvOtBypR0eVJ6JtZlx1RjvIIBt2YHmTc16k9CFZSqoI/loJIMxcTYtPDXBh
         ygzo4eDyEuAyzjXBC5MBaaA+u8va7hwa0AQEtZVoHRwB8unw0cCzYUbp5jX/BA4xbiWj
         Ag1//udx3Koy9CREBJKcEpc5HR4KIKxxhI5/V9KHfQNXaHKgj/XwEkowTH0Klep3ooEV
         0nFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784730128; x=1785334928;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aRCmNJsbnwg4KNVWCbwVcXtXXCRPAx5GRMOnxpCWC7k=;
        b=A/XreqWJ+he756Ha/qd3li/qgRqDfowoAXRPPo6egNhau0TfNhna4y/M5ewVD4bMki
         7gdoO2PmAvOk1aAf+j+q5ieDEI9D32p8uIPgJfQa/lwJH2kz2mKQjBWybQKPavXnY0u/
         JIdSY+aNAqRfRQZzNMrJGawwHu5s8px/4dIv6IlSUKj523wCcn58K7PN4CUIFl8ybcjY
         myqVg20ijfBZXtOUkGNhnpudsKXDy6oCN8FL9kbunwM5BBkQlH/UErCA9wDi1jPFV4BX
         +a1DMobgdudmHsG74Zr8qDCEv+jtATlM37v5+8DYkO+bqYZXyVYqwEPugKnVksYyQmC1
         NHxg==
X-Forwarded-Encrypted: i=1; AHgh+RqAH8eWaop0szxZOSwZF3J0exYTUerVxajc6gxYKj4QWzjtrPlSX0632PMlAkz0YfCKsary/CGH/sgPiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP5DT759+vgE6m8u87H/r9hvYn4oVlS/tTDM+PWfojvLUUIqrZ
	agv7UY8zBLfGKUI6mXtkomm+XUXnF6kwL7bVWIPUGXTo1FkQ7a3uDJKl
X-Gm-Gg: AR+sD12Q5IDO0ArIai//gw3mGZiSPuAlZyIa2t1tSmT0wz3gM2MXSE3iTDmfB+N+x8G
	yt9tAL++xvUHm/kbmV1nuSfhk04t01AcXBy71Z3ZbWbokDQjxEeg1e+Ff9K9UkUjy7ODe6Q2nUu
	T3Xp6Rx/Z/76ULcEvEAF0yXUcSXaRLesJFeVcxZ5URQxKUd/m3+SmBJd7WYBvHnUpLUZThi9h1P
	sZ8MT7r/5Iv2xwsjZgWEBhE78H73k1Jf4ud0hkx7CHDf2myfE/FxdgGSX+Y3NzvWtzb1NI9yeIt
	nS/md2OO+I83wW4My/WPfPRJDVsomd85jjFJOrCdt9F+R9DBohvcKtOs54DWEWNjzj4AbklBIOQ
	sQy6eDQ9on+nJXAGFBt5asfFcDpIlkdTKY1h6ADiScDOZhGhH5V13QmRfS7F5JjDFQzbMGEdK+Z
	BPgo7Naem69CsDbGc+qqdR/ihgdPt+auTZtPNSgEoufgwKkeWiUUU=
X-Received: by 2002:a17:902:e5cb:b0:2cc:9763:e607 with SMTP id d9443c01a7336-2cf349bc5c8mr237706515ad.27.1784730127534;
        Wed, 22 Jul 2026 07:22:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1b6a45sm9508323eec.28.2026.07.22.07.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 07:22:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <57cfc3fa-d4e9-4c10-8aa7-4ad0af7ebebe@roeck-us.net>
Date: Wed, 22 Jul 2026 07:22:05 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hwmon: (nct6775) Out of bounds access to NCT6116_REG_TEMP_SOURCE
To: Florian Bezdeka <florian.bezdeka@siemens.com>, linux-hwmon@vger.kernel.org
Cc: ", Bjoern Gerhart" <gerhart@posteo.de>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Andreas Ziegler <ziegler.andreas@siemens.com>
References: <c1ff485a688b4ee00b1dc3b1d94644b54d12a69f.camel@siemens.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <c1ff485a688b4ee00b1dc3b1d94644b54d12a69f.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Florian,

On 7/22/26 04:38, Florian Bezdeka wrote:
> Hi all,
> 
> while debugging a completely different issue on 5.10 the following KASAN
> report came up. To my understanding the same problem still exists in
> current versions.
> 
> There seems to be a size mismatch between
> 
> data->REG_TEMP_SOURCE = NCT6116_REG_TEMP_SOURCE;  // 3 elements
> 
> and
> 
> num_reg_temp = ARRAY_SIZE(NCT6106_REG_TEMP);      // 6 elements
> 
> The NCT6116 tries to re-use some NCT6106 infrastructure, which seems
> wrong in that case. NCT6116_REG_TEMP_SOURCE is NCT6116 specific.
> 
> To my understanding the issue was introduced with
> commit 29c7cb485b32 ("hwmon: (nct6775) Integrate new model nct6116")
> 
> Some guidance on how to properly fix that issue is needed. I don't have
> any data sheet of this piece of hardware available, so I can't tell
> which registers are the correct ones.
> 

Thanks a lot for the report.

num_reg_temp as well as num_reg_temp_config should be set to a
hard-coded 3 for NCT6116. NCT6116_REG_TEMP_SOURCE isn't actually
needed since its first three addresses match NCT6106_REG_TEMP_SOURCE.
I'll send a patch.

Thanks,
Guenter

