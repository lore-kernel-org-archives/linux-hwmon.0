Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21833D5660
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 22:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302335; cv=none; b=oX3vOy30NU6WhMYLt2tnywrlro8aybEMXHMbYnWUfi8IVxFSvh0Bs/+EkL3LHuggSDOYDVN2tMwRO9y+pVYsbJbtrU0s/Lg/RD9cqXOTqNYPM6rEsxM+L1HP14vXzFS5XkC2ayuSKMso8uZ1rgv40gaFrTkJc0EeiRsBc0wBiRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302335; c=relaxed/simple;
	bh=4x/0XseeDjvJa6YugPIA5WIWLzXeYXN51PeDC+hhwnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t0RZJd2n9ZmHIeSHUyrTOoWhfvm9Sy4WrJ3zD8kLij61YpOyMjQy/P4hUzYNRIGQilkXH1XfnNjZyphypm9xUBuSjs07O3ltXNQfhQHpyS/K0Mc1VTh6W8/N3C8k6/oI1bEYl1fXNnt33RbgtyBNmREDCLrKRAnQsxhsG5y4D0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3Si/ddR; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3Si/ddR"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so521566a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 15:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788302333; x=1788907133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B8BquFNcVW0STtY5GXcO9BwLTcWYfKj9vChUh9QODYI=;
        b=o3Si/ddR8e2/qMcNVylVPbfO6Aq9ZVNQWllVYENxKdV5yk+zcpkSJ4wLKT1cB+l/1C
         kZLJ66nsOPJRuJHSB/g3hsmSeHRSRfOPBOx+F9v3KyhP3VYqqgxxHAy5IFmqDf59tA8R
         CeH6Rf+i3e4TjQlfWOF1MR579rZhqAZtXLTLFFbNIxysrHi/XxM5uthmtAgrkuuXkn/Q
         NjBmsdIW6A/IRk08UOtt9xRkYaGZT4TFhpGyeUR6eu/XHJtS1amLrky/T7r8D+V0nF1S
         /0kkWLr+YWG7sf/Eog5DkdDc9ZkEj74kuCFRpQ7j4LRv/m1M1pHQbdyV5wMCFvQRjLFz
         a63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788302333; x=1788907133;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B8BquFNcVW0STtY5GXcO9BwLTcWYfKj9vChUh9QODYI=;
        b=p703UyCcRTH2B3lbS5fiKxrvUDSGiCEx4kHGu6Rcbv9gVz0BHFirTymgTgPKg7PMd1
         R8PdD3tN0nFVmokgtantvMT0hMHLMw6voq1Cn5YpnRkiKFXbhib5ytHAkbQy7U9mBjQE
         aZ6VYNGHLPZAbpRkbulwYUzSLKYV5BrOCy5JaO2noTZaqoiFG13FeI9QKbmt+it7mXA4
         iFENbFS9k+EUjDpPUcGQScdcJdjQyn8nCW5l2auNKDSd6YOu2KO9CQ+6651k6nfCGVz6
         gcfFltxxPyyy3s2tnVQzY9S9z4r4N4tPp4ZtJjO90l8+RfMHV1ElvH/aHef3yIvqSe+l
         AGhw==
X-Forwarded-Encrypted: i=1; AKwUvBzrMyXGfkC1MVZ8i1plhh3E02rHo4MzkE4MbDN9HcOAH8pquVzBEW3RmiKawhbvAb2Cqinjx7ctST9ybw==@vger.kernel.org
X-Gm-Message-State: AFuF++lUOoLKJAu4Uo5XOiqyRsgqW6IM7GYTyZxrRI43+qmH7YS1jcmf
	QQWzTh4GxWzQxrlxyok9htgdonF6R32fVmFELHhr3c6ckvFW6jf9WKX8Skkm2w==
X-Gm-Gg: AYBFou3/N8KvuWDLqP8/Sv8+gUONfNgQ9MfTMBKlxKyEmoFrIUa9xCn0vH8l7sapTyg
	b84d9bSIfXeDE89YvB82F8VHmA3vPEJf1eo0wA4r23Xj/n5d+Qvd4837GkzHQCAMN2FPpofLBTs
	t1e/X8rIMVLDyALaQu/dY9tGk0vCZ44sk8YhFnrCqecEa7XcFvSv3tw70jlgd8ev5cFjn9/qqc0
	f318PZFptfSJjkfSdjFlR64cr1d5WlolbtWULvgVs54KB5C/Vq3sHtFLSfS4j3eBuhMt3se7fqG
	ckbUpSBSPdCZPH3N04j7CdHUQxh4jK/PQIDXKDHUbOTC7yraBbG414BWs+8vJNz3CuCoLmZaz68
	5qZwQnz3TTauK3F7Uy9w1A0K+HUfLFh0g8Pjm78ligZLFf2QIf4Q1lWzLPe2Mat5stoFgS1hJJX
	edEEhCgKPupBIE2aeeCSW6kmCqJcpYIRayVFCD5ycGH4OLr8mz8WYQi/D+GwkKytrdBbHzRhZtp
	Yh26+rVxrJ57k1rwUropz1PQK+HW1uBpqtPaA==
X-Received: by 2002:a17:90b:4a46:b0:399:ea1:5a82 with SMTP id 98e67ed59e1d1-39aedf7cc37mr329614a91.3.1788302332928;
        Tue, 01 Sep 2026 15:38:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430e8c6fcbsm2144123c88.0.2026.09.01.15.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 15:38:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ec4046e7-c6d8-4a51-8131-e1553a0cf7ba@roeck-us.net>
Date: Tue, 1 Sep 2026 15:38:51 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: hwmon: tmp102: move ti,tmp103 to enum
 from items
To: Frank.Li@oss.nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
References: <20260901222249.1194299-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260901222249.1194299-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 15:22, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Fix patch merge error. ti,tmp103 should be after ti,tmp102 in enum, instead
> of in items.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Please check the latest version of the file in the hwmon-next branch.
This _should_ be correct now, unless I got it wrong again.

Thanks,
Guenter

