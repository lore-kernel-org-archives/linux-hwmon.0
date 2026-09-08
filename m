Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C8B57C72E
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 18:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788893317; cv=none; b=AHU2bq+Mn94c2rF6vsoMiPgU6efJuI6jwxAynG/+faUdXo7F7WWyUptkZVip/8r0vdMZyCVaD/fPKRm+XBd4E8ZMZ9EVT+amUUhyQqwOBF4Nb8PVNMxyY04UOviSwuR+jGpEtdS7sy4xB8CF8sE9ny3k5zE04lVPmC3/tWJZGzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788893317; c=relaxed/simple;
	bh=3BUQ40Te82zxUOd3nT7N9CSpWi8Fb7EeAV0xm/rLncI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TOnq8R/B30PUOGcr/aLFSJ6bbnVvxQ4NaaZ7phpyOKwYmaPw2WxGLnKy3dvoJc1DRG1vlp9m8WHqxB8s3I9c2zV9xq1deZxGgyXePMrRWbwf5R9yRLTRR2pohIT7FlxI0xg+nSNmQbRJxTmtoE66Mc16JWHQsLwUvrtRU92B9yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niQ/237R; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niQ/237R"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381b831d535so7780382a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 11:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788893311; x=1789498111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3BUQ40Te82zxUOd3nT7N9CSpWi8Fb7EeAV0xm/rLncI=;
        b=niQ/237RcqlNGguFrJCJ63NeFz3PsVXJiR469lDbIE1fCNLpfWhpCNkGOZF5x0heds
         tE5dce2OWLAwkeEl+DQcObTZNEcs5o7qFXHq60hcUtbKOsvWnZpNXlDjywXUccHC+83g
         t+156mVkmO+lexXIyhZ5VJjBI14dRyAPoOlxLXLUc3t+FJqQQ/P7N+Qi0RSXrECgWtrh
         ncUexYHPYm2MrrSoI996fZzCGT8juAvLBgXBAlsdWDTozIBAl0e9Q/fjEdGh8gFdulJd
         BS+TpFLjCIJyuHCXaeFkqhWHJQAMHYDKHpcChXBq40ORdcpfTn+GDAUMBgYe/gL8Kj1T
         kPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788893311; x=1789498111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3BUQ40Te82zxUOd3nT7N9CSpWi8Fb7EeAV0xm/rLncI=;
        b=Frx0SeKjUizUHQsl6CTJgZqMfbFLR6E5nfU3rYnvttrZhrKl9Vbge/12yuzXDSHQwI
         pwIo1pQ0vBnABMjfZMZPl+P/QzUwXjYMSc63pYEE1Tg7nyZCKCtax4AeCy1rwgi7bYPM
         5TNUrSa0fz9MQfiyJOn6eCbCHTKGINC2I/E0baMj8Tgu4MsE1v2ISeqyt/6Sv26jtqm7
         NrY1GyHI8mFiACsdwxbKKXVhgkJeqVDAw28VoOtfxPEYK/b/UK9vDQk0XHcZmv9YaqJt
         CRHYS6x38R8w2571XatmhO9x5QIViGGW2ZS8bR7lEkT1x3NtsBXDVjQfegE7WyEC0xQm
         1gJQ==
X-Gm-Message-State: AFuF++mSAhR+sT5HmoqZFz431xjTicIj2iE0zo/3Kj28dmYffCyD/WIw
	s5SLWKv1muIpbZtCP2M8jnh1S+BCROiz/ggYcAWb07YpgF9XKmjEoaQP
X-Gm-Gg: AYBFou3p8D5WUmt+zXOhTGAbIEM1OfXWJs7UXi2LqaEetnkNMmQt/p/yRICFZCZIfKy
	KrJgfj+krGvGHm9MIBOzYSTA6tHn/8DctieU6RT45N4I+Ym3H+Y4erKfKCJMjFi4bt2Rt7bHkkK
	C//wBYcXfdLe1Lrq8M2VqdyUYCggzEkmRL3vA9QWJJS3XTBQhBG9wryTGSBLA09OyjKEPsIBLd+
	VNZ4vYtNWSnshIIyQ+poaxMTzZnKE1LIRCj5oz0ShOSxy6/MACEcG+mAcMYo8r309+4jm5fp6Ar
	mSYvMbG0BlvNqarUYueAUv38fNdwejpKYbLTOv/rMSXtau+p5gz3Vdzamx8WK5e2V1Jec6GBqLm
	/a4K9UfcFjEu3dO7vJ8ycvcubLydtYrHazxy81prXz58bvyZi4dLFr/d2yTeArP+Sh31OHtA9jt
	/Cg22XQNmWPH4KkSLPw4Mhzei7s6Y0UiftfIDnjDhLV8uss3upThL7Nm7ZMyL441NGtGEGe/Ki2
	JTYIteImWSL7g==
X-Received: by 2002:a17:90a:dfd0:b0:396:61f1:da5c with SMTP id 98e67ed59e1d1-39b260de667mr45639850a91.4.1788893310969;
        Tue, 08 Sep 2026 11:48:30 -0700 (PDT)
Received: from sergio-82n7.fritz.box ([23.162.40.92])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm37254955eec.22.2026.09.08.11.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:48:30 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: Re: [PATCH v2] hwmon: (yogafan) Update reference database and contributors for new models
Date: Tue,  8 Sep 2026 20:48:13 +0200
Message-ID: <20260908184813.2353047-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <32638fb3-4f3f-4798-a166-3cf1efe0c424@roeck-us.net>
References: <32638fb3-4f3f-4798-a166-3cf1efe0c424@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Guenter,

Understood. My apologies, I misinterpreted your feedback and split the
documentation thinking you wanted it strictly isolated from the driver changes.

Since the driver patch is already in, please either apply this documentation
update as-is to keep things in sync, or let me know if I should drop it
and bundle it with the next patch set.

Thanks,
Sergio

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
