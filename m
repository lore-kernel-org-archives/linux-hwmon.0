Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE5130EF84
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 17:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855250; cv=none; b=Ru4yxBEvb9XJAtFKBhCIhkVQetdmcPn3n3YiO7K7oJnlqfmugXUEPvZeZR1QzMIo8J4UMhzDcCfi8XqCDiCyAcnA0obC5pe5yW8cXXTe/4HVie48AlalOUuDQVF2ubJlRYsvJbafKV8v0CIE3YWNfmKraYS2hWOkPnGz76uYupI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855250; c=relaxed/simple;
	bh=8VMNYnpVHaNRAEX/drpWt4PsdIMVh+ZoUPG/IH5ILAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SXFJIP0b7zSx2jthRakBN6kahVe3Y5Daa17ZUTsF6xAV5T4bpeQrUgkQCUgh+gS1sl0BLcrvMrHzhVyi7+hneyb2efHjeqroA0K+aUFCEGMVFJsoalsG0vDK2Rna94Eui/SeE5D7Evhz6jlDDZ/FAJk0IgiTsrlL4L/TzfCucKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiIZSNhe; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiIZSNhe"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-359fea895b5so146675a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 10:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773855246; x=1774460046; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EPgwoRrC7+QQkTKwjUbOhwycwkaqrufAa2TwHnGOJoA=;
        b=YiIZSNhecEvRGOqutfd9hM/EMlmogo28LF58oXP44nK5gmxn0S2ySfMpb7uxnnl6Rp
         Z6ldG5iB1G46L0rUkLDrL0QBD+BlyKCii4Hk47qrPwM+pOtkuH1GZ3d7eXiPKnTiyyBq
         90w6X68RLfAe3UM4omy2A+S/ORYTGM/NUd8xvvheOn0MYS4ZV3tUnx8n0PPsfqy1Gmef
         F6atxGYCdGu4ODuJQqWWY4AFy7zmo8+S4K90ecGCt/6kjHnJ+rgs60UAA9NjA2iQk6V3
         RzG7n/zadIJnBcg4TuOSjxU7TeysX9TwSSmXUJB+0clQE8k8sK0FwQjXhWukAgdAFogS
         DR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773855246; x=1774460046;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPgwoRrC7+QQkTKwjUbOhwycwkaqrufAa2TwHnGOJoA=;
        b=LrfMu0Qfl5pRn2FJgAnG+cYiGc6CKdVMmEU0XxNitz7NSLLip3JRlgj+9pZ/bOQwZP
         npa1NBS5llI58VO1k/ilEes0uxgD5L8Ox8nERQEP7ZhO2u41WOQ+lVHs993qPBgEnhXg
         FWNumDmzqLxAZn4Bk/f5Cwuwa1SV4R9fy4IxyXacnBcORRQivc1s/1KKNhaV2piIkDbh
         XvrQ39a+dLcxPda88JLhQLJ96Sh/86yDqrYVQplPJUuLczb042hTXTRHxFNe2hSGyaB8
         8fRyF+GqtLDY++ql8CJWPgybYcgdV4oRT+ifaX21oxuCeEcsp00iyH+Wr5mpOn986OWc
         yaeQ==
X-Gm-Message-State: AOJu0YxQWggXL78gwEnVdIU2/g4OrC/2Ihq/sJ/uF9COgMjDesEBTaF1
	KoPSXulVPPoHZ9O9bmAQwQVUKA4Nu+jDp80T9048I5XKdpl3deKn+e/T
X-Gm-Gg: ATEYQzykFNSCxznKknuHI4FD2+05NJufZstnp7aD6bzlS1LdkmtJAjPy+Wf1bOBGi4F
	b7Me8HTuDhpWHdpjn9sefqm2wxzkYEb0r72HDGDsRd6UawXSylJRjqfNxnIKrF0mJUy9lnhIDgj
	qUyGPuQco+/jAjoXpb4UUqEdqX5dGt7eTAFQI6kEpRpct5eEn4w8+ulTn/J/24UrcyYjR9bEG0L
	/3HTOwlEuLFRuy6MRDBXV1LndTevskUiZC98wlaSfZwbSmWyA1savY1FlYmPyZqTcJp9aJdNTFk
	emQVpvJZHhLw0RPLJtePX4ZpJCJ/p/TS7SU+vFhZ0+IwBRs7M1Qohea5s5Ntd6DvWnizVh+YfNC
	CJI/X06m53owL+Q18gDv6UetxlbPKQdJZXX+hl6G2SWg2VS4BSpRJZS/p+Evn16aNEhoALbXDyo
	ULu0RgY/gvtSzw/vpiz1cg1B2lB7S38xUdY4U9yyzJ91JXta2fnn3p3caTh8C7ZFmP6zTLBRc5
X-Received: by 2002:a17:90b:2781:b0:35b:99f8:966d with SMTP id 98e67ed59e1d1-35bb9f0f790mr3715953a91.24.1773855245704;
        Wed, 18 Mar 2026 10:34:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bbae5e139sm1034514a91.8.2026.03.18.10.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 10:34:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3b9a3b0e-9a52-462b-853e-3f557a422879@roeck-us.net>
Date: Wed, 18 Mar 2026 10:34:03 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: mpq8785: add mpm3695-20
 and mpm3690s-15 support
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, paweldembicki@gmail.com,
 carl.lee@amd.com, ythsu0511@gmail.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wyx137120466@gmail.com
References: <20260318094635.1873-1-Yuxi.Wang@monolithicpower.com>
 <0111019d00581351-82f8e649-34b4-4f57-b08c-cebf9d486454-000000@us-west-1.amazonses.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <0111019d00581351-82f8e649-34b4-4f57-b08c-cebf9d486454-000000@us-west-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/26 02:47, Yuxi Wang wrote:
> Add device type support for mpm3695-20 and mpm3690s-15.
> 
> Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
> ---
>   Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> index 90970a0433e9..86e979cf0a00 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> @@ -19,6 +19,8 @@ properties:
>         - mps,mpm3695-25
>         - mps,mpm82504
>         - mps,mpq8785
> +      - mps,mpm3695-20

Alphabetic order, please.

We already have mps,mpm3695 and mps,mpm3695-25. The -20 model is covered by
mps,mpm3695, and a separate entry should therefore not be needed.

> +      - mps,mpm3690s-15

Unless there are other differences, that seems to be register compatible
to mps,mpm3695 and should therefore also not need a separate property entry.
It should instead be listed as compatible to mps,mpm3695.

Thanks,
Guenter

