Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D09F4A013E
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355728; cv=none; b=Q32gO0M7DIrpUy2zOz4doh921fkfYTTqs2eeRswKj5v4nO0ok/Oo6q0EQYVy6gUIZJ9IWhXiTxQPMxoPBbvF+nKSjlHnVvpxcgbXv6IvuBXnIcCHFJat0uWjJRcmePXEIxlCLsW3W4tO+cSLOz85Wc53dBrBol0pJ/nQp8+3lsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355728; c=relaxed/simple;
	bh=vqQ9yFom+KAtKBmXnmdPUsCdNv7GT8zmvq1Y31NDaXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uCkjR2R7STa91qIe79Leg2bCWpKcr2M6ajDBURFmp90Sud10w6sKYw1M2BypQs7M1B5UVmuQ1WHJfXH8JLfMhP/xHeDezoZSFqLAbVkNDfChz+g9fm5ZAG3kOuvtDoDNyvRwQmwwZjb+duqETY6fuGQQlv4g/CH1V3qz8gAdVYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q4M/7d0V; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q4M/7d0V"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1244377a91.2
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Sep 2026 06:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788355727; x=1788960527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WaieGRt6LOh5thIe/TkyPr91gBSSxoFIo40Umb3lPE4=;
        b=q4M/7d0V4DHiJegKtwXhmBb3L81BAeT4yvG2kyPwkNXJ+z4NnoE5XFlFHDb0CmI3gc
         1DlQKXgy+hRnUiPFz9NVGb5/CCaZxXcPbLJ33BBnG84Njx+5SBiEHQiCRFea5vb5SL57
         JKrdQIE+U/jNOlzb3NowieqjcSmMdmIHDkPcdCj97Wyl8Iu+kH5hdLF44xzQMDoq2TOK
         MCqO5nQ/fge3WAfLHzH82NqLztjdtOG5PnF6JmlIxtPqnAdNgXOSWVt71BoxZHvsWsbP
         ibIf2K+LuGg2N0uhcgOHKZKJg27U4HW8njsewi/1jAw1i6mntYHp0tcR6QE/zU3vB4KK
         kyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355727; x=1788960527;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WaieGRt6LOh5thIe/TkyPr91gBSSxoFIo40Umb3lPE4=;
        b=TiZm+k2UMcBu0LIQm+rBSVboSmvwdX2IKxka26E3aZTyBLIdlKiidsAiKMBby7v9g2
         x4bC9JKYWtygMJj0ekYv8rTsKhB0phAleitaMK/vl8iivxIVL7EWNN4JkMuype6mqA/v
         72uzVoxU/E4nSMDozsilknYZ8j7/w7I6/e3zSIJ0mCBgV6QYCghkKXVyGmzmb22mZcMl
         APsl7Q/Wlg20oWTCh42+E8tGSCw9z4tMWkxbuYw62Y1ouWmtp/IkNKYqXdL2vmPfGI7n
         tcTnf4OMQKKEVBIO/2XVIz1h4tj0uZO1EMHDEDqumh7nJf4IUfUQiMUwshII7iWivAkx
         fekA==
X-Forwarded-Encrypted: i=1; AKwUvBy+34RKNOd78uzEbenjfnY8RSlt+Jw/HSniVfEhx6opKIzX55MSQwGcXqOMsX8/J5mHlTFbtRYM6pobyQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k4or0QmaIMBRfIfi6JKUXepri8tx4rlf4G3L9cII5OKCTSBq4C
	5l9GbMuYc1Xge+M3ZxqlWezUxC64bHJ7Or8XLlP3sr+BhnohGdl4whmn
X-Gm-Gg: AYBFou0y3jj1gD2jYSjSs1kNPtv2WD01+yTTgc8f1pv4x85oCQGdW3dzVeeu9b+gzRq
	hjIxsYvi5VQ0CAby9Liqw0NMdvglWQjVUkHzB+gCoh+9fEAb3WmXxeySNZC5wjrWikRyeDQTFHH
	b+SkIpATN0hpf2X/tia29kT9TNUQ0CDIoI4vJ9pNKIJiFrDrqfDWAxngZhBXS43AJDSxYHGhz1N
	KuMeR4clglh81j/G8WjgamjqBIciZZMTAFEs3pJjCxS385gEOrEKIxXB/8h/iiL5R2jiYpxxh0i
	v3AnqgYbDb/ggk/xiC+THBGQXhu41ApPt9aL7FHafYlITPee5u4q8L0ucvnTtcX9z0y7/VUWsrk
	2bRjtDfOC+cGgou05TErwU1CuBI3n24w56BxNpZHOs3GHQ+qnQl0QyGKB6hq8G0+B9SCmtnX8J+
	PBzWs/nKqh8kUytmyj/B962hVQyRz+XE9EJK2jHY2GZ+6To2ycGNYsgPC4RyLby2PF7koJWQIkd
	cdNm5uRTh5itXmVZSDGo1YP2hAXriWheu6dcQ==
X-Received: by 2002:a17:90b:1a8a:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-39aee0e5de8mr6631593a91.14.1788355726490;
        Wed, 02 Sep 2026 06:28:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d7bb9d7sm12149494a91.15.2026.09.02.06.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 06:28:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bc51c907-a523-4b99-bf3a-b23c5823fd56@roeck-us.net>
Date: Wed, 2 Sep 2026 06:28:44 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: hwmon: ti,tmp401: add
 #thermal-sensor-cells
To: Krzysztof Kozlowski <krzk@kernel.org>, Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260825-for-upstream-dt-tmp401-vcc-tsc-v2-1-cbc360ec51d9@free.fr>
 <20260828-weightless-ferret-of-pluck-ef2baa@quoll>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260828-weightless-ferret-of-pluck-ef2baa@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/26 03:02, Krzysztof Kozlowski wrote:
> On Tue, Aug 25, 2026 at 12:13:18AM +0200, Vincent Jardin wrote:
>> The property is missing, so a board that uses it with a thermal zone fails
>> with dtbs_check:
>>
>>    tmp411@4c (ti,tmp411): '#thermal-sensor-cells' does not match any of the
> 
> Cannot find such node.
> 
> How can I reproduce this warning? If it is non-reproducible, then it is
> not a valid reason for a change and instead driver implementing thermal
> sensor would be the proper reason.
> 

The driver does register thermal zones. Since #thermal-sensor-cells is
mandatory for using it, I would think that the property is needed.

However, not all chips supported by the driver (and this bindings file)
have more than one channel, so I suspect that the value range might
need to be "enum: [0, 1]".

Thanks,
Guenter

