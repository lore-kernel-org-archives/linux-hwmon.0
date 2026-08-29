Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A272E06EF
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 22:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788044027; cv=none; b=m3mNSRex8r3pK4LhjdwtYwPUhGfKQFdHZXYvk5KmUjChT1zHipgJffgCgvP9bYRomhGg/mXp6eg2xvXRt+aR3KCZeDpyN6jSJ1NdvZ9XcphOTs9EgKO+ins/V3eNrKVuRT47BVr8U0oKoVt04rNdOKUDkIqfkJmKbv6qdMXs29U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788044027; c=relaxed/simple;
	bh=Rr4mSBGBvGX0QbXr2L5+EDnEgG29sZxC3b0kFtQVt9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvE3tFwx9RvgRmEukJWQzSzgpWvj4fajeLQqaAPiR2yfCeg++bpK6xp857iDi58EhCdVPlZiqpMzWa7AVuZVZ7x9k7xxQUnY36xEjHMLG9Y3rJIB6kUhXcHy9nfSdDoCssTIvmag0PWciXFVPNg/G9p2cWMfbLYnp7XEcBT7BV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npmWP2Oi; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npmWP2Oi"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1c9879395so1711785a12.1
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 15:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788044025; x=1788648825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KW4iBdA+4j7FJTuj2eFXoHZSyVIpp/GuRTvkTOZhPao=;
        b=npmWP2OiFBQI8GCMgViwvddgDTx9vQNtqVwL+cZVRo3MacN6PStCbcnZeH5cHt71wZ
         uVI4HhwstoNXjPro3/d7j+ZCQJfk1oiZlM40+mB3zGhbp6ZenSWu5DODjtqSIgsKp43G
         j9M487NGpcvokr2pj+epwn4omELq+VhVQprEAb1YBnTrOiRfdmhZ/Ez1GfuwGv4rTVRd
         KZH7/ZcGuhTxs4gWIWIvNZvsIq3lV6Q0N5COZ4a9sMSCpBOVzcXo20+sY92jVuy79j8t
         IqnZtuxfNvLZt6lvMrUyaFhJuilCACGSMtUIcNMx+xmIS5LNW86GelETUKLzHiy/xLGr
         3zCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788044025; x=1788648825;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KW4iBdA+4j7FJTuj2eFXoHZSyVIpp/GuRTvkTOZhPao=;
        b=pVcx99DDIkus4Gw0CcbWkGUS4FMqzYGWALJGrFAkQKb0K67CnpmJcPRpzhwbJW03+X
         SWr0wKNjscZGm++J0hbj3PcydBv6VtVwvxSrSto9rp6/o6yQ+QwTdCJ/Li0hi2ENgG1/
         +Cm2vpqGyFafbx6Njlw8Pk6ohLCk/l1M9DH5zyierdKYkvXYp54T3RWxFP1KY3E7xzZ8
         YwhBvVSK7JGRXTfTNXzj/kqBmB8NAFf8rkvYxu8y5UbxpJkDOt2Kkz5YWSWKmZK9de7a
         ZQjxvA3fXoVlmtBDdAxsm1iy6MQGmcWeySpjZ+Lg9qpBAuE7d5UuHbpZsopiXfXpbh//
         P+aw==
X-Gm-Message-State: AFuF++kZXY0c+2MToyDTY9L9eQ//hSl06wXT5hvVgE6gn+inrepMlL0n
	PtlvII/n56EGGkl4kX30Em/B6ipMtLK17sQcH2hcRspKae+EVRVeGg/+
X-Gm-Gg: AR+sD12FSwSlWJJIzYSk+dCbE8V/jYnPSGV2cmFdeo2BczG+swbwclZkx38JZmxw428
	SKLeDIQk7JZ54fL+FQKkV9NyhANedOhSKnpkzjomofzJ+QULyk9flFzjAZTK3IP2hthxnVcsP2V
	0PME5vprshF6alXoD8/glAP3TfBHkff8ClUkgb1YvkRmGzvUhZAApj4F+2dFDEHyXMD0s1rJ0mb
	04z1/ev3jTmV9snnBxmnsJT9z3y/D51zoBqmIbi8kz5c0N5ByQv/0qWkh6A683qsMDhYkuskyKS
	In9HFObfttxTXrkK2TIpNJFF9P+9NUJIkIatGhzJ87tpj5rGegDOOPGDt8AxsJ4JIOqK9BWGPLa
	FNPxltybeRwnus6KWERB++RHy2pS2mjBOLFO/yFQdqgOmJ6xDbAczDSz7erV/Yr6xTEwD/A2tdd
	SAa4F9U8DzETCbSP9qtyU0XJaOlD2LjhTgEAYXFR6BcKyX7LMmENDrEnptdZK/2BAv5QJROcg8p
	QlO1m0KcMwL38vz8PKFi1ATnODMOlwEhcPTHw==
X-Received: by 2002:a05:6a20:939b:b0:3d1:af47:5f80 with SMTP id adf61e73a8af0-3d26784f3ebmr33555798637.11.1788044024734;
        Sat, 29 Aug 2026 15:53:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b0451sm22648672eec.16.2026.08.29.15.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2026 15:53:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <25b0930b-5d5f-4144-bf09-1c0837442ceb@roeck-us.net>
Date: Sat, 29 Aug 2026 15:53:43 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] hwmon: it87: add IT8613E support
To: Jerome Tollet <jerome.tollet@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, Benoit Masson <yahoo@perenite.com>
References: <20260829170545.33401-1-jerome.tollet@gmail.com>
 <20260829210036.61136-1-jerome.tollet@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260829210036.61136-1-jerome.tollet@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/26 14:00, Jerome Tollet wrote:
> This is a respin of Benoit Masson's v4 series, with his permission.
> It replaces my fan-input-only RFC with the broader hardware monitoring
> support requested in review.
> 
> The v4 series was dropped after a NULL pointer dereference was reported.
> The IT8613E device entry did not initialize reg_pwm, while the probe path
> unconditionally dereferences it. It also advertised six temperature
> offsets but the register table contained only three entries.
> 

 From Documentation/process/submitting-patches.rst:

However, for a multi-patch series, it is generally
best to avoid using In-Reply-To: to link to older versions of the
series.  This way multiple versions of the patch don't become an
unmanageable forest of references in email clients.

Yet, sending new version of patch series as response to previous
versions is becoming more and more prevalent.

I am curious: Where is this promoted ?

Thanks,
Guenter

