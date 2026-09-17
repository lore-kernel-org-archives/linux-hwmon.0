Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C27F199E89
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2026 00:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603551; cv=none; b=LIZbrIveDCchfMqysXijKaHIjoHjOPp9ElV3uOchjGylU4AfOQtGrzXEqLfu07aZgWOUw8WKBj6yE40pIqcre6LgKhYHI180JbtwavuCHp3c8h+G6M4MQ/wTzMOrr0xkalgU2aaaf2+ks9E7g3fynl+L3iGkxVo2kYnIe22KThY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603551; c=relaxed/simple;
	bh=YfBWQIfeWmSq4z4LF/oUiBx8g/eXxpGJ0xbwZkgPHfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aB7dEDKXo6NtBKOVQUA/O9K+wWHPBdP6XXHyJcICgb9XYjtlAvaadC/xXi29CCf0RxJS9JUJnhLMxAqnktLLihENN+FmYymSgnknKhET6MI5mAb8XnKEAeBFmqgtn+gmoKEmHP1f2DiP2+K1p3zXC2/i0Q3WItFtrlGA+XCos2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDvGRhQn; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDvGRhQn"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6b1ae72186eso134015eaf.0
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 17:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789603549; x=1790208349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kBJXze/m9QmJZA93LQC5bmBZ9qB9hQQMsHhryNrPRAM=;
        b=LDvGRhQn3VgrlTn/7I9Mp8PPtXW3tyO2yjU+zXNyOqfvmFjOsYcLsQaA71QBCORvlr
         OYALoQiL2dYZBd1FoZb75vl3IfSH6vZ11q4k5NPKgbsI+JcsaAVeb1uetQDhIB65mHHl
         zUlnNDW//JAxh0xacaCDz0rTFbYS6MH59qvacfr+72k5/rFR7r0HQHfF78oxMp6CNylN
         9ZjDUWpFj1YBw8JfqnTELXUZQ9sZFCMfJLJ7kgJjy/Wd4OjsCx4Os+FeM4Nfw/fzY042
         5ANZ/W6sxwywd2E1l7KGuX/Uyp6M+l4UlkgCjWECbyKfpBxtvDyDzCQ2xTH5c9j66TvR
         sfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603549; x=1790208349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBJXze/m9QmJZA93LQC5bmBZ9qB9hQQMsHhryNrPRAM=;
        b=B8KUwazIouvnhUsUTMEuEPdgwRplizhbqsSOpY/LywSQ+1Haoo9D3snSJT98//J+ab
         hSu83hpTb75Arz43SWy6UBC6kVcZ/cup+62gmhjp7dl2LwTE1z6PnhN7iMjsTmO5EZdl
         k8XDE0VUW0OJOMrGktBAkimHGOIEnox4rjyYtP+89ywTjFzokV9uNtajlms9KYqmdRi9
         dZzqkEGeTAE/HtmnApexmgOjhsoPAyLqGET5Yu+DQnbOCUPDKYEAUmGr09uRmPcaO6bI
         ugzEJutY3hZJmnIp26/kn1lThBc+jcebRM7YdX95qBo9tLQAEbz+NctKPWI6MsFux1bj
         iH/w==
X-Forwarded-Encrypted: i=1; AKwUvBx9yyIXnp0slT7XW8mRpSssU67gicL2n6ijf+kJjEsXYKADRwszx4HAnPoFQNDrEkgJbXN2Km5ktdHVoA==@vger.kernel.org
X-Gm-Message-State: AFuF++kr2+3ab0jJ2HAHfKIsLj8qa0JN7WcZoAmiS1TyLXjFtpsI3x/i
	NirX4jzBx0xq5EdSo9fj2M15DUliK2T+xa5PNI0ZQonG90K+ukAgyAeA
X-Gm-Gg: AYBFou00gVVG2qlhHtY/6FxQiqjU63U28KerChEC1MVDgRgvtmolrjGbb/Pj13lJTmg
	tlx8bC0+N6LjRiDb0tQyCZqfr1IudlRyZ+c9wffw+dasi39N678P3Cs1DsSGjWD18+c6AqCj+By
	zVSLnprBxPJMq1L0blq2g2MhIl35IJwbjBKETMCIS9AJEaCJ5bxnyR5RQ5r1G8MMI/IZw7vmLS4
	0yXrj4yn6vnGWTvWm096atNbCHPCwIevjEEti8+eszlf/9Cprqekrb+SdqDWThrxWG5sy9GLzFw
	hc+G1xzQkZFQ/HEUbdIeFUAYAMHKvZP1f0e5eGE376mY/ct7OI3NSqw/ERAfZgkbxZyfDRRzmxk
	8pYqpJuj6q2DxlA9ao3Oxf9UjpxPxkGisCPG665yqF1fQU4kQ1RoYYOzVkMRl4dCOKo/Feny+Yu
	0OLtlvJw+zPHBxdL7RY+XSlbnmmnLmgVGHLr6YGEA7BYlPd6Ze6Pgy/aGuO/hQpYKnUYa/yXn+i
	KfOvVxGPzSJ
X-Received: by 2002:a05:6820:3098:b0:6ba:3635:7ffd with SMTP id 006d021491bc7-6c7d46e698fmr4348329eaf.64.1789603549061;
        Wed, 16 Sep 2026 17:05:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d771e5sm9349126c88.15.2026.09.16.17.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 17:05:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 17:05:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v2 1/2] hwmon: (pmbus/tps53679) Select page 0 for
 single-page TPS53676
Message-ID: <54991706-16c7-4033-ab8f-6ee1149d1702@roeck-us.net>
References: <20260916235406.681131-1-sanman.pradhan@hpe.com>
 <20260916235406.681131-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916235406.681131-2-sanman.pradhan@hpe.com>

On Wed, Sep 16, 2026 at 11:54:17PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> tps53676_identify() derives the number of PMBus pages but does not
> ensure that page 0 is selected for single-page configurations.
> pmbus_set_page() does not update the PAGE register when info->pages is
> 1, so if boot firmware leaves PAGE set to another value subsequent
> register accesses may target the wrong page.
> 
> For single-page devices, select page 0 explicitly.
> 
> Fixes: cb3d37b59012 ("hwmon: (pmbus/tps53679) Add support for TI TPS53676")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
