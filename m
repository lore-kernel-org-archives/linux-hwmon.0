Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D8330DD00
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 05:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770269433; cv=none; b=B7y71khPSWbJ4Kx19/HqP7vH1F2WN5w6lO5hqHR9ciUwI+QdOU4JzBb80R/my5htZ7Y+k6kdTrCawCUfNEGhmp8mJdrQ6HZ4ffmYw3m+Aoi47uhXCUkanKsXReUnBaPThTgnR0XYPXvZTqvADDD0D5MBMowjGYuhXbC7sY/qKes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770269433; c=relaxed/simple;
	bh=4EaoPSeJZ7PkjcSfAJKvXYNbcn+qSK9lMNkJQT680dI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n82WDNJfCv42eMT65pVe2201k/DrU7wuoJMD8I6Vjg4dNJsD40DVW7ZzMnge/O3Xo5NPuWGYtNgGnh24oIh0tChdk0GOx9xptvc8HQmdOHkp94JSaLkyroNyEGmvo3NUvvevwB9mBlZPnBaKtW5eRFYNozSmR3PBLQEV0MxOwVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCqoCx1P; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCqoCx1P"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c6788f3db37so149315a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Feb 2026 21:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770269433; x=1770874233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iCHA0pyhYtn7RkNtoCLDE38YqGNfLX3z4U6eqqpc/Lw=;
        b=CCqoCx1PWYY4Fm1De2VFf7jOpp+4oqbVgE/KjpjlYZZejghB8GQPwTXUMOD64tDmhk
         iw7KBcIZBnt0n/wrKDAYOHs/C9RjL+J3VHszT0+bBMTOk0T1+J9hzPGVI5ja8rGBl/T0
         rW1tQMgeQQfJBEfLKrCKtiBBtSjCws6RNNXKQSp9w3h3d4HVPsLKp8uC1dxHuiP13T65
         +qIq82+8FyLBCsv71cTgloL1CbzJ3xD47nG7vM00fFyF/6/aHL0PqzYfAvFG9ug0Jumk
         Tpfh8E1+jJs3eeEkCOWZqQYsHXogc6kfmXQhh5JStt1fPeg7lS8OtKkC3fbtefAGlxaG
         8W5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770269433; x=1770874233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCHA0pyhYtn7RkNtoCLDE38YqGNfLX3z4U6eqqpc/Lw=;
        b=obQ6vj2avYX9t6SnDsZ9zI6XJMZOm0cKIJQtv6Y+T3JRILgrwbUg7LWhk4fTXH+BOe
         9b67x5XQ0eWeyUFENabBOK/wpBcstXF5DLUolD7kaXPB/dGj+xejw5odVfSzw2wnTEhj
         Lih6dwbHCpF/RYo/3VDXXXtzGbRfrtdW1wvermLS0HIHdEp9ncfu4pauXLYcGfGR3SE0
         A/oH/8J83py3yxg1MojuJ/OntBUG1OMOPiXWUNwTbDDYk1fyf8K/ODkeMACnDejlWvy9
         bax4CXPuiP94JpuBgDTf2cs3CPShNiI1wJY3Ak0p1T8V5pHvwcvV+0NsbHGCq26tGikn
         oxtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEqr9n3rU2xxHEz7gaekoKwY8RAqTe9UZ99JNy6sUD4ttrHsMRvExWKyjV3fRn52jSW1RfZpO/+HaRow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxvBglcVfNjPfv7c79MfnkgfdsWgFxfQ8vzBluyYeEReZdhScy
	Vh5w4cWFjcCjwYtlS3RajkEAYgSzApM0mnJwdAfs4x/uDoNv8Ia2wT+F
X-Gm-Gg: AZuq6aI/uG7RCKY7ScBZMiMHhBd7O1ZegctlENy5re6O+PosmWy67I+06yTuKEsyf74
	mfGcTYchQ6Apu6eDL4XKRZmIut98Z54hrNNz3e7rEmLQ9Eqo+EzH0sfOT9M3q+cBBBPzGZG1jJo
	kXF2AL9O7k2S/J+6kqGLcB7HwLmRyaFr5qj/8fzHT+GRJlDWpxomrooXZCoBTHOgD6WNphwyko8
	/JD13KVa2lBm8r3eUsDQxZWvfuieGegUxEyrcFJxYTQauA53UeFGkw134nY1asPDhtq1Q4CcNyO
	uj6Si2bvYTraJ/f4wdNoz4T9MoMUlvqR/Cr4BPrRg0cmVMRP8g1I0Pv3DUiUGYLCqBBlZ5yWKo8
	2e9OvkHGRH+c83fbnyPNqqu4ctAJKFMf4irzrMShkzO7w8hvfksvcrvDQPx6q6OUOLlfdPw/LOH
	ZhwBx51ot5gHkeDpQZXHFmJH3zxWyRv5zxUoO7X1gTfr8cXPAZYsbvRp9Kv6YT
X-Received: by 2002:a17:90b:3910:b0:343:edb0:1012 with SMTP id 98e67ed59e1d1-354871ab52dmr4376106a91.21.1770269432656;
        Wed, 04 Feb 2026 21:30:32 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3549c09adf4sm1072941a91.3.2026.02.04.21.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 21:30:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <29f37729-b38a-4c38-a74b-011b2766587a@roeck-us.net>
Date: Wed, 4 Feb 2026 21:30:30 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: hwmon: pmbus: mpq8785: add MPQ8786 support
To: "Lee, Carl" <Carl.Lee@amd.com>, Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Shen, Peter" <Peter.Shen@amd.com>, "Huang, Colin" <Colin.Huang2@amd.com>
References: <20260203-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v1-1-67b041e2f762@amd.com>
 <20260204-sanction-lunacy-903e96c447e4@spud>
 <ec538467-9068-4ad5-b788-e60f593253be@roeck-us.net>
 <IA1PR12MB759127AAA1EEF4DC6C1904018399A@IA1PR12MB7591.namprd12.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <IA1PR12MB759127AAA1EEF4DC6C1904018399A@IA1PR12MB7591.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/4/26 19:32, Lee, Carl wrote:
> [AMD Proprietary]
> 
> sorry for the confusion.
> 
> I didn't realize before that driver patches should be sent as part of the same series,
> while DT binding updates should be submitted later.

Patches should be sent as series, with the devicetree patch as _first_ patch
of the series (_not_ later).

Guenter

> The corresponding driver patch is available here:
> https://lore.kernel.org/all/20260203-hwmon-pmbus-mpq8785-add-support-for-mpq8786-v1-1-9ff8c7c50242@amd.com/
> 
> Please let me know if you would prefer this to be resent properly as a series.

