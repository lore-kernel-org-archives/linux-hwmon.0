Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49C548A8C5
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399602; cv=none; b=NJGiKL0Ra0zaTtN6RzUaXmkTlOjmBMi//Kpy0KLV1uNPAZ0wGiyKakGwDgYp2FCHpVgLKxHdErTAdTjEEh75j7W3cE8w1kOQ1RVqMtZK9SQzmQ5V2BUlnmyYKALqrvcboE/ChQNvsPyOvmJ3inK0OZUPSJec/Q7p6YJCJ8/uQJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399602; c=relaxed/simple;
	bh=A+WJXH8LEWEmVEvHuluPt5ZSvK79HhNgL+/k4aL7GRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJdR+4xyUq97KRXMKHgA5YqbMFX9GaLofJLCxf/Phkf9NIVQQmgX84p0xuaO8MceOAQ0bIvikMJzTandYAdB14JQ+WT1ZyCCpWcNthdax5+i4p2jHcEmChHeuEag2TWq7U7kV1M0K7rMt2VIsioBQVoAAyyIQ5Kzgw7YqEeDE3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5rh4SYV; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5rh4SYV"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334ddcso21705055ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399599; x=1790004399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JSZQy8BrbphsTuB3PP3GNkS6dKaTus6BUKVlBhlcQXk=;
        b=D5rh4SYVfQYCkRVFKzGdB1L9V1OLhlOhCKclHkp+fpx02F4njrQeeIvyX4IjvkCoeN
         49UqSrnQcp10IlD0Xs4cpRY32d+DNCyFuq3RxJtRPQP5MY6wEZBAvX3hovhbeve12R7v
         yHHPP4vATJstE3HPnmqdMD/Df0viOU2smgRrg2FX5vjTT4B3RZIoyS4Y4m/2wtPgnNqv
         N+bJCFePE20bR6N2mPA5+hVEUi1AIFuTvS4g9sPD+tr7nsIKE1VUlz6MzXEILC7vrKgE
         iLhfMRVKMeoiAgUXinhCIck8ovROQigpouBcTItAOSRivEo99eVxvhBsC0v0wYbNk44g
         UOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399599; x=1790004399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JSZQy8BrbphsTuB3PP3GNkS6dKaTus6BUKVlBhlcQXk=;
        b=N4KGwsDIUAO+tnpSygHjIGuSYSFX0Ud0Uy5hhzzIN95JJuLOnPsOzSYNaxf93GFgix
         2FwWTbub1SYZ9VIRgdWbNIOMRh9rdbK3UshbfrU7SM9AXy0r7bjvXSUWWfTlb2HeM3qT
         RFmrsvySE3ykFM1IR8FU+4J5KNEfyeRh9fIdIMGyMA5ZDkJuHi6KerR/40ASatG7cFQ7
         5dnPdyHbuh+5Qh4RaLaMC+amnC/lWvp+8FukKR3ioMYePygcyZbGNw1MQh4x22GXjysT
         ok/8UcLUP7rlLq7uJeP7AeFWUezY57/G82HGeFpU9aMWOjxlAihlmflnGoDnlYLC2RhD
         PqHA==
X-Forwarded-Encrypted: i=1; AKwUvBzCW06AfjXEWjnCIMBNhCGOip50hQBGznjkJMjzuJeRNqSeaDecLDm9sK3JRMm/RX9bsHo9Kwu8cpguQA==@vger.kernel.org
X-Gm-Message-State: AFuF++nN4X8EgYdIL433pCi5raq6/sYbBPwpjlR5+/6A58pQRqFX2SNy
	bR9r1YXZdVxtLMI4dixzF5EB2ef3+TfRZWnPGb+MGwaTVjMV2V+UZyPw
X-Gm-Gg: AYBFou1AYg2+l+DN31T8iJV4t+tAFo5gMH43MXO5oBq+fx1EKfjXTx5g9Q9e7HsmH4j
	dLbmoX6nHhVKim2Jiy0HPt29zP9JHSctNwm6DLJdsy6NAx+6aXhyXCd4kATdj3TxKw5d57sA0Bx
	ORyXjqoLQ0Rewlwnr/DIZJZsMrmXUwfMQTul8dew2SC72C/W9ztggAS9lc444p2uzgOaIn/dnHc
	NaBPJeY3DnksnJ5wxLe2uEmuEOoBLeXUV9dZuxOq00hrF1S1ap85jMZGQSVUqbpC6H+0bHNqpMn
	kYRIVEFEDal3AvcStQadigc0c+kctgUF7aQpaQaVFXmBokiB8lxCNELh5T8zZpXhvGvK4N90+GD
	D3BMuRlfVYk6JTPJiR4T+CEDP1Tj9qhe9kQK9uJYiSFwdqd2vWhfkTVxjoVJynu9+ArBzw8sOGl
	jBN/lIhSyjzFVm16X1cRuZeL30/AYwGcKl8spZhSjpV6OMFkkpsihyiSYsLXo7D/i24Cyr754+5
	R9/m2XpBSgH
X-Received: by 2002:a17:903:35c6:b0:2db:73fc:b57f with SMTP id d9443c01a7336-2dd6c6c0cc0mr59735695ad.10.1789399599255;
        Mon, 14 Sep 2026 08:26:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfdc15esm51211505ad.66.2026.09.14.08.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:26:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:26:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Message-ID: <35ea8534-5446-40fc-b1a7-72a115bc40b6@roeck-us.net>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-1-b44b81cd2c3c@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-1-b44b81cd2c3c@linux.dev>

On Mon, Sep 14, 2026 at 04:03:53PM +0800, Troy Mitchell wrote:
> Add the vendor prefix for Sensylink Microelectronics.
> 
> Link: https://en.sensylink.com/
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Applied.

Thanks,
Guenter
