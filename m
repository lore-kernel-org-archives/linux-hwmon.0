Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4C32139CF
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Mar 2025 14:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741010606; cv=none; b=BVMukblRPyw/RvjBV/gLp3D2FbfcQ11i9gqO8x0wybG6xA93kQvX+ztXB3weHU0zP7/ot4SlNnifjKdnfgPUVCGkvBso7Qw0WGyraeltXTF7Zzk9KLGWIijTFeylrdt8au+Ipxuq3yndpUkcMWAcupn8HkVCIPU2S31V1FiRAJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741010606; c=relaxed/simple;
	bh=eRKQ/PNWl9bBUq0EIeJ3y1y5BA9lbgCfE4DPyEcxNw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHCU/PBCsP4OAKGfv6u9zwG9pGtpTV8V2TMY1rNvCDWAfK56boZYHmCzOOKKitYZFNY3SEBWITaze2YlbOzKuTqiJuCEleD7T1BByXwm3UXLIFBbJP3RDXYKxgXBYSJvyunZKd5Q5N64Yri7tMd4XE9ZgiDDrU3kD6/BmIjh1O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8l2NHQe; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8l2NHQe"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fe821570e4so6379317a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Mar 2025 06:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741010603; x=1741615403; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AxrwlSlpTNtF3oonyUmaJzs1kyeL3BffFBvP6uCJvkE=;
        b=d8l2NHQeEM0C00t1AuWcsTVARnCg9KnyQiIiyzTMXjoaKhZJW1XKaPWmzumO4n97ho
         U191NiGqZ+cD+3Gb8xMWEjkoUiCmCTfN9PEbSGKb402WWEDpL/D2nS4zK2bfHzL2bL6I
         vsFgdcR0JZgHMM1S04/PpqRF800TPa0vj6PupXHHb+x1fI4znt8rShDlop3wd6pBJVTX
         5gu2n4kByfS7aCcouctfoDJwASnhCZ4OdpW/i1pEF/2HBTrSEav0oiRMCQ6hB0xhlUSa
         FvdsPp6Iv4f/SUmlP2v4JcyrYLFAZvmUdtgRFZPlDZ6nAsP+mi7kSsc6Oy8+34A2RidM
         D0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741010603; x=1741615403;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AxrwlSlpTNtF3oonyUmaJzs1kyeL3BffFBvP6uCJvkE=;
        b=D2QUpHssJ/lHXR79Kc5wJf9U21kc/ziDz3FcHFVvVyxwANFCkGfZfdHqR0cgOeQaxL
         GBm11P+mBq9DwEXWHHZzOZE7CseLQx5ejTxGzU/Yqkq+ztRFozpvSMwMuduuWJGOdWit
         qbBOYEYNHnKAnHc0b3lcPo+84sSozvYtAN9w7oGLIuhWH9YW16qA5hrSoJv2B5q5Ivdd
         I4OfzqRzmNJWLega8X3CfXH7mCLERXYuTD8dS4z1/taknxDkkIDJq1q0rkaNeIz1V/vN
         CqzQwsYhQKRzqSQihdHrVOQKnAJNfNRhSiJ3QVcZsFmFaKtDxouYf63h9/csotk+T3Rj
         aoHQ==
X-Gm-Message-State: AOJu0Ywg/1dopVuw9jdfJ9EzuMaX6jaKyF9/PY/sMs2xWFJE1k74MJyd
	lmRR/O2b14DjbgByFGIAdKEdWuqza9XxqT3QZXVyS2XY8ggIU6/lQRWukQ==
X-Gm-Gg: ASbGncvAX9oFb3et1S80v+RYi58TcvL6dJQwhEctMErH/dAHghfUToGbH9GFq8P6FvR
	Eam8lijejAZ75Yc+/Nm5QGdB6Ed7N6troXw7cIIKmIi0NnbkbkJITKAvkB9Ta7JMqn1kVkKlztK
	RZCdI8KdN0cUCDRRG7D50dF6SZuvjLV/gWd40mDeQuY8XX/G15EumdOSHEIz8UFkJO6rdKcr3ej
	u1Ar9ZOEJ9bboMc08Vn/J4d5mmc3i8U1+QwziAi8lVsdfPEAbufRaXNb9OarqvEepO278wUMo5V
	FwoH1HM31yF/S99wwPzBgsFhksOtDLfxbYIXsUltSUGWFDigOqahtm52Kg==
X-Google-Smtp-Source: AGHT+IFEbsAgbYsRz4Er9h9Qz2TWVxiYraEvL3449gxDEctOUnGE3UjfXGwcJDxyppLcAuqPwUlBwg==
X-Received: by 2002:a17:90b:4983:b0:2f8:b2c:5ef3 with SMTP id 98e67ed59e1d1-2febab5e160mr22480944a91.14.1741010603352;
        Mon, 03 Mar 2025 06:03:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825baa37sm11147209a91.13.2025.03.03.06.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 06:03:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 3 Mar 2025 06:03:21 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Chiang Brian <chiang.brian@inventec.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] [PATCH v3] hwmon: (pmbus/isl68137) Add support for
 RAA229621
Message-ID: <72be61dd-2e8a-4c18-8114-5b7d4bc9f8c7@roeck-us.net>
References: <20250303083537.3312250-1-chiang.brian@inventec.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303083537.3312250-1-chiang.brian@inventec.corp-partner.google.com>

On Mon, Mar 03, 2025 at 04:35:37PM +0800, Chiang Brian wrote:
> From: Chiang Brian <chiang.brian@inventec.com>
> 
> From: Chiang Brian<chiang.brian@inventec.com>
> 

?

> The RAA229621 is a digital dual output multiphase
> (X+Y ≤ 8) PWM controller designed to be compliant
> with AMD SVI3 specifications, targeting
> VDDCR_CPU and VDDCR_SOC rails.
> Add support for it to the isl68137 driver.
> 
> Signed-off-by: Chiang Brian <chiang.brian@inventec.com>

Again no change log. Please consider this the last warning: I will not
apply any of your patches unless you provide change logs.

checkpatch says

WARNING: DT compatible string "renesas,raa229621" appears un-documented -- check ./Documentation/devicetree/bindings/
#139: FILE: drivers/hwmon/pmbus/isl68137.c:517:
+	{ .compatible = "renesas,raa229621", .data = (void *)raa_dmpvr2_2rail },

The new compatible needs to be documented.

Guenter
