Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D7C3451CF
	for <linux-hwmon@vger.kernel.org>; Sat, 12 Sep 2026 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789222865; cv=none; b=lpiDm4FIeUi0SR+Kwu+VZQDL8L6wvSuM1ssi/2VsKXIdcR/iNv072vnnBdBIcRooxe8/s9W+IPMfYgDI4N89KjD2cAOvBcWl7SAzM3Skf09RW+VSTdaz7jD9AkZmRQo/lK17tfRIDBVnTOIbTyU3Apwk2PFUILSENAbGlPnPL74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789222865; c=relaxed/simple;
	bh=Uiy8nevCbQFi+tO7PRMHhK5e5/ieop6sXofJo9kMfiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+GIlWYSL4D3fy45wa5U6Sw0vUhrbFiwMoEhZPsVn4YglSY3/ZPsx63k5z+nHx9toygsQw+dn7qvaBNCrhzO44uoqZHNIV1lkmR/m4rlKZsKacD5rO0uiXCg5tXNGOhkj4bZt/PJJ8jEhy4/lr2kZ6nWw8zgqdfTCLr7fTBwnrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4eW1a/W; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4eW1a/W"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbee846deecso2692073a12.1
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Sep 2026 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789222863; x=1789827663; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHeNLogRQjCpZaDFq26lFx7YUh4OKGaTu/lrQFFabec=;
        b=S4eW1a/WJY0sJgpNhNHwz+iZxFN9+fQfwkTp+5w+SI9Jz1DZ/bgSz1PUpzGrdwh4n0
         39gFa2CbNbIs+iPErSwVki75FdeEfL5ljaoF4EYJcLLvo/NolOiX7t4adSSyeG6FvVQi
         XRYaVqrzmNC0fzpLBeKP1AqQD2O+uEaPSRg9knE6D71ABERtBBwA4ChfGdstUj/QwOcr
         RdVwEE3wrqWGzq5sDo9nei6OaESl272McGEKQX0zHSOmqhxsi6tRgM+cEdvjFkurmxML
         b14xXksmhv8pjJs7SVGXU2NJNsr/1n/L8tCDvbT7BHdAoWIzY/80V+ZcWj8uaFL1b5W+
         zPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789222863; x=1789827663;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHeNLogRQjCpZaDFq26lFx7YUh4OKGaTu/lrQFFabec=;
        b=EkF4NiaArnaWvkJr5aCWiQUZAojy7nCyKvwGyyIeeizHibQ6yGz3k9iC4FFb3CA8XA
         5KSkjtvCpctMdh0W0oLprtWtPwrT5BmKNnp01UKX2tkTKdYG7YNJBu1bDxngRB9o3E08
         yUI0j2gZLJmpWqxVuBNsQECr2PwiCTQ0s/1ZbyKKG1aumVSgb9DDLmEEh5YPYaw43qxj
         nYvGZUN8wH2rJENbp1uClr45YJM7DUoF43PZqrFYolWdfXPrzkLEsgjbgnIDZOHlhaJu
         nrvoz0PFdF6WMLFQ0gWpRsKjtD073QBrvn2mtRH1Kha8i3cik9OSKHMxqWLj3fycPvBh
         mWVA==
X-Gm-Message-State: AFuF++lqLo4bVS0uWGonyVQKyiXbGeKdgFPwM5a31SI8aRpV37cJLFMv
	fOkbyVP+OOvBdBVnMyhZeAqD7nX2O9ORMOrgAF3Oqk14TxJiLyEgBWRF
X-Gm-Gg: AYBFou3ynO1qTditxh55c/yHog+1kHkg4md4wUp7l7AYfaLjnxlnyuEjRy388iWjd6q
	i06SiunyTkPB9isC43zHSE+/rC5FX+VWDCT9r2CiO9Hm95RoVm1y9A5o9bPxFWGsJxPAZ9r6txI
	4nW9myzfx3C0gl13R15JXDXczWoINdUqA8iPJFeOZUezgKdV+kJR8v8Kd9m1WW+0g2eSKCNfEIE
	oUUrfFaeKN2lVthKzcJL6ms2B8gSfLXnCFVt5ftJSuGh67HL+ZcHTlLnCAbt8/rRu+zsMxJma25
	NQA3IThjuNFU5bgiW2b/VqaTGnZqLClPjMXd8kid/MYBXwq89al5j1kRBBrKeeM4/IpVjnwaXJY
	sP3JZfhh8ZhMkHrqH5Kj08t+f+Tx6WadQqm2oZ0LvDp7/uYSAxvmEQ0cba9EP/h7R7cHRZM/gho
	b89iqMmB290NqD2a1Cf8DCmpXNn2MTxiICZkuBvovMI0jaWFfxrvAnuYJf51EJmI9pJ/c5uWHJh
	7s92sneiopt
X-Received: by 2002:a17:90b:5823:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39d9c0aad8dmr16717402a91.16.1789222862658;
        Sat, 12 Sep 2026 07:21:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95994375sm10643910a91.17.2026.09.12.07.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:21:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 12 Sep 2026 07:21:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 2/4] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
Message-ID: <a4e0335f-7724-4bbe-b624-2aef0990dc8c@roeck-us.net>
References: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
 <20260911-hwmon-max20826-support-v2-2-5e30cbd97d84@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-hwmon-max20826-support-v2-2-5e30cbd97d84@analog.com>

On Fri, Sep 11, 2026 at 02:53:38PM +0100, Nuno Sá wrote:
> This is in preparation for adding support to a device which needs to
> use it's own read_block implementation.
> 
> The MAX20826 family is one such device. When not in PMBus page mode, each
> of its two rails sits at a different I2C address, so selecting the rail
> cannot be done through pmbus_set_page() and has to be handled by the
> driver.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
