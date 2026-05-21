Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5037E3FB07E
	for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 18:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779388637; cv=none; b=KpiBt6WKnaxZvKGDCk8nKtkUhn+pqh9IjLtL9Z2IWIxcFdhX7gaG0BJuevCMN1791cYZM4Wz4znLrExbxoqXJbLuGCqUsFXMJTSiCuFTyoxIglVGtET3Ojp7vS+WFSvxfkv0SoJ51LpTQ36dV4Ah+1o5NKUu8VdoOcWggyBr0Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779388637; c=relaxed/simple;
	bh=u/k5DBsWhRW8WGTDF1T2ICyTZCQlu885Sw/0LWDxyNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rWOWUZtIy3FiPqqybHFmwD0cUHxmApcPcH4pFlZGdCmWweuLfbbyz2ZLjwkSfqL5/ZteAJjMqXBCsZiKthkUNNygVS/7s0OTcqnObVagriYJmJ6QqjFAd0NBjktmSQEhHypuZvRMWjkmE1SqtoQFQ9OYnjTk/WewqtQmiQPBsbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kyw5To1X; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kyw5To1X"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so21745205eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 11:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779388624; x=1779993424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GhFybNGI3PZMMt0rrl2vjqxoBgIa01LMGao/5LTtZZ8=;
        b=Kyw5To1X5P4vlqDGLFl7dSTwrRdVjFaAWbaIwBhtsVocw+arhHyQgokj7Q19iHuU+8
         OiEF3wtbPosvhQFP8D5+lBNRETNaHA5MlfyMH4vfBKtYo2kUwebPzCJoOnYZ9iV6KSpN
         07FKoLZb5e35XZEmgjizdNUeAPsWTCmbO3lxCoMUrm7MRmQMiPtMD0RDabuZi2bgxvgw
         gF+7pAEfIZ1vCBgtXB3Sfs7gux8ZUFWGh5ahxFF7qaiXaznggrnHYkRPhLNz1eVVwMtQ
         tO6W5hc3YTfgt1ZyPIKYqZTC1agOq7ZxQxEOjieF1t4BMmpLLHKNJGrJSs2XfU1LhcB7
         lS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779388624; x=1779993424;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GhFybNGI3PZMMt0rrl2vjqxoBgIa01LMGao/5LTtZZ8=;
        b=M1u1SX5kMV7LpAfZ7sqsQ3azQrAxXto92ePaAUBzBlGBPxYWRdBGfScX5Z21CyZFTa
         w8BJmEYJbpjJ357WpiDtS2cHlxQnolQxgPYuTpDF9Jc49AZ4wJHO0aAl2iVnmwvd1fTR
         X7Dw2T/ww5RjWmu4y8ESyuTYMApnw6vvE1q0cVZ/AQJuUSr0/RJtHtlpcNUkBttZUd5o
         kzd3mnZ+OmgpiSRU2RUxzF4xe51wcY7+qN+YlfOWcbB+aB83Ih7PGJdyO19RezUT8nSB
         ywNCTZicgODzqYqmrfSSRtrMHQJrHpx0WfcdbswUsDY0TOiTctO/mMiquOwrqG6INi8h
         NxRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CZLB+77GR7JOjbzbQCFiER7Cq+lZjGqRH8rgY1w4LoM9gGQnGc/ancqYXdymDkWyDtNwxk8DBrMEmrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRX3/Ol4xlXGtwpO9KOhyD4F1K+fBsF2xeFkoXMRWKmXNf9P7m
	fnHpViRivpz2Mk8CAqJ8DCfcsOylTJiLdeiPDYh9Rts+olDECBciGYo2
X-Gm-Gg: Acq92OHvVVzppeBbhTFlgQn2sCG6r7Y6FHTCJmjkSLldfVf/43kb9mM+DQLkjvXu0kD
	kbbDge6f75nJeP4xLNtN6jAmBjuZT+N7OuW2ObpKGLz3MDO9DE6PPjLJkgeHnTp3mBYq40fn1Zs
	e7HboqOzLTc88eoGheF0kG3x1O5ncLwG9jB8YR8FjZTaiEEvzCZyWZmZ9o05TA7sPxlQf2MHEZB
	uAZO4ivpyyJs8HM6FS199/dZF2Z2bD4l/Avcz4559WoZTtKXOvA0Kj/AiLdjgML+uqcz2J2ItIp
	6hKfIiTDHP/c+vIgIL0c3rjqLb4eNgGnhZ3d+a5W1sigVOw3SsclUeuCshoSBMK58E5RaRYlnvo
	sk8ee5C8mTjjDwo1Fz05DlIMX7dRqoopDky5Tb5tWc5zzGbwKoZQJBmeWX7T34HygXqqWcAq2ej
	CD222K7GTXTzKZVveSIgaZ8XlPP6fNZeSfAmRVZHSnAUzZgGm2efooGKqhZovTmcrV1qjMUegeA
	fyGOAFmODo=
X-Received: by 2002:a05:7300:aa8c:b0:2e7:5737:8364 with SMTP id 5a478bee46e88-304490264f3mr202156eec.15.1779388623440;
        Thu, 21 May 2026 11:37:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3044330d414sm1028974eec.12.2026.05.21.11.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 11:37:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <99ec8fc4-e05c-48b8-8c5f-3dcf92d94c0f@roeck-us.net>
Date: Thu, 21 May 2026 11:37:01 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (emc2305) update of_emc2305_match_table
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Frank Li <Frank.Li@nxp.com>, Florin Leotescu <florin.leotescu@nxp.com>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260521180334.19706-1-grandmaster@al2klimov.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260521180334.19706-1-grandmaster@al2klimov.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/26 11:03, Alexander A. Klimov wrote:
> Latter was added with only emc2305, in contrast to emc2305_ids
> which also listed emc2301, emc2302 and emc2303.
> So these three devices couldn't be probed based on device tree contents
> until now. I fixed this.
> 
> Fixes: 882bd6de1a5b ("hwmon: emc2305: Add OF support")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

NACK.

The devicetree files should specify microchip,emc2305 as compatible,
as documented in
Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml.

Upstream devicetree files do that. If downstream devicetree files don't,
they are at fault and will need to be fixed.

Guenter

