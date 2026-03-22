Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D423033C6
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 16:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774197743; cv=none; b=WgMN8fgQ+PlipNaOjuvhHEUXv2aSfqUbM4lwE5Rly5/rtEoS4n+meh6oSVauffi5ABiphpAM40/JBcXV0YXFlFCposuXWQ+mozjFcLD7hUjpOpPpZ+IIO7Kel42uGsRymEsnevnbiQT5eVhl3UJdKwIVhQ09bKuc+aVqzOsgPZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774197743; c=relaxed/simple;
	bh=1390SyY9AT7Z9hZX92R3Hg9KyIF1oCu8KN2F92L3mDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyE3MJgNCsby39G2EOIzpaZYk2daabxmmJqC6UPz0HJX30yCBUdA17O27ZpRs2mjbI8sfPu+15tUelqXy9so2Ih4Vg9UTctYbhrBRnPCe7IqLNIbuxQbmZrWH7xQuj/EKHLaxyJxYXhkLT+OoBmVheDGJffbGHG0fj+EnUzE3aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsymLo8K; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsymLo8K"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c0d36f3888so2075408eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 09:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774197742; x=1774802542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAk+E3Qy7XzkEnV28gFdFpTFKMymvCPt5zP0QO6Jjtc=;
        b=lsymLo8KV+VNk2UAErKbx+iCH3Wudcr53R3A7atoRx16ORJbu544KsBmXkSJm26FUa
         yYdRIl+ogh8/o4AWC//d3nt2HYoa/FfJV7axBWlksMPWdj/ksP+UNcJCY2eR/fgBGcwd
         og6PPfH79aMNwHA+eZbLYXzidcQl+eHtZquJpIuSajWpPjliw2IMB/w2K13k2WwIqMQV
         8QU8LtxSU0eyKnhNNlgBOmC02tVcworN3AYnauEVUoSEZAFaY7BlD8yDPqRE2qScrByT
         ijk1Tl5KDJsabvPJZhDT8rLwbuBnzGPoNJSf4DBu9gNsqqZxomkOc6cKn9b/cnNwTigk
         S5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774197742; x=1774802542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xAk+E3Qy7XzkEnV28gFdFpTFKMymvCPt5zP0QO6Jjtc=;
        b=ZXBSqg65kchsI8XI/WHqkgKo2j4mjhN7w1IU+8ZHCHemLuVLBWWEpeisASZCoxHymS
         g/Ne26WpzrCQm5tmo+No8mE3yfBrsKjNe0BgMUxknkggroPrTSV5wVs9R0yIrEnAk13/
         n7IxplZADtiVh1yaCFCCx0JFwF16G4Ouwj8DO0pxULe/OgItbBHER1WbAH/5dN+pniz0
         rhTBmCexqrwL+601QZAFV21JcQk+8nlUUO3suXalBstgB9SCtzzbbza1+FHoRvH0ZyAU
         SbG6XzLyVbziD1vSEg7Dz5DDFER8/L47zIOQx+CHlf9qaNUdk5NA/ZN2Gs8eCGpLwIo0
         koLQ==
X-Gm-Message-State: AOJu0Yxyc7Lye97MT42oiKKeFuyADiT+UCVqAqGxeQ04SIZC7E28JfYr
	7LZpA8hV9u36dqG/xo43tDOJPWY3oMiEx8NCgprm4BurWJwyaobKsn74yD2caw==
X-Gm-Gg: ATEYQzxyeG5TPignaHj/Gpw5pGDNVCDRjCBqD5LkodeslIDcwnwIBJFq/bMVUcduTmW
	2qgI1T6bpDk6pX4litTagbWGL/6CgwHB1dn0x/ZtDRSDvH23SqwijNYKqQIehTQh8TGhBqiy4pr
	NlYNfYDv1kuiTfHRcKExtLhJNMYqn0n7LSxk5CQVn7ehurX0EpT07OgMhCoTwV8v6/6tS9kjLTl
	Ikj2FAUne7THppg0vNc+mbWSvgBFX2pCGXu/Ou9a+wMD06T1sDUYRTFZEh2yFiYF2bqGr5fKgf4
	TEOpyI71i5Q7IZ7zfs5M8svUFh+3kI3+5Lm+v8ZHxPAUK11n4eoq2vhIVseb6i1v8mPQMlD3o9k
	aE88rboormukrsFU0cyMJYoyWSlrZooLqPzqwCX4NWA+D1a18TPAGdX38yWKQ4lvRFILS18YdcQ
	VBxtWxoV88KM9+nwYeQyRns2CIuAhEqonNeRaG
X-Received: by 2002:a05:7300:dc94:b0:2c0:dc7e:ed0f with SMTP id 5a478bee46e88-2c1095a4f1cmr4235581eec.3.1774197741666;
        Sun, 22 Mar 2026 09:42:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b29c941sm10092079eec.15.2026.03.22.09.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 09:42:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 22 Mar 2026 09:42:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: lm75: Add support for label
Message-ID: <c9c5aabc-6fb2-41a4-84db-716deb141f18@roeck-us.net>
References: <20260322162616.102229-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322162616.102229-1-flaviu.nistor@gmail.com>

On Sun, Mar 22, 2026 at 06:26:16PM +0200, Flaviu Nistor wrote:
> Add support for label sysfs attribute similar to other hwmon devices.
> This is particularly useful for systems with multiple sensors on the
> same board, where identifying individual sensors is much easier since
> labels can be defined via device tree.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Applied.

Thanks,
Guenter
