Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D741BF53
	for <linux-hwmon@vger.kernel.org>; Mon,  5 Feb 2024 12:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707137575; cv=none; b=affJTnngLpbbSIAWXocelJLcNUs5UJ4Qqbxex+GfsAtKadO1+XIj88j+fVOLcSs7S6Ec9IO1OIiewkrqoA33IYv9izIrb3r3L4WeP3oSHe8V2nkBYB0DRnW4M699LTLdFCeUtu7aAXDY+8LIwnCmO08imN7Ws2648IdeWY8s0So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707137575; c=relaxed/simple;
	bh=HkHgehI+WaG4c0DqeBYHe1vEiL7jpcCz3alv2nQMpVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=kpCnGgBmLrDMAaXDMicKdQ+CgUP5J1T/2J5UyXf12w93DCYUuYSksqVkXF4ifKuJ/DHYGtYghDqRlfLJmC1y9cD2TryCufgQRBOg+iX06TYFvBrGT8siL6RP3R/qKbZOWtmvXM83B310biXTDPoAOXHTyEqIWK+VgfjXOhRxNHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=NGy7+59G; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="NGy7+59G"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7856cce021dso61674185a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Feb 2024 04:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1707137572; x=1707742372; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HkHgehI+WaG4c0DqeBYHe1vEiL7jpcCz3alv2nQMpVE=;
        b=NGy7+59GC5mkpJy8ruYlMPg9JNbsOzIUb+ykjAvuITLjAktiuEifskHn9ewedW5kwy
         TEnIlvV1NwnhYmv1ygcnGvrKSrWPkHRsucihTSdYx6ocrdl4tKc+WwFzMaMeXrzl8A/6
         zHY95AbeL8z2//UxgVli4ryFsrtODyZH8ovFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707137572; x=1707742372;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HkHgehI+WaG4c0DqeBYHe1vEiL7jpcCz3alv2nQMpVE=;
        b=EyFit3RkoifbA3OaE5JM9VFadegaz05e+WniZDOw7qGWaPVT9sKimp/Z9tPMY/I2Ro
         aFpO6fl0Cfv/E9lWys1F77a6zmVuc6+jtxC3TjPXlAb2L6rNY+dmyqeXqt+rHPE1TXPH
         nkMc9AFeLPd8coMib70B6YsZEvj8J4RCk9RBrnBLq798kdAsyxMEdf2CgSxsWhCP+uSp
         zAAfpJBbkQkVaadZAofNmuP3RKxWDtRG/NGgcjk4Hicc5D9UyccSxmK/KIjdyA98i0dR
         XSAiZROPGWaU4hJCxfDHMt6LsjMGqTyYYqTB1+i7/FgQK2xND34hhDsnGf/OBVy81eRH
         GtwA==
X-Gm-Message-State: AOJu0YwrVShcAuEEp3EO7Kj3JneOL/fPEbH6+wTe+cj8qHzt6IxE2H8e
	fMCJoqLh09C6AFDk83gAwoDNsSt5bQRqwvZ2uXN8MfxwEDN5kG35Pvrx+C8uMjs=
X-Google-Smtp-Source: AGHT+IHv3J+Oy1vQFgBNQay5e2uYyjMXZUhDEAAG1ojm3yKUyWo6jVNCqGESjMKGxhTJMs1ZwTVrhg==
X-Received: by 2002:a05:620a:b82:b0:783:7fa2:e6 with SMTP id k2-20020a05620a0b8200b007837fa200e6mr11873808qkh.67.1707137572338;
        Mon, 05 Feb 2024 04:52:52 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU/0CS/ctURe7AZkyH0035lhV5nv5FUihR2ayRY4vS+xLB1oqpj0CLWJZem0eZ9o/mchF9SIh0lnReTlHvMxMje8YuKT2caIpwZCc9dKVQ+4Qe4hr+XxMX8Vx4VmZkxtvFsX5PIBh+HNgLXa2NgmQJjRcmEI1CdGnsfDGHFOCRZTtkSpSiACJZG5/oQ/enHNx++fpo3Ji9G3P1D179WekeS
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id n9-20020a05620a222900b0078565ed2bc6sm1839309qkh.124.2024.02.05.04.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 04:52:51 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: luzmaximilian@gmail.com
Cc: W_Armin@gmx.de,
	ivor@iwanders.net,
	linux-hwmon@vger.kernel.org,
	linux@roeck-us.net,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [groeck-staging:hwmon-next 13/34] drivers/hwmon/surface_fan.c:87: undefined reference to `__ssam_device_driver_register'
Date: Mon,  5 Feb 2024 07:52:49 -0500
Message-Id: <20240205125249.3740-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <50af81da-779b-4782-9326-043bc204bfe6@gmail.com>
References: <50af81da-779b-4782-9326-043bc204bfe6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Missing 'depends on SURFACE_AGGREGATOR' in the Kconfig.

Unfortunately, `SURFACE_AGGREGATOR` is what was in the Kconfig, it should
have been `SURFACE_AGGREGATOR_BUS` instead, that's where the missing symbol
is defined. I wonder if that split still provides value, but that's
off topic for this thread.

I see that c3747f28ebcefe34d6ea2e4eb2d3bb6b9d574b5f is no longer in the
branch, but 42c88a7d1474b6f6e53acca3522d179d3c9b1c6f is where this is
already changed over.

Thanks again Guenter!

~Ivor
