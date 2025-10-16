Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09A52E0928
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Oct 2025 20:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760647550; cv=none; b=V3/bkpsBEuD/oFwTalx5ixGBWle+Q3lVE9FLn8A/4YWF/TRyuUqRJ1Wojq85HfIeV0laKlmbzuR0yoNd2+GeV+pVDcpiaRFpmJxE3Uf2b7I5cSjfaJ5R7kZ/OkeJp/yDMNepgAa51fSNrGmT5zJI2sqdpZzepPUHBESUrX6fq8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760647550; c=relaxed/simple;
	bh=vuWYntITigM17Uxos/gnhh7/TGTP6biLwyfnGBAXwc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lU1iXUxZ62syxeJIRK4KNYHl8YmA3BP+6RtBTDKwJ84mK04WJukJ0pB5ChgkQGgO7qtEGECBUfM1gTH/xprw4r9vbyl8XTRhFevgVkC++10mkDBWUQ246bLgdUVVsDx95ahA4rCdn4PXSdGSGKmyGowrG4ibJzeVXXNOyTELmAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sc3seehl; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sc3seehl"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-33ba5d8f3bfso1155965a91.3
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Oct 2025 13:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760647548; x=1761252348; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KacH2S0aPS0z8R+x32QNIGxVbnPy5l4NrAbTjwCBOnk=;
        b=Sc3seehlAFFnyih+zDchRbExcYOtRqcambMNU0voht6lTgyeG9F+kEO64hU/MrgsV5
         Bs+/HstyyEiESwo/e7GJs3LIFnJKq1fuGnxjnUypEIrMqlrl6TQUvlDPAQtyuf8pqcDE
         X4VmiyEGiAJwdpomhOAdBNE+XCkCwPjTw5I+zMX29bpqILdAES3HOZkYOqWJ/f5E8RLa
         eOTmmUABkQbvSz7IipsZbZLYeqMPqqY9cBRval1xVmuU0NAVQxPlrlr8BCXu0MsUXVl0
         8Al02p7CTDJJmd8+7Mo1C0uD3rYhKaL402nkfhwJwW9lWwfJ942EN+sfljvcAnJNW/3f
         KDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760647548; x=1761252348;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KacH2S0aPS0z8R+x32QNIGxVbnPy5l4NrAbTjwCBOnk=;
        b=cMG8F946ldBrQImiHw6LHoCLp6PuRj1SbPl2Stmn9xV+ScQAn4AmHam69UeMOMf67g
         wKKyY1n+CY6B56AXljfXmCfvUM3TAk9pxO1EZfGK9nctRSP2BM42PXPp2ZC1/nmtBoBu
         B4mEBSJhqYg8dSY4jjx1E/VnBZEGzOY2jM0Ow9sN6XTAoxIbKcs/yJFkM07XtzcDeWWB
         Ni/sJCwwuoeDc2uYFMJ29TlPJELVU5icIabyEn+ksARlJc+BOFRpMYDRQQLaTY3PB3ua
         GVl6JIUkIHTP1zXbzmNAyT5iqOvBVB1fkXGX+pT3h7eux2RGRCriRA4CyC1eeW/qquo2
         3ILA==
X-Forwarded-Encrypted: i=1; AJvYcCUag9fhyo+QHIVy6RsOBkrcxDyM4d55DYPJ465BKWHEBcejevWmFLKkubAgQUUOUIo2b9VukrjYaGvABw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLwJxDWPjG8U/QUXZXq5cSA8vgtV6WULicF/qyZrqmusxkHwIS
	wmV2IAPYc+Yj4Vp/5oPBUWSRYfCp9oGNAUFkIIzeLUWDrfVfTJk3CiWB
X-Gm-Gg: ASbGncsXeNA6zbT+5XtbhPSdqQTuQYohHztFHZgg77RX7D7kQUZcp6QM3SMa6ssFrYV
	qvnNvToTi7Pj6UmOLS0XRfY2Qer5gMFostQ//NkcCxSBNmDqBkF9o9CIkhXpDR83hYqmqD1DG5B
	w61+9DCdHCeO+Qzl2AkgviXLcwQnsyr0MKMrG9dBxDEwYE9wsxXFp4rBj11j9q8eLYqkflMEd6b
	Gs7Zvmg/SzCKyatBKkRiQCK5R5rFnjUtx3lNpbR/RiRKjH1L3f4dLRqIvbfb4YWXUDCMorvSeBa
	TYq8TLlxT8Lgr7juhvncR8nd0cqqsegiW5gRJ6nLzHcE7G+1hIhrF6IncNTgZ4kXgdny/Jsqr9x
	4yqX3dLlUA0oQ6PipKYXOnMreW9oaVrb58g91/cAN/p7IdB0rZoOatI5igEK57BA4U64g/O8tTp
	NljCKP3s6YKL3u
X-Google-Smtp-Source: AGHT+IHVzP7A1c3K/jJLirP2tUltPrRMNAxAH1YDsuuq4Mu78bpBc8QWu/jyNpybBNXUbtk+WWslYQ==
X-Received: by 2002:a17:90b:3fcc:b0:33b:cb9c:6f71 with SMTP id 98e67ed59e1d1-33bcf85a9f4mr1194137a91.1.1760647548158;
        Thu, 16 Oct 2025 13:45:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bae2739a6sm1616142a91.3.2025.10.16.13.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:45:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 16 Oct 2025 13:45:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/3] hwmon: (adt7410): Add OF match table
Message-ID: <f05e4643-c80a-4a64-a0c7-19b5ee3f1000@roeck-us.net>
References: <20251015-dev-add-adt7422-v1-0-7cf72d3253ad@analog.com>
 <20251015-dev-add-adt7422-v1-2-7cf72d3253ad@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251015-dev-add-adt7422-v1-2-7cf72d3253ad@analog.com>

On Wed, Oct 15, 2025 at 03:52:20PM +0100, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> Add a struct of_device_id match table to the driver.
> 
> While at it, make sure to properly include mod_devicetable.h which is
> also needed for struct i2c_device_id.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
