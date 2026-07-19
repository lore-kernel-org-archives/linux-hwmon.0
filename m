Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F7C25B09D
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784471930; cv=none; b=SFCmqobn0C0IgQapQM2z7i8RdpkImNG0PjPDt5M2tnbaMMXmTpQitNgCaTKmIxlVKK7HageqFeHRNXX9kNQgTJMdUaMXGrnPnpQzwIVbZ78vS48vy2UqHdqec8U1XEuOP8+3sEsLP8CSLAd+q0V0bYnpckmELspCtqdPu/ysSyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784471930; c=relaxed/simple;
	bh=5JViRLvKb8dPvcqX4KeS3RCG1atYi0jAQLZkceHHjVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWL3hXUwrX4ichSCX4NAW8VUbpEzqg7naCbfvwCTC+Y0uo12jCTUM89kxck81M4J1lv1CsblEQV3YcL1Ei8dVJjJwjK60y/lR/9h5kbwzcm40cnOpwYwFpUfVVOoy19rSmiKW8DGFshmKkx4wFS3CpPzMioCBdaWs7wYgKmL09o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1a+G//J; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1a+G//J"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso3648021a12.2
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784471929; x=1785076729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QWosVd6/mPQVTjsyekcZhVDtJcqWOKI5sNaG4tYywqM=;
        b=Z1a+G//JzY2pD/WpuwZM1YYNV0HCgwWt6vH11YgjELiL008w01HiIXDyc47krD+Huz
         6gchN34AhmC+FozmWhLf9qlszm7Ml11ArisnWxh3sebd0mO1jnQYdETu75zEK3hkLIDG
         jpBRX1TWngfVIu7aUvJFOPuAUOejl3i2IySX5Mq9sfYRn+IRbnv94w3gT22S+q2Jl2bN
         6ihfoAzMJozX9KL8aiXO5ynueZy5wWSDxvHkHRcvp+SJHfPV8rO8mUqvT72BJN5SM77c
         IBE4rI47fCdmg9wYFuCNWjEgJ2GRrKOYaVAxfd2dldKCb6Y85cNkuegoy6w6Th0KTuj8
         +W0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784471929; x=1785076729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWosVd6/mPQVTjsyekcZhVDtJcqWOKI5sNaG4tYywqM=;
        b=TdEV4fFvxKhc77tXkjs6CwCAupC+Z93PR3px8M6R/Y0sdAzmUDhStiMob4yujnpNp0
         eyIDtVzlhcH2gGRw40tPieyfkvNVZ1jWRpCqaHA2JoOFEvAgDRgfjzeR/GpOfdLcBd2Q
         eGTB6Exf4s4VAq/UUZHaKJTgz1glJmgD0xTSxXdR7PnXWCZPq0Af/XoNxu00BWZ47Qoj
         1gb07HOjwzEcAXndjf26tqBDJIm7IqmjQiEIneY58XQCTR3KIdYPVEXh2WK0lcKjghCV
         ofDfQi032Y5MhPS9zCwPSscx4NEGodONxAWwrkomdEX0IQaqxgnvO2JCl27RDOzhT+he
         vtiA==
X-Forwarded-Encrypted: i=1; AHgh+RqS581K6u5qLklPYRGMQGLFPlAGZW1y9WRcvbHW0R3LOiQv8c1P0prW3Kw7u1inJxMsynjjgo3tAloIiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjpDZql3L034Nzeg94WZXmy+Fdc97y3vAC1PvKWqn3mTa+mHWP
	pZtTqlDZ85aGwFO9v3brdCWpLUWqDYdm8AhOGLv+a6hCYFuc19kApqTG
X-Gm-Gg: AfdE7cl3BqdEm4btejXe3bSQiUtCLzzVjwWWgPlC7V9xV1CYaBIxEPEgTQ50no+xunc
	hZ7TTabkKPNM7zmx2ig1My6WbJ7kz7Zj0IfxdhM+uC+viutG7HpHnMVEnY55vXk7enLtLWS09/2
	rFEJo2Ua7dvGyl9JL1oWCiFWb+BZNpvlaU3JOfhy6svNcQTGKnm0a/lLxfoDftRDEg7PZGCAmlF
	bPTlU8UJak03Ih4lZdzizf/UDCkhgmQI9+BdkIF2pIF8DV5i7arNtdx+PMsnRbG/40VUz8JYjz+
	cQLgbhsLgr/4tpyXvdX7vrwM3DgunuARCxVPluqgB5Rzxi8tum9eG5hMYnCHDn81KzjmV9PT6hU
	tHJukhyUnCPmYLQHPhUUgAP3SCq/S+KMUzIV9XnjVUORfjNQdUS+mVoX//TsCHiJHbcvfuvnmah
	916qHySeFqcamO9oa9j5KrYn9iPA==
X-Received: by 2002:a05:6a00:17a2:b0:848:2f74:1d5d with SMTP id d2e1a72fcca58-84c2955cea8mr10590475b3a.67.1784471928854;
        Sun, 19 Jul 2026 07:38:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af30b89sm4244052b3a.33.2026.07.19.07.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:38:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:38:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shih-Yuan Lee <fourdollars@debian.org>
Cc: Henrik Rydberg <rydberg@bitmath.org>, Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] hwmon: (applesmc) Fix lockless cache validation
 data race
Message-ID: <dc32a7e9-5774-4916-adb2-6f30b291e9dc@roeck-us.net>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711093323.14529-1-fourdollars@debian.org>
 <20260711093323.14529-3-fourdollars@debian.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711093323.14529-3-fourdollars@debian.org>

On Sat, Jul 11, 2026 at 05:33:22PM +0800, Shih-Yuan Lee wrote:
> In applesmc_get_entry_by_index(), the cache->valid flag is checked
> locklessly, but setting it to true lacks memory barriers. This can lead to
> a data race (TOCTOU) where another thread sees cache->valid as true
> before the actual cache contents (cache->key, cache->len, cache->type, etc.)
> are fully committed and visible to that CPU, potentially causing it to read
> uninitialized data and send incorrect keys to the Apple SMC hardware.
> 
> Introduce memory barriers (smp_load_acquire and smp_store_release) with
> explanatory comments to ensure cache synchronization is thread-safe and
> fully visible across all CPUs.
> 
> Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>

Applied.

Thanks,
Guenter
