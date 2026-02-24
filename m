Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F523806B8
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771946759; cv=none; b=hyMiTofEsZHt/QrYS5mZH2oDtt5BX82qMnCwfhUVM5AMnkaTXnU+EpzEJIInMVGAAqicd7sTgcueUo8HlgQtuhi5kM7dpsO+D8XygaA/xFfFqh4ujzDvF6TkBuU1HbsAt+lam1v4omZDng8QlAlsh3X5f2LpeQ8yqm9OKUsiA7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771946759; c=relaxed/simple;
	bh=QnbAFPGFthzvasBmUjYWWjZFAYjww/ilHVXgXGc5JRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRQOTIIZyvlu3s5M64Q/+an9sGEI31S0VAyF03dSeL60v169f5JpHbXAWGmphspFAOqhaNUvRVfWEkdB2gFVKtu57SO6Zpy5XNkj0QeTQ9HwRAedopCRLriHuvwMm1FGscTstDYwUMJhVS3HX7V9qXdJXFsX+qqC2NwCMZZqoFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aN/i+j6a; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aN/i+j6a"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12713e56abdso3734498c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 07:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771946758; x=1772551558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrV9BhMxEEs17TmWJHa8CNzBUwr0TwzU8O3qC1THpDI=;
        b=aN/i+j6a5JD5cyFWNNDYDTYXIAOZOhLz+ChjE/yEnqjRkzrNuNwkcbUNECkqJBg1pE
         DFTXvgJkiTnXeZs6X3rsZ9C2BHAbOU567iPIiPwpmFUzp745ZQTOaiq0cSlRYthDDE9c
         Cxsn8h+8onogw4XCMPNJLQJcCiPLBWbnZVobUlOdIx0gm5xIEJUOlthbEWG1AV1IpQan
         1xWpF4GOyaC0cJ42rgsNE37sGPd66fqpT+AACgpPEl5yezMuhtV5vxVqV/Zo8088lF9C
         A0d/3gUDI4jTs8s+q4RwNZTS6FP+rUHkE6Aa44QKSOTGANwBOAH5EgyhFfctmzkHKXKj
         86ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771946758; x=1772551558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vrV9BhMxEEs17TmWJHa8CNzBUwr0TwzU8O3qC1THpDI=;
        b=orVZ/ZdQxFHpxvLNGjUTGcm/0Gu9bmaobro/cCN/Dlgh7zyqXhwVIXkbjcvaMKEjhS
         fsmKoyIhtvcxKbuyb+uGM6kN4/jvJh4CrcEoncbEJhXkMDD5TwYJZMT3vrn7g4GnDH9P
         ZepIFfEP1oKJlIqJLzdplu0ujSj50Wmhwqip6XyQOTPSxgybetYKcTCLUpm5aNZ1p32Q
         62UnhkJTrLaELX4chOp3nZ1kwPr1kF6WCfeqSxHp+6hzntDD0WBBtXuoPey8LqjhTZkD
         bw1iGWbpKtVfwuBb5jB+pENA542FpmJrxQHDwlmERpuTVyRzu3XRRV9S+yTxftxlBMig
         8zAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzHq8afCYcbctbknCj/k9hZl8ebT92XAlYna5xJQCGnMqMwHxO9izSIfI4iqc+WKuI4lFgzXyUPrpMUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6YCAbyf+JERuxWusDfJsVtzUyMhAbB04pZmPpNjtTGoxA0CNU
	UM/YAUPdfIkRPwG/AbiBj/2KUah4+89z0ofrF2QNS/oYJnQsVfUwwW2/
X-Gm-Gg: AZuq6aIXanMAIVsPHfHFUxedXnP/p7V7Ij9QuJKHUaBCJ4fKDDw7SNppQLio4OdcGtA
	hHmTwW1bEJM5H5vQP/nP6ootY0KdKAv5JN0CeKITX6ufDi5L4oOWNLIPufE0M7i0eaxVgH9qa0R
	+HS9Cmc+9jJssWME9EtdHdjS+4iwr3DlbYJmoUMoLnBMtIiDMGKg/BHXkhR8WfhEXOnk/gvrK6A
	GKms1jt5j9vJeJ/aZHRRDwZXBVepQrGomQuukET+MZC1xjbD/8hpd5Kpw1XsfjvkNt4mCuP9WpB
	LPCxFvapgCsMc8ze5CxaRI5h0f61c6uj+rV8BGxGOLWWGEnIocsD89UYeKdJKX3RZfUXZ32Y2IJ
	ndrbRu9jGrbeGbR+1H5vkzdYt9uB+dFGxbRrKoceDZzt1f1Ltjq+Fj4GTvIArK/eaBPGFhAqep0
	rL+7PnWAjyPQbaFqWPXXSPDmU38bpnBmuwPef5
X-Received: by 2002:a05:7022:421:b0:11b:ca88:c4f1 with SMTP id a92af1059eb24-1277f5606afmr123769c88.20.1771946757470;
        Tue, 24 Feb 2026 07:25:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7ae99sm10658338c88.10.2026.02.24.07.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:25:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 24 Feb 2026 07:25:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <mwalle@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/8] Revert "hwmon: add SMARC-sAM67 support"
Message-ID: <05db17b0-d9f0-478d-bbe6-1efdd9802abc@roeck-us.net>
References: <20260223100459.844967-1-mwalle@kernel.org>
 <20260223100459.844967-4-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223100459.844967-4-mwalle@kernel.org>

On Mon, Feb 23, 2026 at 11:04:48AM +0100, Michael Walle wrote:
> This reverts commit 443b39c82c322c9f3c38bea0389fe927ba00b3b4.
> 
> I was just informed that this product is discontinued (without being
> ever released to the market). Pull the plug and let's not waste any more
> maintainers time.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Applied. Please let me know if there are any objections.

Guenter
