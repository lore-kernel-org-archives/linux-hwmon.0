Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3F4190676;
	Mon, 27 Jan 2025 19:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738005711; cv=none; b=ac7GL8gLGhBlLieJxdKqILiZ5cTCXb4Zx049TEr8Dr2qrW3mGKNwfzS6kYePFk1FJ7hFhCKmdnxq6yFclcLUE4LicMHQaaUWN5k2TCU0PxCUzQv05ZxTFyNadlrfsgpEBIJJHkaTeuUxtErvO01iEeSaphGX1pGIkF4JFEKGUY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738005711; c=relaxed/simple;
	bh=aAWNI+mDKOBMiU2ylcqk6ai9x3TKCghjCJ2MBTvYpxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ryTR+DN2c+3G2CCr8MaqDJMYKNZ3yt75WkDm9kL5Kpm88yOWb9MfgaDaBKftkeJNeE5qltwdWTACbs1qi1tAoRQ2oj9PvrHGBBk3TuwVShOWGAC6UwUw5s2gtITsnKW+njg50Ews0ITYv1NGA/oGcXOSbJkG2T8LHrQw4X8SCYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqHSRvi6; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqHSRvi6"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3862a921123so3210347f8f.3;
        Mon, 27 Jan 2025 11:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738005707; x=1738610507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yNw9OnOc9yEJnO/vmpScrROeULk4MAFwK1l5JpCMHTk=;
        b=NqHSRvi6U1wkS9G3oMsNNz+hxJRKrgIym5a+We3HEeW511NLYKkyddG46/f52ESehD
         y64f0BPMPKtewxi7aceZPgnJ6KClMoRl6gW2GB75x3eVtCB2TBVaeJw9sAk5hL2BvkXs
         u6vODyaC4XXuJvguEHQbZeiVT9xf8YiAA18J/hlZdBXXnVvdloqtDzyPdvsQQv2uHzqS
         KitAzKgFQjAXgJDuuhSUcyXd9V2V3JnMXHuQ/7MkcGwPO0Jqp+Go9qNQNilUmODwLM4L
         vwhjnmCIo7111dCViDmuzF2LU+HwA9ZGlEpCRPlfF/dvOfrUveJ+2gUngnoi7A8L+Y1K
         ltSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738005707; x=1738610507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yNw9OnOc9yEJnO/vmpScrROeULk4MAFwK1l5JpCMHTk=;
        b=PVcr4bEi1hD5l4KKQGVlGe0CLZTHQ/waSvB3J9SypCMIB8N81fNSXWd5n1TA08WJ3x
         r7SrrMJWnj/u+oFeDibxQGsaGmSjgLIKAo8KajPTsz1Lrvn9p7wVIulRVaJlKBqmPEoR
         4563X9qR3q5Ak1zXzVOX3qj7fEoVLPH4H1Z2eCWzLBNZQDpDeKdb+pBvkQNcjc6noTEX
         La/rBVOWbqjLKpZHqBv9qnFKz9trRpck0KPNUzOhoSiq6WBHWflf++rqnxKxY5emhY7z
         xMZUEsA8Pj1RD89dxyxk5/BefAzmfG/+TJAJQw679LoV0Trid0jGbGlbfBk1asfunrki
         MzGw==
X-Forwarded-Encrypted: i=1; AJvYcCW6HPe98V016oawzeLvEH5n5kmLQIuqWFb3ow4KbWdciJlLf6gqWIP0lWQqkV07xDKY0AtNiEPcmMCb@vger.kernel.org, AJvYcCWQiimM/hmR/+7NqY32eHvItvtW6Wpe/5HbViC/TLza1vb5q/IBkHjoA1D9Ul7v8/sfX0EVCQU99POvBqY=@vger.kernel.org, AJvYcCXgxL3wetZ69HVBajH/lYKuKC9he6HxMoUGxFJf3LfsRzwS6Czro3IQw9AM62UbhZJhn/qlMlUsMgIL+I9U@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0WIy1J7LLEeD/99dAfTbohkvZiiA2r0Z9yha/QRvZ55uQMuPa
	QaS1CYGE5eRm4oFDbt8aedG5ef30pk5WjAeKzqeD36/3Ay9w52I8rLHRUrfmyZ8=
X-Gm-Gg: ASbGnctrqp6Jji4i3Wp2mDzPf8sJQTrqUbSRRCyvRPV1PUKjOZYvKI6h0q9dvOe1o9Z
	4KmOWv3qIZ9N5TINvA5Ry9Q+Bruai/e5ss2SIZzuwCVjVzLMzWy2XBrhbb+69+w7KKdVwEttQfm
	lUiAOFO+50ypDKuE7wGVHrgJpxm8voM6mI8U4PiAv7rjmj76oGrFupPm1jVNnQD8/Zi01eYnazQ
	EEkdE2LUbnk6JfedPdluBX7Ys7V3eu7g5GWsk63KOcLs5T31V8J/fuETnR1sL4u8qt+slrA1TTI
	WojHJL8K2oWTCLP85Nl3YQ/7tmaEZx60hOZEx6Ltm5JgX3n+uvsEJ11w+TXHfBnDp/WEMDZMGkm
	SbcndnprPPIUKFQWMBzc0vkCLjanhiF32WAy48y/QO7duiPNt4CDAOagNHIEZiGjZ8tk7BrTHK9
	dw3WCRVA==
X-Google-Smtp-Source: AGHT+IHZhmTE4brzo3d8hezDVlU7nabOTvbGztXIvOlUBIrKqCqUk8VID9wkgaynPTdEZQKtaNobKQ==
X-Received: by 2002:a5d:5f8c:0:b0:386:3329:6a04 with SMTP id ffacd0b85a97d-38bf57a957cmr49687207f8f.39.1738005707357;
        Mon, 27 Jan 2025 11:21:47 -0800 (PST)
Received: from ?IPV6:2a02:8388:e103:2700:6509:cde7:b0a9:d5b3? (2a02-8388-e103-2700-6509-cde7-b0a9-d5b3.cable.dynamic.v6.surfer.at. [2a02:8388:e103:2700:6509:cde7:b0a9:d5b3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1144f6sm11736713f8f.0.2025.01.27.11.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 11:21:47 -0800 (PST)
Message-ID: <57e08fc1-a319-4778-ba4a-28655f413511@gmail.com>
Date: Mon, 27 Jan 2025 20:21:45 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: hwmon: Add description for sensor HTU31
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jdelvare@suse.com, linux@roeck-us.net, conor+dt@kernel.org,
 robh@kernel.org, christophe.jaillet@wanadoo.fr, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250126144155.430263-1-andrey.lalaev@gmail.com>
 <20250126144155.430263-3-andrey.lalaev@gmail.com>
 <20250127-agate-mouflon-of-promotion-6df8ee@krzk-bin>
Content-Language: en-GB
From: Andrei Lalaev <andrey.lalaev@gmail.com>
In-Reply-To: <20250127-agate-mouflon-of-promotion-6df8ee@krzk-bin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.01.2025 08:07, Krzysztof Kozlowski wrote:
> On Sun, Jan 26, 2025 at 03:40:56PM +0100, Andrei Lalaev wrote:
>> Add trivial binding for HTU31 Temperature and Humidity sensor.
>>
>> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
> 
> Please version your patchsets correctly. `git format-patch -v2` or b4.
> 
> This is not v1 and you could not get my ack on v1.
> 

Oh, my bad, sorry, I manually edited the cover letter and forgot about patches' subjects :/

Should I resend v2 with normal versioning, or would you prefer me to go straight to v3?

Best regards,
Andrei Lalaev
