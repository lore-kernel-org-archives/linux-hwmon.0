Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC103438FF4
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748723; cv=none; b=gdpmpDSmDl6E53gPZ67KJg5fR7muH4WwstP5RmOy6jeJLud378o0S4AIe0gB1DW4O/VcJMZarnW4wtz3Eh5cQGk0PSpBXZOx4MqvY3OY5aIm/eqgUvomLG9DFz0IPEu9tmVJjzRKdO1PKCXO1CRsYfPY79AXV7j77lwelrJWxPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748723; c=relaxed/simple;
	bh=foYyIZBJ0MoCbq2Wo9LeCV4l3uwSOfWvCOadwIjww5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTsmrX5ugrCYNimyThV3hnZCxlUjNuWdRz9mTtZFyoWbD+bclahbsB68pkm0/bsa0zznVJEgeGJb6w1CdQk329jXDCy79g4JwZ5ZG3OZ0V+I0qzDpiz0PtlrxdmckLc/BxoPlrIgkVHBof2LZe1LFIHDVnuPw7VO2Q6BMDqNckw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5yW+nZR; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5yW+nZR"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30c944aacbaso3356928eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782748722; x=1783353522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dNCLst1AIC3Ocf1UQfyjRnOJqom+LQyhRLMmxgI9Os=;
        b=M5yW+nZRu4KlMW9hqTHQAKodZ7nziBA8W4q0F1YlqlnQCMFJ8Husqe+wZgcN7eADaW
         qL4IoGepqB9Rjr0YTVO99myzYrzVhRuQk7tXGYxgbY/JKom8KTdvbq/74Zpt+9+a9fma
         uF4LMtad0vactl3zmeq5A9RwvOVZ9MohnviUgNK2abM8UXwTrgBU4i/ckfpYZcXddtsH
         XLabMqJGibpcv8xTwih4nB+V05qklQYROwSUUv6t2eCd4nePz4Up+3dH35rHXYk46FzL
         GtnI+jqB3UE8/vt1Y1apraaiP86N4oyEhoCUOd4/97rRV4pPv7q7UdQCs4UbjgPdP1Or
         dIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782748722; x=1783353522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1dNCLst1AIC3Ocf1UQfyjRnOJqom+LQyhRLMmxgI9Os=;
        b=fz9USAfoKKrlqgHQgch0wYVYbu7oA45kBtEv8GjEDv3bjJkfT+5J16LNNEA0+e4ebT
         tlcaWx0sY203Hm68enbl1dnrxjYClP1L762hleEk2ZZzwa6Kjisd5nkkYyhIRIHbbIRS
         n6R/Q1kqrnfCDEDE1wFI5Qt4QdC8kDM9OR4d3WaIXuu8X414/bbeKcKZmbyU94Z6U5vB
         RDhY2azWU9hVkGMHsaPD5koTsV/qePIk3P3ZShH6jfcEBh5hmEDUIn0npVV2Dqdb4mYT
         ZRY6yNBGd2AFxw70/IglTmlSMFlagRglZmmLvCAEFs7+Qw2ZFInLjKjHH+95Zt3K7zOq
         b3BQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWKiHyOxbsJw1ujxZ7OqykYXlUaEBM/RhqCyLL6BPEaozIrqC3q+xBsOfglikNtYyquuog6TqHlcm1ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTGe8aDv1Cz3eRszuTQ8tUqKIJqbIwJC0WPyDIL5bWuG+ELCex
	73Zs9qE/XwWlLnCFOgIu8Up34Q7T7sMDvCnRAV08ELqrEO8BCVEFB8zb
X-Gm-Gg: AfdE7cniUP44ZiAvsV2XYHF4g7jnttj8lGO2MiKFESeLbNgXysxOY3tHFM02ZBGVbSK
	y8BmA/LgQHWeLFQTkiFVkIu6t+r/u8HAcIjkJYUCzz9arbB+L7itctbipgi0XicAM/5UKKCmwal
	cwD/mtqpzOppiUzW/MGE41bfGB/zq3UVwNevTdpGvINqEXJ2NJS+6bmBwfWYwl6nbk9hqeZbKYU
	A96+XIeknOfjSk0TdP1K4MAfPAC7KdjOoZ2HhqyubQsUxvwgqe9ptXilMulkeP1eris1NRPBcp3
	kiRFIb/KtVqYeef0RSeAHTRfv9JKEH5MVuXx15mdjtXLzbz53CHpbUhchcVHdxQUUqqKgL2WsDy
	Io02rqXbwD/OaO2WBysHgEy2rLFBaN8VQESPJaOEeo63EPbnxsiJh6im6LOy6SwweMGLYtZodOt
	16PzgB9R/kSmY3VToAmKfMGvX21w==
X-Received: by 2002:a05:7301:4888:b0:30c:ab4d:382e with SMTP id 5a478bee46e88-30ee14ba46cmr26077eec.37.1782748721625;
        Mon, 29 Jun 2026 08:58:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c9c456cf5sm37515581eec.2.2026.06.29.08.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:58:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 08:58:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (chipcap2) Add support for label
Message-ID: <d1d0b091-efac-4774-8435-510d12aff6a3@roeck-us.net>
References: <20260625160423.17882-1-flaviu.nistor@gmail.com>
 <20260625160423.17882-2-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625160423.17882-2-flaviu.nistor@gmail.com>

On Thu, Jun 25, 2026 at 07:04:23PM +0300, Flaviu Nistor wrote:
> Add support for label sysfs attribute similar to other hwmon devices.
> This is particularly useful for systems with multiple sensors on the
> same board, where identifying individual sensors is much easier since
> labels can be defined via device tree.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied.

Thanks,
Guenter
