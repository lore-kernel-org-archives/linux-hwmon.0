Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B3334388C
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 16:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935798; cv=none; b=jBfcM7Y670D2LabyNwPALRwWVy2PJxjZ7kcCEI6WyioG2C2GJmi+gSmEi/urYig3PX0KiVQR6ncpF04Woniyf6DOJ3tcPRa/kHpe8NG02N3o1nVt2lrujPRUCMlwYYxl5isgOWcoWbmKSTm+W6XX0OVyQNuaG+LOhCNmSyTJeeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935798; c=relaxed/simple;
	bh=8te2zY0sO0aPP8QOfw6I01FBJQIKoZ/+eGWsj3nDQBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6cPaO+IB92o3BNCaNQKYrUQPApVUc2XTdJQ9V1H5UC8TpbZdJ7c7KUnBNcbRVHiqbj8fGLN3tO2oCx7acR/rIAluIcVsz77G07xOv2TuEGd/SimbH0Jbm6z29ghlG7Gddb/fLzd2OdyQASEE4wjJeDlYKUOu/y5XVm05fS9gy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HecMdCPQ; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HecMdCPQ"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-304ec41197bso4196767eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Jun 2026 09:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780935796; x=1781540596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xyJaeMREvFPr6MLUgM5itNfuv/IOwPcbYOyGoFxcyk=;
        b=HecMdCPQ1i59lPU4qr4EcAV4/1QRMh/G0+Oujd2PN2batwOOL2slTM2LLdjI2iM0mN
         vaY3id9VHDiBIu1dzLtiIhxpHAYYH2jTO2hwRH7yTJ21NnecTRdKw4rxvTDUCcs/BDml
         ax/WDpaAYO8Q5qEgjEtE1CNYywArc9zs+CihG7jI9PhyrwTII/eHfHfrEZbdh4CorjBq
         9Em6R9DNX1da4osXiTxejefUqBHPw7g0bCq4zJ7FRh7lTECxrKaJjE02uJBnULpAltlo
         rro266xoBORRXNY7Z8y8wU61LwxzW/f3vBjG9vgN45XJ0MA1uNSPEEh+Jv8xTTmzZ6x7
         h+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780935796; x=1781540596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/xyJaeMREvFPr6MLUgM5itNfuv/IOwPcbYOyGoFxcyk=;
        b=F4oP2dKqc+Uzhr0wnO1h/bcdwfgdTOUUzPT68bjoJncoWVpTcH1uaaQ/A50dViobQY
         GztgnViMLG8KJHmmNFOIaato8DaOBZ+4P2dobc9YSeTThzAxlYORLDElm0dJ0gNyOFSC
         3r7/C+v4o1IvliyFYNH29ET9i/avI5c9MdMG64u2TI0RnL7QLg4p+M1mChebEi1h1DQB
         qn3rb0RFvsAAyBydHgse75cjQ/VvXULvK3MeY6y9nl97VosWVD1hS0RXNiu2hIgRaIwz
         KCTVPmRGkTuYtU/aPgtyE6NSjL/mFmXLbhMH+HRPgzqERMQ1v4eY+AxRzfEvvQlmUTPO
         kRsg==
X-Forwarded-Encrypted: i=1; AFNElJ9xI4aMVrt2Ny+wxoULY4VhLtvfIStLyft0l8vivuufSwGskXkWwM8gwWUBdRlAFd2VElrd+4Jby/2+AA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWhwq5brrOQT2fgNwJ4vwPtqKC8nRoBnVpt96MJL+cWs09g3w5
	TOuq6i3fPxt/d8x5mVIyzzmuR594UYytnZ60+2gG8hwy8aaM3cMnCqVL
X-Gm-Gg: Acq92OH6PGwnS/iobPVysjtfgSEbm+EbA0rDHl02WzWXtRXMxw5IBNANr7CX3D9t647
	3WoX0iOgWq8lUmIGSyFydfczd63wE5Xmv64wsAWSMsVlEmIVuFOlEY42LlWDpqRM+nuELr1g8Wb
	A1zoEg4vefprrcdzZnzBE7qgXwVIUTm1c7fFPtp8MP/G3rqUWs3fEGLiflYHKS3w32blj4vJyql
	ksL2/g+x0LjkahtKxqd15tD+ITQ80gSr3DePn8UKXXSRFbHylu+miJXl7fKtjxUCra67HLOJGYt
	MjrEuJHBnu6PKpXYU/QQG2PotxFGdCXePMN7Po8/iqNkNXcq/IuPoKalsocCzasGce/UU/gi8fR
	ZU1I1jdl/yibOY31E5PhUAnapHKqUTPqEatzNPk055rWRKF3CZ4NMpX2OIx457tWcUiNJRlErBa
	Kfy8Sx8Tv2ZO8JRZgM73eoeBB0gk6aDSenRto/oPDanDtSA9s=
X-Received: by 2002:a05:693c:2c01:b0:2d2:96e8:1bf5 with SMTP id 5a478bee46e88-3077b32a4ddmr8991673eec.3.1780935795967;
        Mon, 08 Jun 2026 09:23:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df64eb9sm15724340eec.25.2026.06.08.09.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 09:23:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 8 Jun 2026 09:23:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (adt7462) Add of_match_table to support
 devicetree
Message-ID: <49e962ce-19ad-4ed8-8fc5-3924f87d430f@roeck-us.net>
References: <20260608-adt7462-bindings-v2-1-272982c40325@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-adt7462-bindings-v2-1-272982c40325@bootlin.com>

On Mon, Jun 08, 2026 at 05:23:43PM +0200, Romain Gantois wrote:
> From: Kory Maincent <kory.maincent@bootlin.com>
> 
> Add of_match_table to add support of devicetree probing.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> [rgantois: Removed of_match_ptr().]
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

Applied.

Thanks,
Guenter
