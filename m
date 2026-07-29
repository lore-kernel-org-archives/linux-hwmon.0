Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FF924DCF6
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 05:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785304568; cv=none; b=Prf+Q9PLqPVSUpUpaeP59Gbl6pAR2/2XF/j9st6H3F1msvfHYs8zQ2S7Y9yWRiZXGF4HDZhH//EeWNXn+dJJ4TFkGAFJJzpu6iJa0eeNcAiucsnkN27FQHVBl7fyjteciXP1Bivdc9QFbbsJKlSTZzH54SdbwvVDbHV9VEvQ8fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785304568; c=relaxed/simple;
	bh=nTCRbQU/WJ/IvAKmCjE0zHuOyHenUXqviPzmn+nZN6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hSuG9peSsLzz0iV/QO1n6e1I1wizYLWmX2i0ZL3ily+2aiPyrUWQnO0mX5pjdMPzb3bjhnd3aKsZ4sb41etMBsRMBBjRg3GmVO16/l39Du1lvEWTJ+E6JDwVN7z6czSnAqVfbuGxUVdT0dJstnN0Bz9Ld7Oj23hUSLNOWJfpeLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+gQTws1; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+gQTws1"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e58034d05so640304a91.2
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 22:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785304567; x=1785909367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j6vxb3iA93h1xFB1s2izVjT6Hdtw2e+2c26Xk2WfPZI=;
        b=f+gQTws1ZA4wocTtl9gWMLjUIjLf+iNm5AwC/k2fV3BoGf0kbr3vQhfskE1sBaU8Qs
         66tJeb4JXd+zTJK3kwObmfvkpPG0TghdZOvI63MRIpLMpajr2Ya6rMTI/C/nP03MVBNX
         DRmhZdaKga620Qtu7RMYZY/KaPkC4sXPnxKLM75kbhyZ6d0C3rjx3gmJ0j9mrGrUxXP+
         mAnvFpfuK1yF6UdSTEDn6136pooZa2DZrUECD8VnFST9aa27qS3CIj+eT9XuOikeoWVe
         12nr0Ijb0uMWmmB6HRA0abxUdcLv/T77qlFpPr80uWRPtOoYrC7FZzXErUX4cc1bDmYh
         WGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785304567; x=1785909367;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j6vxb3iA93h1xFB1s2izVjT6Hdtw2e+2c26Xk2WfPZI=;
        b=UX5/Va6UnSNT7jgto5/jQ37ueoGb9N2CO3vOGozrbYcYG/Bj5azr2fZghsaOX6ERlj
         EWzapv6zCdIgJRXpAiHfOWPlkZDqy8SVIPyAFUjcYHfO8qrI1QpFoIrt9LCLxQNiuseq
         ySe3RJq8JjkPDx1AjIq2vRzizs7nUESeN+y5PqHt4NZx4tPT+U+PQ4Qs6u9PBoaWLHrf
         Sj9/ZR9Wh2bISlxcHsO54EgZTTrCwfIaCeJffTbIyS+AR9I8K+hEImyh+E4JecVWQSc8
         SFBeYI96H7Q5O+MDVEnnGRjvk4AERR2giJcox7J4S/JII3AdlfgyRsST0a+2sIqEv8+1
         0FlA==
X-Gm-Message-State: AOJu0Yyw67G7+ilz7S/qcnroqVkBWjuLHWp419DvXPxDZolKV+3EI39H
	In7J3gWmveUsfaeZ6IVS4vbNqbN0QVaYCyeDRxp11jvSal7Rn/Kr+D5T
X-Gm-Gg: AR+sD1095mz/gWDmlhFkKIeQZW55lpzzJYwshtQAGxvW3uy+HjYrQcSWQQVVHSbAh2G
	9sfPkQS0AEhA+VTvl7UkUzBOMy/YJu//FOo0eE02bYHccBbGgh7SnSb0IKEl2lRzoFEaUn0x2HM
	iAC31KnOJFVcxNDmlcYccxj0abYHlFAZ5Wpfaolo1Cnz2JBP7B/SlPRchLJ8fn9jwyA3R/7ryiz
	xxB0Ob+2fP4ylT4zSvQ0Y8Ss5c/EwzFYEU7DB773ihkfsUPW/mz8lE9eHnDOz4OjygqXAI498Cm
	UJNEQlYsPosUcYfrvtPKSCQrljBymqs7fn7/VDOOjsBvKvLrOMa2b8vvWI71YkeKSVvYIDm5SuR
	CQDXmpmx5P53OWNKR66A5NWlugFlmtd+nxC2rw0gxpP2TL8dHahh22kj1KeMJA2+pO0QbKs0XN/
	7c3dWxgKrP0scxK1tTeTZr9n8gfg4DOl1IireK7aISWCULLVHi7T84X4V7e0a62xvkzx30B8Z+U
	znMZKVBCRj3gm0ZUZ/f+lZ6s67UTs9JjiBufg==
X-Received: by 2002:a17:90b:562e:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-38f6a45f777mr5761630a91.24.1785304566565;
        Tue, 28 Jul 2026 22:56:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f2b690fsm824351a91.13.2026.07.28.22.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 22:56:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <12dfeaae-f806-4adc-95f1-97fe10ef748e@roeck-us.net>
Date: Tue, 28 Jul 2026 22:56:04 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [hwmon-next PATCH v4 3/4] hwmon: (adt7470) Expose fan control via
 PWM framework
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Darrick J. Wong" <djwong@us.ibm.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com>
 <20260729-adt7470_thermalzone-v4-3-c14039dfa0e6@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260729-adt7470_thermalzone-v4-3-c14039dfa0e6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/26 21:46, Luiz Angelo Daros de Luca wrote:
> The ADT7470 features four PWM outputs designed to control fans.
> Previously, these were only accessible through the legacy hwmon
> sysfs interface.
> 
> Expose the ADT7470 fan control lines through the generic PWM framework.
> This allows generic PWM consumers described in Device Tree, such as
> "pwm-fan", to use the device through the "#pwm-cells" property.  This is
> particularly necessary for boards where the ADT7470 external temperature
> sensors are not populated and the chip is used strictly as a fan
> controller (e.g., Edgecore ECS-2100-52T switches). In such setups,
> delegating control to the generic PWM subsystem allows the kernel's
> thermal framework to manage the fans based on unrelated temperature
> zones, such as internal SoC sensors.
> 
> When a PWM consumer applies a new PWM state, the driver automatically
> switches the corresponding PWM channel to manual mode so that the
> requested duty cycle takes effect. The duty cycle specified by the PWM
> framework is internally converted to the 0-255 scale expected by the
> hardware registers.
> 
> The legacy sysfs interface remains unaffected and operates in parallel.
> 

No, I won't accept this. It has to be either or. A pwm channel modeled as pwm
subsystem channel must not be visible via hwmon attributes.

Guenter

