Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974585;
	b=vSWk5+B+OK1e1TSi5oVV//iERE8z4iUjQSHmnBgQzMGH39gLslt4GJOxlRbYvKqtFoIZ
	 yU0LW0Aq5AQ7gPHdxe4kr6Ag56GsHJmqeWI5PlNc9bdVKmq4Ao3hXfcX/clBh9CjJ+y+z
	 dHgGf0ZrxaWlKAh71PtR+tAQe8RrXRKLfrL0aOW4G1ICPIMZqtkBQZnGxMBgIcD5DpsyZ
	 TaVVktwmblCJ36tdWJoFrg6X2w4F7M/78BTtRml3f52N4TM+CGTGrC3srV8HM+NspIwTU
	 GSy2k5N1yx9C+vKxBJFdzShGPlGIh1LP6Vvt1tgx7tG8t62s2kcUHYmQA09b4ZUsivw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Daa/iIwitpiz7Co6ECQKt9tYfMt18cT1MFoMvMMMOIk=;
	b=muAHMlkreRVn1JTgDcrtlPYN2Texxp1HYHOPONPBpL8R63QrGclmt5RnBAs8mhMiWumP
	 c7lq2GRrGEhlm1l0bz//3xiWoDB1sEMecak0eM/HyKcWrH+uVQviTVvthFwl8cX+bEboP
	 vfcagCvFIMxT9t/3jj9P9I16BEZ9e5Qg3R5WaLY9zmWUi5efj/Pd7cFNVc7U8KnzmBVhq
	 4wv2suW4lbeiA2+q24R+lbZ/aivXhmWBXjCRaIit8AQpv+CZ9cPD4mVdySiBRiF6pWDo5
	 dtUGL0SLRh99yDvjjxWezn/DMxg7OGmRrvdVtYH/6zHfS4rXIONz9zdfrNSVqX6GHYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y4Iy1scq;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9F4606A31B
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E9F4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y4Iy1scq
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ea759cc9b6so8044055ad.3
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974584; x=1793579384; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Daa/iIwitpiz7Co6ECQKt9tYfMt18cT1MFoMvMMMOIk=;
        b=Y4Iy1scqew3iKckDBJkT6E19Cf8YuHJdeW8u17Wbh8V1nQ2/4UVohE1SZjkZFtM+4+
         oIsLW82hgZqVwZZ1/EZsvjE/hKb5oV3gZpmlr/Cn6OTJsw+fjQHf5b25wfgIv3RiZAk+
         uQG9raDyemA+/7NFKhnZ0v4HB1Lugd1I2gtMJN2isRkPymohut27gP83mwwWOEomR2hg
         Bpw6JBuThz4qjfjls6Ce36CWMYYrWfqN/8ANbnxhMDvkaXj/KQ9udpk4Jv9g6PIoixbn
         pU2TxVNOQGQjTHjsG5ur5ASQyK1DvvKLpXe4cQpLRjJmYP5l/1vXbyjNsMsY3XGU23bc
         jG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974584; x=1793579384;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Daa/iIwitpiz7Co6ECQKt9tYfMt18cT1MFoMvMMMOIk=;
        b=sxc+fnE48hzB6TsWG60Wtkycmm9O+lmdVOFwHwoiVTA5pVke9u4gDp0Jmy4VL5FSJe
         zZCPDCCxr4bGgp2Hnl2Fewt0U5XTkIZoQOrEQxtAe2biKb78tE1LtSn6kzd29dQW4kAD
         EyPGNVTjFHIbaUNbtQOZoJ6Gl9YXBxxkUvWR0N+qlnmylYXI2nq1Hd46/xHWShibSZK5
         sZbp8ukooiPKtc0g/ZSuquoCoR3meUmgbxwd6Wl6prU4ej7Yd7fXo3+zIyLCcKoqZp8i
         hSwyF9Qbk7Memts365HY8SNE0oGcA4J7yam05S3+UXohwh220QJDjtkBQYiQQeFsnDJb
         X4pg==
X-Gm-Message-State: AFq9FYK1Iw7F4RUDEIwmMYS27lcBYtZWrYAO93iMbvsZukrcf0uFH1DA
	ee0AJhSeL+CMv6xUByXR96XA/pS/0RKnEcN6EfythZqszPUL27NDECQnxTL0pw==
X-Gm-Gg: AYBFou0h0e76XE49C2TWCBqWOv3HxF2qP2qVqCQP/+NnRsAoxVSAyF8/O+u17NlQMaV
	YU6sre6xGKh0mRMRj7woONTsa9g1GEej1L13en7g9/WSa1ofxXa4Dms6DSeYMLj2/OXM7hwb9Qj
	L7RxM3pKqEwlqQ6s9i1zAiIqgJycm6LkH2LRkIIWIKJvi2TOJYcjx9/mnXUM+Xp3a8qG5aLaANh
	M63poi6sLZGd3xLddT6fZuMQMrW5KY/Yz4518w6lEYYZwzkfdbssMy0lK14EpQvZbjixZTLdhuT
	qjF58bryNxqJmLMmtwJnTiv8W64CaFtKfuOAXdc+uIBxOumLf5eBtghYGtpWFoaMF8o1YmXKbIa
	WPUr0SnbOf+wRP34bqrecXNVpgSQNNqISxWmMfxfxnghXPf42ac2ak0yiBC0zYxs8tMLzhsrvYU
	e8/4KqMVO4s0GaYwgemC9phtDLrQRhsqoATpE4m0QkFYARrzwG+SuzIXs+I59x3slK8Fp6jhITP
	zU8Ql+hHNB811raqS2sgA0aSB7/U2p38CVNFcjRGXRa99qOtvCi3AP8tUQntirMkzpeInqCTbls
	AXR0MPRfbMqe8t8=
X-Received: by 2002:a17:902:fd88:b0:2e9:734c:5027 with SMTP id d9443c01a7336-2ea9c697125mr44525615ad.15.1792974584380;
        Sun, 25 Oct 2026 17:29:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eac205bb63sm2057115ad.48.2026.10.25.17.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:29:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:29:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Asaf Nuri =?utf-8?Q?Bertizlio=C4=9Flu?= <ycistak@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Add ASUS PRIME B760M-K
Message-ID: <02aa6c87-7098-4a4c-8d84-197323abb3d1@roeck-us.net>
References: <20261018202934.1111462-1-ycistak@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261018202934.1111462-1-ycistak@gmail.com>

On Sun, Oct 18, 2026 at 11:29:34PM +0300, Asaf Nuri Bertizlioğlu wrote:
> The ASUS PRIME B760M-K (DDR5 variant) is missing from asus_msi_boards[],
> while its DDR4 sibling, the PRIME B760M-K D4, is already listed. Without
> the entry, the driver does not use the AsusMbSwInterface ACPI method to
> access the Super I/O chip, and no fan, voltage or board temperature
> sensors are available on this board.
> 
> With the board added, the chip is detected:
> 
>   nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> 
> and fan speeds, voltages and the SYSTIN, CPUTIN and AUXTIN temperatures
> are reported (BIOS version 1838).
> 
> The missing entry was found with the help of an LLM, and the change was
> tested on the board above.
> 
> Assisted-by: LLM
> Signed-off-by: Asaf Nuri Bertizlioğlu <ycistak@gmail.com>

Applied.

Thanks,
Guenter
