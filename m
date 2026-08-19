Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A19B486648
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 16:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158061; cv=none; b=JmkJn6hlWbku4aeCx5QphILECSw/myTOSpMU+GFG+TDM35MLMD820jnMuShfXDOJC5kuf4oBFoCaIWX9fA1ZqMetTvi6gblvEL1dlRncoHadoc8f3MxVBiTzuTxoMBjAMzlifDhW/+LdWfDybPlWUrzissEDbPAtPvkKiH58VEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158061; c=relaxed/simple;
	bh=/eYgWtEqYAzD57HkRpZz5a4HVxhKiyMDMESi6QCYaE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sOQB/mQacCyXthcVOY63zaHmZ2XAg6u2sI1dACG3fy1QnJjidLpKTldA7+JtNO5Q0HDC0DzJyXTrnCv+xz5cOoiyyMXdnDH2/BarcCvFICuzx6YT1xDJzL/X1zlK7LpZ9ARiWM/jX4lO12UcPSDjzGT7CjV/m8TtSljIgkznvXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lT2N4sCn; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lT2N4sCn"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97c4fa7ba1bso454856241.2
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 09:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787158059; x=1787762859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eYgWtEqYAzD57HkRpZz5a4HVxhKiyMDMESi6QCYaE4=;
        b=lT2N4sCnZ47RI32+awJpcwl4LAVsEdCRC+jOclM7ceB1NslL6a1Q2vQQ3WFP5zdAhU
         xmWwJqQ5Zcb27D6Q0xn9kCa1CxCNnoT4GNTk1iOLyg704T4jvZI7ja0lDup39nrOBTwi
         nBk190ZqLDEV9LSV42cY1IJ6whBJHfK88HCBRZg4sN8ULIf/cjjHxhIdzAFhJ7umCWeY
         Jij9agujLagH1BvIdJQZRgnpwG5cUeLMx84IaK+BBaqYtVF4EqnTbweDRm/cSOO6mh2P
         Md9nVF/jxWGK74IBQbNLb7TUvsQt2osj9Jy/k9gifxoWdtwHrL8NAxy0PGkxpy94EHx7
         C0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158059; x=1787762859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/eYgWtEqYAzD57HkRpZz5a4HVxhKiyMDMESi6QCYaE4=;
        b=MQ9yczcFLbEMDb14vl/016VsYz7Dr5NApMpbAJeJ8vF64ILAL37D0auIurTT/S1WnR
         escRIG/86qC8Ajj8VsDmUM7t7ngVuW8pb6U99ztnRIzKKy0FSqfe1e/E8cNwV2ipw0rO
         BhRJUAYdOdmjQnU2GtNGc7/4N7C8taUDVroaGPPRB98bauv4ZkJXl8O98Mc8/EGQjdpO
         x1QhdqFmnYLvCjzniJBXq0jrDS9uWfCqlHmyUs8NKgHTt4v1Uh7stGxnwi6aUkTCREKX
         nCwp8qv2QcvHUPDNAp/Tw9bVXZSL22+ef7x7b/gaTsjiVLb2/eVxAFwbyPMDp2oBVOBx
         Rh0w==
X-Gm-Message-State: AOJu0YwrM45ujYt2VGpxtp1RCfQcW8rPJ+Y+Z3Rr39wUlDO717ZD1zlg
	BovmmqcAmJRk63ZZ9A/AKuoys0t9PX1/Nv4cAAdg8bI2f93AFf242roFYhopMKYG0DA=
X-Gm-Gg: AR+sD12nRp2fQwdLsaPIzns7z7Z3nm5dkVqCthMGpmclNIdkUfg1GPIHCW9CPDDjyNh
	PUOHEziss2Z6PSnzy8fUjkz0aMdDdtrVomQOasRLC5lF1UhYh0MxWDVpJGqbtGN2dmhrVRij/1B
	YRylvAJryC79YxQfMZ/YP89PfCyiAEh0K6apk6uECEXnWVeHsrwazoISVa/YUxOAICC6G4YBTJJ
	YVLK1koUm/ZfF7rbkllyPC2FYUa4DMeYJ7TyYo7hxK/MsZhVxh+RFziFQCybyPOSJV6VPNJq8EH
	YENprBa6C6cuEooGxmnDfvVvwZDp5EuVBayf4iDfDbF6Gic1aaPOgAi4oa1Gp14NTs4a2vmqRL/
	jNW02n4RrJIaGSOueTSwllpaWwA4XLtxyhbXgR/ECQPAc6hWjkXItj866bNmBaMNArdo+CwXLKK
	tFn3MQQEHgflMOEstEjfQvn1SS0LT1JAjLobKHCjYSnmvbc5yq9SlvPjATuC6XT7Uw
X-Received: by 2002:a05:6102:370f:b0:738:fd01:5b63 with SMTP id ada2fe7eead31-777f8f80ec7mr2379289137.4.1787158059104;
        Wed, 19 Aug 2026 09:47:39 -0700 (PDT)
Received: from nixos-minipc ([2803:9810:b675:f600:b156:3bb2:8e94:883b])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c4e93f0e5sm2703633241.11.2026.08.19.09.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 09:47:38 -0700 (PDT)
From: =?UTF-8?q?Sebasti=C3=A1n=20Peyrott?= <speyrott@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/1] hwmon: Add Minisforum UM780 XTX EC monitoring and fan control
Date: Wed, 19 Aug 2026 13:47:07 -0300
Message-ID: <20260819164707.434235-1-speyrott@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <5af9d252-df45-4d3f-ae14-648a546ff508@roeck-us.net>
References: <5af9d252-df45-4d3f-ae14-648a546ff508@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review.

> Are you sure this is what you want ? It will end up in a tight loop
> if the problem is persistent.

The in-driver retry loop is bounded, but I agree that returning -EAGAIN after
the retries are exhausted can encourage immediate retries by the caller. I
will return -EIO for a persistently incoherent or out-of-range RPM value.

> This is an inappropriate return value. Either define mode = 4 or similar
> for "other" or "unknown" or return -ENODATA.

Agreed. An unknown register value does not necessarily identify another valid
firmware mode, so I will return -ENODATA.

> This will require explanation. The values are stored in probe,
> stored here again, stored in suspend, and (only) restored in resume.
>
> Why store here and in probe if they are updated during suspend anyway ?
> Alternatively, why update in suspend if they are already updated from
> the probe function and here ?

The intention was to retain the last coherent configuration for restoration,
not to maintain a general hardware cache, but reading it again at suspend made
that ownership unclear and is redundant.

I will seed the saved state once at probe, update it only after successful
hwmon writes, and remove the suspend callback. Resume will restore that saved
state. I will also rename the fields to make their purpose explicit. The live
reads in the system-threshold store path will remain only to validate and
clamp against the current peer threshold before an individual, non-atomic EC
write.

Removing the suspend callback also addresses the automated review observation
that a transient EC read failure there could abort system suspend.

I will give this some time for any further feedback before sending v3.

Thanks,
Sebastian
