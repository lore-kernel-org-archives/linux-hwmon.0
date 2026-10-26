Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976476;
	b=wQavrDwcVG6dMuwjU8G5M3oFXHsxCqU28hEdD2v0LcrQjhRtyHzpaWKseozzyicJurWD
	 5S03NDAQgEvo/HlVh/URs6scitrTO1RykzkfWplU9xtlZa/WcKI2uGE2eI38Wv0Y4k8M6
	 8HJVXwKz+tYN0vOrs6J+9Wn9Wd/XomUfsw8hKJ3KMW0nizHNPj3D2wKNjC8VN/Hr2uLpO
	 sQGGW2mtIhsEVtMBjjPrsUWjurVmoz4/DaLZ8ANmvSBYrNiI1lLLGaLS8bOt2ge/2bpp1
	 9uDmCTCz3kPACaavT7eUMkqM+ESbBElAHNl9HwpDvrvem30IfIb5pT7/1M8RUBiOsUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ETaVg+JKCksv0hVScE41Vy/yxIUDCk9MA46Sf7uJaxg=;
	b=uN/ZQtP3cU6SJnSJ6q7P6j7pzth7D1MZ6iTMysomv44p6qH0wHO6i9i/q8kszDIxrA1k
	 qnQ5g0o4uLDgNpU3eVLun/AmevxCUMBq4J3Au3aMwbOts7yIAYIxLbo8jqggn6pXfpjlw
	 MKJbbdymakc+0K/hTYnrGchIk+KQSPQBrhni1FL6r/94rqF86JS31anKmw1F19gdofkqG
	 vJDIlc/KDuUEP5nsdzCTN7flBtoPaW3YvfcXXPkj8GGOJN3fiHEj4lbcL8dGwQ6xJYV3u
	 0926ANJZc7iaham6v/7mj8fudYnnvP0r3mGwEq4stoxPWUQ+tCOggO5AHu7ljPeXJWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JYGUz59G;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7807E606A31D
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 01:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7807E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JYGUz59G
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso12601315ad.3
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 18:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792976476; x=1793581276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ETaVg+JKCksv0hVScE41Vy/yxIUDCk9MA46Sf7uJaxg=;
        b=JYGUz59GR2IAGXxoiB3QNf8GkVf2fBELbswt2zzkZVtrkjTvYiwIr7neW8rK0w64G1
         8hozvQJCQ5Db+2Xqp/s5exrlojlPWTyKhBZAUnbPObs/GnRAVj+Xc3FvY8WPLXC7oD+q
         Rr2tGDWh/Pg2JjMVkUoj1cO5UxM8/RyJDOQZTr/BzBphFyM0hrXwkhGDudYHB3b2Ztgy
         vlWbUCpgDH3E2r4uLPIKK5rX+yF0PSS1hlGRIy/LMfGsFn9dL5gLVhAXGPuH2+vrZcin
         D3a9jItxfGcZElYsTBjaDBnr8U/qLYkKsdQchoqyDV8ULFwC3gfPNVll6kwcRZ59syb6
         2Bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792976476; x=1793581276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETaVg+JKCksv0hVScE41Vy/yxIUDCk9MA46Sf7uJaxg=;
        b=xtlvIDjY6Tgd2M3+lVq8C6Et9cDyo1IiH4WRziVaL9sZfvux9Ib6MuQ2vkwvDJ94Fz
         +LTfUjk5Cgww2vyIMvfttm2G8fRrHGY6+3pMNXV9aUbMOANbKrNyeTv0eT1A5j7GKU/5
         fqTnEQWUe4siDEloWk2SFq+EjhZxeWTcineF9OO2d+64skr3ZQlfacjBrWl6xCSArEHb
         gG7gGSUGa7/Kdt5puH9o9qqeGlryMwDbfFJAZrKLrg9VsgxIvejO26h5Yft2aQySo/jC
         CkTt0qvROt3FrsKd26AHrEowdHmTuD/Xdnu33M6mY6JpjgN0fPS0rDiy8c/p+JwY8wYa
         RAtw==
X-Forwarded-Encrypted: i=1; AKwUvBzu5+Xu94sDTQKl+f2LG7Rj0xz19tHk2qXzAfTb+cOv6wu5Jb2Arg8+mDK8HDgXwYpClhbM4pH2okvYDQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLi5viza2gUWhjz2XemPVmTdvdMlijt3zZpUkf9ipbfsuatRF0u
	1iZtDn/RhWNsmtdYOSXd4K8otZWScqNFGQVfmS9b2m9yXZk7JhLau6NU
X-Gm-Gg: AYBFou3tozKh8t/6oGaFDhdtIBv1WZLlV0BR2eXrPsUA4YE+WRKYoCwScMCFD34PLsj
	/dtFUP4VdFo6jJ5sLHr5/TNhKL/85qQBuWhBERtvgNWRnrL5sGvB61kXbj1YcAWTJUBecGj5gbz
	iViaMLqwnO3Bv/p6Jg7i4E9st+9RG4CRPM67nJXQxw0zbROfW8drOgBa4tP9a8035KZNyFrT0e5
	CZjfgu1eze9/dKWgcauuxOQepnnz8O2mEVc0iEU5ehUVpAXHOXfe/vemAGlwuKtLeYF2jOMcM9S
	5LwsvabwZYk+sVftRgltZFPspmEV6ysZxEHxA1nlA+8o+xinAjHM/gH9mutUuZYVX3RIpLxwM7g
	PK9ZfO7ZfbiNVPlQ7mqBpwJR3FwzkWwrCmyXhJ7UlKSyUUMCfy5WvkDeFG7nGP07d6AIfMhnyUL
	wYGrh84r4imdZv86K43iiXBfZ09yBXQVwNATELYSsuVtzI3PJ7Aeicl776qLW42RMlHdKELzF/7
	IcptzF9mzUCqcFsCZb3cvGitW1iXkQx1243jBYjgvtsYraV3GAeK55GOeqEMmymmLafig==
X-Received: by 2002:a17:90b:4488:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3adead4c649mr4370525a91.44.1792976475605;
        Sun, 25 Oct 2026 18:01:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba32f70sm5974385a91.1.2026.10.25.18.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:01:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 18:01:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	Eduardo Valentin <eduval@amazon.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (pmbus/core) Register the thermal sensors
 with a 0-based index
Message-ID: <f29d1bb0-27c1-4218-a022-9905f1af62bf@roeck-us.net>
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr>
 <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-1-bfafba9fcc95@free.fr>
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
In-Reply-To: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-1-bfafba9fcc95@free.fr>

On Thu, Oct 01, 2026 at 11:47:39PM +0200, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> Since commit
>   3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE")
> pmbus_core registers each temperature input with the thermal core using
> its hwmon index as the sensor id. That index starts at 1, so temp1 is
> registered as sensor 1.
> 
> The thermal core expects a 0-based id, which is what the hwmon core
> passes for the drivers that set HWMON_C_REGISTER_TZ:
> thermal_of matches a thermal-sensors phandle without cells as id 0, so a
> PMBus device with a single temperature input cannot
> use #thermal-sensor-cells = <0>.
> 
> Cc: stable+noautosel@kernel.org # changes the DT-visible sensor id, no in-tree user
> Fixes: 3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE")
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Applied.

Thanks,
Guenter
