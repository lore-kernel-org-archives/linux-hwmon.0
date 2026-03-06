Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C531634BA5B
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Mar 2026 16:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815220; cv=none; b=L4erT3mDVRkHcMT4AIaj0BN3x3gg7DIT5E5k3Q0KXsffjb3ThNGQwNZP3y5hBBlKgHwUw5vb/0f5v4/quhGrtiw02HfsUNa05cayla0OMb7hEkjDbmLHgxkpSw3Jpl5bCVotdoK2WmQ1fBsYPPJ92JugBvNqC3KFeNxfgU0fcGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815220; c=relaxed/simple;
	bh=RU95RNdDOAf5TJ6YGt0G7xFdwtFU4agv19bQzXaGAWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brBGZ/I4N2gbFxKw5TRTvorwzSTn17gaMr9AXdeaEapnzoJ33m508sd79mru5ERAC2j2MSK6JPZWyOiCIHfdu20Jd7Bax9zAFr6CfzrF+Ub8SAfVrNgMqOaAavQp6YMSVyhyiak+QIF2lxoQZr7uaAigWjcm4FmSywbwlze7eYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUnks1Ze; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUnks1Ze"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2be3bdfda8eso2557490eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Mar 2026 08:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772815218; x=1773420018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTEKjkr+py4vbKoL17aEQA2Z7Rzut4TnqzUYs6TIXhM=;
        b=iUnks1ZeYLeqyMgpEu0nqRN9hCwcM0jl97l55thW/AMslUwm1VvZ7x1W+Idrx5fYqu
         +84fB2y/S/7fFJa53nFI43HZ/dqUm2J0pZtSBoRCLpF/X9RMOoH2BhUEQ5gAFthwT3XV
         CqjsAkPu7HU8EbsYkRJ29uqz+ZMyfU9lc35GkhMOyKZrHgIeh3wX70OEAf8eurfFtW2k
         4khoUbQZZQ0iH47nm8sFGYzrJf7OKpspkajonNTmW6dL5IA5V06c+hyPxIE+f0UNxEJ3
         4VAhM49vhm0pTJs/wN79tBjsqVoDodFP+/QeZRzAZrKeWkel+2N+JI8ps1xZOrTL2fEa
         JMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815218; x=1773420018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WTEKjkr+py4vbKoL17aEQA2Z7Rzut4TnqzUYs6TIXhM=;
        b=vlLfEbEXZmEHJtZcHnWiZV9Bw0KCNiPRC5V7CakYGOIqmVV94bFcYcXk38orojR0E5
         9p1Jr8PW9DBoslQv+9pPSPwdnnu2sYJTZLc+E6ABOGD8Y7/4AWffBFJdMDVk1LRcCMvH
         pGnnOb3Wl9ZufNTrWpr7JGsPOIKTnZaiZzvVoBDlrdffmb6K5T8gbZn4ppOeNTlHqaeR
         J1OV/+CG/bnWo9xNSq6MfhKtCAb7pkOFLbR8Jcd2KN9Eb+rDVJ+I4FaIRoRZPVQjtDZ2
         XpH5SqF+/TAyQ1QOpvfl+lnkxVv8jiDLpQh19afLLiDF64/vUWnJ7GP3Xi5ZQMu1R2Ug
         pJyA==
X-Forwarded-Encrypted: i=1; AJvYcCVjYd/7/NQ0GAcWdNBjyKGNMMt9gwwSRTqVsmOfqFXExxYyhh0yzsoZtnZ2KzU/+uQ7F5riobPNwj1iEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNdQ4n1CUANlauIC33SC7Ry/FU3hupuHY3Q0NDQlr5rFtj89vV
	kf07yj4X67FcfSNkHwOkmOfdn2gwnEqc9p+cYo+9pGnua1BP7umHfxVF
X-Gm-Gg: ATEYQzzAO63KjgOXxllwtmh8s/k5WgadFittvH4ho68F8SSNVC5iO3hoJW7VVyDZXRk
	XP6dJNvIUT+Ccg91Ra+m0qIEgkww73e2fKvplbgPUBAk5AhpIIoGW9rAp23z635G9P6lJx9yLPt
	I8/nLp/ZRmbfSN1hEWNqXvjswoYffi4L/BrvCqeEAKLaFPVDjYZDXxsT7mvze+XXYDnHLwbwCrl
	Ua6PfIsDvkdU/iBGz/XX6deOK1K6W6OOGpZGRJIwHl9cD24Vri6RV/gspQFdgL60R4et2yRQO6I
	hr2jFsbz7znp7y2vY6uANm1iKO7UMtKWBKR0a+mjIKi0I7HSqzF0SD8QT7P51Fyy+TrlKi6etLB
	Te+FdJPfZ+S+YhdapDfCupXj2N1OpyNAzD49vUH0cF81nTBAf8uHuPz55l9Va321DMRRE+xXS3f
	fqwsIbArb8UgtmdcpEabVy9h5g9lJBkySAMOm5
X-Received: by 2002:a05:693c:6099:b0:2be:2b8d:3992 with SMTP id 5a478bee46e88-2be4de65221mr814876eec.4.1772815217782;
        Fri, 06 Mar 2026 08:40:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f80d72esm1728236eec.4.2026.03.06.08.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:40:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 6 Mar 2026 08:40:16 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Luca Tettamanti <kronos.it@gmail.com>, linux-hwmon@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Linux ACPI <linux-acpi@vger.kernel.org>
Subject: Re: [PATCH v1] hwmon: (asus_atk0110) Convert ACPI driver to a
 platform one
Message-ID: <7ff14a0d-ffb9-4258-9b1a-1fff0021d19e@roeck-us.net>
References: <3691136.iIbC2pHGDl@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3691136.iIbC2pHGDl@rafael.j.wysocki>

On Wed, Mar 04, 2026 at 07:26:52PM +0100, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> In all cases in which a struct acpi_driver is used for binding a driver
> to an ACPI device object, a corresponding platform device is created by
> the ACPI core and that device is regarded as a proper representation of
> underlying hardware.  Accordingly, a struct platform_driver should be
> used by driver code to bind to that device.  There are multiple reasons
> why drivers should not bind directly to ACPI device objects [1].
> 
> Overall, it is better to bind drivers to platform devices than to their
> ACPI companions, so convert the asus_atk0110 ACPI driver to a platform
> one.
> 
> After this change, the subordinate hwmon device will be registered under
> the platform device used for driver binding and messages will be printed
> relative to that device instead of its ACPI companion.
> 
> While this is not expected to alter functionality, it changes sysfs
> layout and so it will be visible to user space.
> 
> Link: https://lore.kernel.org/all/2396510.ElGaqSPkdT@rafael.j.wysocki/ [1]
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Applied.

Thanks,
Guenter
