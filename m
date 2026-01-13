Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E083F3806D5
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 15:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768317014; cv=none; b=QUc2HZdCRsHMZG5q2vfrT1urJzOB8Ly24S55792/0tTiDmq+DfhnKwwGjUfafBn+x7+dZbViovfjon4bmqbkloNsV9v/wUr5K4xPPdBSCT7ugYsAh+KshJRsae5oXSJg+on7vZLbDQ6Km9eiW5i7pQr2ebqJf+M8n7uSVndiWt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768317014; c=relaxed/simple;
	bh=Gxb3l2ZkVTN8/AW+TlsPGmW4d4paIYYrU+ykzKv31xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ik0QWL73P3eGIANw/rYNQEujAZtQrkr181y7JBx3m2UZZXFEW8BHG9JVll1epY9FugTXowQSfXNvemAU0o/Dmg7fF3qrZoSR+QHQ5LzXntt0sq9/DthtyT5FQ2JvnJv6pHIG15NnxapclIGgB/vM79FiOM2lZAFZ+cWQTjp40Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BP389UcA; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BP389UcA"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b04a410f42so6648309eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 07:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768317007; x=1768921807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tsl7cqadgB0ILyuJ5pleT6+lRwkh2wBTJUg/m3d1c4U=;
        b=BP389UcAySGw8CojUXWpYT0ugKU8kcOw8Ry293mBVkM9l+B5darYDR/fXN3YoG2e8s
         fScPzbpax3TidGuVvrWlnYj53fhLrCDG6X0/5iwHBiHdUKkZYLFqZ8x5xBDih6+EiIfp
         0RfBwqpFsqVgCggxO53+3dHwVp8zdwXC3jY1lA+zTwbSFUFg9TPK8oNmouEqyUO+Ei+J
         Xh8IrZPuvXdVWKcza88WAU/H20D5HDptR7Tua2pbQUxOA/ED2ylophfhiktlM+XsyjFq
         nRs24hylYsMWUv5R1Q75nmMPKAFrIA08rt4ILKvkGCdvuWjrGXwA/DsbgVDOgjlriSaj
         0s5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768317007; x=1768921807;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsl7cqadgB0ILyuJ5pleT6+lRwkh2wBTJUg/m3d1c4U=;
        b=T2dsRIdIhZOzTatqm0uEXac4+EObsC1q9CWuKUWBoKnYigAONRhCZ9vl+5me9OCP2t
         cDfVT4LhuusJuh1skki+iSOuHzGLHySXjGSD/I6gar1Sp8CuXFtheV3393EKktbhfsRz
         31vAOKPbUN03VDd2XYoiMje7B5J5SOBy0nuHIQqDgibC1qGFpBggVWGEX/7gLuz5EPwN
         8+hPilN1FGejTgoLSCv/iTTzpx4a4txOXdf8ltp5aYHLPHwt1tFpdfV2P37YspyolHnf
         I+mGLNQNLmkxH6hVGgfPciogHivs8B+48S0C9bP4YbqAk4yfnOZoeZplwVn4VIn2s/m1
         Ebwg==
X-Forwarded-Encrypted: i=1; AJvYcCU1ZbM9AMPhBw/88hs4IcTyuH2BIndFtlbhZPsNFGlfFuj79iF9owgM8vfAXIgMzQfBnv1Q4ZxJprj1Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTqIfHZIoy8ROeCwH22+epqTUiAziAzeb5Ktgdljk2mJ6cX0Dp
	QTWv2NcBeTWgyS3lfkQrmfa50pgEToCuhxX7nQnc1nQX4yqD3yD/gHrl
X-Gm-Gg: AY/fxX5VAMROOqTgduGGs/QHI9U25gvqgohy2o0kLmk+L0Vlk8p3iIi02wc54Zo+Za3
	ZLd57wG8MMDYly0c4rPYOiwa18XrJsYvGY6T2/A4htTntzW7RFqVkL8mh58XNcVIQeJFUsOXBHN
	9mvBfi84vWgQXz8CC481yHlgCJt9JpjnRBKXXgaGhJuOGcSrJIiKV7GcCwQfQtdw2yFMplVO6Px
	FhrPWwvXcq76rju8XeXZIzoV7mz4IDhKUXN3r8Qzw/QDuDECThg8Yh5aNGaJoIBn3on2Is26rka
	JkxqpYdsJKh37FdCUGDFkNX1AdVZLAHzVwdaI5oRFM5eHOhScv9QxmjIFQJglllxeS3P0AYR6YS
	n9fKc0rrtG6F7gz7e2u9DvN2RHKQocRA+gVyiFYdIZzA9F8RND/Wnal0AnjmZ9Yj0SiQyT06zND
	oG8zuL/HuH9RfBGAtFs+0T2qQ9d8CwZ7SzwoJrixEO40UrKinJgzetgzb18PPy
X-Google-Smtp-Source: AGHT+IHDyD5oG2uXUZIVEGCqh29+M+KMR34zeyrN9l/9A7q54mG4sz3mCfwqFTvAWjK975OSjaMbCw==
X-Received: by 2002:a05:7301:1e8f:b0:2ae:5d3b:e1c6 with SMTP id 5a478bee46e88-2b17d31c5a3mr26669210eec.21.1768317006674;
        Tue, 13 Jan 2026 07:10:06 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706a6386sm17950034eec.14.2026.01.13.07.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 07:10:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f0d230be-676b-47b9-9565-22319b8e62cc@roeck-us.net>
Date: Tue, 13 Jan 2026 07:10:04 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hwmon:(pmbus/tda38740a) TDA38740A Voltage
 Regulator Driver
To: ashish yadav <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ASHISH YADAV <Ashish.Yadav@infineon.com>
References: <20260107144507.46491-1-Ashish.Yadav@infineon.com>
 <03da3b10-dfe9-466a-9dc9-b51e29938e3e@roeck-us.net>
 <CAJKbuCYcRMrX5H5rWXWXOz4FCZi5iu8CCE2Oi3WEsWqEikqsYg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJKbuCYcRMrX5H5rWXWXOz4FCZi5iu8CCE2Oi3WEsWqEikqsYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/26 23:24, ashish yadav wrote:

>> The need for this, especially why it would only be needed for PMBUS_READ_VOUT
>> but not for any other VOUT related commands, is still insufficiently explained
>> (and I failed to understand the rationale provided earlier).
>>
> 
> It is specifically needed for READ_VOUT as it is being used by
> external controller to monitor the rail health.
> Other Vout related parameters are used internally in the IC to for
> output voltage related protections and does not impact any external
> decision making.
> 

Sorry, that doesn't really make sense. How would the chip know to match
VOUT with its VOUT limits if both don't use the same scale ?

Guenter

