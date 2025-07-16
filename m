Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8852C15A4;
	Wed, 16 Jul 2025 20:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752696728; cv=none; b=bhDotrbkuVylTvjWvOz25YdN1xcamLUTauHqAGRMk0+xFAvUZdKaXCooBHYlFIZaJ+Thk5Y96KWaWAMToE3YrH2oUGjwROFKxKFd44CRcvsIgBA+5o3VGu9Sa+13fN1dvB9ZcagxIIdyt8fdI5xtLJdk2CpHxZX+hnLNGZ3QXak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752696728; c=relaxed/simple;
	bh=xEV8dTg47n84pizCdm3LrFPREs2r6Oli/nIkx6rR3Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMJPSLrpyNKA75RK3YB+xNmWRKHEY6cAt8e7XJXkSSLY8UNzuVsk0gfChBq2+yTSme0RQWfsST/lkVxbMZGTp+BF+t9geM8P/je6oEFQH0moxA2EATnrl5p2xzhwkfPySJ5XmHRqXUIAu5ss7uaHwt7aGp5aUhEkhzl33LYtzgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJPFz3XR; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJPFz3XR"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3138e64b42aso338611a91.0;
        Wed, 16 Jul 2025 13:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752696726; x=1753301526; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vipzSYSc81I30V0apAlpwktAqigNP+wa8Cpnw5FDdjI=;
        b=VJPFz3XRLSTsbsTluF41qFue80gQYBOOnxx/1aPWa5CmNIt5W+wj5VYRmdXZN3ukaM
         V7g1kcBOUCP9J6WA2AzHYzJNyq5rSJhqKkBd0Z96+NJQWYxRJrMMYJOPjR/ql4vlydq7
         jg99dqZkgPk2ZNLCMI+gySb5/DQr6I9qK6vzE7+05zBaFBlmcWG7WEcwsw01Wv4P3e2k
         VI7rdy/u63fVnYsUV+2DDh0tkYDv/LbokpR7I3XjjvvmksCQgOXPVR2x8nrwNyYDdNti
         XP4/EoSWoGgOMLKNSXC+SGGv17QOiEyDvKpSmYZSdSxxYivLBDqkg9PhpbPFqa+uel95
         Dd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752696726; x=1753301526;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vipzSYSc81I30V0apAlpwktAqigNP+wa8Cpnw5FDdjI=;
        b=JIu0u/WHAybfacu0Mvd2fAbDCPcFg9WQJL+KOzuY1FxiZnzo3qp1iT04w6STDWrBlw
         h6vjbs9p4KnIZzKfaecRxizgh2zbTfqGrfUYAPOpeq9+ot+mh9ypYAO/aCx2Djyzulfp
         NAvu7CX4JxynnEqEIbxZwJFle0gZ1p06ovYZKYx9udoYRmld2mCA67y4JDKXQQr2+Los
         yyQWSiXFol8wtlMf2RVFwxbXOMrsbhOSsxCROTdwF4wWmROOpQRK/YvmJuK0D1zIKf7Z
         NL/gE0RbeLKfxChTHHPb8DnVyEwLee2aR+Ef1TLi/EFnuUkx7AE/uoGg3W/szASkjAa2
         n5Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUNKzlf9JCu+Az8ZidINLrQp7Ko2xxVnrbzfOz02DEfDMFD0BscSYGHa/W0SS6ZOFcYnGlg8LrNhfxm@vger.kernel.org, AJvYcCV4k4aNpgKu5tHRAkZMkh2bi1pCiDptBOLPcD5Ve+P3b4L8hY2n3OiRuZ8uwAZIAxMlFAhYXIVc5ROgtrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhtO2qmc93aJ2YXBxacuWJCsEnzjQZHJERbCBQdIvOQDIfg/EN
	8Q43n1GyuwCzToCWZxOyhVV3G2Ft+5Zr9h1YiBb7Caz3d18DesqgL/92JmPtSg==
X-Gm-Gg: ASbGncscrdPx2Nqg+F6VE6dN0oMhcguKo5nV+F6vfQtL+olLvNZ6Z/oD12OcAkt50Mf
	ai3srfpQ71nCCoruL0l3matP1Cic8fov4oZIFNPJriGGXN7yeQnXqbGLduQaqt7h5/Nkap9AXOq
	K2MZrjR/XD/N7kyw3xfkJAglsgMHSVnundq2oaiA159OZY1bURsCb8kT7PFCthgOddjKGCoHlED
	WjbOOiDKLNvG+guquAXz5ziAmVZ45f9SlBxUIt0aKOBbkzp1waO978Cpv5pdG7cZUuBpG1pGTwA
	uA1kR/HjL0PTgJ3ctTPhMIEV5x3dNwyY5k0R7qQTX8kNO7Ji4GBj2o4URqDB2h/O0KsrCVaCb6u
	HXIa1cuWyNh4kXtm67v/Zmo4lSNkqwkxJPt0=
X-Google-Smtp-Source: AGHT+IEC6MPswG6VWrrkgPXqEuI0xKebntwI/qZzconfHyVsDtGrjOx2QzNdKsg885iAPj6dgvkORQ==
X-Received: by 2002:a17:90b:1fc5:b0:313:f6fa:5bb3 with SMTP id 98e67ed59e1d1-31caf8f0301mr373047a91.26.1752696725998;
        Wed, 16 Jul 2025 13:12:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf7c3729sm81916a91.18.2025.07.16.13.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 13:12:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Jul 2025 13:12:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: hwmon: adt7475: Allow and recommend
 #pwm-cells = <3>
Message-ID: <050156c1-f702-49f3-a620-987e0254530b@roeck-us.net>
References: <cover.1750361514.git.u.kleine-koenig@baylibre.com>
 <77895aec937b6217f513d3b12e7945f1707fd906.1750361514.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77895aec937b6217f513d3b12e7945f1707fd906.1750361514.git.u.kleine-koenig@baylibre.com>

On Thu, Jun 19, 2025 at 09:37:46PM +0200, Uwe Kleine-König wrote:
> To make this binding match what is usally used for PWMs, deprecate 4
> cells and allow 3 instead.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Guenter
