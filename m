Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0378D39FE3
	for <linux-hwmon@vger.kernel.org>; Wed, 31 Jan 2024 22:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706739727; cv=none; b=G+pZ/NdcpSgCN9+cVs5MtGk9lwAX2ahQgCNZo/MM7hliAS3zQMetxhe2QP/hc6PhEzjUKjVTqi0CLlfRaADA11CSVUeYLU5eEDpt/eBuNhe5mwsPuQKMh/9+0Aq5WT3ecL75RAqO4aR67u0nD6NM+6VhWRAXCQxchKRwspbamU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706739727; c=relaxed/simple;
	bh=vcScM3cpdf7Pja37NGeK6Yly0/J61B5EtMzfdpq0CFg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=P7EtdQ27KDFgo1uuCLaaPcfhMTA6p0hPOFiiyzbUSxen9emb47uero/hymFuV9n55CjsOmiythWvlqDbnKRuMaVPml8j1D0s5fEP9sL7Gq7bPMmJSfOjhE1FPcJMIkXTaRhw4llICiAGMentAmlycpo+iLsvWT7Dj6+dQPzx8Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=a0IxyXcY; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="a0IxyXcY"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-42a4516ec46so2270451cf.0
        for <linux-hwmon@vger.kernel.org>; Wed, 31 Jan 2024 14:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1706739725; x=1707344525; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vcScM3cpdf7Pja37NGeK6Yly0/J61B5EtMzfdpq0CFg=;
        b=a0IxyXcYWUS0UrNbcJkKcy0kjVdzpNm2qnbggSJj3XN8vuN3WRoVmVp6dWoim0I08b
         i54pYRG/sKToEfVwg2LTGWrMU8lt/YKiNTpyxZQ/dS6cw5TqmvXFVDHS6OJQL0TPJA1l
         18nT4JpW5Hf+cNO5LPKtLHg1GVPdabkI542vY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706739725; x=1707344525;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vcScM3cpdf7Pja37NGeK6Yly0/J61B5EtMzfdpq0CFg=;
        b=mW8kJOrD3aqI46srckdpltrY1KeI1i4u4vdZcWh8cNYaja+qsLFKREHbNtQGQWiQLE
         pg2Ze8wB36wBbTj8u96X9M2W0bMYDEinsbrow+F2BTxLAr0balNqwuUHIuxV7S1lZyFJ
         HNoCUfQH++170rABNiTVxrfnTSiEXz+8zLsONmEnuB/HcJv61B6rAz0akMXUPmWe16Wt
         CI1nAUS/63s3SpFZu4CipRJ7pKS8KKcRR434XIwMP7IOFqkJDCPS5zx65OIpuVCo8edj
         MQzuYTMt0F3+c5pGJv5eJrlFlCYYXfhovFmcemSRT7HwlqUGqBBfUXj2NjTkhmhUc+g0
         ShcQ==
X-Gm-Message-State: AOJu0YydMzehHRv2hct2UL1MF70jY/aOljuswXhBS/B4+YTrfFn1mpAo
	PnGEEXQwB5kw9loOG9eHsd1ZZgKHqqZxB71lEsBJ8IgX0njwROZMRt8Oaaa3ziw=
X-Google-Smtp-Source: AGHT+IHT6U2Z6r+BnwKmbGRGJKdtoLhCF94IFwTmfyoXINLyl1O7n6F0NJF3d2P84mNPLywdHvL9eg==
X-Received: by 2002:ac8:5a04:0:b0:42a:9d70:7f58 with SMTP id n4-20020ac85a04000000b0042a9d707f58mr6949131qta.49.1706739724907;
        Wed, 31 Jan 2024 14:22:04 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVNPF3itdhRp04csr0g5GO3JreHvCYGEIEA/une96Tw0FryJ0AUsks6nkPc9NxQycBHkdbMDKYBVjTcz2IjRJuyJkHgxNyySC5weAtSxjO5EEaYMVghfNH7nKD4OL1lxjiGUjUEI7dg4/tfEA2tPW06FBT06l8h5qTN/ZKeRaBEiSsjKlk/w8lTGiQA7XkPmaR6priWatn7TyQuVpp3HuVi7JRILUR0tzT73HALyiZHrMrUYSL6iJ59uXeozc9BZprHUPJ3nr0SnhhiPljScq+3grTguB6aez9TEeN+149b7uSCpWNPtbIx8KEoBFtMBaboVIJrCAZbJ/hfkzNfAWBjTQ+9QfVsmuYbogN8Hz0VnU9yp7Y5/WBWK5TAX/hi841Njiv6orz8GwTLsOAH
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id ci13-20020a05622a260d00b0042a729d17dcsm1896082qtb.86.2024.01.31.14.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 14:22:04 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: luzmaximilian@gmail.com
Cc: corbet@lwn.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	ivor@iwanders.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	markgross@kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v5 2/2] platform/surface: aggregator_registry: add entry for fan speed
Date: Wed, 31 Jan 2024 17:21:45 -0500
Message-Id: <20240131222145.3320-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <8552a795-9ce4-417a-bc71-593571a6b363@gmail.com>
References: <8552a795-9ce4-417a-bc71-593571a6b363@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> I assume because of an older MAINTAINERS list. Ivor, please add him for
> any next submissions to platform/surface.

Yes, mea culpa. Guenter also ran into trouble applying the v4 version of
the patch yesterday. I'm sorry I didn't base this off the correct branch
everyone, will be sure to do so in the future!

~Ivor
