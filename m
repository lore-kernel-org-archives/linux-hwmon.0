Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840D5386425
	for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 18:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896085; cv=none; b=nZxSL/amtNpSszU32D3YqxP/iPLU1net/Q8BUetUux4eybaBxuNuj0v6IBI61cRTYaPOiDLazssbLpQrPDGU46TJAke6of2Ww4f67jAa4B1/iuG4MacgMBunsWQ4vnvyiulirF6SKkYCfpdoym6Ir6RU/ZtmqB430Jg4hm0e/ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896085; c=relaxed/simple;
	bh=XdIRVLXe9KzsQ+ktHrRPxM9W8BGX4NgLlI4u8lXkNGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cUVuU52zjfgM5JDArvOf+FWll3Q3qpMhGHCnBZnMxqOLoOdFcPR6xSVOmgCU4WOT5LaO4tODglFIlOD+A++5DPocqe8lXx4dDl2VGIEKlJt1B6VUkcHEf1OrYWR7Wz47KHT5BqNqa8ul9I/J7tXOBpewDuZAat2l8P9klDt1UIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K29UcUaX; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K29UcUaX"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-128b9b7e3edso272787c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 11:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774896084; x=1775500884; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Qdux+kJq9nY2jpK8Fz/JECipCcGyaxinKJtsf7bYkL8=;
        b=K29UcUaX0FvyqW0EycO7KgiVuwm4yXNCKtT0Dolb39RbBOJ73TDK+fWn9/gbjkyoXi
         7ah8WPlTj8Xh4f5bw8xa6IsprQ1stt8LsXqff3ygEupCCk0ptUNNZxRZprpzJy+RgaAg
         /KZq56a5cJENuNV4a5VHs3Nd7iBdReHh3e9HxGB58gA83CcU3e+vjq9pvTI1cySdShu6
         jEIu++xHKN9ls5LRNNPZVJb2cGUlTRNsDHz9w0p8aJjoUfs9XI5BmfetOK0fEVSKDJgJ
         LIUL4WdYE0nawbr6zHKEoR7wOyoAsm60hxsoVAjw3hkMAHLUYNqhSiGxgzfK44wWzqnl
         5gMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896084; x=1775500884;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qdux+kJq9nY2jpK8Fz/JECipCcGyaxinKJtsf7bYkL8=;
        b=HWzpuvnS6LqT+Kq+1L/oEhng6qZArmFV8LNkunFL9R1kT7gAeXhILl3xNVibiWlqJs
         rawfqPSuuzvgi7V3uL2qXcQExqT1Enp362M9lI0KaEOYPycAK3hKw9bJkc8UeM1ZHMOc
         V4pG3mp2gc0a+fIIlGpOmf7oFXas+yEsdNGyp5pj2zXwmb4BEMEIhmUTWGOh/tX4aStj
         wp4OWHN0qvZEnja0qdosXcf0LDDzmMq7V/Dc8KOxkUiGvlgSOB8Wx7FDr4/6KxvelGQ6
         /eBpz3cxwOczWes6zZ7CO+4zgI52Ucq0irryhbJ7T7x8Gi9etA+aG78xrckbI1gkS0Fq
         KleQ==
X-Gm-Message-State: AOJu0YxZwNaq1clIQg2hBPDdW2OybNgza/7QKkedcvqzFw/JxwUyQRSj
	2lL9Bb+aQvU09VZxrlf3XJ7Ack6uKtDEpoLJzbXRyz4gDLpZiTLVo8+L
X-Gm-Gg: ATEYQzzYL/SqFfckqXo+F3X+tjzOgYaPo97v+HE9BpgWBcKuv2frPoDREmSyct3GQMZ
	v6jkwy/6qS7oINCO/+s7NmYGvlLgVsLz80yFdjJabkBHNH59HfWOcaZSEh5KaRGJWEPcSanof6R
	eFsVnpIVqZd54fNAXSbftjMG7pGLMe6rRcLIHadlAMi8C+2kTrLxuWhMcdX5lptvvoKrbTyW8Ln
	kXcifTvjUSUzsJlXHTgoCPYJh300gT76hChzxRPu1W7iopcSF5dfghm7imkNgDCo7YXF9B2TOUe
	//gafakWqjvo17+vjSCfDun4g8fk+3drAf2seOFYi1DUZJnE3zEqmaVHVYWgnK0zeoVdzRBCjhV
	i2b8gZYyVS3A6vsHVlzwxOq9xO3FyzMiotJ76BsFBPmj6FAGw8hgJK9EXqApZrfnszTwwwrvz+g
	+SXbtxwYffod8CGGmfq0m923rz4w9SmEousVxladRRML6SuybJeztinbuQ8bl3tlWmwNXPIaDt
X-Received: by 2002:a05:693c:2c10:b0:2c7:ea98:da7 with SMTP id 5a478bee46e88-2c7ea982a91mr7634eec.5.1774896083494;
        Mon, 30 Mar 2026 11:41:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bda306sm7736513eec.3.2026.03.30.11.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 11:41:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4dd404c1-8d55-493f-ad5f-2aa30ef10b55@roeck-us.net>
Date: Mon, 30 Mar 2026 11:41:21 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] hwmon: (occ) Fix bugs in power sensor, extended
 sensor, and remove path
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>
References: <20260326224510.294619-1-sanman.pradhan@hpe.com>
 <20a29a60-6848-43cb-be2e-4e63c8602462@roeck-us.net>
 <20260330160105.78279-1-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260330160105.78279-1-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/30/26 09:01, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> Thanks, for the review.
> 
> The AI feedback seems valid on both counts, but both issues appear to be
> pre-existing OCC driver problems rather than something introduced by my
> patch.
> 
> occ_shutdown() already holds occ->lock across
> occ_shutdown_sysfs() and hwmon_device_unregister(), while OCC sysfs
> callbacks can enter occ_active() / occ_update_response() and take
> the same lock, so the deadlock concern looks real independent of my
> reorder in p9_sbe_occ_remove().
> 
> Also, the occ_active toggle path appears to have a lifetime problem:
> activation allocates occ->attrs and occ->group.attrs with
> devm_kcalloc(), while deactivation unregisters the hwmon device but
> does not release or reuse those allocations.
> 
> Given that, I'll drop patch 3 for now and resend patches 1 and 2
> separately, then investigate the OCC teardown/activation issues.
> 

Do you plan to make any changes to patch 1 and 2 ? Because if not there
would be no need to resend, and I can just apply them directly.

Thanks,
Guenter

