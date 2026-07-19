Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EB0277818
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470603; cv=none; b=CCOJCdhJRsVDnRS71mhtBNPP7wKYF16+WBAO1yBvIz2emErfVRcqd1AIsvCNfrwweAY6KM63fOjyTmo4R5ajQnTYY02Kjon2ApuwN9xt8pSFfjTmLuvrYSEwIkQmfYwDMvzqOBrx5pNbGqlyDJqCfIxFIeeyPCAk0xdqKrQlGU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470603; c=relaxed/simple;
	bh=cwcFjwlC9XWGnFfo+mLll0vJJ0N+PQ/CNGhbgglWYAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iB1v2NPK8wDA0i6Vrqg9WpAJN8ufOrkiGn8nd3P00tt+MRS7ML+ptzBK8t/xWKPqMkws/k4YWyIyh7fodtPWdw8ebwrlHEV+u/FreA6ZQQEOdEsAD9VQDFJBFjIomD0fII2Tcyi7o4r3z4EwvEP23YR854aW48uwIJe2HUrIiMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W89bOnod; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W89bOnod"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2596547a91.1
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470601; x=1785075401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hHyN3ZHgdsiq85sCwYmC+VXiytirIyjYwu1Jlw0IBO8=;
        b=W89bOnodunSxy2TmXb6RVkXH7kAvAQSotMS1TtZul+achFwi+BxbOhhyKLSZZXV4IK
         +E/T1pdXcjOiM4+1UfOMwB8N3BuOsDJ3sv71sJfIbX7weuCihFE9vxOjgUMDvyG4XWUC
         i3xtHm/JzIem8J3k4r8GS+2wjBOTWDUAWut5EZI6nXY2igRub6UZgzs6Qfx4xgdEmwy1
         NUROJAi/23qOeNB7pTrzYSrOGMb+N64PU/4tG0+vImcQhXmApaXkjApc/wkb6M9U09ru
         QAFMfUrwNLKZSwt8ALIafOvTJr9gQZSDraxG24t2KnCxyC8+T0Biwu3OsxAmKq/eqOcq
         UqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470601; x=1785075401;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hHyN3ZHgdsiq85sCwYmC+VXiytirIyjYwu1Jlw0IBO8=;
        b=kG7Ah8D1N7hkF5J3+Un/4B3e7+19XBOIwfFV5HfaDozzZWClRkOOBh2kA+f3QRIzGI
         8KosMFm3plTgTQfpnNp7MZj5nfO39qtkWdyk0gE7hKQ1d67zCH0meDC4jYyG6EAyYYgw
         0Xmy5g/QJ1wN1Yrnz/eFIV+PRYSvqtYQvdLX9qSu5vMD6YnvkE5P6sKzEHv480Ddd+OS
         T32fiBhAWsHDafMFiKxpMnE2MC2BW8qw7VvEu3kWqtix6jJTECzw6GbwJCVbe/haAHkX
         0M0UMZ2nbdTpDmfIASH9yecX12aA1FvQVLLe4MI5SO9yKApVYSUJOtVkWLG9DQi5ign4
         i4OQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0U1OVF69gbp0pdO/6pLaTm+ycJAvX4vLTeW3ge9OFVwFoZbH7LRzYS98RvYNlDmeB5pkrwKRZAc76Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/j9VOrrDFwiU5XdGLmt9kyMYT31pmh+bZVGYDmqI32OT1A9Gm
	C6pmGYxXHidPd8A38/L7SJujp+p14kqgVtEpIeZDDseWl/t+xlqQsN5T
X-Gm-Gg: AfdE7cl5esoqT8KwLQWN1zEXfrM1qPtiQU39gLK2w9yAN9ofQ7moxp+Sfqf8e35b/mY
	LJp5acxH6ZpSEj2n6wD1rxKoINTSy0rSAVi6dD4wrVvBJK6WUzbKqfsD/3kUuLeRwdGf1y/dU/v
	8mCTFMxCMoob7/4sX/xndbKfFxho7tOBoox6vQYaADwPJ4AsXjqApJSRctR8zQqQvqNX+1n0eBU
	G1hl5fhpywfWqF6XXCCEdd1/dFG3z3XPc9deg0ZCVMJor7vOoe0BZINNLH+nJtXb+ztK/I+B4Hm
	O5oVi9dhmUaJCa2Nn37rntEXbwZlLifHboFyiaz9RkD4ngHhBImTxh3nsf0wfy0HGsTTSQizVxQ
	++rhv0GKmpepE5dGbsm/vtawSbWL/rF5YoSfqKd4uYvi4vR6czbz7TO1lZ/IQoAM1RtyTKxQdII
	ROW/PB6uTy/qxkRd75JBHfI22e2g==
X-Received: by 2002:a17:90b:17cc:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-38e4b3db1bfmr11446884a91.2.1784470601299;
        Sun, 19 Jul 2026 07:16:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de7790sm6151339a91.3.2026.07.19.07.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:16:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:16:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: vendor-prefixes: Add GXCAS Technology
Message-ID: <a4253a11-2970-475a-93db-a09223c26759@roeck-us.net>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
 <20260713074559.12196-2-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713074559.12196-2-zaixiang.xu.dev@gmail.com>

On Mon, Jul 13, 2026 at 03:45:56PM +0800, Zaixiang Xu wrote:
> Add vendor prefix for Beijing Galaxy-CAS Technology Co., Ltd. (GXCAS).
> The prefix was confirmed from the manufacturer's website:
> https://www.gxcas.com/en/index.html
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>

Applied.

Thanks,
Guenter
