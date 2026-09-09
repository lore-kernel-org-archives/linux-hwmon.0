Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A4F4334C7
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 20:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985612; cv=none; b=nm3e9M9bUfuBI6IzCp0Yy+vpZSlxvDe/3bmJ8Yo1MeSwuccPq2iB/ND8ncFS/lHGqt11MF/Jpu+/CbxkROge7y4XD/acAdISrZHxDqCqUbHpLWGxs+e/F/50wRwiKzc7Z+QJzHYT2RhQVo51NzWUETAsgX2/pwQuEu42zFyQhXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985612; c=relaxed/simple;
	bh=0p8Nkk2uR5bJct5mDj70pGBOis/omuOo7vuJrgv65Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIGfLMT9Dz5wUJ/J8iMDqzqypJoW9FANuLdWKgIIbVtgYpcgqkB1gB1yHq9e1wlgzPwBn6EPjZnDDYPseyC8ZlrOdV/kaIi/xX4NCNY/keKD5ikpQVr5O//xwo5SMIL+p8CpLuMf4djecxwXQ88W4AgH1FsDQQhgg53xoZBvwJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AohOgggQ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AohOgggQ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2db710396ffso2255995ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Sep 2026 13:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985603; x=1789590403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0rUy6QUb3FEaeMughMRFuqCqfaHGo8kxiuvRMxxUU30=;
        b=AohOgggQ5aKgD4ZkgxVcEE+fpiUWut/XEwN4ZefwAqF2tJMDvJmFbw2u6kMkQdMP/p
         EiCMDLZl/6CRcTagFPiboGekl9cTt9AL3yGoyy/B5w+l2x+rXzXKZH6/r0Jv9Xc2Z3pi
         Xuqq5Hj5otbjR1ia9cfAWv0IcDh1m+7mk/SwkHGe/rfj9Wwp+0ckBwtIpI1prwRXSbcb
         H0DpydB6uKg1gSbtSgplpW+LvDWaYBlUlzkM0Jk+fQzcxGlZXfs6n+92wY2dKilOHrq5
         IOBS9kfebFvNMszjaHxB9wZz4ZM1cK135TuTfmY8vH/P/nLANeV/v1Bgr/zoAuqn3ltB
         4yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985603; x=1789590403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0rUy6QUb3FEaeMughMRFuqCqfaHGo8kxiuvRMxxUU30=;
        b=MwgCWrQwcYtmWpj8YRs8wEW/VctIHUkTiiTSDr25OgUqUyixu6tq8GeLul6gpQ5AKU
         k22Sf5TP4gwHoHkYZwYAl92ITByfO5Lq6+wuYywe4tM+6LLLCSg/RfQEi9YL/GAZkbsd
         flf+F6h3lGHWWv7MbCn2GHBraZRflZ9sbNChZXn8Wn+SRIDOUZtz1bhgkWO/5ZXWvbiC
         +nlKXRK+0IYYpWYL3x5vq75ldaM1ufoswTdSytlS80qprGJWf2oKaHIn2qwCqBvodzky
         CtdDrL+dyXZdLG/apE5sQlktIXSCr3kFZp/zqu3y+qmX2ND4iEmXsrYtIFIdHukyUFxu
         dBcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzp4qV3o9K8784Jg07uHf+7qUvTscB6dVS3lc4FOd5t81/rAlUQE458S7x2PRgdcQncdB8l54ECBaTi/g==@vger.kernel.org
X-Gm-Message-State: AFuF++k1x66kxqoxJIg89XcUBq4mvYctFndVxF8fpBgBklR6A1LQDNMp
	H/DIqoCLFbQaSA7DfK3+Nv71Clv1yW3uNvQ+WgCuoKtq2Il+IRnY/ZV6
X-Gm-Gg: AYBFou3Ec0EADsOXx0n44/eJRhL5xECpkivANzM/9KoS1olCTUogYkesgX6KMGmJqgZ
	mUILWj4noAdxP3+8RfH+mUaA4k93YATzOzHpF/qFX0cfYiYaC+LSkOMwnvlBX9abrH0jRhbSfou
	gmJRn6gnJ6BS3i20SQxp5FAkS6BzXtGr2/B4L49oZ+ZZWntejp487E7otcYogisy2gtN7vRNot7
	TpJL9e2MNe34C/d5ciNyESNYKte6I9Po891vEhVr66nr6Otl/CtARtb6i9N/vOF7zAl6Acwarcy
	mBYRfpSHxLYxcaviA67+3AbgvC01MkftVXfChYNWZ6uz5wfUH5b+boCGruPTUepr9VWDmvOWnDw
	xxw1GH8DFRFT/7ns8JCXDi1JHO6WrHlfF0qqP3cpg5nwsVcUs1d81o2DBAosb7frHoJWqfH4bDe
	gz/4LVXLxwtNE2iZ6tSRb6SfwvJAVqND7siNesS0ua+aa3mFiGMVOVsvQt7ApnsfnwAb/kXI0Bi
	osCRj8ZrzWis5eiv7IdO8E=
X-Received: by 2002:a17:90b:2f8f:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-39d779bd533mr1151278a91.14.1788985603264;
        Wed, 09 Sep 2026 13:26:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d77608fb4sm1175896a91.15.2026.09.09.13.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:26:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 13:26:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] Documentation: hwmon: (nct6775) Document
 NCT6116D/NCT6122D/NCT6126D support
Message-ID: <6faf5d14-1698-44fc-b4d3-492f567c6172@roeck-us.net>
References: <20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com>
 <20260909-bootlin-hwmon-nct6126-v1-1-4e85615fef10@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-bootlin-hwmon-nct6126-v1-1-4e85615fef10@bootlin.com>

On Wed, Sep 09, 2026 at 08:25:54PM +0200, Paul Louvel wrote:
> The NCT6112D/NCT6114D/NCT6116D family has been supported by the driver
> since commit 29c7cb485b32 ("hwmon: (nct6775) Integrate new model
> nct6116"), but was never added to the list of supported chips in the
> driver documentation.
> 
> Also add the NCT6122D/NCT6126D.
> 
> Assisted-by: opencode:z-ai/glm-5.3-flash
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>

Applied.

Thanks,
Guenter
