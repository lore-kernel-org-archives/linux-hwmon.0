Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6584F2877C3
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Nov 2025 02:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762999387; cv=none; b=nO9YDV5WknLRvWdd8EBRFsNC+OV7SJccisRVxqoaqcGntDnCD53z9HrMNRThG3FoIeI0hRDEDYoS1JdpQ9R7pQ8043Xlm1I1iusUATkgaHUpXV99u54uzybPTHusM8qIUbFkRqf+/mfkRMubujoaIVoKE+AhHOdP6N8nmvQWHok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762999387; c=relaxed/simple;
	bh=7sagxwt3YOzXO5GtOUTkLWYm3rudvxzxUFEOh7+/8k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2OSu+x5gZD6eUDPljlyWYIfjEyd3TnrSiB3Q0hJZTaJ56CTbJbhSKAwUXpBcU/koZ1l7Dckxz6ZM5bvTnSoYEDpf9S7LTP+GAlK4xgaV6QV0Lqo1rYOgaXLwptrKS3Jmi19i20vsvkoTk+HAafJwnS4aMl1XTcBWz8kYXqt784=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2glekrH; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2glekrH"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7ad1cd0db3bso224234b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 18:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762999384; x=1763604184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UjweUzZ22jKy+FdesM7fO6h9LCgM2UrGbdkfnRu72po=;
        b=D2glekrHFqeT0yPeelVgNhvC98HG+fPpgHEZI7nouqZayqIRe6psL548Yg952k9LXY
         ap8XZ0j151HcFuYoGfwOped5fmAyDQ+l4RIwQLhlKr5t+XgAFOTfRvfctJy6rsYUmaLE
         IVtwOOzIm21RnG5BopAIkdOG7W8loTGpbc0gcCdUGvpHhSsNCnNdw/TLotTmwKXLQf1g
         BQdcQ92VOahrAS5jPLitmPlRIDym3JRC3klqK/98wpKKrbTU/pB9pdfCjjSXwLvDx9q7
         CIesUu+HunioutEDfVFUwM35CzzOgmB6SH7AgEX4t/ychMjnQaRZ65c8Nu/7+tmLZPpI
         Wg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762999384; x=1763604184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UjweUzZ22jKy+FdesM7fO6h9LCgM2UrGbdkfnRu72po=;
        b=vpXWUK7GLl2M8IZiEdlEqIKsIQLLUjPg0LZm0YRVuJ1xKsob3tOwg4nVJRmWXuLz1R
         WIcMarStXgZMKw0eYwvJsYKJ6EBTC3dxx7vAg6H927dTtriZOk2NhLotWfTC2p5zoB89
         FPwK3/WNgWH+/HCyUMN4r0OST3COoO4AOna6KZbWRxKCbaWcollBzimyz2Qr4NsZfvTG
         7Orkk950ZbOyRhVMavi4zchsDlz7Kwzmi7m6RUyLGZP39cgqvhDzt7D7n4+rXq1WyjW4
         pijeJEwfcszHTeLZZln26RqLuciR9jS/J5yFvXZh0NiGnKMXht3nL//VltkA8nLeXREi
         FU2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVn9nft37TFwhjoKh+lhRBfyHrKYpJ8Ch6NH9YzF+bqjHPioBy+pyoyC2ItZLKLPepZP25u3g3SGAkiBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx10lbGfSf9QUrMxOKFaFqlBR2kG6Xerh7dDU9O90EFp0KX3Ukm
	bbE9goT5DGEYRcFgvrWRjY/QYxknpnks8JQ9pRHOKCFG2LbUmKWsLMxy
X-Gm-Gg: ASbGncsdFz6Fes2IsfhKTM2h5qGFGGc3QEpVY3OdqSaHE12zxlT/IJ5WxpABk2Hc3Wr
	0VVA0iavUU9R1jgDNlsnt4QkT+//ClIbrM9D41+7g3U54kn4EdTxWKqEMZaVGmZu9P93pS0YuWt
	+rKra9ukVbNd8kBAHuCTtJLd1DmlsldAY68nlc+Kkm9tYloThQdXmGEpl+UUo2t/TbrBPszci+K
	PZ5BBvySRQ+1d1cA6bfEpX5FX0WY7lSV2tYfl5vEavVm9ddKp6yYbc+KaI4SW/JN5LxZ5SkDlX5
	qDQkSdbb0bHa710pZQmekbSR9mJNANGZBnmwjj/MEI+6jWBe2DkDj/bnfNQUY2bUd12/RcOTHsf
	9zVZp/08e/Bcjd3fMQSOT24oNjZyu8I6DK8Xp/VYcWOoKF7u/QRtZCYwSbvS656yQQNP9NifTms
	7wI3HnXsUaRYHREl7L8hY+c2jRiXs7K1Yp3BSHZbsrU1vuDidC
X-Google-Smtp-Source: AGHT+IG1WS6e6A31ciU36x82nVcAmvDmiX6VuzUgSbYU6zLgxbRslxDpgz+YB6Vd+8ZB7Iy10zQcHQ==
X-Received: by 2002:a17:902:e80f:b0:295:6d30:e25f with SMTP id d9443c01a7336-2984edec6e3mr65136965ad.53.1762999383530;
        Wed, 12 Nov 2025 18:03:03 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36fa02c42sm435825a12.16.2025.11.12.18.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 18:03:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <50cb21bc-55e7-4bf3-9d05-0cbe10af46aa@roeck-us.net>
Date: Wed, 12 Nov 2025 18:03:01 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-binding:ti,ina3221:Add SQ52210
To: Wenliang Yan <wenliang202407@163.com>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: christophe.jaillet@wanadoo.fr, corbet@lwn.net,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251111080546.32421-1-wenliang202407@163.com>
 <20251111080546.32421-2-wenliang202407@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251111080546.32421-2-wenliang202407@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/25 00:05, Wenliang Yan wrote:
> Add a compatible string for sq52210, sq52210 is forward compatible
> with INA3221 and add alert register to implement four additional
> alert function.
> 
> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
> ---
>   .../devicetree/bindings/hwmon/ti,ina3221.yaml    | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
> index 5f10f1207d69..0fae82ca3ee1 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
> @@ -12,7 +12,9 @@ maintainers:
>   
>   properties:
>     compatible:
> -    const: ti,ina3221
> +    enum:
> +      - silergy,sq52210
> +      - ti,ina3221
>   
>     reg:
>       maxItems: 1
> @@ -77,6 +79,18 @@ patternProperties:
>             exclude specific channels from the summation control function.
>           type: boolean
>   
> +      alert-type:
> +        description: |
> +          The SQ52210 features a configurable alert function with four
> +          types: SUL, BOL, BUL, and POL. Each channel can be configured to
> +          select one of these types to enable the alert function. This alert
> +          function can operate concurrently with both Critical and Warning
> +          functions.
> +
> +          The configuration must use numerical values 0 through 3,
> +          0 corresponds to SUL, 1 to BOL, 2 to BUL, and 3 to POL.
> +        enum: [ 0, 1, 2, 3 ]
> +

Per datasheet, each of the alerts can be enabled independently. It is possible
to enable SUL, BOL, BUL, and POL on each channel at the same time. This is not
possible with the above property since it only permits enabling alerts for one
of the alert sources on each channel.

Also, I am not sure if it makes sense to have this as devicetree property.
It is not really a board property. It might make more sense to tie enabling
the alerts automatically if a channel is enabled and a limit is set for a
given channel.

Guenter

