Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4310D3382C8
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 12:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354071; cv=none; b=ACUsjhc7Ad+zAuP1LF9lJOPVS+G5PurZvF8E8xWKs3emgxPIeztM/8rAGrTeGwYQ+8CHLLAHLyfei5S81LW2e6hjKxMpBc96RZ2HpCjUDE+sewvnzfq299abi+ZwIMpS+pWEl17chDVz/usezDOPMGiguHIiT/tzp/90ryI6+UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354071; c=relaxed/simple;
	bh=EHL8E+Jx89ou6n08IDPBdu6NV+0S9S5LQYQ5JG0FpmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZcuuvUv0z6k1BF2dAjlFZeqEBo7FS+3PadiEhL3m+xDA59/nnrlLWjafFviIzlQ9eZdGjP460YK9JXhfjFAg5k8aFUkAkkm6mCNPVAif1WJwkvgXqIpPnfV8cjSLecxL2mut7SbaCenM0JLTZAMBjxirbv89p0WikUx/f4S1AOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaaoS0Ue; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaaoS0Ue"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b4520f6b32so1384785eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 05:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774354066; x=1774958866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1/rsn/lXVCc3yikp+gMBEl35mfBKkCjw13MbKLj88B4=;
        b=KaaoS0Ue95T2p/4ysIiEQy5z41TCPLP1S/KAXXZ+iFbCQmitNZoLXKFG9H35d6L6az
         P7WGpfZ2INnG3NAGIm1pBjUyO/aSSTF1Oj/BfpZfppiCEIQ4Mserh9OZLWyTiZ3n9FFU
         OuSorKs60HR3fviKueZQ0uUy6mXH3Ql3rW3iQgMDU3a0cUf7y48/1C5x8sFkBXR1VNBq
         nNxeorJ1rE8QxlCfOUIFJ2buKLH+shbdKRVtVMnBn+0eis3fJpxa/r+dNltNh1f8QDmx
         uNHd5Qmvn7owvnm4ZPNLPdrSXayO3OTq1oIYzNZTRasMfvvKlnZM1MgiUwXXs0XSqEqL
         e0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354066; x=1774958866;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/rsn/lXVCc3yikp+gMBEl35mfBKkCjw13MbKLj88B4=;
        b=gRP5jK4GUs6y4kLt44EXP61/6hLTTua9XTuxHwUk/NVSFJCcmqU1PASqccykQZP/WE
         3kAaCi9CHcugcb5QmppMaEQyJYK2NhRMJTpCqTOlJa/wmRpf13LTYERoRhDLWfpn4YLR
         XGJnw3DE5JBp2G3eaP3hYuy8a6Cm7ghamjdtpW3rYNvjQlazcUCPWY2raXd9FjS5Md1j
         Ootahw3ksfbqm36kVgxtIZIpNSwKk+dCH89uMLhCHSzth4UTX4mhcBexM3hbHXoZzpsQ
         hwmkVEE61C6eCbY3BXOKQjuoL5KWcN+SB5ZjvRExZx62HigAMBJIBnvjMWkcp2e3FyVk
         y9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCX+H653TWSzzxcB03HgPEEiLhQPSt6VVeEldsqvrZHrkrEUjxtlk2L4+IQwxpb0RvevAFvXpTb+SLHNqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrMo/+4vSQYJMUGx8rt176nDd3i/7VCf07RmhnShVcqUBqLyVg
	loQ7zewcDZvqSV1nxj2LH6vVngp2nZXRZMvjGex+fZ54imDw7yxaDie3
X-Gm-Gg: ATEYQzyEyfdGgrIr4JTDNNlWSLDBaDk7ytanxEK280v6CbjZIUZql16WKlrwfjwxQ4r
	bqI4e0Hw7CjS9pZ0YF6RZ7en7OtDF+GDKSS06bcM/93T4WFwZ45O+myT5Nk4oRijLlVfnfxXHV3
	0l20O8oLWAm4WBJ0JOqpoV1tWzbTp6WHZkPmFKr71hAdAcJCsuPDU6/0GImsvVqQW1ZRvogwtGt
	9X+1oKsgCI+Rzt6YttXXwba3gQYwIGoqxhDtqz+JwuPHNJQiKgyn8z9EqVJKel+H0903N2fmyMM
	5aZ1eR/7UgJK8oDKbawm9KIdXiDz4MQidyX0ZCdZkiExgDECcv7e/idI1DRQhH59gfn/scEtLS8
	YKuBmqHhhWQvSE7ksr2q2l258Wm7y4pepAKG0nfmiOvwzbokF5bzeBp7HHMcPZ/LAvUAy+KL69U
	NZ/m22WBdxlnwu/wEslvsw+dlK2Ut/k47VPNGdObAlGIWFSixPSUOYx/yKpbtC5xy6m+5NwkuO
X-Received: by 2002:a05:7301:e30:b0:2be:969:75f3 with SMTP id 5a478bee46e88-2c1097ae086mr6341785eec.34.1774354065661;
        Tue, 24 Mar 2026 05:07:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17d1ddsm14898035eec.11.2026.03.24.05.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:07:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <61770780-add7-4ee7-8139-1f8dcf9d189c@roeck-us.net>
Date: Tue, 24 Mar 2026 05:07:41 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: Add support for NXP P3T1084UK
 temperature sensor
To: Anshika Gupta <guptaanshika.ag@gmail.com>, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: lakshaypiplani77@gmail.com
References: <20260323162252.15508-1-guptaanshika.ag@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260323162252.15508-1-guptaanshika.ag@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/23/26 09:22, Anshika Gupta wrote:
> The P3T1084UK is an NXP digital temperature sensor compatible with the
> Texas Instruments TMP108 register and protocol specification. This patch
> extends the existing DT binding for "ti,tmp108" to document the
> compatible string for P3T1084UK so that the hwmon TMP108 driver can
> bind to this device.
> 
> Signed-off-by: Lakshay Piplani <lakshaypiplani77@gmail.com>
> Signed-off-by: Anshika Gupta <guptaanshika.ag@gmail.com>
> ---
>   Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
> index 9f6c9f6fa561..47714df5aaff 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
> @@ -4,20 +4,21 @@
>   $id: http://devicetree.org/schemas/hwmon/ti,tmp108.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
> -title: TMP108/P3T1035/P3T1085/P3T2030 temperature sensor
> +title: TMP108/P3T1035/P3T1084/P3T1085/P3T2030 temperature sensor
>   
>   maintainers:
>     - Krzysztof Kozlowski <krzk@kernel.org>
>   
>   description: |
> -  The TMP108 or NXP P3T Family (P3T1035, P3T1085 and P3T2030) is a digital-
> +  The TMP108 or NXP P3T Family (P3T1035, P3T1084, P3T1085 and P3T2030) is a digital-
>     output temperature sensor with a dynamically-programmable limit window,
>     and under- and over-temperature alert functions.
>   
> -  NXP P3T Family (P3T1035, P3T1085 and P3T2030) supports I3C.
> +  NXP P3T Family (P3T1035, P3T1084, P3T1085 and P3T2030) supports I3C.
>   
>     Datasheets:
>       https://www.ti.com/product/TMP108
> +    https://www.nxp.com/docs/en/data-sheet/P3T1084UK.pdf
>       https://www.nxp.com/docs/en/data-sheet/P3T1085UK.pdf
>       https://www.nxp.com/docs/en/data-sheet/P3T1035XUK_P3T2030XUK.pdf
>   
> @@ -28,6 +29,7 @@ properties:
>             - const: nxp,p3t2030
>             - const: nxp,p3t1035
>         - const: nxp,p3t1035
> +      - const: nxp,p3t1084

Indentation seems off here.

Should nxp,p3t1084 be listed as compatible to nxp,p3t1085 instead of
requiring a code change, similar to nxp,p3t2030 and nxp,p3t1035 ?
Unless I am missing something, both use the same I3C device provisional
ID, so I assume they are register compatible.

Thanks,
Guenter

>         - const: nxp,p3t1085
>         - const: ti,tmp108
>   

