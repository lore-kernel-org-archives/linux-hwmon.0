Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD83279917
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Oct 2025 14:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747935; cv=none; b=QUrsQ+Znm28sxWQ5SZ7FvEv22xzkhpIG6EOlqhvwun+VF4jS6Iqs0pMmv6gSgspvai4A7LXiDeZ7/d199HNT2kP91quwTBq6hykDTj+PJjZepNFoNjHhbj8JDPOijdWxw9OWps2Qa+PA/WCHXIp/rwVe0eaWqyHPFfTdEkYeLj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747935; c=relaxed/simple;
	bh=B3sbwwzs9MVfr35/M8il/tVRzvFFJqtugA8SprPW4hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lUJULh4JWg3ibm6SLDNB8QmSEW91ivUdaTQCfzEI/UC8LCcDDuVJJpppX9+Lwk5XlB2t26XkBV20MwAYdUN54szy9DDMxX/vqZas/r3JPdwgt5SNFMzxKJ8e8S6u0iohNFRY7louKqhPAwIum7MOLezgBQSp/7bFSLqmc5odD+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kebDlKBc; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kebDlKBc"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-269639879c3so62373595ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Oct 2025 07:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761747933; x=1762352733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jgmOn0xD60/w5G8Z/yTkMy8yyYEwegN/YbrThWd8B78=;
        b=kebDlKBcJvjZeyiTxXS8ac4h8BsOrhZB2ucZEx0S7q7jfRESZEnsT9LxJup5xZkLke
         1bqBjiYCfZ9/riT3WV3e9TIgTbh+aY+4RfJP8PdtrT3vn+K+PXOi3K6hFjXHvJNMoGV8
         rOgIGfMblLa60xSPkLWhf8LkjNiCTLgxM4eTbgLZ/8+ahlDlJRzZPMfslqh7MCypoIzH
         r9UbTpHhe7G+gaD58so3KDcQA2myKuPaPttBTa/yBByxzekONl6M9cDkS1WCDodG96w1
         GqOKBmLzPdh528E0uYBzmsXWCK/seMDzGfO2dcDCtTa5auDp7leloE8fkVECvuFbfIfB
         W4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747933; x=1762352733;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgmOn0xD60/w5G8Z/yTkMy8yyYEwegN/YbrThWd8B78=;
        b=vlzFfxqKztQcsNxA6UsLdVgA4k3ZB7dVt9en5G0UMOmAjSzzZKvageCxHemnMs5pzf
         Pf2rvbR6bl8SGDTlw4kBzoDc8Fq458RCwjvC47KsHaQM+0wYqCat3ZWXYhk3ZixUnc8J
         PETDii25NXZLUCY7KXwzhLXluU9tiIxx2xDHIyLQOe9yJWY1OawSc59fdcd7C7Tpae34
         6n8MUdhEHWlD5Y1svLRprKbEFsnNlDwY68jhyMyq4VGoTJBmo37vgbQ+DUpxPEO8p26y
         tqkR9uCA3lXqAX8gNHCTgnZfpauM1lWr5Bf7yRDwuDapa+6kKbnA+ZY/IfIhG1gXVXg0
         901w==
X-Forwarded-Encrypted: i=1; AJvYcCXRYJSnTsxc9XiITDC65/SRBGS9DTgY7jX86If/P37IP00meHyHfHdifx1i60EVCAQTODpgncKiH1zTZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLmwtwwUsd1BZUdCuuAngwfvFLLQ8g2g7AHOvkehZqDJ7eGdB7
	o+6LBkfMhW2dcKJZFUNeTYynjHvBmuWw/qLkANodved26XAhEdgZ88Mi7GBUEg==
X-Gm-Gg: ASbGncv6NDpL40NLOv/VVFCuCoAtsEayfXOFs+30tw4C7hDYY6vpa0oqrhDSPNZnw/i
	YTTVRk8CgZPHcj4ktqHu39duZujZNQfTlyf4X2d1mjgLhnpwDi/GjZGxQiItAe90xyI4DpcDcqo
	utASHyGh8Y4vl1ghpK8Scs3s9ce7kGGDiBTQjXnRaXjWd2N/NZRJsNerPIqsQM81jc+JLK7FeZ2
	ViAcHypmfmdpLUrgCcGlPrJZMt4qRL2yZ/CDEACD+oknKGlJpIjyLnFXlIEI3mZZfxi63KBUVGS
	71fwP3+VCtaihur7QuoD2vbZYlu5RbMX19utQjIEMTdKG4JBBYghiqXXze3al2CoF5suFIKI5Ym
	p0sSTYw8C4adpLp5dXFa3D8zPo4ilBp82/nVkV80+4nv7QBZgSbFN9m7s0tC2fK50KkhUYmqcdT
	qPxRlAt+FxnN6wAkvXiYY8poINfejPuQYwWSXCoFO4nt7Fv87n3F4vWegLXR0=
X-Google-Smtp-Source: AGHT+IEf6e/foomFLq4K1E13/Aa2eew3MijpE1P9QpJa0LgPblSEKfui2B1DkJrn/sO8+ZxJSQ/jdw==
X-Received: by 2002:a17:902:dac1:b0:294:ccc6:cd07 with SMTP id d9443c01a7336-294dedd524bmr38472425ad.1.1761747932364;
        Wed, 29 Oct 2025 07:25:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed70645fsm15935049a91.3.2025.10.29.07.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:25:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <52268b57-30ce-4864-b9e7-7076c6bc4418@roeck-us.net>
Date: Wed, 29 Oct 2025 07:25:30 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] platform/x86: ayaneo-ec: Add suspend hook
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Jean Delvare <jdelvare@suse.com>
References: <20251015084414.1391595-1-lkml@antheas.dev>
 <20251015084414.1391595-7-lkml@antheas.dev>
 <38a49942-58d3-49cf-90d7-1af570918ae5@kernel.org>
 <CAGwozwEmjms0H=GPbevuOjJfed6x69wmg8E9begBhUKbF8B2AQ@mail.gmail.com>
 <000cd38e-7052-4987-b5bc-b8de176363cf@kernel.org>
 <CAGwozwFDsn0xm_mG4ypEym=K8c81qqi=qtJL=06nP6SzdFaFoQ@mail.gmail.com>
 <b98a8486-e90a-4bd5-b3a7-3b2ba1b16398@kernel.org>
 <CAGwozwHa3GSNGyRRp4=bR+Wsy2VLgwAbSmcdWb2=5rEyi7jdQw@mail.gmail.com>
 <8f7c2544-2b9d-4997-942a-5bd3ea72e3a3@roeck-us.net>
 <CAGwozwFNMC+g00LhR+tPsLWPLOiYh0NA0p9yawcunVaMKsNXXw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAGwozwFNMC+g00LhR+tPsLWPLOiYh0NA0p9yawcunVaMKsNXXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/25 03:49, Antheas Kapenekakis wrote:
...
> Speaking of which, what is the policy for hwmon when it comes to
> settings after hibernation. I am being asked to add a restore hook for
> hwmon settings here, but other relevant drivers do not have it
> (asuswmi, gpdfan, oxpec), is a new requirement for hwmon?
> 

Your driver is in platform/x86. I do not dictate or control requirements
in that subsystem. I only get involved at all if I catch a flagrant violation
of hwmon's API/ABI. I found that people implementing hwmon drivers outside
hwmon often do it to avoid maintainer scrutiny, and I am tired of arguing
with people claiming that they know the hwmon subsystem better than me.

For drivers/hwmon, there is no mandate to implement suspend/restore support,
but if implemented if _should_ be complete. I understand that this is not
always the case. I don't reject code because of it because it is sometimes
all but impossible to implement. My philosophy is that anyone interested
in a perfect implementation of suspend/restore support is invited to submit
patch(es) implementing it.

Long story short, there is no such requirement for hwmon drivers in
drivers/hwmon/, but I can not speak for requirement in drivers/platform/.
That is for the respective maintainers to determine and decide.

Guenter

