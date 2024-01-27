Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78142E634
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 20:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706387315; cv=none; b=qKr0vRu0u+GEIGjW5VcqOV0qd7NaTeEPYppQoKg30+INGTFbqf6JJtlm+5oESaIlOUa5HrrqwPBsKL73e/b4Oe0+vjgy+fXjlEkhw1Tvjk0KiTCAhIIT37Xfj9mLe4G6Lb/IwKl3JYaUevg+7HGnZzw5CLNq11nS+2KzgeNpD2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706387315; c=relaxed/simple;
	bh=LUBeGALBzMiCBd9c1SReM0q1tcU5b9jqGILvsbgJMIY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=SWJ4VIu0XRacarVkyF9VyV2qjfhy0ZueFnX4PU/Zyqt5jP8Ft/q1IUwcnltHIqDZA9yrA140ZkWj7YYT1zVeFgfWTK2lqkeRis143vp0RZ4OffEXshRIlWiEtqgG7HkRxaGzVTz3359d/WGtU07K1l6Suc6CKdTp/stRl1Yb9rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=cPiUlOQC; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="cPiUlOQC"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-783cd62f1b5so93127985a.3
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 12:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1706387312; x=1706992112; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LUBeGALBzMiCBd9c1SReM0q1tcU5b9jqGILvsbgJMIY=;
        b=cPiUlOQCphIO0s9NPenE2RFlAlyb8S/K+R4BYa5wtGhyJBvb2gRqVjjR8CnNDunySp
         Xbh8vGeIFcowaaGMk7FGDYGfMGysPL9EXx+tCaH8yBW7Utj96SM82gxSduB5Z3B8CUc5
         cjcvlVDGKD1h85A82xGLxgStlA5Srwy6Bs08E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706387312; x=1706992112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LUBeGALBzMiCBd9c1SReM0q1tcU5b9jqGILvsbgJMIY=;
        b=eEfsHuMoHneAaMElwO9IeRQypbB8i/vOdnfa4AQOPPFGL1GM3Ys5jQNpffuJUFyNUg
         4d97fwBVONr0haL8Nu6D9tScjSD/0nQCE68cLWtrfx5YdwpwbfWiNuBYVfwq7gLAvdZT
         cBTtNcqI2GbvxHEW84SzMPusIbPzsAPwemntH+wqMCo/S4Pw6q79itzx411NaqXYU1PV
         QAl1o3tGKKU+IpKzT6Uxm1pRmElBvsCfL+nOzB4HQyTv1cH6l2xNwLNKZqYE6Et8l9Zq
         /dnM0ZcPL7Bt9AbbU0jOwDBXFZNgiTTrDm9X6AFFuAyAFKk5T7R0W7ZP0/7EcdoHimzh
         jU+g==
X-Gm-Message-State: AOJu0YxHA4JF2uKNXCLV8YscV1oZpayMpO+ivTRjfCoF/hjdb0efCiMe
	7cJjVmGiPZoiRYGomQB4Q8eboSpNno19vybtvS/dS/0XopVmRYOH0ISZpgN/LCw=
X-Google-Smtp-Source: AGHT+IG6s/fHhjP8Qd7QpYh+6hTN6Y01lcMsE9p4qdH9PvkO5SB3bp0d/yDNa1i7yrGjeQoZV0xYSQ==
X-Received: by 2002:a05:620a:22c6:b0:783:949f:cbe2 with SMTP id o6-20020a05620a22c600b00783949fcbe2mr2208737qki.150.1706387312664;
        Sat, 27 Jan 2024 12:28:32 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id b7-20020a05620a270700b00783e18e45desm868815qkp.104.2024.01.27.12.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 12:28:32 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: w_armin@gmx.de
Cc: corbet@lwn.net,
	hdegoede@redhat.com,
	ivor@iwanders.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	luzmaximilian@gmail.com,
	markgross@kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: add fan speed monitoring driver for Surface devices
Date: Sat, 27 Jan 2024 15:28:28 -0500
Message-Id: <20240127202828.11140-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <34960bb8-fb85-4cca-8b84-d99596d046e4@gmx.de>
References: <34960bb8-fb85-4cca-8b84-d99596d046e4@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Hello Armin, thank you for your second review.

> maybe you can just return 0 here.
Good idea, that's indeed the only option for ret, so that makes it clearer.

> Maybe use PTR_ERR_OR_ZERO() here?
Definitely, thanks for suggesting this; cleans it up nicely.

~Ivor
