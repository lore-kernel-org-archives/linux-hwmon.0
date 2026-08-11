Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814B83BED5C
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 15:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463846; cv=none; b=Sh1ZzMcPT//707Kse/FD6l08X7wLBVg31ih2iLLFW6nBImq2KIhKt5lndNCHyoHEKRqRggEE199DuAoORWxM3bY5vMeM7vsNT/kQijE7RE30Hm1JjpLRBLlhANsenYyazYGm1fRUntjwsR8JVcEu+FIqauDCUtq4+4wEcGNPCRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463846; c=relaxed/simple;
	bh=JDa1npCoxnVz0A/TLLUwyB3cYz5sbB22cXecZ8GRtDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYQcA+AAViiWGJ/L+vVa0Z61EBJdqMUcR5L+gAGzCN84IxQ191UPWezjrvbS39yjK4mtJLLI6syRIU5O9ngHEkd32qKsKjgbLeDSiDkBkRdm9D6ozRdW0O53uVPGwyNcKYyaUr2ZW4kbjGlWJzp9ZbDDqHKYMIXSoVbAROb9w1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJ7LF8GL; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJ7LF8GL"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso1087285ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 08:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786463845; x=1787068645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BR1AwFv5ug2wa1HdUYKEyyrH2huljwL1Xbj+dbpxbVw=;
        b=UJ7LF8GLwaRX6dpSC8S+sH+1YUJAwgFr43FWAkj8GfdPlFNNDsPO+00cNb3ioW6wmS
         +lXv6Dd3uVZ5mbGu9ElmQthlVYTEoMCYafDJ+PgkjHVd71DmHkzaaRURgkUlFCxsHuEp
         fVMWvakW4kIs289onIoZ/PKnlXUX7lJdg7PPfsYq9BUdwQV/MSpXbKrVY3yS0sPJqrQT
         Me4mkiA7L6vu471fpaCmiDgqrTGs3VQvY60ZmMciUc++xjT5MqySzcar4BiVR9yTMR+Q
         rI7hJLSgqNHTT2B9hXqMwOZJplkC58MBXVKgWq2z4DrZzpfxDLzeC5bEhDx+YYtunuR1
         3WZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463845; x=1787068645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BR1AwFv5ug2wa1HdUYKEyyrH2huljwL1Xbj+dbpxbVw=;
        b=U1BqZD3mb9PwDZQiigru2I8wULgI7AHIj/gz9kvnVXcn93+sL6f+ZHwt0o7lpWvR0O
         84GeTkwh+lsM5MeRoprmlzHeG/jao5rKZjMx1oLIav8uakrAfMh1a2xje+6qJKokIr+J
         /cKn0xCvcjCkTEeyj0TWgBDdP43WNALgkgUpC8JzonscE/9d8ecsWC2I+UXGhm17gZ9Z
         yVQOZ72ptvTEepU/9h4eK41Kr2v++s0wLPnu6THmOMmxz84KC9+ock87xBCWff+6YF5/
         Qx33k3NRv5JE0Y9squ8CUzmmVtTBrsSDIhg/Gdz7F9arKM/kf3Zz4oBInjF35Z6FS1ZI
         63qg==
X-Forwarded-Encrypted: i=1; AHgh+RrgNA+D89XvvFNEZvg/wcBaaZWoAfA2cY8ZidxSibLiE+P7EkuCq8EEpAQxlBvJ20LjE0JLVD8EYwBCAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Opma5OOYiM1ODxGYaP4oQV8Kh2QUNE1Z42o103Om5WbqjOCw
	QpQsSkbffdrwI0APLlPp/h0cQI7prI4QFNvDX4EN4JE+9SExFYVWh+hiDh6weQ==
X-Gm-Gg: AR+sD13nbJNTXHLkD1Xk8ivu3dsBSFv3nXBEGoygs1OluRbcnEKXC3zWTkph9meJbSb
	ANh7oQPB9AFukTXRqiboPLwCWgqfJJgAbk7jN8/fr6hmh9iq9c/ZfoDTvFsBbPJE3vS8pxpDGPO
	78ygL8SJhsVsZVUrCzIfhYCSDAWRU/4C36TSWW8jdsqjvnXTd+sfKCng/SsbeBrAcvRxjMnfN09
	kocoxA6kM9F5DK7aFf8b0KH0ZVOH/AZhysPH10nGsOnLRD544IF/fFspXAgAr0Q+668HEmGKxSP
	S76bkAyQJVVtCUtqfv7M9TOA4HIDPvzOoQFR8/O4jeCWW1Y4LXzCmA1Sjry1+XcvvoxdtCTT+sb
	8lvbvOKUnemNg/j/ykuNh89tiIBoQ2TB9WgYw5m5+GIgBalLYLiVFImjuAf0B4xwqn9ORqKOX+E
	PR1ocm+t57AJkYtf3+Nemfl8iR6mG79nro3LNZQKmgSteXOb84Ko2GAWdh+nM7WivZakGCNG0aI
	Q==
X-Received: by 2002:a17:902:fc8e:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2d32bde999fmr22795135ad.1.1786463844615;
        Tue, 11 Aug 2026 08:57:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d316233ccesm10216235ad.72.2026.08.11.08.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:57:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 11 Aug 2026 08:57:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] hwmon: (emc1403) Add regulator support
Message-ID: <61aba261-099e-46a5-bd17-fc81bf4c0dcb@roeck-us.net>
References: <20260731113007.145322-1-clamor95@gmail.com>
 <20260731113007.145322-4-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731113007.145322-4-clamor95@gmail.com>

On Fri, Jul 31, 2026 at 02:30:07PM +0300, Svyatoslav Ryhel wrote:
> Add support for VDD power supply for this sensor. It is required on some
> devices for the sensor to start up and work properly.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Applied.

Thanks,
Guenter
