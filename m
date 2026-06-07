Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DCC21A453
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jun 2026 22:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780872735; cv=none; b=db4vKMzloATcM9DZwlRzvgJ2GDYCF2/hplxb/zMcVsMr7vJuDk1Loa62mitazjgM099x0+LAwOk3NMkj1QwKvIVudmGwBzpSc4IC3RlvT4pZHv+LP/8bxBgfYjN3WUCaMHdpuTrt7ZD39nOPDErCdBV+NX5d0JDg8JpvqKeg/8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780872735; c=relaxed/simple;
	bh=G0hwanQjIillzN7YvwfYTJyh/E8hBGkxrtuWPWWKAnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZkRJPXJiC2VxWqOo/HRJ+DDkR6pghpEesrvfEmAo8j1aj0uLnl/ttIezXy+Y4TkPZ34oMIKjic2BSP7XZjYn4Rr+hrf2Dscg5xF0pEv51BVMpV3ZzIM6tYipeXwyuZMO4t9zVMO7SzVcVjDtKhrbYRWQ5wXhbZCw3qBqf8Ap+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKk4hhWV; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKk4hhWV"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304c520fe9aso5884393eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 15:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780872733; x=1781477533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VMyoQX7XgJcOZbk3isFK5ARGelYrfSmjOPTA2SAFw7I=;
        b=TKk4hhWVS1zgecjgNvxHLP/5bqvQuKlOUbRjKppCGp4ybvHWu0dufNzRaaYBiiegR2
         ATPLlxWlI73yn8svNpgOvOkdjJKqcoEP0l4/stN9Nahzn1tYj+I9LjGegksLI3skoa+f
         hnAn9IXTOJTONuFnr2gnQjeUGVOr30j1qYkuE0dJamwOK02aoQV+mrAnLC/9/oensI3a
         TSY3qqHqmOUTfzwMtdNvCc0LTCF48fy+JiEmy9GEp+m7z+z+GNdK0Li9cAXglv2MgogM
         nBFuSloAn9m13Epb1N9oHPSnmGcxwaa3lZkxKr1wPycbXoWNqGPyKlsaTsxPcN55zLKi
         Uw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780872733; x=1781477533;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMyoQX7XgJcOZbk3isFK5ARGelYrfSmjOPTA2SAFw7I=;
        b=Tiq8laaj1gak5LA1nacfaOcv6szxXvDVP3EAxDQ3Pung3pGdLzV0TrrB8tKEFTWVff
         om4FWD1HnB0p8kudlqNo8SeUD6OP9wLPMfvqPIaunvAun+0kdw6UW1u6Pcz/yQCeIRYu
         yFUJLsDFDVIJEJqb21v1qi92CkMskdqucy6Z3dGIulivibzKFsjALtdce2GwwxslVNlc
         LmdhvOXfpySvccIS3i+kofget1wGAg77dl+pB1OznMT4+mbOJEW1UXexP7wyXQN70Vcr
         sxbi85ocNZITjcXx1UnNj1nmKS8VlKGPUR9EY7wmmmKmq6aXhre4oPCyuRP8Ya/tf3eH
         dl8g==
X-Gm-Message-State: AOJu0Yw9kPt8shjcLtq9392fRVrXDvXIonIJhlixtaR6v+Kp7PqTsP3S
	J8ccO8cQpRAv0yoXujF3MzHleu4Uba7IF+FUiBpBg2XYEcDm0PuikEVO
X-Gm-Gg: Acq92OGqiSiTGWBp/jp4LpEBIwuOheBxdPtNjw+TM0/LsEK/hYsqS3hVOtgomjZKx5U
	VuAMZdMSMnFpsdnlTvdiqJiJPHWHgYopeNq9Yh7JfiWEf8IorCamE5GxCdjbVAbNeuQl/UiFtrD
	tJDGkULLDKh4owEkC0xQ3bJ5CB+7pkU6CG6yH5o9oJEjNlT4DkVoRbRPmgEiMGFi9XoWhaTwsHz
	laAaPq6oL9u+CgFHEcQ8aoOQ/dsnEa/vuQqPyr5OzsOaeq+Mk2ANE9WvYZ8X/Ww57vgV2JwQSBo
	F/nOxIXvKzwD32c/bHY84seCIGXa8OrxaYCvhOoaKdCIEUWwHpG+NETjCNhaLDWmwwgu10Fr8rO
	Q9Sdo1dhtBdydeXmIKHzVgdd52fHOEnRsT1Od6N7oi/PVVPL3kafCNInrCk9P+mG/cBJRfo4IOv
	Vp8tla0yZf0WjLrZFDLaGqMMeVgUdME4M9Iqq6QKF5IoyJQc10lS9igcUNAWc+PyV8dniVUm/Ys
	+5daB/IDP4=
X-Received: by 2002:a05:7300:4347:b0:304:5bee:f59d with SMTP id 5a478bee46e88-3077b845773mr7295413eec.29.1780872732841;
        Sun, 07 Jun 2026 15:52:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dba9d43sm13803012eec.10.2026.06.07.15.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 15:52:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ee0ea703-4c80-4212-9327-13e8342c10ac@roeck-us.net>
Date: Sun, 7 Jun 2026 15:52:11 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] hwmon: emc1403: Convert to use OF bindings
To: Svyatoslav Ryhel <clamor95@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260603141033.111300-1-clamor95@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260603141033.111300-1-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/3/26 07:10, Svyatoslav Ryhel wrote:
> Document and add OF support to this LM90 compatible thermal sensor
> family.
> 

The chips have similarities to LM90, but they are not "compatible".
Please do not make such claims.

Guenter

> Jonas Schwöbel (1):
>    hwmon: (emc1403) Convert to use OF bindings
> 
> Svyatoslav Ryhel (2):
>    dt-bindings: hwmon: lm90: Document SMSC EMC1402/1403/1404/1428
>    hwmon: (emc1403) Add regulator support
> 
>   .../bindings/hwmon/national,lm90.yaml         | 109 +++++++++++++-----
>   drivers/hwmon/emc1403.c                       |  25 +++-
>   2 files changed, 100 insertions(+), 34 deletions(-)
> 

