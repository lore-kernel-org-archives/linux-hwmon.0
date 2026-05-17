Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA272E175F
	for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 16:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779035764; cv=none; b=NMpTKj4VGw7+BYrYN499r//u3sjw3G9XcTc0GfWBMavPCevdzItq1Au/PkdmZzffd/rLifoxh6PbYwLhFAP/nt2JblrRJC5rkAFxoBVg2U5+AI/2P7sH7PQ7szFs+ngERynJfjInmZQayqw69SmJskJxrJJbvgA03t69Vin2ul0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779035764; c=relaxed/simple;
	bh=Cj+9cmabijep/deaJfnH7LIDDhBOmoD3M5cP/tXP+TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jlu3T30Cv0AJPHB8K/8+VyePqCSoBen2IyzmR5CjBVwV1dNoGP9WtNouUkXv2XWaAHfpq2F6qs6susZjfEOqFQHi7cdIeJRJtqnBHudY010K+JJBgQqg49fsLRvoYOBA9B1xW8NgGDtpt4svP0Csd/vYfV+8D86Amvr2wDAXfo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWKmRMxB; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWKmRMxB"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c156c4a9efso1677129eec.1
        for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 09:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779035762; x=1779640562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPorwG15/XWzJyBYLzFXxINYCVIEFMIvrAdrpQUCB6c=;
        b=QWKmRMxBtEWGFkIGQEAYDTFBklaeQWvrMhVmUATVSEOVS1i/teBq11Bd62810s/vQs
         L2OdjgU2+TV7S4R53ryEU8Zy2NCsa9VL5s6PkOVNzb/3s3Ohl6lU+Yw0skRq6x2XCB9r
         V2yZl3zUwFLx/U3HChgzU/eWmA5I1CXvt6FBdTbMWJseZrxSBPFBhQK2PQV+kPH0h1fT
         6zyYriKKLlnVRkvjChHoVplImE4/AlbBrLw6yCXsbhxHcXKfr4WHzFSGvM/pS3QBymT5
         aQ88N06ZvHV30p0gglsE4Oxce6pLYzkyyAu5qz3y4ZeMgxUWbd100doQhzYZIkhHWrRd
         YiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779035762; x=1779640562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HPorwG15/XWzJyBYLzFXxINYCVIEFMIvrAdrpQUCB6c=;
        b=CdaSUn90Y/2Vs5mJS4sEFdUCYmKx/AOBtHWoQTzR5oNcsrthlW1zgWYpIq2PVL2pOL
         wQTPJ/UXiEXCcx4IcOAMgsXUcnJw7smxeROjOuAIYTwvfGuxo+ZNMbHXKFKDEVvkRhDN
         VPaguhwzejOiImNn17zBnU25JetEIAHhWIdB6Qfaqy/NROpA1hixB4FRsq92WDp+fqoB
         YAGlSCBCdCQViZmgz6ihTuEeBILClrnIdJx3NPkeOz4fyL/glxyrd0SI+jopvzgdOUPn
         x1Adt2zZEE7pirQ7sMUUqXRyU2W1nV01UGlsj4/KUfYXkwe18fQVXPk29ZAx2e9OeX/K
         kWGA==
X-Gm-Message-State: AOJu0YzbuAnl/giF0apcZtTQ1UHBws72ibPZhPp+Tp1po6SAC721yy71
	VgA8nZFv+S1sqI5jEZu8rxmpbLHZ5qq9bzV0mI+gZp7t/k6uxe9y3E3JrFoL4fhL
X-Gm-Gg: Acq92OGfFEcPkueWXPlK+eCBq7J+//J+ZWLUqbKZCiBbkHHZJOdQ7Tcdrg4r9c2fP1o
	sxxB8f0tyXRZtMR3cnKCmA7UnzDCYL5Z0wxjeUgRtxvdkO5BYkMZQYinhmNCY9hSxjEM/MAlopt
	DPGx3kuJDygz1y1QerrhfejmS+nAeap2u2y3kh3hX6c9iljuU6eXsvxsMVqqTIAhTD7Beq2fwjw
	0hFMbr3D07zJ/k5K+BRdHzCUCqyMSmXxcljD7RFd7UBN8iAA58pDeMWoGVXvcAd//BLRfgwGftS
	NkA/FRcNAy65znU75RuKDV+2bKuBa0nO2UozKJv8a/9I6oztzjXPdwe4iU4+vN679USupELrc+Z
	/8Um4hEg8pzLv28mXe8NM5FgyxzoblF64cPkG+jZgqQj/Cl0S2a66xgqJcVRghH6xZcAZJUw+RB
	IMvvyaskLjmEkgQ5YkzY5ns+PfsMvlq+SUAPVsrf6CMgvNaYo=
X-Received: by 2002:a05:7022:1e12:b0:12d:de3f:f3e5 with SMTP id a92af1059eb24-135049530aemr5010386c88.37.1779035762279;
        Sun, 17 May 2026 09:36:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2352f2sm17449983c88.10.2026.05.17.09.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 09:36:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 17 May 2026 09:36:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: bakshansky.lists@gmail.com
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] docs: hwmon: (coretemp) fix outdated documentation
Message-ID: <21937c2f-8cfc-4517-b880-a70d1635202d@roeck-us.net>
References: <20260517152027.350356-1-bakshansky.lists@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517152027.350356-1-bakshansky.lists@gmail.com>

On Sun, May 17, 2026 at 06:20:27PM +0300, bakshansky.lists@gmail.com wrote:
> From: Roman Bakshansky <bakshansky.lists@gmail.com>
> 
> - Remove broken Intel wiki link; add Intel SDM download page link
> - Fix description of tempX_max to clarify it is not Core2-only
> - Correct tempX_label string for package temperature (changed in commit
> 2bc0e6d07ee5 ("hwmon: (coretemp) rearrange tjmax handing code"))
> 
> Signed-off-by: Roman Bakshansky <bakshansky.lists@gmail.com>

Applied.

Thanks,
Guenter
