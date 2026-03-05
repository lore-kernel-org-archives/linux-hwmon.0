Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8663354AE2
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Mar 2026 21:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772746492; cv=none; b=oK6/X6ajjP4w/nkzaLjJ0zgf3cxcdY2kHKexbthOWC9yHqzzGyHk22aFHpv3VLeCr3ArV9BZVECV9NtIyogMIyBkldidw96petTCgDa5rFT/sCR5Tytmc5Q67XFo77M9+Ne1tR4HO2sSZwH+s4J8kES3/THKMp1Qv8VZm33bTsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772746492; c=relaxed/simple;
	bh=we1ZBBjFteLr9bgO+Lax1g9QldZe0sSWMHfxffSETjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQG6rZXnUauJbfKuQr/BeTFzhlhRTgQCO1xsLnLTaWzLM/OLDLJfZqVJrRWMKsDipF6mQPJ3xpioxZuoSNEXhWMKOrabNO5V+2SPjqU/IHt7iMnnw62nNyIsAa9SeuUxZmA1wNh2NcCMgKGWMIFCixoEEEPzhEIgPVUJXOk6URc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxSGlYft; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxSGlYft"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so7112505eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Mar 2026 13:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772746490; x=1773351290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSsd5bKDZzrvqGFN4Dck6xWTQJmjnOdB6I5ka+LcKGg=;
        b=cxSGlYft7I/188dEaMTyNCN8PLTGBbzKhiscWi73TYDM/EBkSou3MVFDdKK9UU+DhO
         r06GeTAY9Q0T+OIUFCRE4895HK1M+o3idyHLm2SdROks3UvwshYwZ8xRYZKCneyFKnWi
         eOl3weCOwi9PjEOG/66Y2MeVQk/JCLkgynm8WJkkaLet46EUp/e/2PY/fGzzKUv0itAU
         qTP5wzLc82v12tQke6TBTdjGCG49MdmmfZinUOEw0Fg2S+Y685S6RkBagUA11vdmKe1k
         QsixhuITw1iTHsdkW+AWsEsXxu8ZWwxkDfOgHA2lozPvKvzGRZ7xVmjBqIk1pkfRh9dl
         hSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772746490; x=1773351290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pSsd5bKDZzrvqGFN4Dck6xWTQJmjnOdB6I5ka+LcKGg=;
        b=Z7o21VJJnNLGOSY/ne1OXiNHNr41Awcy0hK81s8ECfD1hnK1qIKGEDbqv1dDTogtZ2
         yWltbrXHlsalM/Wr7RVmwfq3SaAs0+j34rqSBXssVcssMVEBwz1jFJF6dUAsVeLVBpOi
         6mugVrU65NpLI/jm5w8XfmP4r7HbDhvb/vNy/yHAKe8WxsTdmjDhgSGO+kagVvgqMfTI
         URDVjPbzRNqHr4VOMv57tsg8tGPuOFLFd9TLUFpRxod13HH26pZEpaFKk5y8iUwpJoIc
         lUG3mfIiaEyLdBTbulrrP3FnupfAhGV1EuwN0YoIEldPjVkSBfIwja4c8c62Ih32u332
         ltpw==
X-Forwarded-Encrypted: i=1; AJvYcCXQyoP1+FgPAlf+9TachoiMJ7WyvfaJmcMJMkvuLJxXdUl2aa8TAXlQZDquE1zeCfRFB85eBMzxsGfQ+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhPn9ps2tQudQ4LoVvH8FPp+WjYdRYWFzlWblNvKKUfNH4QL3U
	EUbnZIa/ZvGcnf2YFzoaSLI0cw+pw2XEoTOyR1xO9RgsNVVwc+y13qCX
X-Gm-Gg: ATEYQzwxq+xHRNqpfKYm8oCB0EwhX4zAj2FClAcbVC2dWCJRTomBtl2DqHLOWrt82Xj
	pJexV7J3Vtyrq1XhUicWhRfouXXdsF1B7GGSc7TQs5wzCmYdmhc9KqY/hMW00+cFpmBRYOrDfJc
	c3cbKQnUYVyuKCAXpKjw320XLvin05kxYRrxuU4/Y/zj+kGZKxP0CrRPCpwZ+x1QQc2jcviAV+Z
	KXwqTJE/Sf1OD2OXd6tMkxKkT+CL6vdIrh1ewWMTTavIg/ShfWb/R2k8ZSAXBru2FLQcn79h1Am
	/9z0U/UEBg2MPJkhp0+kVmbIK8Vt504p4aG+jAzgP6r4k4ykgG+tLAUC4LP6TRad8P98U1nFaBo
	jrxwYxmZCzCVetInrkoknk3wT3492eqWkfamwJte1v1zPrnkTr/laeqVrT60l+/kEYkQzXap4S6
	vWzyAvyx1xnN/V3cc4xC98WzmchHyUSk2zRWid
X-Received: by 2002:a05:7300:148a:b0:2ba:75f5:72a2 with SMTP id 5a478bee46e88-2be30fcf975mr3249419eec.2.1772746489738;
        Thu, 05 Mar 2026 13:34:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdfba0df2fsm14573249eec.7.2026.03.05.13.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:34:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Mar 2026 13:34:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rahul Tanwar <rtanwar@maxlinear.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <de1e20d8-2d0c-4eec-978f-2293c1ebac8e@roeck-us.net>
References: <20260305144044.44208-1-zhengxingda@iscas.ac.cn>
 <20260305144044.44208-2-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305144044.44208-2-zhengxingda@iscas.ac.cn>

On Thu, Mar 05, 2026 at 10:40:43PM +0800, Icenowy Zheng wrote:
> The G and J coefficients provided by T-Head TH1520 manual (which calls
> them A and C coefficients and calls H coefficient in the binding as B)
> has the 1/100 degree Celsius bit (the values are 42.74 and -0.16
> correspondingly), however the binding currently only allows cofficients
> as precise as 100 milli-Celsius (1/10 degree Celsius).
> 
> Change the multipleOf value of these two cofficients to 10 (in the unit
> of milli-Celsius) to satisfy the need of TH1520.
> 
AI feedback:

This isn't a bug, but there are a few typos in the commit message:
- "cofficients" should be "coefficients"
- "correspondingly" should be "respectively"
- "has" should be "have" (referring to "The G and J coefficients")
Additionally, "has the 1/100 degree Celsius bit" is slightly confusing and
might be clearer as "have 1/100 degree Celsius precision".

Please fix.

Thanks,
Guenter
