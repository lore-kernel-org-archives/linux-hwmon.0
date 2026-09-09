Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7263C0602
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 20:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985703; cv=none; b=sXUPlUJYqWlKPBBmrfQgdyEDXFY6dymCB4zJWqAxA9p8sycaI9FXP1mIscjqVyMyCNYN+WVON8L1TiZKLhbXhrxNwK6SJHZoHsNjxdZfg/ClHC3f/oNub4PurGHuGT3GKfrWHPRaJqQFwBrBJCipzVZ+xvF6380rqryNAExYsoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985703; c=relaxed/simple;
	bh=W5JXtiEI1GAvGT/64QMWOtm3bVHKWsvJdYfasU41N9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YB4r0/ecHzzO7xUku9yyNff8HC2DZlf+OUXxiFTJYjxlbbd4iMi9oun5aHKyMBgD6ln20LJK/AoV9Nb+EwrMKJ9zNigXWE6sNmBOer/dGWcBEduyiOkZWPZHUcogKmBExr0fsql56+6CiVKge+dTZvdYFP1wsIT95m+8LUuTVaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gt8ZOElh; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gt8ZOElh"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381b831d535so9875417a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Sep 2026 13:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985696; x=1789590496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DEzU3fsaUeqKNU36+P/KzrJW02m3H6Ngnj8OsDYtm0w=;
        b=Gt8ZOElhwjuuUxUcP99/D9HeSgGkHyVSX5spNNTrK6ezlxDH3kYrD3FuwgXU4sU6Nd
         etRG3UdQTh7Jiy1SMrLYPF0+BYVvMx73BxsZ1zguDnCKAshmUSv4WMr10mY4Gh2+cBQA
         qS3CImtiCwKPdb7Z3U3h81TNLMEiMIeoKs/xcDvANqkjBSDrDVy87PU/5NLKB7OWj09f
         yvLswRdMwbjScOrcMJgMA9wAn0szAVqU8kZdpUCXj9jWL18SgRbDJUoYHIF0Fsll4Nuo
         Teldl7MITb5D1h2KcOIRt3U5PCzcKj/ltgrbwVprPisdmDn1tJHj2eIaCQwyAQDyhlCG
         dtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985696; x=1789590496;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEzU3fsaUeqKNU36+P/KzrJW02m3H6Ngnj8OsDYtm0w=;
        b=hi9GidrVTGq7dwMaFOYBIpZUnqX377NuUqnpQzY1fg5n7WB9jbXu4/TtYGX/dXkAmM
         qxdekr44vzdSrRjinzumyq8KdT4LXrO4cu/ewMmsmbeSj4Ki5nOYDpe9x1Dv8owcyq+7
         GnEKuHEN/eAzIwa2Kcdkk8/y4x/QSiNJQwILLsYAyJCfvm/lLJh8V8JRBtvSDVORflND
         0muVh8dxhDC3wi5ZuHmyL6MFGq4l5HwHNdPXfhmd227g/AWvzptECqf0mMK2qPS90ey9
         6Zpg0r+JwE/sQPcBZxIidcw+HHqFNwhq3jjEkMd8mN1GV4v0lHicYCsbZMjbS5xMNlAi
         XFXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjb6gWg70kkzFwGjrfHbdPtmjlE0XJO2PGgpeHB2d+uPw1VAYsUfViXhGLbbx2w69iDSncOOv4w/wwzw==@vger.kernel.org
X-Gm-Message-State: AFuF++lQUQjfEaFuS5SYLJms2RT/7Rn+qx146JIgpHNV8mwH3l6oirWb
	zPBln3ANO+OfMBC7FrApXEQ7edxH7pC2K6JYEP5PkvFUSBe4bNEQTlNv
X-Gm-Gg: AYBFou1iRLfHPnHkMC/wagpkN4usPdSDa5rGyzp4bYwY67uIIfuNkiZfXo9TlHjVPwC
	JzPcAAkGqdlRzIoUwB/arb7hTAgsl0+sP2MFjDpcAZnWf9hOToUJ9KIOUIsxddjT6YE4YBmduR7
	GrAnyUyc3zo9JrZzGOVKelA1mghReKqhvYwy6Lf7T+8zQlhyQYnPChdX0JLcQ4HPyhgpLCHt+wl
	EPBv1y/br6crcCHOmIPzR7R2j/lEDdJYGwoiOp7JBBDXnCHX980Xyb7FCOIL7sDxQ5gOAAgvF9Q
	cjxw8OL1UNwwz5ittt0J5BFWMIy6P/tiJX3rMuyWfiv4CU4RuXDVNeFZsnuB07AS8Bk4afEhvue
	5mfBKIU6xXUkzVq4XcZA3S2k0Pwl12ijV2l6oAZlqZCNZ3aGDgo6h//qg2govUtmycieBNdMH3s
	HkaEHe9pE7tAlNJLiyRqE1hJaDGiBROtwqB/CshT1wqO13JeqJJMYxqEPBF9hUCIe9iv2PKO+6H
	UwZmbVkVp0l
X-Received: by 2002:a17:90b:43:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-39b26141c79mr58732068a91.11.1788985696439;
        Wed, 09 Sep 2026 13:28:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d77388944sm1156264a91.5.2026.09.09.13.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:28:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 13:28:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (nct6775) Add support for NCT6126D
Message-ID: <be37aafc-6b6b-478e-b01e-9e6f0a932608@roeck-us.net>
References: <20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com>
 <20260909-bootlin-hwmon-nct6126-v1-2-4e85615fef10@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-bootlin-hwmon-nct6126-v1-2-4e85615fef10@bootlin.com>

On Wed, Sep 09, 2026 at 08:25:55PM +0200, Paul Louvel wrote:
> Add support for the hardware monitoring functionality of the NCT6126D
> Super-I/O chip.
> 
> The NCT6126D hardware monitor is nearly identical to the NCT6116D: the
> fan, PWM, temperature, TSI, alarm.
> 
> The differences are:
> 
> - Device IDs 0xd283 (A version) and 0xd284 (B version), which both fall
>   into the NCT6116D ID range (0xd280) when masked with SIO_ID_MASK.
>   Instead, compare the full value to distinguish from NCT6116D.
> 
> - One additional VIN: VHIF scaled at 16 mV/LSB.
> 
> - The fan count limit registers are documented for all five fans.
>   Also expose fan4_min.
> 
> Assisted-by: opencode:z-ai/glm-5.3-flash
> Signed-Off: Paul Louvel <paul.louvel@bootlin.com>

Signed-off-by:

I can not change that, so you'll have to resend.

Thanks,
Guenter
