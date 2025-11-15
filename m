Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEB015ADB4
	for <linux-hwmon@vger.kernel.org>; Sat, 15 Nov 2025 07:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763191899; cv=none; b=sUKM1IPnM3JruRB/dt2dzXGZQf9IA0/rrhdMRgDxZrU8xwpV0IEQWkMEpXWnyZhjBECo3sostRMAFiy9gMQpGaitqzRg/1y4pYjRvWP1Y/a0LiaF3pHPSv7kzTlYfrJH5P5niBYM0UOVto3WPpJNz1IaMC46t7Lqdhz8xXMPm2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763191899; c=relaxed/simple;
	bh=YQ3U2AImAkYxHbBMcQLJLvdQgRWwcmUphCSkXRfdTX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gt7Vcw8FwItX/HMu20BEq26kLmBSJS1rHq2Dts1Hva1TNop7q0+qx7Ud7Td0obmoiv9g+hJXr5yG+VnIHdSPPd9X5qf6q2P5ReRvYtGprrhxwiQPr4JJ1HkJK0ZxILZIte/Fb4dikMf2yKDr9xEL3OWGjX7l6Hu1fifxxM8ILaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=gSQ9VNoP; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="gSQ9VNoP"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso3121921b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Nov 2025 23:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1763191897; x=1763796697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UwsKfG1u9xzoIIYU5TWHADxjaVWDZ/+j3qMJBFXHuFg=;
        b=gSQ9VNoPQecHAf1ncQD1j8klf9deOIjkV0eNDSItI11YVEP0iU2WpulHwuLT1RN5JC
         zlbNI1pMvIlqTWpHYniADRSWUtJ4AC9vkbXpHf5/UIrVpzxkZGdjfotOJCNg/GL8CRlp
         bUvTRz5kiLd65Vw0tNo6TuN3tsHL1KVe2Cd3TzVngyrGCTbeUMri4ckpJUj/kGxdJBBV
         Kzc9KR8tfoDoFeBQR23bcNXs0qQ/tLY3+p1jZnDnCVaDmiED9bGgMDaSKQ4lFMYGYZpR
         YfFEX8v3F+KKxWpQlhEGJZ+9ykmE/EgBunSUSnqznovWcOOuT901zZQ6nRP7xqxc0LiT
         dkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763191897; x=1763796697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwsKfG1u9xzoIIYU5TWHADxjaVWDZ/+j3qMJBFXHuFg=;
        b=rNf8erPAg/K/Lz8ack+tnhJ/kDpiwkVkRmPyo1J36uI/Fe0R/bW4L/nWz+N+0nwvYY
         IgIA9MVi5IwyBe+BbV/D7nLmw+tM94rmNgQ8gjxkDKUUIgzwSTTwn3ztP0ySOGMnB02b
         I/Ctyl7hHT3xImYO2G1Knie8AscAjyamwzYNMXsooXFv9JBYl4BJJh2XOEYuZ78cxdDX
         iagZyljTt1NnWil9cGCwwo0dTgxN4Uq8icevnzo8d4DxLeFoWWZd1Eftlp5s0PX8E5+y
         WlLayChZOcalSNtaqVy2/XsTXanUK5E6k3560UK7QVKe3wHisqc175HhX0OcRgLrLCET
         /4RQ==
X-Gm-Message-State: AOJu0YxiHhHdx/RXUs8+tN4CF1j5glv61d4qyiEnPtrosfQyOWed2adP
	yC27K5f7E3NJ1DOtNi0DAJtyqnQ1JpaGKfaDRkrsxc6imNqwCcRS58bTVI32JvRelew=
X-Gm-Gg: ASbGncsmL3AhsgjzCiWnfMg4/mujkTNN3XFukJDpRHIUZ1/cyOgqol1xYRGzUdSM2XX
	gwgcQjuI7h1k0qdL3gq/xJkmCKJshiyBPwWm45aiCdfupSrXUDkINri9lyzt226mPXSL7HoQOdh
	6VoTxBEMR5JvVaqMHMGv2pslynuN1OM6GdsydpzwH03I/WdRbpCss1CSAbLZyG6sLYleM1Rw1BX
	uNmS6cQAEiEcJ1srd1MeRILzI85fAlowgmE/Ml8Rij9Xb4ue1mjTDb773O1EaDmR7hzvlMZGoXo
	HXuUPU8aXwXFfNLMHfQufsF8rjYhqaW705J7xIfJ+eyRFygADvsE6/DehuMcVluM+H+mqaPXSri
	dqM5/h1JSMko5fHCA6MKOdHfIh1F2SwfOu1A8Da/mxiuoAkdhDTkLjkDqvOKpA02cxa5alfUvEO
	KkA/yDOKBWowG8i4wlLA==
X-Google-Smtp-Source: AGHT+IHcHb+IGY0TaDgDiTwSLWuhujKAoMG4s1G/gZPLqj39x37ZFlNp0RH2Ktd3ZYtolzcQmhzA1w==
X-Received: by 2002:a05:6a20:7484:b0:34f:7454:b977 with SMTP id adf61e73a8af0-35ba1d9c6dbmr7586360637.48.1763191897162;
        Fri, 14 Nov 2025 23:31:37 -0800 (PST)
Received: from z440.. ([2601:1c0:4502:2d00:e163:4dbb:2ca5:159c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm7169597b3a.69.2025.11.14.23.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 23:31:36 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add entry for ST TSC1641 driver
Date: Fri, 14 Nov 2025 23:31:34 -0800
Message-ID: <20251115073134.1345535-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as maintainer for the TSC1641 driver

Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b25e655f4bb4..dd06cd624617 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24365,6 +24365,14 @@ S:	Maintained
 F:	Documentation/hwmon/stpddc60.rst
 F:	drivers/hwmon/pmbus/stpddc60.c
 
+ST TSC1641 DRIVER
+M:	Igor Reznichenko <igor@reznichenko.net>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
+F:	Documentation/hwmon/tsc1641.rst
+F:	drivers/hwmon/tsc1641.c
+
 ST VD55G1 DRIVER
 M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
 M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
-- 
2.43.0

