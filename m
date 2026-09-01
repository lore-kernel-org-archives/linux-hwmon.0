Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664B749B1FE
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 18:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287078; cv=none; b=Ko0NlJnKTvbmG834gz+k8mAqOg9Z3K24jaHvwoidr4kp0I3VFDluQJEZLi7oSCz1pPNmh+SbaFIUvxN7RRea26Ze80cKB1RNDOCVgYrVtbtNaKbAI2JpsRVN9xTD80LqWKUtSuoxM1DE9Om1Dzf+88N1kzwHGRqB5POiP+2uCJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287078; c=relaxed/simple;
	bh=yXAnKgy/VQxxLilrfdZGXb6jNNTn/HTqT6aUBDy7mCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SsHJg2+uIRIpAF97VcJxmpTBAbhx6PuzYsT9p4tZ14iI7KQJA3C9EQRpasXSCwEsGfGyMTuKOhH1ofVMl4QO0kulkuWZM3zZ8yKa8Xccbl2Fct7yG3sSe3wE9zK8Ftu/GBy+anlT/rzqyIwtHZO39t3mA/ZLG99D13ydehaqjnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0hvvoKI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0hvvoKI"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d5335cf904so872395ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 11:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788287077; x=1788891877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q1E8LfafWTIBOtDduMtXuT8/asiWqzqJ0nzvHLKzE9w=;
        b=G0hvvoKIPVvuw1L+f5tNDGd7NBRb2bGfnpTeZjuIMaADs9rkzofl4xUw459GrgUl+d
         OcmAyPEHonlTO7i66pP0C2K+0ro9QJ7Tk1065emYgiez9MITprC8sIzr90lH8256KQfn
         /YOT3ZMFwWdId8e8ViFqDUe19sGsehfMqSc9GfshncMdQXqdKriqPNfWmbaxGX/SX2cD
         3IXU4F/2PafCsBt9i74wTOdEwQPx6LFDA6Nrl6eaPoG+ijaj/HoiLM/hLTk7c8Zrldw3
         31Bo26BrRk0nkxMt0QDNBt4RTd6caL7riRG02o/eDhB3UEuHx8hFnQCwmZ/yeujYkHcJ
         ZFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788287077; x=1788891877;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1E8LfafWTIBOtDduMtXuT8/asiWqzqJ0nzvHLKzE9w=;
        b=F8wvaex3dVNXTXveQPQc2hGQXTfD/I2KmXamcSORB2d4gid8pz4bXgVkbTsxo/L+jZ
         0mgJtrjsDNNpmFY13ppc6m9IxrL4d9tLylmHk8lkvTwVdQReFeZ6E+3f9b3wBCN6GUqp
         BNF6k77ttn3IvfRGxGL990A/V7Sktk/eCqco3NfnErX0M7tJ0Klb6JM6JNZC/01f/b4C
         81Ql44ThirK7fOx8D0q+95IuWY2m93kOVtt/7ec5BmT5cQFm3E53t+ycC7jSnx113HmR
         HfwJ44G2nn0bYm5Sb+HoAlI1+bZGjNOgO4lLjH+M2XXlmtqTHAE6wo+lu3j3OteCA037
         L7eQ==
X-Forwarded-Encrypted: i=1; AKwUvBzU809/pCcL1JH5cESTltTFK+rmnLTmY6frl3PomuSTJ7pgAyLT8ZQ20/GA1YOryZDodgjkQCv4YQ64tw==@vger.kernel.org
X-Gm-Message-State: AFuF++noztActayLXV5iTS6riWy+0yPn63dkOJTTWgnE+gcIE9ZTNtb1
	zG/NFhVJFdDSWPZfPOoWeSnWDTtYSTT5EPvixktLxXzEAUx2UOwdC7zaDV6nCg==
X-Gm-Gg: AYBFou2K4NcJLyBXtT2dyzW6l/Gq+iKBtmShyKjkZRwHYsj6msY5J1b8Uc3so+2al54
	tKIQsUJCCYZ7s1B17eZS498WlQqcIM5302cvi/IoKUrKWwOixoTEHizTsLW3T6GYJ1s37dMPuP4
	0RlJ+LXMX8PRRbvDhTg+e16z0PjTFX33dLDXlQUlYDhKdLS0Eyk2jiR/pcSzZjdZyqRKsQSA9Au
	wKRSFPle9UqQI6k/bu5F0HjzEQ1EmE6SI5BlQcvdsLPX8rXMTdCmWO+/0aFCBnb6jcZAP2LPngS
	fZFwlSOSBRW0S3XPVuhLFCM6CDDtdk0cpTA9ITa2YTxliSe0e7S2EHlRM6VMYQHqCJhZSzFIRDF
	AcjoC4grR0SO2Ce5A6zM336EiHWeiLoZlgVsUCR+PKXC0Pj0N8yIqqNRpfEQJQhoyOtAzhmiLvs
	sxHeT7EGQGdwWnqEr1GbvBxHbHafVulNFh1UQHfOVpyQN31xvQMmtg4psuIKbFKmIt95Vxkw2A5
	g==
X-Received: by 2002:a17:903:1a2d:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2d94a904ffcmr157073085ad.17.1788287076609;
        Tue, 01 Sep 2026 11:24:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd4a8504sm2259945ad.62.2026.09.01.11.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 11:24:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 1 Sep 2026 11:24:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pali@kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, pp12313124124@gmail.com
Subject: Re: [PATCH 2/2] hwmon: (dell-smm) Add Latitude 5420 to fan control
 whitelist
Message-ID: <3a6a3bdc-713b-40e3-8865-671d52af1fda@roeck-us.net>
References: <20260901181849.241776-1-W_Armin@gmx.de>
 <20260901181849.241776-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901181849.241776-2-W_Armin@gmx.de>

On Tue, Sep 01, 2026 at 08:18:49PM +0200, Armin Wolf wrote:
> A user reported that the Dell Latitude 5420 needs to be whitelisted
> for the special SMM calls necessary for globally enabling/disabling
> BIOS fan control.
> 
> Reported-by: pp12313124124@gmail.com
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221935
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Thanks,
Guenter
