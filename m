Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D7017A2FB
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Dec 2025 21:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767042312; cv=none; b=gMlrr/A0qjcq3fcwtjY2Rak32SJlFJKbXmamdJH+qBdnic8p/ipX/pU/sLqOQrNNH7PHtJ0tTuOnTLuEXfSqQ/TB5LDSYgfghSwMQj0oUI9xlEDg6eIqaHyfFIp3MYmr9ECH2GKeRO/4fkyYthLlMonYK75/PhipFhy6yyvbDeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767042312; c=relaxed/simple;
	bh=9nN6GCiW9qt7GM/1iJFw2vm+gtsFm5SDxDT0h7BmAzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObZ8rUpMM8qEPnild1yOKc3eiiASi1cSxAxBiqm3zSAbtNjQUEVEFuscU7zJVGhode0idmEu5pxQ8pSA2JrKEPeANB3WrTdWT0EYqGdMFrEOhOqLGnyyaZGeMa9CCf5w0QmaWs5G4ZNNlJn7J8DbgFAGSc55eq1WQj3h8LitIdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1Bg+L78; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1Bg+L78"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0d6f647e2so151846205ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Dec 2025 13:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767042310; x=1767647110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wyqnBkAIe6wvEbKA0v5Rnr8yIh02S6Gm0JAY26jKGE=;
        b=D1Bg+L787GvwOhqolfQbKkTagyNw9v/JBzyX4Q1MLdZ1kfRB8AYEIZKWaWha1MC9F/
         fUTyNKkT3fPWR82E9WIr9zv3ek/GsX401Vlm0jq1Y9bKM3SVkDrO/RpDXg6Dcn8X+RK8
         jBLvYsNmgUz0Cmnh2LHsdJdLtqLuNFu+nqMdIv0l+24dRwlcS2TX+gBFWGN9Xfk27ZZB
         o/MsqSuFSgjQ0AXSoKLoelka3QllXpI5Add7hTl5NelEwxHH2iCIVh2psVSQw893Vvlf
         azly+4vh+74zRwJboRjY9BLZ5CVNHdpN9fklUs9LxVzvJ8QQEm1peBYaA5NGUxEYqBOL
         7kjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767042310; x=1767647110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1wyqnBkAIe6wvEbKA0v5Rnr8yIh02S6Gm0JAY26jKGE=;
        b=CGF7s0KQQHx5ZpL2ETF3GQUkWGNstROkKqPNwfFNHkrrs2maaWW0rw2SJ0jN/ax1aL
         3wewlUu+zHHwsBBFK4dykNw9ZxWdFRgWm4Trah4tSrvQ1lLbThM6xSi+a+FGccP8BAjf
         v8wMmy6hjiLd8jd0uP0QqztPAXOfBUg/04GRuAPABZGjIIM2C7TX0AzKHiipGoTEfbrz
         Uqxjn+WGszGxUcBoRXLNNlWggIphb9zmcFr/JBIkykG5Sh4WOTtUTWi+LTInlk+k6qrj
         nAPJnyPWYsBopMEXiLWMtC1FJc400YaeaC+IkPtyXGHSlHX4SRB4ylXz6HgFJ/BzjyUB
         0XzQ==
X-Gm-Message-State: AOJu0YxzhhtQC1KsrptETPIwNBgujmmf1BBcJbkF3IjkL9KDqncGGw1o
	+rE6AcxjwuHBypmPv6WqAYDlSkZUhj6qHXGymQzalSUf+iGd05IIfzfN
X-Gm-Gg: AY/fxX4Ew/UAwdzDaVn69e5sxjkhmJ24Bm15hwk9lvMBZSGgCjlYv1LxXlSASHFL/VS
	e5gjenrsxxBSpZg6cUBXjX/M2j2tBa61ZCDugI6AIxUCaiS4ulXtami1rfRMJKUholZYhCjYzTz
	HnoxbJuxtU43wDLtp/UFD8kUqX2nW9LOfgYAxKw5+zoAz93gVnUpVN1YkedcAmK++XLa+QSp8VA
	jij1HnZMddN9lEsq7mBieQ3veiC4/OAWLU/J2dgHmY5SYYYE4wf1gnYF+qZfoY711tifMsL5ERm
	oA6vvirJ5ftF0wqDex2k1ponpyw7BVf8s7jRPwlr2O9HFe0/WsH+L+di0ACldJ2//BwBJG3jBQ7
	L9XmH8F/L8wpAsUCwSzRAk6KNySrVuBoIr3XGCIv5mZup0+rSrqgmwCkJBM6qQCwrjC67xJkDbi
	AdjSIDhX3mudGjbQR1LNUfGcRul8p4XCzupzQ=
X-Google-Smtp-Source: AGHT+IHRcmWYJ2ZmVGVRweAC85UIeX3VMn3HZKv/o6kcebcf+iSW78gTx+5hOPFMA49Y0d0yJQ4zCw==
X-Received: by 2002:a05:7022:248a:b0:11b:869f:742a with SMTP id a92af1059eb24-121722a763cmr30452665c88.1.1767042310095;
        Mon, 29 Dec 2025 13:05:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217243bbe3sm125650542c88.0.2025.12.29.13.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 13:05:09 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Dec 2025 13:05:08 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Charles Hsu <hsu.yungteng@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: add STEF48H28
Message-ID: <e714157a-ce8a-4b1a-9882-ca437d772fec@roeck-us.net>
References: <20251229103956.120184-1-hsu.yungteng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229103956.120184-1-hsu.yungteng@gmail.com>

On Mon, Dec 29, 2025 at 06:39:55PM +0800, Charles Hsu wrote:
> Add device tree bindings for the hot-swap controller STEF48H28.
> 
> Changes in v5:
> - Move the change list into the commit message.
> 
> Changes in v4:
> - Fix an incorrect datasheet URL and update it to the correct reference.
> 
> Changes in v3:
> - Move the STEF48H28 Device Tree binding from
>   trivial-devices.yaml to pmbus/stef48h28.yaml.
> 
> Changes in v2:
> - Fix the entry in trivial-devices.yaml by correcting the comment
>   and compatible string ordering.
> 
> Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
> ---

First there are no change logs, than this ... change log goes here,
after "---".

Nowadays it seems that 80+ % of my time is taken up with such
trivialities, distracting from the actual code reviews.

I really need to set up AI code reviews to handle that :-(.

Guenter
