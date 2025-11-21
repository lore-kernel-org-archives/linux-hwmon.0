Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7532D47EF
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Nov 2025 19:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763752875; cv=none; b=WobF4d3ZxCw0lh3pCQDyhF2S6AM7xCIWrKYj2vKVsx9KmjkWpyXL1sFjVmNpxRP2O+Z59VefXhn0xRNTh44YRx8NwYia+/uiCCA3DTKeHQuRZLxEHXy4dwOw6EnS4zVt5usbp7VKdsgDpi6mG/00XiVu1Gv8vUfMqDGzVE0z6z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763752875; c=relaxed/simple;
	bh=74G9Xc18v1RypEuwD97ovxP6vhEte6101GCpELdVz84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6iSGD2OtUISmceGFC+wppK19J2cTESkt6nvuTUHgtNcIZEciNJGG7vq7ABpU1nU+8+uyl3h1uSFdJqy4Osbc6G1e++81t7dcgkNAw1Y978FxjmshnyyBz+EuuQMPisYvrjs+zf4fRaUO/BBstIpfSRPMynY5u0ZdoF71MuhaRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dV1gSZbj; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dV1gSZbj"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7baf61be569so2716504b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Nov 2025 11:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763752872; x=1764357672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuwsRCiJEfPqcQBjl8MxdvP+p6un2px2w+qwWN+KPP4=;
        b=dV1gSZbjtJMTIEC8v1mwzI6oPFvfBOnQegiolLYzTddrqUSn6mBJbMPrRKSTMfY//+
         ASZMel9F6x+gd15fpNMMCBFLKRuXcaqrrWj5Ybkuu06Fr+ZsEoAU0hjByT5Xl7kTJ+FJ
         Ia9szNdMQXWC7lhoTBwzEJ4TKQRGMV0t/V24UVCKDocyLLmfJTNCKOA6X6VRiKA1/IUN
         VBDNbDxcpZXvicmk8VOUBbuvp98JkxL3/nX00Zb+VaUwD4447jlGzU7EKw6Z1UtzWNZE
         dKqd83VKv+lwCmFotIAA4vKaia+8LRz5grJQGzo5katxe8wXSsVRyPoJxl9KfJCsuBhs
         2O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763752872; x=1764357672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PuwsRCiJEfPqcQBjl8MxdvP+p6un2px2w+qwWN+KPP4=;
        b=EIpod5bWS+Sq9A99H7/R+KD/XKsehdVHs+pZkmJSrnpQoH2IDM4+lgVsNYuE0A9hDK
         KcRKa0VvFLpIKJscDBh5QjlfN7sQyWdCWzgz/tDd4FkQLbkYgfEYx2keql/WQ3mWB43b
         bx/vGQeGKykzFdPoNZ3KKhWWS/PAnJUTMqKSc3XImskR2k3Znk5LilNM9A9kZlEJNxmM
         mxfhaK4VSGMEE0E5UKbTGaT1zvL6OxqdFZ8z9vx1uL+UO8HoNWKvHBocnw4i2g3N1sXv
         vaIbgtL8eMRAZdZlg+RJyR4KUnYbYmkOVuVrdR1VK9KR8Ekjuv7OtGhIaBKFIg0ArqXn
         5bKw==
X-Forwarded-Encrypted: i=1; AJvYcCXIQQ1lf4dvdjhGee5jQNES7hq3PKmwPiTyfYBnuS2rSK7KmLR3hkjUgEcX/q2Vq92FwmNGD36TxRCBXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPzdDwwgUtTMEpDTL4pWtRYPVLEArr1DMcy9lBqxJWxuQMTHnc
	tjro+RNDB6kyMpp7sB38LC4vfUhiSnt65Z1kWSJhE+ZkTTzBZG6Y6tEB
X-Gm-Gg: ASbGncuOcva3cnbSmjSTf8i3w08jvCWVoDKutMvIReZ7e/AZajAyKd6q+NhjoJeq0kL
	CYy8D2mXmmAM/HJ26yXxOnKe0wHMbZR/sYqKKJHl5lvZsWfvJCyjsqdblE2OnJpLAdsULy/LwnC
	now85j6X01Rb1KZzeW8sHXnQDwgtMHPo6HsmEI8Qd3iV2+fbXpOSy+bRcPbjlpC9JOapt2w2mSQ
	+lA0m/nhftSjKXiFYyq5gEyaY6HuRfzCuFFWSldRfMYpkXfJ+5TtTVl5wyi70d041NO+hU2zkEe
	7PbhooW5ILV7gWtDtkeahckSoPgaU8we9atjFQqPaa1lCsYRwVwCPahTYTPtFHRiMd8as+Y4eAw
	XWfz25MOk4uhww/eoarjBzskkMXdd8ltR4uLwo7lPKjiPEWuLzZRMHnx3VUbd+tYV9zpqNcQCqU
	gyy3soyhIHV4jsNf9jn4HbrO8=
X-Google-Smtp-Source: AGHT+IEL7H1VBi7kwbJmZG3DtyIxfrQ9k12/GSEXJJ2L83oQNAI/YlBkWdpeqhPFCdtjoHJfPOpsbw==
X-Received: by 2002:a05:7022:6729:b0:119:e569:f258 with SMTP id a92af1059eb24-11c9d70a16emr1089561c88.1.1763752872115;
        Fri, 21 Nov 2025 11:21:12 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc204881sm25316159eec.0.2025.11.21.11.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 11:21:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 21 Nov 2025 11:21:10 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v3 2/2] hwmon: (aspeed-g6-pwm-tach): Add AST2700
 compatible string
Message-ID: <30d139b1-05e9-4629-8a95-95991849fb03@roeck-us.net>
References: <20251120-upstream_pwm_tach-v3-0-eaa2f9b300a2@aspeedtech.com>
 <20251120-upstream_pwm_tach-v3-2-eaa2f9b300a2@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120-upstream_pwm_tach-v3-2-eaa2f9b300a2@aspeedtech.com>

On Thu, Nov 20, 2025 at 07:12:32PM +0800, Billy Tsai wrote:
> Extends device tree support to include the AST2700 chip variant by
> adding its compatible string to the device match table.
> 
> The AST2700 PWM/TACH hardware is compatible with the existing driver
> implementation used for AST2600.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Applied.

Thanks,
Guenter
