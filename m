Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217CF2E040B
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Oct 2025 20:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759438511; cv=none; b=k1G/hQrY+zlTrOnlokhtYw8nyIVfvafNiDp17y+vxieWOPUeURemauufLJOsG5fDFdSNdlTHfLJx5SKlKgi8spHLvYmSqCeUjGvV2tzwaJhRkNqDNO/DzOu/AP7vY9DZUKAQZLW/KdDxIKK3PUAHaTgMvio69MsnYfkaSVl2dYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759438511; c=relaxed/simple;
	bh=ve7VSnEXz8SXLkr0Ns3Xtbmzdzf6/gpZI94v8i0XhNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsxM+jp5vzaBirSdMY7CiseM1k2RewHQSqoK+F0eAvpEdzMof1giy0PzCR835FqVE+wW86Ii+hTb0Z7UjuEVT2eQ8gPeVHrkl6sOVufoiLyUb1AD7wcgD11FPYRxA0rvACFk6/lXg7zH11nPog6qsVPWmGOpdDR6Pg7gwYW3SkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zum4Xn2E; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zum4Xn2E"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so17995915ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Oct 2025 13:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759438507; x=1760043307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIklhV74VxzGNTOE6vXMU3sJY9HtAA/7pD7aRkESOR0=;
        b=Zum4Xn2E2Tflw56ex9a12QHG7jkwi8KYoQ8qGaYvZ2Dkt6SMK6fh/JwxIZVn3hwnz/
         656/S9F+MYXBSpsMEVjj3BgNvOZr3Nw80EiJCts7JIe1vn1FoGcxi6q/aTGfXFNeoA6g
         izHmK5aAckLIzHbTx8Ua65mh8J1m8CbDkm+R1czbAbGgQwYzy4KUIN14u+HWSKarBmX6
         BiwcHZmTy6BNiaeiIEJwB7Pchw9C13bHaJ4DLPN+4OKhnIB1f5XOKVSjq1vQgkCbbjUA
         pJELwq2e+S8+JzlPj1jIbcgOWprvh+tO/Mc7DJHgZDMGlzjJdR/e2yQNLEyoXbbmnO66
         x85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759438507; x=1760043307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIklhV74VxzGNTOE6vXMU3sJY9HtAA/7pD7aRkESOR0=;
        b=l91CTqkAL28q04VYz7bFhRkJFjT9WAmjHmcGD+u8GWdmU6Kz9zNwk6V/SHXHQBixFv
         rkUuB1Ff2BLS5JJEdMkmSlBrT4BFl1HhcMriZVReCVzyXXYGnz+CD0VfhuG7CTBq5Qzk
         8HxI/xGa5xuIkr3s12nlkeYuD8RHRAmlPDius4WnPEbnF9wixWcJ3qEgbaN70g+jtMQd
         fPnJX7JGhBPafVRAnVTjed+PwWQzIj0I/IBwejcKkq27wVVSWi/2zJganJFChCWia5Kt
         rv5pHzejT5FIux8jpO4m/4c871KAeNcmX8IAcFcLlkKA9i4Zx9DXLMbSi19akcYKdLl9
         c36A==
X-Forwarded-Encrypted: i=1; AJvYcCVI8+OmmXDBpFJc8G4H8D4aSDv4M+GqnY1mYRLiJxxcZL26l4MTGGX48Ih6uGqgh5uq59Pk1yBXQFGUJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK/AHwtMwxlV3XmxR0ufU2M5caf0aawIflyCd8G5vWHgQd+WY8
	yPkbQcCAJM7is/byAIig/hDGf2odl2evaZs6ymJpfcE2wLyQh3ksQwbQ
X-Gm-Gg: ASbGnctsGLoMxygXBMyJOM3fX+qcOBjzAiBIjElzMrqBXFq1rr4Jsd0Bt0VO2lPaHr8
	nXCcS8Xji8xq5qJ+KvPCMmw1e+DyF3mV0a6uzn90luWjiwkDbjPJZwbZZIUAoQfjJ/GkDLrrXJ+
	NmjtINS82GVC915aR0EmmtsCKwZNVRs6pnNicKYYyEd6tqlgzK3+fbOyS8QwjAuKvPsDDuqshTw
	M3Uyc4PGsEAAr6ZLxUNNz7G7CuagG1Zj3exOi1yrQ8daKoDNg2pfBUoWzFRwBOv+KyVbe9y/j43
	BgC5NBSafbqr049+Q5UxtxhpHX7CRn4W4OXc38dynS8vzddOZ3+LxRwSA9gsWYfruiPKqK+oaVa
	koRRbKr/s0dLFclEYPT3M64ISu+BX5go5/FNSjCXj7CcsBjxH+3OFIOeoPh4=
X-Google-Smtp-Source: AGHT+IFTD102IbQjDd7ezi5HEPtVTH6TbbeKx+COFeUkw9uJEnFAQC6usbIyZfpGul6EpzbGLgme9w==
X-Received: by 2002:a17:902:d591:b0:26d:f589:9cd7 with SMTP id d9443c01a7336-28e9a593d26mr7143505ad.15.1759438507464;
        Thu, 02 Oct 2025 13:55:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1eef42sm29474935ad.133.2025.10.02.13.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 13:55:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Oct 2025 13:55:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kim Seer Paller <kimseer.paller@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: add max17616
Message-ID: <07272da0-6b8c-4283-8094-ff6446ff5762@roeck-us.net>
References: <20250930-upstream-max17616-v1-0-1525a85f126c@analog.com>
 <20250930-upstream-max17616-v1-1-1525a85f126c@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-upstream-max17616-v1-1-1525a85f126c@analog.com>

On Tue, Sep 30, 2025 at 01:02:20PM +0800, Kim Seer Paller wrote:
> Add device tree documentation for MAX17616/MAX17616A current-limiter
> with overvoltage/surge, undervoltage, reverse polarity, loss of ground
> protection with PMBus interface.
> 
> Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied to hwmon-next.

Thanks,
Guenter
