Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EA634EF06
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 20:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774037169; cv=none; b=LhNGuQKXxJlpMTMEEoDhXsGmyVzkOdztck4YbrBC5pwy2RLvC4LL+DUkpQiVYwcZW3GEO2uhGUuLWPm7Okw6AepHF/RwQeExD5UzVhVpiK+b/DoNxNtjolw+gGlaYrqMu9WmASpD/52WawXwD2lMtrevz5B6jn5SOwD5/EYDFZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774037169; c=relaxed/simple;
	bh=1qmaFxDccZRzs0QTOM1bUCGgFCittjZZSZ136PK2yWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EthSllT1Gdl8hRB+o5Maol/Uq+tqaj9s30qMsuMzVMaJZs8Ai0ko430YM42Z5xaCqH6IGuAMxdEepqPeZ+SIQyuJF4RQQJu7V/W85j8x5VRMBs9ccj8CGnAuzvT8leZidhzNwCFP59lgdm9Y2GJlKOmt6pUHGERqzmRfwiM4KuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jz7E7ng7; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jz7E7ng7"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c107ef474fso823713eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 13:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774037168; x=1774641968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=w0eYaGcB3V+rZa//1YtvXJWbgZGhvz6cAIvDXCZsJEQ=;
        b=jz7E7ng78r4lBRJXaRlRG74j50yq7ksUuY0c/mQd6gVZ7VFQlGofgppk/y/Olu7Gxb
         jIi4vUbr9oayMgj1wyFQJ7PGMy7O/pdU37oSbS9R33wPzCf0HNQs6u5Gfg4PGZ+82sKK
         R1pwuq+XeLFdEprXacIXRt4Pong4L9zPo+fVIxgoJg7FBt6oVS1NkMuHQ1ruo+w4MlXk
         tYf4AhAp5QVCvFHyO8l/kG9axEZn3J/S6dPpR47HKjKbLi2qkEXEwrepKWQpchIG1wNV
         T4VoVJWs0a0jKH8yDJBQhGFtW7fWtC7odorCYhfI8mNzwCZJ3orneBxzb+AMSqlo75Ys
         q0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774037168; x=1774641968;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0eYaGcB3V+rZa//1YtvXJWbgZGhvz6cAIvDXCZsJEQ=;
        b=sTZLfa7XwD7Ta3VduYpRlHBSo4HRzrLXqp7LU0G/eFgotPfL5eLskOMntCmoupx0x0
         DX4cwMzLIVCIWBPV3Ggunwi+oZYPYcWMg7O3Q/wQZMHb8v0DbCHHobHI66gCXSBxPG/2
         dtsh02iiPpT1yxsbW8jcwB5kxcFMlCLxL2wUHme55dJj31yKhNjCUwcBoyXF6qSOtEmZ
         FTPm0ar6yJBsXF2or+G2Wl5HGLWd6jGMNWBOc73r4OMU4KAl7GSIA6GEAOrmNHKAUW78
         CTon9XS5hOY4TU5C0eGbJkx9XbOc9i2hvP3fLwQ/LAYMtlALxzGaJXL2UW9t86eaudxU
         bFGg==
X-Forwarded-Encrypted: i=1; AJvYcCVieORNHRxCh0VGlPxYsGnYhp4rcTWLiI+cnCJf4/s0XRrAs7FAtqhF9d9ppn0xDiIq7Sa4nUXA6l47ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHAAxKKxBFpHus+x75qU49jBNK5pDqhLUnIh81luYrwO7CtHj4
	5UqSlQSqKQ8pmBnYtb2zszxVq9RUckk1DbaK8Z15GvfR1ekCRnYlax77
X-Gm-Gg: ATEYQzxFwMv323YyyzjtmFdN9CPZChgz5V0QCH2AKa8mPciUq3RR5ZMYeknGrY/9zPa
	t6LB3iS5jAM7+hUnKP4PuAVsbUu8SCMIMWwxj+akiAAtZDD+wRA4xSgEFuO1Fe1Y88P8xh+ibAg
	ecWOTamh3miIg/of4bp+6KY9h/cmqK/b4vUdqBJLoQn1ega01YvsPG/OoILJxAUs32bp7VmhEH3
	YtHeSi2DQl5h0oQxbDJ3L7qkGkZKpDfcbUeWhlfx7p0A7PYXkgL8iwMS58slP7oKIq1Lm/88iio
	dOdTbNucaCCO2rNyLOUKZ7HYUh9AFqSx+Fz/9/gCj5DP8QaIvXyNvvKawpt2uJ2RxsDXYwqcxCd
	gtISKBlHi/5aFUUKJqBusf7QWk9jFjX0uxQjTalorsJUIa7vGSSJRpLPS6kj5tenZBs+4HHhu3l
	eK9JMD66EiqYo9GnE7GuwusSBRrnI8ikdcosgOD/2r1QnRb4VIco/Dc/M00zgI8EqZiIDiPRJ3Z
	BX1TB5XfU0=
X-Received: by 2002:a05:693c:300b:b0:2c0:d92c:2c68 with SMTP id 5a478bee46e88-2c1098092b8mr2171432eec.31.1774037167545;
        Fri, 20 Mar 2026 13:06:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14bac4sm5869488eec.4.2026.03.20.13.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 13:06:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <52642e6e-cd86-46e2-ad73-3775ff9531b0@roeck-us.net>
Date: Fri, 20 Mar 2026 13:06:04 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] hwmon: emc2305: Support configurable fan PWM at
 shutdown
To: florin.leotescu@oss.nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/26 08:29, florin.leotescu@oss.nxp.com wrote:
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

Sashiko stil finds some problems. Please check.

https://sashiko.dev/#/patchset/20260320152959.1575978-1-florin.leotescu%40oss.nxp.com

Thanks,
Guenter

> Changes in v4:
> - Initialize pwm_shudown array to EMC2305_PWM_SHUTDOWN_UNSET in probe,
>    to avoid treating unconfigured channels as valid and written 0
>    during shutdown
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
>   drivers/hwmon/emc2305.c                       | 35 +++++++++++++++++++
>   2 files changed, 43 insertions(+)
> 

