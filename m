Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0B81A6815
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 05:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154623; cv=none; b=EAPb2eOIRQl1/3kcBbB1hs9osge4zJkgqldGLHbO6YYEiYXEEVqToWpREU0bKKl83wbmvUKt2SAizS3fm5EoQMd5wyxS37vtiRrmWS+W09iB9LifHI7JmN3/R8f0hKwSz1b7kybGIVbkeF+KGagCO5HDLM99cLR8ePiwEku91d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154623; c=relaxed/simple;
	bh=zmkzSzhvw+WilwBDBM+O/tskOQXff589i697NXNOaR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBgPKTij4hMXpMxRM6KoZgsBcjNq0RSKg76lvioJVGymLOfzUUQZeMMzd6b18zKWTm0hu4dzsutttdsaksnjTJEfxr5yE66rqRAchrPkEMVK20UToNvpkTTeTB2hPIEa+jQDesZVqOHaBcn11HrdRTOV4oTpTBQ5F8PjG70HlnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvNXMM+3; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvNXMM+3"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30749947917so4880823eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 22:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781154617; x=1781759417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mq4I+H3M5WD+IZU9e78puktHFYu2zgId4Cetgo9kHXw=;
        b=SvNXMM+3j7EL4PwpDiG/GliUUdQrHIPma4p8dDPgf5BUsIA/cSkZB87wyL97jzx2Pg
         1EnaBks9GtgSUHJR4jQao/47Iv5i4/JG21fNUaD0hROIeseHnRIVm442edEfMOcLG0gh
         k0t98hAmqfzO46WoL2XLu3jYlfYTbpEk6+toOI8YDgvELLY1d/1qjC4i8VjqUSWlOSYx
         vfU7swEK+GQQFqmWAZTdqvJUuoNjGsnBKXRpePjCB3l+UBfVp2D6LJxTF2Rw5XCBlCL3
         PuWhH9g6M+S5GcUfg3eP0kcvm5Lbpca4CVt/ZJHdVLxIcViLcaTKupEkFeELPCqbwQPJ
         pK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154617; x=1781759417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mq4I+H3M5WD+IZU9e78puktHFYu2zgId4Cetgo9kHXw=;
        b=FyNnzUJcKM/9vL+eVM3piW+MbGwpm8lJvIKoMPV2DGiQPECut3c4mCJkQ/vPlbRJEo
         kEvq31sJNSrdoElkRyWHcEo06PxQtJajXdbrzy5QkdaeWNrmVwEpABcZ2BcBoPhwWkz4
         Z4zSyf42Mu0rXaR1igmixW7EwxqIOXXbh11mZgME6ngQwtGRhtGbS/Hv6C4cSNAIIKSb
         pHZyr/kmCeiCYd1D21DIAsASshxH9B7OHh9AtPFnvWmfk6i7NX4Qi74WqbIOVisQXaGa
         YhukdxMJUeUDgaEp4vBAR6urcFHk85mXXWMWrw3DpplH5pONm3yZU/CMT/abYh9L64/q
         KBUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9kx5J53+wqU3f3pnXiPq8r+hZHUo/YrQ6tHO5AKjA0z8XNk4Tn3/3x3JPLFoLC5TMKqTEAgW6+ziL6HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNQ1pXshW9PYsL0nUTyFPN9UYRaBc1JCLFtb3Ml/9FnelAjm/6
	DF/IznVJLpeUoVzSF61lhfj3l1vv6DRmmxQfkvo5ipxtN+X4MEtJK3BB
X-Gm-Gg: Acq92OEV6fIcf2D7SvjOcIKGlQBr7mzFdH946MScmDT9KPOTdtlfdop6TlyohBp6os8
	ZLimZi6AO+3keLOdO+OAWXbRYrvz9rYXTrmpHfkqSP8Mo19MesiBgWNtW3WYAk1H9gM8B5kMtVk
	B3Aj1KSjfnUxpq+nhCqqHcUd4XT5/6UMKKPU3DApbt+glc8HMrGW4lcTnszwk02xoKfD+WCsdJe
	vWmT0srAzQF0kRV7ub0MiGKPjTeaYJoooTY98b5saGWd7TaXs+7CckB/VhQ0sPXhO0En9uIZgpw
	3bEAtsnc9hRMdI2L4v1lsmmrm3rvoH4aO2PvUAr775ZspNDVKsV5GAvnun87R0nkRcMio3tz8eI
	36vwUGG9J4d3iqGrCi9VBO1O+AOWIzxts58yXo9wm3Le5KH+EfFUZKWR4InVazm0oqVe4ixUi0C
	NygLa1ToJFMTGPGG0fZyO0fv+wZFyjsRqlh9mUuXs1kF5dMzg=
X-Received: by 2002:a05:7300:a191:b0:304:de8e:17b with SMTP id 5a478bee46e88-3080461f84fmr1061969eec.5.1781154617304;
        Wed, 10 Jun 2026 22:10:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30806ff773fsm719026eec.31.2026.06.10.22.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:10:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jun 2026 22:10:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>,
	Mike Hsieh <Mike_Hsieh@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH v2] hwmon: (pmbus/lm25066) Fix PMBus coefficients for
 LM5064/5066/5066i
Message-ID: <d79411c7-62f8-4779-9677-9d09551623f9@roeck-us.net>
References: <20260611-lm25066-driver-fix-v2-1-5d28861b0d8e@quantatw.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-lm25066-driver-fix-v2-1-5d28861b0d8e@quantatw.com>

On Thu, Jun 11, 2026 at 09:59:48AM +0800, Potin Lai wrote:
> Swap the high setting and low setting coefficients in the lm25066_coeff
> table for LM5064, LM5066, and LM5066i. The coefficients were previously
> mapped incorrectly, resulting in inverted current and power scaling.
> 
> Additionally, dynamically assign the exponent (R) registers inside the
> probe's LM25066_DEV_SETUP_CL check. This ensures that the proper
> exponent is applied (e.g., for LM25056, high setting power exponent
> is -4, but low setting power exponent is -3).
> 
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>

When I tried to apply this patch, I got:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Potin Lai <potin.lai.pt@gmail.com>' != 'Signed-off-by: Potin Lai <potin.lai@quantatw.com>'

You'll have to decide which e-mail address to use; it has to be consistent.

Thanks,
Guenter
