Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047751;
	b=k4YF1tUlC0/NxV5S2dUDRgcv/M2JzhpCxV1AnDVFrQzNFgU04wKTqynqzmpK2cEf2spE
	 V5bjwZxiuwqyaU/7mwAPICNlvFsd6G4hahMFKL1/yG8Xhe4IKROb1e3J3iTplrulj1RGI
	 upaQxqnbqCTNR3I9v82OF554CADp2Z0F7eG+FsP6PIC/L+1nxJYIfhhR1uqwoqFCP+/E3
	 Ib/FLVpXZDssvFWsGp6zyg7EZ4MXvtS5TCBSbmG+Jwo55wmyP0ddzhMVrx8rnzOPBki+h
	 d11NoBQlZXZeJpEZG8rxLgr1kQZ75aHPxDZanA5h91+TbT6EdfYFvzcZdGRSi0rXevQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9TGlJH8mE9LBOMpy8hUBezrc3b+6uaVNZir08Qhj/4Y=;
	b=DQ1muHUHReiTah+wP8p6GpPBYAzyU+Y8ntWuxe9LzOSUwMPB0uR35FeYI7exFmrI9J7M
	 FxSX0wR5RNkIk3IIANYPgoaieHWPGA+ougxMRtl3BA+NVGt63YWkkVakyl1s9xr50DfKu
	 i+nr/6Hpx86VFJBB2klSk4e6D0ysSU8lNQGJSETp/5QoA9mXMPoWjFYRr9fF/ejeZ+Ug6
	 i/4Ek6D/kt9IvbXR24AB3TZC8mo423IHUflrpH6Fa5lOgwK/1iDBvogPcpKMB61Bt+45H
	 rIdWddIIG+NJwKURFB6nEu8/ba0dYE0gSo4ziswHcEyLpZQx7ef1ApbzGlA18/Zxdng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n4LXTAiT;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5316F606A32D
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 20:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5316F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n4LXTAiT
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-156cbe59622so2756718c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 13:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047750; x=1793652550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9TGlJH8mE9LBOMpy8hUBezrc3b+6uaVNZir08Qhj/4Y=;
        b=n4LXTAiTiTGuyd3+2e5lsWMu8UQ99JNX5Jta2koR4OlN3EEsqjmoE743H8P9DiP5ls
         Pdt22tiAz4ntnvO+CahN5g48ngubMiFqSvWbswNGIwCy0lGdlyYSKS1jykFCkJGTLigy
         gzGr7oRl2jJBP4iZFqFq8i9Ss0s45J95vD++RZt25/9kEqPcZe0FQahoYB3cwdNJ326Z
         m8FCt7P+oPPFubt66n75aEdrv3sBlBCMFpUg3q1GM+F+4ertbWvJN+HI3gJJyzb8eTus
         RFQ1h5cT7RRu1LW5clr2d+eLWOBGEYZoGfxR1UkQxxCROz1GQyYbSftY4TZEG23c29ae
         BoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047750; x=1793652550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TGlJH8mE9LBOMpy8hUBezrc3b+6uaVNZir08Qhj/4Y=;
        b=jp73xplyXQgw2k0Yo0imO14FbC4lBm9HJm9OknPLoFWPr02uEI/OvLAxscMypSQF67
         la/GWFeR+NLnRkbKecO0j0t4CoRfsh47N/iVduCY1n9u/brvRC0eJmKOpOuHAne3Vf3X
         wFyg7rFC7lkJuJzpR3YNQlHnSqXvDII8RMafemX/N7wXWgL9ttV4lWRDRBU4Llpjx6RC
         F2MmDW2SP/A9GNFwOErhM28lKDVooE8Kc5Ugk1Gy5t0IkBXoimnpYkixOVHuj/qoq7pC
         kgjx3ylHli2q4P7jJKHIlZgtEbZX6ICOxmcEmde9I7RurpxzsuccOmBWEUYCIhA/yir/
         aEQA==
X-Forwarded-Encrypted: i=1; AKwUvByAv4w5wNuqytjZQNAexdQoGg8/IJtqUvco4s2FkHnq47InVphvntsR4AGt08Mku9XlXDhqJmcHFiCHXw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4fCGT1qPa/somIcUard9DPwk+1Obecg8XuviiV83454rrnHQd
	WqcKsE+2a9SicLULnrxVz+/ZYnoZ5HmNBqh2R0eDMnU9nchl7WGuug2a
X-Gm-Gg: AYBFou0wpFWePVc9wflSMyyn+22C85W1w88X10AkBjnK+RwqJuag8wCF84jT1xoKIWM
	fsIBH28C6UhAPJOwNFyLK3vWeuSMPaVDWuLStwS/OfzkFCral5E/0d7085NXb5xNYaC2Kn5pEkX
	zu9Gpd84pSB37DZAbfhlKF6D3MXBZ2+Fq03DdknOCkc4IBEkf781AG4+tnZNNVypoCzw7BYV4TB
	x0epf9pciGhdp1bVCvXKFL4dmsQS2pfrjjqLoGf2MTB+On7RnLcnn+nPmVkEH7Mtg68AmE8dtCa
	pmD8dSdpWzwfRKggcRwOUvLJ/x9KyEt6bh3k7R+J0CM1NjgFUJKgq8orcnGgdmn6MGR5CDFqLXT
	IYFFnk+JzfSGu5+ZFc2GdB3eNIZbFXW2QZ+7Pn4fLqbztAxxJ6jqiiyd8gUvNf8PGEvx9MwHB6+
	c0CYXeHd69QYh2+Vk+IVwRD0JL1AICfzHAvi/LYwJ4cWPilYeawdw+srU7dwplUScLv0z3/TYw1
	sqS2CKE2PzfdAHZsvYBI6T7ghZCab25XhkNRNK6CU81RV8tIJGhGTR4mTpRDAyZdZ/y3jrsGQnu
	yFMUKZmgpTuy+UmVMZa9HvIKgTBKL2tNmhjwfcjgowqZiGMBv/c06gUOoHOB4zUG
X-Received: by 2002:a05:7022:ea5b:b0:1a0:e3e2:22a3 with SMTP id a92af1059eb24-1a0e3e22384mr5029745c88.31.1793047750376;
        Mon, 26 Oct 2026 13:49:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5937dsm26657068c88.20.2026.10.26.13.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:49:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:49:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vas Zayarskiy <contact@vasily.cc>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 4/5] hwmon: (aquacomputer_d5next) Skip unknown
 firmware version offsets
Message-ID: <ed3574e9-51d7-4996-bfaa-8eced16a49cf@roeck-us.net>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-5-contact@vasily.cc>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927191316.4137752-5-contact@vasily.cc>

On Sun, Sep 27, 2026 at 10:13:15PM +0300, Vas Zayarskiy wrote:
> Only decode the firmware version when its offset is known, matching the
> condition used to expose the firmware_version debugfs file. This lets a
> device leave the offset at zero without interpreting the report ID and
> following byte as a firmware version.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Applied.

Thanks,
Guenter
