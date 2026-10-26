Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025540;
	b=OBNVdbRVk/NYPjms4fMZTxo3bhB+MyDLJhmil6XlFXS25YSDgrm1tgCJ/neyREYV98dc
	 a7l3KlgNcIx8sa/WNuBoes4vFGELdwJsq5FcgcRcPEfD8LZBzJs65vHuTA3uGSQVUexCE
	 Ze00QoEqCmd9MwO2Ln4P9ZEOrbXsjV10PIkTJmDmh79gxF2uTGqvcQ9Lbmeo6xEnAvGDL
	 HrlTyIlyZtujTmzcZmXWVo0VUs495mq9I/qr9VYJhL3TZz8t0MQ+QuKby87+dTJ3tcQvd
	 hA6wJOL/IYSrzbAr358tU5tOfCiLIHFGHdBjeXWdMVl1Tcuz0ozZvN6gpSOFIRFOB+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=KkJn5xzcY7rgiWyxMv2iUeAsVYBZEtEGigL54m7zP2M=;
	b=4/9kn1CyvMIs0S1gEnO1kgtIiEISXWAlnkT0cFgfactSEOIpXkL44wPouAZpTWSzeOiy
	 +hUfT1uJTYK3T+j1Psoi78zHybkw6YPSEXaBDvsP9dVTYfFg/x/Ch42XltCZahbevaCpm
	 e0ZD7bEarFCDJ1vtew+jinsttzvVXavtSCBaRybPabZinr7VKAPO3zVxNXGuqQDpou3nO
	 WatxwCVOfW2lF3EFF562cxhrkoDCMAUbjyqxZt/eDP2xJ9qcWlZ1TqmPV2vCL9P2c6Mw1
	 C/wsYoIhUK6/H/xw6dmotII1B10vLX76UeIiGe6to/LIFowcT/jU1LgEGyoAZRl2zPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mdEAXxm8;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF24606A31D
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 14:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF24606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mdEAXxm8
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc758830601so1894181a12.2
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793025540; x=1793630340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkJn5xzcY7rgiWyxMv2iUeAsVYBZEtEGigL54m7zP2M=;
        b=mdEAXxm8sTczLp4+up+wnrXYdOEguu8EpCNJ5V9XE5/0t+hOluDo/npVKi8fjIKsgG
         EQun98mk+XY3eWnB/MXILvSyWUnSxoltrFC8ZqcOsk9FIi4ZPoxtZ4zPOA18DjhtVrVQ
         xVADeLZhdq6dZkZGWFvQTJ+Ty28RRMiprfEaOhBVlKxfgCTozPWMu9/F+ZMvMUurt9+N
         DIUU5dTNBAOjrau+r/Qit7AT0utbaVdJdKXDUHuFJ0AaXmVlquoOZLPjcEdD4Zepiqrc
         fHA6K/mx+auCAufTeyvfMHaqzn9+svED8NUREDfSL+ennjr0prRFn9cvfybjf1Q1npBu
         LmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025540; x=1793630340;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KkJn5xzcY7rgiWyxMv2iUeAsVYBZEtEGigL54m7zP2M=;
        b=ligJSawH2lVJyAquKA55JZPfW/LJJxr0eBMoiqpuhsqncRoQtliljpxvF7Ji+43TRS
         XWFHRgb3z78ymE7L9Q2GcdlYGuTcYvJip2kU6xA/YlY4yBC1/ldRnQ8G8CR99BKRk/st
         shdzO9fiQkHUXGMjlrQhRhta4zKPA4qeHvufmaRxDBThSBv1ewbBkGNwhNioBgEklI2f
         PejHOauAnO7NCm0EN6ixyeMxRtPTetoEdOigL6R72qSrS3Ep3d6clC/IyDxZUlNJRwFY
         fdfnDq0N0mD7IgX7c53SeuepIz9+BbqykwbBDqwEmDBl8BTq0rnorEAGTx0up3JsaSyE
         q9BA==
X-Forwarded-Encrypted: i=1; AKwUvBy4IGvmC1JH3QRAg65Lq39mgvmwdfoiUFo7dIbMFbQZ5o41X5T/eP0cNl8EgXL6jvY2Be7W34q19pu+Rw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIil+a3LLPzQhJ3837sMW3XlwCiUnoZTyK9mfGaadmlPz9JsdHa
	9sNRiKpgsf7gE3qllwBuTjEgTRi8y1qxCrwPLNChxQ2HJEMrL5RTGZ7R
X-Gm-Gg: AYBFou1T2ZAm2IBiwoH0gI2XH77qL1b+c+YL/tk7HHHsbPMxyKf9ysGVnvAyoWXSrqK
	gGTOKjH4094HUh5JmD8Vmg28Ky5nbwQHBPHo8SkJYDvWztG/sLd8TUY/6rnWg/nNiox2bkClLZp
	x4ObUyD2ORxW4f22ibyfY1PJO0fSt23HqI3LpcgwTXFor+mCXUGHrunaeyQesUUp+7O2aUTGO/x
	w3zpReMfYBrq5RP8mfLE9/oRd+kEAFZS2H8o9wEJyPsM+i9GOFULpN5pg/Qq1qF/393gpUhcGma
	VUllapRhqEj0sPcoqM0K9MnQlSc2MJNqi0zqNTC0g3D4uZm5w7SpV3Uy0R+32H8CvyY9JjqwZvX
	k4NCGAr077L9/9nouLh8bZWZLfhixegbo39ayaUCpOhdAui01bAhTyLb+JcDCDtHo94Swy6epre
	+p9oh2q2U3MS+Yxgfvt8dwz6dvTJsZxcYtNkisS79BH2rgxWJvdZXpP3LRYoc6lfUSD+JagZZ2U
	YcW+LPgkYb5l3JCmXunLW8i85Zvmi2j/DdOUJmP3Ex1limZ05qy3nK8uUn1unILfzTaVGWDEVvl
	mSgXpStIRpRTnMNdIavDigfDuUZzNr6jSY8PhcOeiVNoW9wshi8=
X-Received: by 2002:a05:6a20:3ca3:b0:3e2:8c83:6824 with SMTP id adf61e73a8af0-3e7b0701c44mr6042430637.10.1793025539607;
        Mon, 26 Oct 2026 07:38:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a37695ab9dsm1280749b3a.26.2026.10.26.07.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:38:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1af09bc3-b9b0-4fc5-98ee-417e5ffd0aea@roeck-us.net>
Date: Mon, 26 Oct 2026 07:38:57 -0700
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: hwmon: jedec,jc42: add
 #thermal-sensor-cells
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261001-for-upstream-dt-jc42-thermal-sensor-cells-v2-1-6edd30b082f3@free.fr>
 <atCP74Clfba-EKpR@L30177.local>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <atCP74Clfba-EKpR@L30177.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/26 01:33, Vincent Jardin wrote:
> Hi Guenter,
> 
> It is a gentle ping for this patch:
>    https://lore.kernel.org/all/20261001-for-upstream-dt-jc42-thermal-sensor-cells-v2-1-6edd30b082f3@free.fr/
>    https://patchwork.kernel.org/project/linux-hwmon/patch/20261001-for-upstream-dt-jc42-thermal-sensor-cells-v2-1-6edd30b082f3@free.fr/
> 
> It has Krzysztof's Reviewed-by. Could you take it into hwmon-next for v7.4 ?
> 
First, I was on vacation, then I ended up in a hospital for a couple
of days. Things happen. No, this is not going to make it into 7.4.

Guenter

