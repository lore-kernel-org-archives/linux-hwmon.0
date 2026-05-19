Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106D2408016
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 15:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204553; cv=none; b=Ofq7eCjEsdrk+3o9p7fhoBEOU4XK0lUQhirDXa44wlDlNa3d8SAH6NaJyxgxjeBEoK6Eia3CumLW7cf8E8yHHVTnABeqszTePS4RGR9RbhaV0QsNFBJq0u0YYzf2ixEDD0Xg0WHC8XV1+zb+MjajjGI2ho7uzVFNYMj+AETZ9K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204553; c=relaxed/simple;
	bh=N0HBUn9Mh5pL+ucb5UEd0fgcswa/bdyHlGsPKKEWNpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rH2sFCs2lsabKg7I5evzuY5OzJtHHn3otlOyaTmedi8pcNQeJ9YjqDcOKMbV8pVVqlpm1lRASQjpO0qHPY0s/ZepM3lwzk9stRF5WNjOMMINGa8B+BiQvfYFLUzvEF7RvnOzQN2SBUXfv0KY6XW9I1JqMi99E9e6ngpXFxbHR1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LaI3lp+S; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LaI3lp+S"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-303f2fb7225so1811367eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 08:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779204551; x=1779809351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/se++TNvk8+Q7Ds+IWKg6JPvzTs/UdaVZJDuU/0ji0=;
        b=LaI3lp+SOHHGqWsTc3Y2udZlUufakS+84jpG2r+dx70bOviSCVyPWJFsi5TQK67sLq
         ia8x0JO0piWSoMI+nt1ixS052TZTqLsZQqBAgvgYLoEyjy2mPRX7gCqvb39XrcjJL7sj
         spm0gBta62dH0kNQcf7m0FXc3bxYrvZdbxwlA2DxGHBRFA4emmg4TD8SPbXZjdJgDHgo
         nABPUFHjK24H84RtT5kG6/XmB5+CqevlhH3xxC+7Om0rwX1b40sRUZ97ApiWGx4WWYAt
         fjJTfW5+ZpR7YEqLr/99HnA59oB2x4hI/je092DQ07UxXOff6uYPpMNFDS1hzXG1sZfY
         QBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779204551; x=1779809351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/se++TNvk8+Q7Ds+IWKg6JPvzTs/UdaVZJDuU/0ji0=;
        b=LHlBYOYP1RDPGvK+m6S/5g4S7z0EK3SiDLENHrxddumw0mmBntXplJPXDrV4XWBfR8
         AOsL+LDtZ7xNLlBu960KCIy46SulYG0wKmvOY+2e6wrS987JsD4mrcW4wa/IiDKZX0yl
         5z2pAwSq2Aie8l1XMFAFg6RaiyO7fOzVQtQjFP/1uDAe41Avojcob5aqKuKW2wE5aAMd
         eFr1JoMLbThtbcg+wFw7WY5py+4O06tj2ENpijY6ehWbmNONLtCPWytFGySFHaaUrwu4
         asdiGKJ/VcC8jWlvdUMbjdHvJiDE99J7nJKVkuUby2Vj3+jpDYRhPpz+MPjLNK9lOkqf
         9bfg==
X-Gm-Message-State: AOJu0YxoS+HEZhMq9ckWQa6HXca0vAjR9F+5n0x8GOPT2KjDTqc4XY35
	xfw8kcLHgypoO/TWZXhLXjukqaD9gnkR6iPwsHrQPGewAESITaGELGMJ
X-Gm-Gg: Acq92OGmd9QD2Otp/Qd+Pf/H/37JCKdkBzoPWljPdm1lKXJw0hWN8mzcXjQx3feuGPb
	hpOzd7kF1wVQC1W//huG8VjO6tcWEVbUf/7xi2C+DEsgqZOwIoLjprs8/RifdYSR1Kr5K8pR+mv
	Wg0h8NLBgXAxojyin8yKCr/j6HsJVSFTwzRePS/PDJo6IIbjw5aKFw0Ekt9X0V1bd6SOnHKzwEc
	8FKxq9Fk7BofmzwHFbFuIDEs2t7D7vceGIK9WTP3M025xgQ8NOuGkdD3/iie7Qc1u64PTthWogX
	R0fCGhCs2NTOVwAOYaZ6hh3N5u2ZhvqFS1z11LernMpuTCZmhWInXhkpFqzCxFze0I6aqIzV5oT
	TEmqAdCC8WkH/FuyvlFPl1UUKgQpLJguiGFhKhKjz+l3vxSMpp1FB1R2SAxNYkYQvOcP1ankY0D
	VP77pKqHe7uiLgHIRZDDVDvLdwb057FiZ1DUeZFPhPnjaO2XfwXI9gAWZL5vhZ3TFymJDQZp1f
X-Received: by 2002:a05:7300:d4cf:b0:2ed:e14:42e6 with SMTP id 5a478bee46e88-303986bbe5bmr8933376eec.31.1779204551163;
        Tue, 19 May 2026 08:29:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcc458sm20207784eec.18.2026.05.19.08.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 08:29:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <51133193-57fb-4a22-bf9e-9817f1f52ad5@roeck-us.net>
Date: Tue, 19 May 2026 08:29:09 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for Infineon Digital eFuse XDP730
To: ASHISH YADAV <ashishyadav78@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ashish Yadav <ashish.yadav@infineon.com>
References: <20260519075558.91466-1-Ashish.Yadav@infineon.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260519075558.91466-1-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/26 00:55, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Hi,
> 
> These patches add support for Infineon Digital eFuse XDP730.
> XDP730 provides accurate system telemetry (V, I, P, T) and
> reports analog current at the IMON pin for post-processing.
> 
> The Current and Power measurement depends on the RIMON and GIMON values.
> Please look into data sheet sections 4.4.2 and 4.4.4 for more details:
> https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp730-001-datasheet-en.pdf
> 

This driver is 99% identical to the xdp720 driver, except for the gimon
constants. Please add support for this chip to that driver.

Thanks,
Guenter

