Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9971F2FFF9D
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 16:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773764250; cv=none; b=J8Uft4vt8I3g8pff5eiBVnAQUhoQGg7pyZ2YUZMsgd8jCD8dnoNFxx1KAeamRnMdG5Pv8/02eECen10bzEemD/6RVl5UyDTJ7A5e3TIr+uMWRgvlteQcUdNUP5RufIKmkaIiWW6Vwsjk+0loQfnHp0BGa8XfeJPjnPyzmOEWoKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773764250; c=relaxed/simple;
	bh=nCvD6fcxeEXltoWuRIPe93LC0JA/CjYCn5ns11eB1AE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RNqFbwkIIPp5fdC9shUaBp5H/5DQaqncnjoFMs13ewOl1yEpGjiXqz6N8PJbaVomy/mVqjralyT/EfNYoL8uLBOX7wmz/92SB+Edhr8Ia9+c//5rvBJiS+EVE/eF5ytf8Rc2V0ydHFdKEdZRr+yyICOcvVrzr5LzWjHT3VffS0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNUfwDiK; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNUfwDiK"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1273349c56bso8953705c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 09:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773764245; x=1774369045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=URvoLxPA0BeSlPTpYdBZgg88Tz7V0XCja4l2VDYBveU=;
        b=dNUfwDiK48PJs2FQ1f1EimJvGWTY8pBrdQPeiWPbv8OEqHSWjRphABELMhAmvtlsWv
         iu5696lgvYbj25chsnytDn4k1525X75syY5/VQHEImaesSp+2OhbVaOP3pIL/0Wo6JrU
         VEle+SWZVS8d1B852QvpoW+hZX7DKzCYIiZSzSUxRaMcJmF29BPKof2RDMYC+Z85spvw
         1WFny8x0X8sd59YYTg5rliW3W7i430DYd9aqFphiBtz30mr0t/joJ2lhgZZ+ajryePuo
         wtIJFo0mroHpw/wTTw1bA+yiAfti0yzDEHBbX1HyET+XezCKPkQqeSPrHfU6etXG8ks4
         V/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773764245; x=1774369045;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URvoLxPA0BeSlPTpYdBZgg88Tz7V0XCja4l2VDYBveU=;
        b=iLOgpcxDya2/gN9ynNvM+d8dSUU+/ZgRrtG6zgdz4AQxQrFPH43qH3gTrE8/vwEirE
         /68VQzheCgFz6euYzOY2quFo8rmLEvWpTA4sFPWlRAxxHejcLTcAG8hDY9vgHxPOHe50
         NgeCMxfiLUkQUlD2k8vQFMfrYgTpdOfX+Wtf5+CVJV3hhpMfxS5zRtdlZnEpXBD7cUMS
         YkdFHRDH6YrVuJu8jm+1QZ2MTMCtxKppnb46KfZ/EDAyvUsy0sY0JNPmZbe6yFSJtxvB
         9p60qNcq2VkC2VTrZlwuVoFQ3etTPAUfyVuyfCZScwtmRBDzrwdCnPbeIoWuS69wwCdO
         5R8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdUFZjz1Am10rbmT3LdXtOd6nsSDDcfqCvFg95YN7Ev3wfCzZe/vTZSeScs6jOMd7U3OYY7285LCA0Ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJkb9gYQtGV2oj9qqIN3VkK9LCBTFltwumD2tlpqXODRQ6c/az
	Je9b3o2qcbXxRo5yv9PGAW/MHIH8ldqMwiEBx9XqntOmXAY4ZDfEBgEP
X-Gm-Gg: ATEYQzzxLuDSI+xG+b8sDkAPpB+XjA4ga5rC9I2m/cChH9HkgVzJEEo1YDWhdg0IUEm
	oEIWz1jP9Q+qgm0LspL8tXaP5XuT8u0za6fbCcq+zQWN3M7xmowyk437+EaoGSOPMPUxLO2RjSh
	R3sNC0YABYiKaWVouuAR036B2UiwncB9eprCUp9qE1DVVsaZSmivkA9cNpeDejBzb3gNKlhOnUR
	vpLytPp4biz4jI+o2zCpmoh+ohEZxfAz2IkfPSQIJ82DVbc4MN/Vy0mQG/jSeYm6Wbl1peNqNWV
	6x5LtuJ4TYkH9KzRzJv9IuQohn5zSZ5sAdWHp82tYcCO7ccg8cT+/x9bQ4VUufEzy/o1xL/FlBl
	TwrB7P+jOgn+N1EN8YcqhC8vZsK2pyUCb+wvfV+m+SARcP+znl8Dypwvrl1hoN1yedWv/1DjKUO
	c9Ebr9N+gm9VHhrtKLayCc0vl9Q5SvZERtRUn1CYDhGKT0wrJzJWyMeeGkWj26pztvIClHV3df
X-Received: by 2002:a05:7301:4b03:b0:2bd:fe5a:b861 with SMTP id 5a478bee46e88-2c0e4efb874mr14500eec.0.1773764245469;
        Tue, 17 Mar 2026 09:17:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526db0sm24622438eec.20.2026.03.17.09.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 09:17:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a3ec42e5-d151-4d54-9625-fffeb0399431@roeck-us.net>
Date: Tue, 17 Mar 2026 09:17:21 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/2] hwmon: emc2305: Support configurable fan PWM
 at shutdown
To: florin.leotescu@oss.nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260312144325.1311314-1-florin.leotescu@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260312144325.1311314-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/12/26 07:43, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> This series adds support for configuring the fan PWM duty cycle applied
> during system shutdown for the EMC2305 fan controller.
> 
> Some platforms require fans to transition to a predefined safe state
> during shutdown or reboot handoff until firmware or the next boot stage
> reconfigures the controller.
> 
> The new optional Device Tree property "fan-shutdown-percent" allows the
> shutdown PWM duty cycle to be configured per fan output.
> 
> Changes in v3:
> - Rebased on current upstream
> - Dropped already upstreamed of_node_put(child) fix
> Changes in v2:
> - Address feedback from Guenter Roeck
> - Make shutdown behavior configurable via Device Tree
> - Add optional fan-shutdown-percent property
> - Apply shutdown PWM only for channels defining the property
> 
> Florin Leotescu (2):
>    dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property
>    hwmon: emc2305: Support configurable fan PWM at shutdown
> 
>   .../bindings/hwmon/microchip,emc2305.yaml     |  8 +++++
>   drivers/hwmon/emc2305.c                       | 34 +++++++++++++++++++
>   2 files changed, 42 insertions(+)
> 
AI review of series is here:

https://sashiko.dev/#/patchset/20260312144325.1311314-1-florin.leotescu%40oss.nxp.com

Please take a look.

Thanks,
Guenter

