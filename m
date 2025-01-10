Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B825F2F2F;
	Fri, 10 Jan 2025 01:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736472286; cv=none; b=kTV5fzbapfmhJp94dH4msrunaQw5Ym5APYrjSMNe7//1yD01Hdmq65eQciMiH3TFU/gWtRpmNIyJEnW0vnMGSQPtrjHtv6aSC5Z2qof8GUiG0vqsES08nGL6t11nIRxIKqRfo4T7XaYhDeAHts3+4smEynsqrvg2NHQQPotrKao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736472286; c=relaxed/simple;
	bh=wZ5D9PiDL4l1ScqcLNoXhkgWVEHvXrFKh7UyL70UMT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMwtNR3gjeRQ+I+TNYrUMwbdEV/JXH990oN3q1a0arQMzkomuSdy5KbKHtf7Vp5+mCJimDIUUmmxIn3PWvW7WEb9bXOGnh6XkYS+Okhlqch4R5hD9Xwg9gR9T06MY/5J8xJ/WhVYXF/+y8WZepk4gDdFO3SYyT2RAVz/IaVw22w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DN/zec3c; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DN/zec3c"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2161eb94cceso18616415ad.2;
        Thu, 09 Jan 2025 17:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736472284; x=1737077084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tvQt950RFyp/qo58nej0dfiGIB9r55J5KlMxBP+gTkE=;
        b=DN/zec3cK0QkVFbfZ4Q8toj/x8ofgPFHlop70yMvRfBlPK/zzf7LALPv5GjNxPaerZ
         FGaHfCOmG3w2OHkhq+M/s4sxGqlXy7C2O7yuhLSqo+TFc/jscJHdfcMDKPdYK3l4Rc9Q
         PzTGVSpy4rnXH0P3P3O8pON2EiFRLCvNWEmyRl2KtKM+VV/ksjOEdo8EofWI+q3qPEkT
         Vvu8Y19+1is4PN1s03kMPlUCQHbp65PuBfsW1az4cVhOkHsqCA0op/id1Eoy8S/2b0f0
         t4Aar3O08bWcpZlGEncl7ae6mNnwm6NZPRugCsVCnr0V6Qt39amoUxJbJ+PIubIp+O8S
         nruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736472284; x=1737077084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tvQt950RFyp/qo58nej0dfiGIB9r55J5KlMxBP+gTkE=;
        b=ABlqfKcKlS0meH4TZKxmQlk5znLqRrtEWKXklj+PaAB/Rx2f8FV5kYjuh3is49W9cN
         FsWT7xomSImZ++QZUr8j3z+wq89Ce9DAjZsad1AJ18Hq3eWqrhw3uPe1UkN3/HzUp9PG
         fL81OQYpzVw9gLPMhZ+wpgsaJQVGnl4nIiGKTJE0wB45lkqau8w8BpTL6s6H3DxwWgr5
         zqGwHyrybcAsyEhxY1DXVU6OMuMQmIPBrJNLpE4pDSZ3smkTG8SrVhq2VuGwvejZewl8
         nAUITES2ru4L+o3c07hLS5/zHDK0DDPyw6O82gKC00CmvPI7ehqPI55LFFziJ0coW/Gn
         XSVQ==
X-Forwarded-Encrypted: i=1; AJvYcCULzOFFnBu0o4iEoUcb9hNL/vNwf0O3oy1p9pA3hHJo07FK4g6nNFTvcCfx67qi7N0ok85dO70sNSV5Ww==@vger.kernel.org, AJvYcCXrHKTRIDzwZUlkchLjr2EvSMdrZ6bXWqA1oP/zT4IEFA7xE9XhpRRCHLY1Y1rvN0yYZ6YecW6ub0jJApQY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx47Dt/xAmHQeTn0QJ6XrsxtVMIciVgwb6RXlZzJBPccxfqX9hZ
	L6C3IFTqXrhATL8jimYdDRfubDJxanFUP5eBGUxfbaI5aJnLMt0d
X-Gm-Gg: ASbGncuc3yIKLieVvAhZDT4Gwzt/cEx/yoCQQ5LtEN95PSKSsYG7jtp086NwhIe3o2i
	9o6C7LY+FuQsUsfiWeVkXcKaNE7jHTkVhn7d+4VIe9K+OoCo8KJbADwHrolAVyhRrPthxtBBTZ3
	RoNqBNOlbqdIxPHQdEZPmMsD65nVk/2ViehR7EYDAsffzAZUpraWe6i3xbo42fYNAev+wW9WwFS
	74i9QpoKxrC1RafhaFeFuSkyVIZuA5CG75YV8MAXDz/D3Lraeyee3zFsZlvHNTDujyeaw==
X-Google-Smtp-Source: AGHT+IFbcI3Lkyivt/tdeBsXk2Mr9xuK6fZDlesjSTmNbWISnggw9p+wDnk4qrT7oLswbyAmR8pmMQ==
X-Received: by 2002:a17:903:1112:b0:216:138a:5956 with SMTP id d9443c01a7336-21a83f59822mr142993985ad.19.1736472283897;
        Thu, 09 Jan 2025 17:24:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10f04dsm4061325ad.42.2025.01.09.17.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 17:24:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Jan 2025 17:24:41 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Denis Kirjanov <kirjanov@gmail.com>
Cc: robert.marko@sartura.hr, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: pmbus: dps920ab: Add ability to instantiate
 through i2c
Message-ID: <7048e012-d615-4753-9478-f71910138739@roeck-us.net>
References: <20250109100912.10054-1-kirjanov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109100912.10054-1-kirjanov@gmail.com>

On Thu, Jan 09, 2025 at 01:09:12PM +0300, Denis Kirjanov wrote:
> Add support for instantiating the Delta DPS920AB PSU
> through I2C on systems without devicetree support.
> 
> Signed-off-by: Denis Kirjanov <kirjanov@gmail.com>

Oh, never mind the change log. I looked up the older versions.
Applied.

Guenter
