Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0182E3718
	for <linux-hwmon@vger.kernel.org>; Wed,  6 Aug 2025 03:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754449632; cv=none; b=Q6b3rDUyLXX2ToL8beQ+tcYqbm0Tp7mBiGCYeJcMNCg/Xza0IAudnAlNx0lTujNgLOR2L71geJl0PzayTP3tGyZQ6AE+LNCItGG7yzQFDjmDRM6wsSinQ9nTm8Mv5tAsrbGBHjB+1sti/vGCzzKhnlZhI2NptX+Psp+Wvq6fhwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754449632; c=relaxed/simple;
	bh=O+5LeFqNJGSGEtaC4nO+d20ATneMk6muhPoTPNGhNUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Raf/0ulEIrK1iQM3qpkExg5DEwSIUcOnimITAwSWXD+O5OX2voIkXCrx9p6IKa3tS3nhvpPijUE4y/5yxBAdXFRSnaMZbo0RU9YafHOxcOwanPFiG6GqgWSMFK83onQs4nSMWlIkOWbKNGTjtvnmhfcZlX0L5DZLFSJOnU1gscE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fk50YDcU; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fk50YDcU"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76bd2b11f80so5227144b3a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 05 Aug 2025 20:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754449630; x=1755054430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lr1FlAv9YIlTYXcepj7UVEG/Y7I/61UK5trMeOxycZw=;
        b=fk50YDcUBBfCiA8cmqdD2BFLFFRR45nwVqlykbcYJ4T/wELdmiItiMozn1GaFE2VO7
         GJTWAYhIGnaj+9qVjvwn9pSRDrUxtYBdEwcu0w9K46h8reU/5bXScKHr1OAf9c8Zlack
         yK3SBzrKJ9qsWFQpfFhP7VEFG9SebOKlWrlCuD4jn5fsYaNDKDjrY1rmUSe4atUCUAst
         ehBby2I9Jr5CSF21+WB5+zkN6ryCNkREx3UXmb2DO64tTMyt4+0NAws2FC3qnqyJYLMI
         3QJJNorZc/PplsGNt5FProyZTNcrP2y7CVcZNas+1N4F+iZ4rVDNWxdJD0f4EVjtAE2l
         8r6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754449630; x=1755054430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lr1FlAv9YIlTYXcepj7UVEG/Y7I/61UK5trMeOxycZw=;
        b=GZXDaD06tUO0rC/EQ8HhhZ6JoF25SUx6F2pyClujQn7s4IxOVBZ4FKYAtI+zhFsJLX
         uY1Z29j/Qi2roeB/YDK67pMceu8ZE+PvJrkWo5VtNwUEo+RB3e7b9pE3PJlmjgid9JDX
         KusHXu75oPlqFi/x3MTzQRPISOQ1pRqoAGux+asUDC3f9wD3kNvxUo2jHPzvJBpz9M7c
         6Ws+JUGUYleHOg+iXexkky7Z7d2UFmpRtlId571JOWsdcoXBTuwiSFkZ8XF/k0DcnCTl
         mBfvapkhAKupgCFjcEeh25ZwMKiyNn497JI1s5GYdGXMohe/OkmGbl0mQNoB1+H5Lrrl
         sECg==
X-Forwarded-Encrypted: i=1; AJvYcCUS3Vfvjyl79XP7BrMI7wTQO41E4siFdm1+j1j2k+gw/zeYt9//DTqTV2uVRuM6bJCVkihDGNBdEELZuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDRAGWOOAyUDGezNNBTaHikW0+RkrIJuuU4T8QoXivwmPvQbvu
	DhlQfU9KEcOxZ484RLua9Wcszk8R9mXDC7WSxm7hosgVUcsE8AEch8z9
X-Gm-Gg: ASbGncsXx6i5p+TLWLkWOgKMz1PTdk/BpBRmM8Uvtnp3ZTg90XC/F0xfjWwabGAuKaO
	IrKIfwtZ+Ka3M4qQGJQzw97zdbh9WA4iD8L2x1lskZ/6S1RRYoSua2IUmGZQ8OfI11N4zWXq+fW
	bZSyUNpeZMLUDOONbot4OBjgbcdGZiR4k7fiq4YqeoVdedS1M392YLrxCiH2azMeUaJAva3qgRC
	p9GljHkwi2QuJxO8ndOWIzZ1n5hsC6+vH+Iz8jW3PlxfS6l6hbYB07eIuuzYH2ZRPdr4e4e/1FK
	OdgPCPFGtDE5vTOFe+/ij53J/iLiCxMguuq1o+RfmHn8q0o+5gl3BPMMToQ1Ha+Z8KKYLg03+eW
	4HnEV1+vh/hzSGE6cUhVuY0yawZmK/d4/eWxtZLPj/F6OGl2fUXtzQ7GaIA/69Bbn72row64=
X-Google-Smtp-Source: AGHT+IEZTmuhXZw4OK8cKGeF4OKFzYKEXs1H54jRH0HDoCqk9mpbIcoGmbnUD+zJnHmg1YqEoqG+Nw==
X-Received: by 2002:a05:6a00:1788:b0:76b:cadf:5dbe with SMTP id d2e1a72fcca58-76c29b27de9mr1656359b3a.0.1754449629586;
        Tue, 05 Aug 2025 20:07:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76befc445a9sm9168019b3a.109.2025.08.05.20.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 20:07:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5b378c11-1419-4c78-9c7a-df37ff80afe4@roeck-us.net>
Date: Tue, 5 Aug 2025 20:07:08 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Clarification regarding handling of PMBUS_STATUS_WORD in generic
 PMBus driver
To: "Soloninov, Alexander" <alexander.soloninov@siemens.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "titusr@google.com" <titusr@google.com>
Cc: "Busch, Martin" <martin.busch@siemens.com>,
 "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "Dabek, Florian" <florian.dabek@siemens.com>
References: <GVXPR10MB817781435A2F2955D0D5A58CF222A@GVXPR10MB8177.EURPRD10.PROD.OUTLOOK.COM>
 <GVXPR10MB8177AEDA5EC62CFD7BFAB40DF222A@GVXPR10MB8177.EURPRD10.PROD.OUTLOOK.COM>
 <aaa21aa2-70ad-4646-8020-73945e273922@roeck-us.net>
 <GVXPR10MB8177CD027751FAA6EABF7FD3F222A@GVXPR10MB8177.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <GVXPR10MB8177CD027751FAA6EABF7FD3F222A@GVXPR10MB8177.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/5/25 14:34, Soloninov, Alexander wrote:
> Hi Guenter,
> 
> Thank you for the clarification and the grep output - you're absolutely right!
> 
> I apologize for the confusion in my initial message.
> I had incorrectly stated that PMBUS_STATUS_WORD wasn't being processed at all by the generic driver.
> After reviewing the code more carefully following your response, I can clearly see that PMBUS_STATUS_WORD is indeed used extensively throughout the PMBus subsystem - for initialization, internal status monitoring, error handling, and regulator integration.
> 
> My actual question should have been about direct hwmon sysfs attribute exposure of the complete STATUS_WORD register (like /sys/class/hwmon/hwmonX/status_word), which the PMBus core correctly doesn't provide since it processes STATUS_WORD internally and breaks it down into individual status sensors as intended.
> 

The attributes in /sys/class/hwmon/hwmonX/ reflect a standardized chip-independent ABI.
Chip specific values do not belong there. The raw status register value is reported -
together with various other raw register values - as debugfs file.

Guenter

