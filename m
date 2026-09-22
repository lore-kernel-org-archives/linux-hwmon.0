Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2531C569F0D
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 17:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096875; cv=none; b=rFB5QiGlq862Vm6Xp67tMvwb+z7+z+NlG34JBUKfKG+cET4v6tyy2vVmj51zLiEO3/RmrJN+5//JncU65ORKE0N5I+YrDb53hwfmEuRcb0e/Cnv6gmpixtGGN1VFL4503ubqOfKFuI1iZTRx2JrpKb/dqWNEMsAaVdsnMKcb+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096875; c=relaxed/simple;
	bh=/x8p3xF5ileb+D00UF4eBYRkSBEOrUPpsYMUbqmm4x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YkqDNhAdYUzU6LZaoRlYgy7+vp0j88qOS7t3I6HnAFJv5jbe4NrmQcaF8MKVx5mKhJb89XruEWh9eFaS+ftUT7KVbFQ/5gSfs3EjljPAniz39yWpw6uYEMqFQKiW1R8ibNDa/Lp6/H7jFC59yMjFZXGScKPehHd+N1VJvyDVQpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7binD37; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7binD37"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f0b25dso532245ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 10:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790096873; x=1790701673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0L+7e+cU3VWegVLLOjh3YpblpIX75X+DIyXyAmlh6g8=;
        b=a7binD376UIRTFXh3GjTf0NWpm/o3hLASw5o7kGQFuq9LVlRFukCiYd3OU72lkRSVE
         /nXCD0IW3gQYxhoGa9e1hMj/C+lork985sSZic4NWTHmeVo1syUPT9B5HGNUqnuKG1yj
         2zuyzy+NdTqt1p4AHuIKhbbSjBTQ9I1vOOTFULhukZ2PMbUPUX8kiLZ/UlLOp/RiYd59
         V+R4qUbmUqB3zqp34qQV8BOwvZr7qI9VTR0UOtancKMr4EYIZbps+XWzbn9KTGk3T+8o
         h4AafsHdnaO4woVAM96fnkOnrRgJGjDXm6IHMV6bWmpAuF65LuiMChhA9fu4ELau5V7+
         hStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096873; x=1790701673;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0L+7e+cU3VWegVLLOjh3YpblpIX75X+DIyXyAmlh6g8=;
        b=0OPvfCxdP1WH1l5KYi/N42+XghTjAEqvPuZ/ZOrIQUnr+bAyLWgxIsA3h7SluRqOQR
         xCA8rzvzTQUyViE9VUy+6eiPLcKZ1eHlto8s7Jr85IQbQrJkjNLb3QEZ7zwoJttpZEyf
         6H/jZ8cMnct4GK575//DZEX1W+gKpeGUTIAXCDjRH4mcv7RiS1HqMh2ggYdRRVuEsXpP
         ARTsq4lvDU5TGH0S1JYt5r4unc0FNTOx0WWTzmM6bAduKDovWhcRE/1Prj+Zz3JcCKui
         hLmC4AOTdRJMIcs0dPhKOUZxPqlHFKSsgZded47KC8c7BmUHSxCGTtS2jOyZQrWk4Hub
         IBLQ==
X-Gm-Message-State: AFuF++lFb/s6rxyUQ9QM9WTVx9qzaFRrDLuzb4/zauiMirr1dVJeZzpE
	HbWYiFRMe+XxHgSL3INT37y1i+YP9MTsD5NXXCuAB56AmngOJ5oL/lSdTEA17kXH
X-Gm-Gg: AYBFou2zMGY2aS6GgUOC4J8WGQAG/KipGRx3gwXvi8aCO+Ec3J+Q7suYxnlZwBJC+8m
	MTb3zNCrXR/56dDrANUPNqfZ2BqZQeduMMgqGcEJ79o5swGggiTrGpxBHH3eTuYadH9ZxOYD4VX
	PWxoRqq4CLZkoPlfAbOywAe3QduxC0dL7lRapJHi2E0n8wTwvbmuFewapbCXbex56mSinNc+fxP
	DHxnKMmOEDKqPpGOLtfOpFD5gqs+i40kH1ab/QTleUIfw4kpddcylqGEX9YzGHWMOAEznecA33q
	WxDmoqGbP2SDM7JGCM5+LBeWTaNE/FfClCbszWOjEFiBnmCwxH2Ds4QAqIzBV7WQWO9ySZuK+kG
	mRAsC0yEn9LGIohGDDAI+Y0MYcxQWKG6dcU276NkvuqEtY50+/Wngp1s/3tPuiCrbs6/bmB12kA
	eH/vxAc7vH2enrOeOkqeNgb4EAQj6UpkbUu0DbwnzNRO9+HfutHfyEMDdN2N134QH/eJ0NBa2QJ
	GR0hdb4pk52
X-Received: by 2002:a17:902:f693:b0:2dd:b20b:76c8 with SMTP id d9443c01a7336-2df69d3aae3mr371675ad.16.1790096873290;
        Tue, 22 Sep 2026 10:07:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d057f55sm13556195ad.73.2026.09.22.10.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:07:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 22 Sep 2026 10:07:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tomasz Bojanowski <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6683) Add MSI B850M to list of tested boards
Message-ID: <fdea3ade-8cc0-42d9-9daf-b50d578a7be0@roeck-us.net>
References: <20260921211304.74729-1-tomasz@bojanowski.me>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921211304.74729-1-tomasz@bojanowski.me>

On Mon, Sep 21, 2026 at 11:13:04PM +0200, Tomasz Bojanowski wrote:
> Tested on MSI MAG B850M MORTAR WIFI with NCT6687D EC firmware version
> 0.0 build 03/10/25. The driver loads without force=1 and reports
> voltages, fan speeds and temperatures.
> 
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Applied.

Thanks,
Guenter
