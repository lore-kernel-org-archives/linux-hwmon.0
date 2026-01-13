Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9070F3B1BD
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 00:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768262430; cv=none; b=XcHZ4VSjEsbezrjD49xFtYn8Dc8baC40WB6SiPt3zeBPGa4OLB3FQli4DtROgGTyzzd6O2lgZaSwF455VoRpvtkeqYTD/1anb04HUFL3ZBcdL+TU7Se1F1bn8L3OwUXkhNChbbmYKd2s3iRhcSAQnbDl3DTAP+lVq08obJGyvOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768262430; c=relaxed/simple;
	bh=AB46dIc3yizScZvd1REalZDXMZ+TOT02GcTeNQrT7FM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QwSoNmi6X3Hk1N1Q77/RJTRKnr0skd+DW3LQp0NLMc+AhOrqasZm6cjxGhE7RxY1BMwoiz/ZMvf0rS1dHpQZRpudHx8FAYn4uTaqhZAy6egPxPrudg9tvTyTnfJg4pdvqd6SBB3z2beyyuvTIXcv4ufQas3XXOW4eO2n05FF3bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cuHn/xHK; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cuHn/xHK"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ae255ac8bdso1478789eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 16:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768262428; x=1768867228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ca7ba810N8yfT2a0uOQiRTeHQwK7t+A9fpbfT6p0g0=;
        b=cuHn/xHKC4Fx4u8p+uokujrGx81NZV/+bb6pQWkWRSqwZAyALsS8kAvtzCG/OJGTmS
         F7NuYdac3rRaLWQP3KwQ/Lmrl7Q+lxvuvut+HTOkF+3c3GzGeCE+UYH7gOHE0ZArQmp9
         6TT828npXw3pDvuUBQaMqV9TqNnyfC57kNQqNLzItNRO5uuX5mOk3dFc1RoQO5tQ5kNj
         6L45SPIs3NkL9j6mH58JfwBWQXqm2FcBQPSKinuzhzzKqbiq3pQzAJxwbVNHnMM2bH9Y
         FeuNTEhRK0Z8by42PaQI656LKO78KFAJnePwyI/hl73URfPDyQnziyotrJ22iaAYbUhm
         7zAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768262428; x=1768867228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Ca7ba810N8yfT2a0uOQiRTeHQwK7t+A9fpbfT6p0g0=;
        b=ZUGJibYvvjWen/2FOhvoubQ05uVi2Ul5Y7wS+hUADAXK+5Gt7UtfVK8tKIh3AIdq0V
         5vvrhPIuWAk6H1wWjFxlhDxW5ptA9q3aGOMLfBpxBQljZwZ9TOF0xgVNKjm4VBUQ3MAb
         4KuBGltaccxwuWxrxyNdw8s2KB4KPXD69SUtx3PPWrMDEtJEu18q/xZfpuKkPA05KuOJ
         qEs78PSPfPd2kM27CDPfl0hNcQ0WMPogltULytA5BScS4l0VuSByGuwdBXo23JJmxtOP
         GS6F3C060bOnnfx6lQ8st07SO4H/X5J74dLMft+He1R84CZGNcyO+w5YV90xu7LsIDeH
         Eh/g==
X-Forwarded-Encrypted: i=1; AJvYcCWjwfDmwdXYz/oHmCXGCGrXukv5pkjG1kKy3gB1Q7ekprlK0rlTmUw/RuvVLmxGtAHWFSrQdVMlhnmkcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRZgDb7dwc/VrMpu7TGFNRCDPfmmGFs/vCZipSg05kwMEOaobK
	cfvnfVsRTdRqHM5XawHlPWsBOf4W8LDOgvCqtAAsOMUOpZAZssmK000N
X-Gm-Gg: AY/fxX6pcOw90YOqhy09McUnhhVNbG3qbzAFDalymHWTkEMyoTRsD4B0ewuifv4cT9A
	4/uIyp9bRl1uUuknrlg0MgQx5Lm+FJ/58rA9e2q43CRXMzAXnowiGQGnP6wzBndC45GBLhKf3GH
	E3PXklUACmcTitGSdkDjj5aUMDfvOHTwV6Kax/HM+TPVByhs5AMR6rAFknhykv3bLGVhWK+bylS
	Mxd603PspKHfVAsKDkiJCNFIcp/b8n09vilnt173ifDP056v/iJWbvsqx5K7vk8L/pw59rjsho3
	09gKGzNlYAERVRH4bqdSljHNC2MKFzp4BXkUqpyRt0HjsfdiLEPeiZDYonfCgAf70hOWKLJWG8x
	XDg1I6m2tSdqGhFgJWXFfv/2+kMExnbassqManeLGLN5ON0Y/4ns+nW0cANaoFUDyrhAjkMXFey
	wh7Pa5DzRi2WSU0m5Xvmhf0ixQ
X-Google-Smtp-Source: AGHT+IE6yvQ2ddlvX9nyemFmo4N5T/S3GXfv8OCsJYg1pE6WW3PJHwa8O1dQ8ly5F9NmxtGXBloc6A==
X-Received: by 2002:a05:7301:fd8b:b0:2ae:5b24:1cf6 with SMTP id 5a478bee46e88-2b17d30f886mr14686787eec.32.1768262427467;
        Mon, 12 Jan 2026 16:00:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078ccf4sm16958219eec.16.2026.01.12.16.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 16:00:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 16:00:25 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: Convert aspeed,ast2400-pwm-tacho to
 DT schema
Message-ID: <8d63c13e-15d2-4555-a110-4d446f3db314@roeck-us.net>
References: <20260109-dev-dt-warnings-hwmon-v1-1-f2a84cdb0e1b@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-dev-dt-warnings-hwmon-v1-1-f2a84cdb0e1b@codeconstruct.com.au>

On Fri, Jan 09, 2026 at 04:40:28PM +1030, Andrew Jeffery wrote:
> From: "Rob Herring (Arm)" <robh@kernel.org>
> 
> Convert the ASpeed fan controller binding to DT schema format.
> 
> The '#size-cells' value is 0 rather 1.
> 
> Some users define more that 8 fan nodes where 2 fans share a PWM. The
> driver seems to let the 2nd fan just overwrite the 1st one. That also
> creates some addressing errors in the DT (duplicate addresses and wrong
> unit-addresses).
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
> Hello,
> 
> This change has been on a bit of a journey[1][2] and was eventually
> integrated into my RFC series tidying up the AST2600 EVB at [3]. Rob
> did some further digging at [4] and I've now addressed his finding
> there.
> 
> Much of the series at [3] was merged so I'm splitting out what remains
> and peeling off the RFC label after making necessary fixes.
> 
> Guenter - I've included your A-b tag from [3], but as I'm sending this
> to be applied through the hwmon tree, do with that as you please.
> 
> Changes since the series at [3]:
> - Update #cooling-cells to 2 based on Rob's observation at [4]
> 

Applied.

Thanks,
Guenter
