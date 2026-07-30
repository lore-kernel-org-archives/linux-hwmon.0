Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F6F37106D
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 02:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379332; cv=none; b=Y1LTQ1EbkWNDbYsJAFWgxRzqD+zwondoDFmz+EXZGy5XCEAQmn3RAPo5poEMe9tTSrMxOUFdhCWhx/eJzn5aggHzfDvKW8nxANZOgclPk/FtAFWEkeHiWBV9AClA3nFe1GuvvGhFdRIedoUbm6B+UK1GS0X4KwJAzork4Bp2b2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379332; c=relaxed/simple;
	bh=on3VzepDs/3MHHs0RRL/UeEpFoiTSFv8jJib0SgDcnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Actm0CCNdmHeu0+poqneZVlQ0bgvQdvms2fkTfw3yXzhH0hftthjsQ5QqQF4RpkKtan9o0/M9Q/iih1Q7acHgAXl6I3Yd27Oz47Z8QWGd9g78LymbNEycDzVm+srem0PKtf2YqpZ7AWxrmqdSZZKfENEAo7QfABpT31eV3q7RZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWBgPn3P; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWBgPn3P"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso1941557a91.2
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 19:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785379331; x=1785984131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JY27cQNaqzGYLZOQbmnzVq1JmgnQdsEEv2ezwPRKfII=;
        b=eWBgPn3PrZkmAc5r/IYJ7sPVoPhEed9Y2fKWWjjHpixcVfVyEdgdSoiBJ8q7t6WjZz
         Hm39s1jTW9W1lpVUscoLMztLdaNKh1Ge6zGp+9fzqUC5n9vW/eKPDlgjcx/F1wghqOIa
         bkcloqaYEmSDGc0C1fbik5MTfamYDqQSqanFyQ87vyqwybzTFBuvH2/g7LK+5NMa9Cp6
         PxbpRvPZoKOq+nICqNR3UiC8j1QJr2q4KBgRedUvPkSOcVy6K9kg6Fojw3907Zlj8Q1d
         lxbsx1cuYzYoYSJhsLFMYwX0cksXNTzAV8ekV5pRrJU/5NLZW4i3Zdr3PnCJl01DR20L
         3fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785379331; x=1785984131;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JY27cQNaqzGYLZOQbmnzVq1JmgnQdsEEv2ezwPRKfII=;
        b=Yt0dhcYLZ8IoH4oRWHezuL281Ou0u0PkElYsF14P+bZeyXs1WW8/vHObBVp+nszFZg
         rJqnssrRry2CPU3/xT6Ch/4gWRczBsh1t9nDAIUHqf4/z7mB2Psi+JSCJrO8fmBXVbTq
         2nIdJZ3FkSxPbvEUFHmGHRXHlSU9mjdYThlZ7EId8hWVrZWVwwcDnY2T/6Y0IzuyWBeH
         i3yC+11RVurhNjdI1NnZqcrEWSjHGev/Kq0K5V0n1BeapmuWcoDUoGx+eftgVKJG6/g7
         I1Q6ZUq4u/AQgea+MRwWWwDoznucnNMto6yDgWcaEZ5E6i/lrJtcM5GqF4wIEbSyXEf8
         UknA==
X-Forwarded-Encrypted: i=1; AHgh+Rqpqae/Z+/nyKEQRy01+gvlUGUmWkXhjCS3ZxNkuudOWPqNccoJoACoccFbmjD5hWhfNhi663EtmFLisg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcQUw6YSbUhliECTI6xeGqnOkXWPC0JJ/2ENVc5XOmtQ94LdIc
	cqK9pZMgUeBlReH8d+i1PjRrQTQ75lqJApf+1a7npiNu+i6zt3oZ6KGk
X-Gm-Gg: AR+sD11MBUxDIbfkHvwNmrWSH7PAeW0MwOzWEneZV6sXc3SW79uuE2x7e9VrwdTfAOC
	MLtyWrjxH051DsO4WrAuPdqUoW0H/7MfdcTc5v0Qx2PJQoIayVwys3M0s0N5LuThog+LrNFUIsK
	plKFhRMHrVcGdk53wNYUmWZrBfU1RrLfrzcdEt1+LXc0X290yikXWKtj3Mhqe7ke+kZmBypkyUD
	JXN/71fStcNl4y81zDIDCnDsqjLHd4nKc8golTKE1r4duKwSDlObm1bKhY1euq2kFIKq8DbSg1Z
	k3MKEWN2XeWJIFb8/lubUd8qCh4g+BCRUjVC58Ih8qvz2XODAWjFjsldDf63SMKwd1pJubd4IwP
	giqFG6lxoI51haDXaGCN8hWIUNo+G9l2dmE584aJBKbFE8QBHEvVDk1mg2nhThCrRBola8xV+5R
	41iLMwMKhiIup42FqmsBHVmDVgF+oFRzWA6xWrl8rZx/zb6jZCUaHXkG5UpQ/gLnkrGcdPjCsaN
	A==
X-Received: by 2002:a17:90b:1a88:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-38f9bd73f03mr782178a91.8.1785379330453;
        Wed, 29 Jul 2026 19:42:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc63fesm14037037eec.15.2026.07.29.19.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 19:42:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Jul 2026 19:42:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 4/4] hwmon: (pmbus/max20830): add support for
 max20830c and max20840c
Message-ID: <82c06175-35e4-48a9-9ddb-e60d3dcb974c@roeck-us.net>
References: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
 <20260730-dev-max20830c-v5-4-a7553f84ee74@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-dev-max20830c-v5-4-a7553f84ee74@analog.com>

On Thu, Jul 30, 2026 at 09:03:36AM +0800, Alexis Czezar Torreno wrote:
> Add support for MAX20830C and MAX20840 step-down DC-DC switching
> regulator with PMBus interface. MAX20830C is a different packaging
> for MAX20830, and MAX20840C supports 40A regulation compared to
> MAX20830 that is only 30A.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter
