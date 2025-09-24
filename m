Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9FE307AC5
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 14:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758724605; cv=none; b=rwtyyBsDXh6eFTuXK7hEaoM9sI5gQUsLQK1AXUp69oTN9JHZtpkT3rt3jKGhf5d5BxL89zUmNS7d+kAYEk4hpxav+HFRVoxozNiOQU4FFavyOGHYObtFmvf6rT1B/UwkzIRvqUm5gtMWErUUYQHQJu9gwOvlXOVV1FgQBOAHtrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758724605; c=relaxed/simple;
	bh=VidlVO50el1H467lJApxsWJXJg6s6uikstqa3zxjdVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlRjwf6KVaeAEw5wedNBo5DsPd8uSDui2dpxQxUqA5xvOh1A9Ws2reiRvOP/F+KDa1c5JsnioRAWKEUHGncny/xfwte6WDwCvAauWssUHW+Pi8zbZ385SwaEJoyXxymr9Kuoq9mR10TFBhzwveSK2VL0GnteaBRlqgg6raJaJ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXWTUPow; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXWTUPow"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-27d3540a43fso22042235ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 07:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758724603; x=1759329403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxgE/VwqMUnmRpk2sPi0rJ9F4/7o5NXDeAMdW4raKNM=;
        b=BXWTUPowVR1rYmOJKOswTxz5Idb79j9b3HcjQTtWHPOoT/Nsmr7L1MhKKUTyKHDCmc
         hY8VkTQswu9ZLT7Ur1tV9ERdtSNyXzMCRjw9QD6B62BqkrshWNIgYihDi2kKpstUhSAu
         KBS9yGyIpWiuSSAqRGJ6pkKoVJshiwn+0rZ3R/PTSUQF9apW6IXZWzl/Xuzv6H4JuYZn
         lOWgyEwwn0EDSZvb7+ep8ri0SwmWdlymVX6pOFrFAdG4vUQn/HM2SqD8EgDbtK/Bdo4K
         KQF0c0Ew2/ujlNOnQNlox5YDrE7D7g+yuKK9mgBgYwkhPT1KL1+Lqo3/4A0vhXzD4c3b
         S8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758724603; x=1759329403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxgE/VwqMUnmRpk2sPi0rJ9F4/7o5NXDeAMdW4raKNM=;
        b=LdtzE1AgjJs/rgsmFwxv5yU2d+OWd9AvEZQiUo92UTPYeANFhlChSKGEABIE4oFjeS
         R2sMFoLAOXiYWP0CN7yIkb75532oJhlRZTBal6xeo/hvloJmBqfmlZHAXSFg6Pb68N6p
         2NBlXlFlalBDo+plcFSEgG87E5+0n8/MnfZpXTmhSAS/KtQwrZQstP2Oo92SfK1NoXoq
         K/2fOj635lv6LHEC0Y0IZCep1qn6dmTRu7b2zgfEJxNdLviC3gpM+Jy7qWDt2SKz+38z
         3WLZDW0vbWucXhvNYmV5Ubq9qFknAGtPRY9QjXSI5far0EYAiT4BANpkN8QSKqufyNBw
         n2GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMiC2CEzYkTvZmjzQGgG+eth9jFwrjbkoZQJKSjgBpskNwEVtGky7eea8ZAMfsQrZYxdgowgL/QPFJJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQeeZhzIcLZxosaeyNjzbIbluAX3tBAYUnG0yYMB8PhvN4HvrV
	W0U3vfbNCqgs+J1tpplyFbnZwkbYf04b181qwNDEoTelZjCOfzkddvlT
X-Gm-Gg: ASbGncuHjI0UYTgNqTwG5mI1PkoVTXgA/dy1HtvahXRI7xa19Z2dHgKSkvX6lQiL568
	mWNAsGdm2xfOTvpaS8ILulFEtlCnk3Q9/X0WTGUR/OPluAlFHFOcOBAeNz2rweI0IPM3IoFbAy9
	/BrT0LG0xua2c9O18/guUmUgixxAUrotK0BqnkUrv3VmWO2XTiN3NPTBjpgUHY2LFMfkjPcNTD4
	hDDaM9b8IFmKi38TJi4AEOnmPtF4TSyYU0scvTxRHb3JgblQO4+Tln9riOV97CxQXjN+i4htHcV
	67CLEUO/7JY1jxeKljAfK/Q4sqSgwGCky2yKHayajfTlIQsP3GaTS3pQmwQG2S2oHIrx7PwVtsL
	8NeGffWWJc5vKDjKU3DLWyrIf1qNYY9IJWoU=
X-Google-Smtp-Source: AGHT+IHu6iImWwWebqU0fIT3geKZJI+vQ7lMRP2q7Y6UID/bj52Rxi/gS4qRBD5nGfGbcaTqWRH+Jg==
X-Received: by 2002:a17:902:e5d0:b0:267:a231:34d0 with SMTP id d9443c01a7336-27cc5623567mr78793925ad.42.1758724603132;
        Wed, 24 Sep 2025 07:36:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980310ff8sm189560205ad.110.2025.09.24.07.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:36:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:36:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, cosmo.chou@quantatw.com
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: add mps,mp5998
Message-ID: <4f57c182-d3d1-4007-80db-915ebbb6fe1f@roeck-us.net>
References: <20250916095026.800164-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916095026.800164-1-chou.cosmo@gmail.com>

On Tue, Sep 16, 2025 at 05:50:25PM +0800, Cosmo Chou wrote:
> Add dt-bindings for MPS mp5998 hot-swap controller.
> 
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Guenter
