Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B56D33343B
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2026 03:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776396157; cv=none; b=nJhYL8pXK66xKZx+UrU5Ec29jLsoMMkXMzQ7bwb288OY8OjjXhEGH+WpAnPQzY56oVpgcvj2IzR6/e/cKDSmRvd5fK3VujLF3AvDHmKbD4LuYUSsMe03o65XFmBxyyGAtKfioR6fTr3NpZadlBmfWjn1PRDV2xkn+J0nUtdL600=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776396157; c=relaxed/simple;
	bh=ZSZi3UpSXF8Wby9x8TqfZI7RiyaKLQaIxoAawQtBQXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HNeckIvcOACquezpxVHoYYpGQIp6Wd2CCrlot7n2MMQKNBzvEJ6C3kA6vVNIkcdrNLcEoYlVOcJzm/wVAhg7SlFfKsEtfpXU802eKfU1glvCD9FBaBJQaQsfKe9BSXfNH24dcI9zDf7iXl70apwhhOfqjSsRH3MSfGwGjDBx+yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdDwL7F1; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdDwL7F1"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ad9516a653so833805ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 20:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776396154; x=1777000954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=riHL8PUFIWxFVSSO9aFHtXI+aBYHRPRmwkjy7XIHGSY=;
        b=XdDwL7F1MbngrLrDtArSW/iSMtZi5poL+fPgCjODw7mj+5ZY07DeW7Emqsm/TyzmX0
         XSS6Tj2LK0gQrw9503Mf1pC3QUO3ms7yA/egkjTsj5teehGKYLMvIjFIpKRurYDIDIgE
         vj3TQPpVnlEoWyTd1D/QQKsSnkVZgEYzsmWS6bJQ5t7/x11kjGUGXrh8C0u/rhbJ+Txh
         vvIqzucmcBWyH13stjLaeg1jLsUjUeY+Ow2MTEggdxYrBlh9y4YaacLBRwd+Ve8v7FEN
         X670taxX2pg23hXdX/jIj7a4qzt0MR37F+UxDF5rGY/42wHvhvB69C4AfGflpxjR37N4
         O7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776396154; x=1777000954;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riHL8PUFIWxFVSSO9aFHtXI+aBYHRPRmwkjy7XIHGSY=;
        b=FM0waFW/r3hAV4FHS3jCXACgyOR8vTqodjsQ2n1bivK3/78FcdW2ar78km6SB11M4f
         uolKwj+n1M/FkcBuc+AjTXiJmd3Gmo0/kMIXOCb4vL4WUuZALt2CuCGyGScca1wuIQkn
         poGP6KCF3Q7dp4uiZl1T+T4ot3AKGwE1V8vUQ0ikTpsAnY7LDQd3GhBlGaTOyTm1qI2l
         YQaMK+PM3NZJESrFW4QBtqRsJjEYbXsM1otLrMoQrkkYZu279Lauz/w5wJfoOHV0oLkB
         FXpcyNRW8S3GNcPq8DbWFYdeYGFYOITQDMAsXXP5da/RrJilLOYcc9iqWaUC1+U1goX8
         UslA==
X-Forwarded-Encrypted: i=1; AFNElJ/8woTYKYK6fx/AP8WQ4GOH7TxthN6O1rcySW0DPPhsZWop1RVyl17CGAOYHeKTdAm/6x+X7Lt9tOzJNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVNOLuNrvy2qHqrhXM9pkCTwYOdXt30RAmf3w0ExyMa2R0b4V8
	rNduvoQXKQ///m6ON6u5pmR3WD47zrdvx3dm0eus+sC7DU8nGbi0NO7h
X-Gm-Gg: AeBDiesGsfKzU2jGYv1P1ipqPOQ1iqCQ/brpPSrdp+nsjTsliIj7+j/nM1f0Nvz3fPS
	z2g5cgXSKH+lOSbi2yksF2ozPZlTVzckyxOP2z50zAotQg96OC+BR+D8/WX10Ayx0E8lkOY/KNd
	Dw0kkooWLUxf9WMsxMVz8r3apNRNRVtocxBozlB64hSG+mI9s3S3mfpBmAzKpBa1HXoiP5WU65f
	Pi5LByo6kZsv2vQ8jij7OvP40LlOQg5klKfcSzO0ZVf0YaEFnhc5rOyQSWS1AUQxkcp9ISFRmxP
	EsQ5tsYkrCdU3ogMamTSiZbfRlGvH6RpUbrXkjKhIgHC2bfP2kIGOBBKT8o06YW1L7XqaDiT5qn
	Rg4Ukda4kFgE/cDIDR0vc22SWosu/zQ68Rz+Ty/4/AqbKT0JqDt9LqWB/R/mTVxZSylDmNJL5RW
	RL7UXMdGyvTYpVEOxg/t+jutDMSsR0nitz87w2wmk9tMJZIv9ahMdr1DbFcLo3Njxd+A0Ki7l96
	iVgyegp74o=
X-Received: by 2002:a17:903:2c0e:b0:2b2:539b:d2b1 with SMTP id d9443c01a7336-2b5f9ea6173mr11262965ad.16.1776396154079;
        Thu, 16 Apr 2026 20:22:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cf3bsm3965605ad.44.2026.04.16.20.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 20:22:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a142d5ce-e4a3-4f50-8009-f796609fb13c@roeck-us.net>
Date: Thu, 16 Apr 2026 20:22:32 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add max20830
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
 Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260416-dev_max20830-v2-0-2c7d676dc0bd@analog.com>
 <20260416-dev_max20830-v2-1-2c7d676dc0bd@analog.com>
 <20260416-diaphragm-corrode-494560404ed4@spud>
 <84a5154f-1139-425e-94ae-31d7e662cd0e@roeck-us.net>
 <20260416-scoring-secluding-c7a7235b181a@spud>
 <PH0PR03MB635166088B7C473CF59F17D1F1202@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <PH0PR03MB635166088B7C473CF59F17D1F1202@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/26 18:04, Torreno, Alexis Czezar wrote:
> 
>>>>
>>>> On the previous version, you got an LLM comment about not having the
>>>> interrupts property amongst other things.
>>>> I think the other things got implemented, but I didn't see any reply
>>>> to the bot about that?
> 
> I wasn't sure if it was that type of bot. I'll try replying on the other patch review.
> I just added a note in the cover letter change log about the lacking smbalert.
> 
>>>> I think the answer is that it shouldn't because the pin it
>>>> referenced doesn't exist, but when looking at the schematic I have
>>>> to wonder if
>>>
>>> I had to look this up in the datasheet. A SMBus chip with no alert pin
>>> is a bit odd, but you are correct.
>>>
>>>> there should be an interrupts property for dealing with "pgood"?
>>>>
>>> FWIW, I have never seen that. Normally such pins are used to take
>>> devices out of reset.
>>
>> It's an output on this device seemingly. I don't care if the driver ignores it, but
>> for completeness (and we like completeness with
>> bindings) I think it should be documented as an interrupt or gpio.
> 
> Alright, I'll add it as an interrupt: optional power-good signal
> 

Uuh, that really doesn't make any sense. Please at least make it a gpio pin,
matching pwr-good-gpios of ti,tps65185.yaml.

Guenter

