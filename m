Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52D7326928
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 11:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497439; cv=none; b=ZjKmDVb+KJvtppUw+kG/VU8I44uNVcOLyoUlMcwbnurb/QTwSZjjjh9x5S2zGuhah72D3e45yX9Jsh5nlcyqZfr8SogE1X2AwQE57SS6uYbGBdke02eqZZfU5iR6MV2bRvY2Da6z91kHds0iK0Mnsfn31lpF5Os+838hxb600nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497439; c=relaxed/simple;
	bh=PeMDpAvSc5FYx4ZkkGcmikFJZ8r3hndPMUQlaqdD8jI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jpGAMBozPzKJUhDOcJKQOXiK5guNCeD2bPTxiriRUFfWYKA0dWuBvV/77Md+PXyP/q6cgMnf+ZFpSy4yB/f4gOPFnyBpSQy870fKJiQxhiFqHNeVPNCs3Obt8yxQgtRv8fKwSB7q7dpi4hpoxA8nNzUn0c+FBiwPJyud2/UJbMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzFR4OLf; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzFR4OLf"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4758bd3731bso867292f8f.0
        for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497432; x=1786102232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3c4L/MJdU0lTNZCQtFNIqJoMYY64q68vh+MgKlRHtjQ=;
        b=gzFR4OLfiLykFqtMqrkXcG1BbL/fk5y9BuhSGj+pGercqmm9N6XCIIC9mocgWqDGxt
         pe6Ht3mz0rRhlq7lNnoLIDH2cTunEOfbg2QfmsdOEDxbcNi2NQhLApzezqKlQwoLVpL4
         QWc4FThUBXFpUYGpX1Bg9mKpT2GgLaSzUd4FVUlRLemYZTk0xZYKHd9zIbDBbOZOYk2Q
         eRKdLw5TVDeLVcqWxOKPIPC8l9SXr3t0YnLcYQED3FY5P0RcAK/ds5gbXQrlO+knrbKJ
         mlUQOV1DZg0MSVTJZIGQl92sV2S8bMbfo0Wn0HJgOWfm9udq/RJ3XP+jwMEwUxmOteeZ
         nFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497432; x=1786102232;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3c4L/MJdU0lTNZCQtFNIqJoMYY64q68vh+MgKlRHtjQ=;
        b=RuaArJjqonSmuivF/GKiFGHW1DRKkKgOeAlJioltFn7WWAd1G2tUQl2QIefhTItqP0
         jc26LwHLQE9+n20fY2XCYCrpw9IwDDVFupCti4dpOtQ3felen3jeIg8oi9H4bLs8HIRe
         cAIjzLwrZTlQYXeifdoL0/klQktBvMfG/aW7MvWPTVRqPUbsJ0NtaMLeHBWezrzH08R2
         CyEOUI1+S1vY4DJFNiUhLnGkLQhJOW/ncsvLI1bfyC6kJEXNxM5v9u9cebxUnkB/cnHS
         pB9b3JOBT1zC9wtVYpuNHcwi0gjlUtXY/rnvM0tGrsQM0nz7NlAmBZByFTa6prgR1lLr
         A5Jg==
X-Gm-Message-State: AOJu0YyMLla8l+qyowCLPeEqyNW/kpME4qKsakj6gFPVOsphQNE1aoKm
	l62EkpmaLgdQ/e5cuK2vSWbwEl55ZjMwr00sIqHUvpJ0TSjKPsXKlHrW
X-Gm-Gg: AR+sD12e4b8ThANEpZSlOKtKxSsvKFNFfBfmKKEnvDiy9q5T2/AYOoCcG05SIUYuhEk
	K6ywWLUpS/cB2hxCXgZGkfwhDgM/TOr2bcAkri94Pgq7WzP0IuZM2BsB9WTUTqEuH/zhe6tGEw8
	cPMVH4Lq5l3NVrmvemuQSw+ePNiAEkXBRlc0MakGKQlOMlnaIU2x21i9WPFe6BKsBfw/awYQbwF
	3h7X082VX+Gy4SN8SCmnJR1HMn8YysJaYBGg4Nce0UNBDMYa3oqMzSON6qCAPTZ5k/DZs8j/J4r
	XdMs+1ITBDvK9Muau1HblZFCCUEa58KOAmcBnPfzzajF/xrCvgPZuG9UL/26riGq0awBBGGWY8t
	kfJnCK4naGon9Ew8B77QqfGugBBM9ofo4FM7PU7ajeNatFHSVpv1HPt1SCYvdeV+R4ez2eRu9gE
	wao9qYFP6caRZWrAPuvRbQ9GP7q9QVNZETQmPkud5i+IPCHV2P/kPZzW0ExQGAiCqqK6M5K9dT+
	q/Vn+PxAg==
X-Received: by 2002:a05:6000:220c:b0:470:8e2b:9c84 with SMTP id ffacd0b85a97d-47fd32b8f8emr3398881f8f.7.1785497432068;
        Fri, 31 Jul 2026 04:30:32 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6besm3823656f8f.22.2026.07.31.04.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:30:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] hwmon: emc1403: Convert to use OF bindings and add regulator support
Date: Fri, 31 Jul 2026 14:30:04 +0300
Message-ID: <20260731113007.145322-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document, add OF and regulator support to EMC14XX thermal sensor family.

Schema file was separated from LM90 since according to Guenter Roeck[1]
these sensors are incompatible with LM90. Proposed schema has basic
hardware description. All registers Guenter Roeck mentioned may be added
later on, when/if driver would need to work with them. As for now driver
successfully works as is.

[1] https://lore.kernel.org/lkml/a0c5c1e8-9a36-4835-a5d9-7bafda79c36f@roeck-us.net/

---
Changes in v2:
- schema separated into a dedicated file
- dropped chip id check
- fixed match data casting
- adjusted regulator name

Changes in v3:
- fixed number on channels for sensors in schema

Changes in v4:
- removed redundant line
---

Jonas Schwöbel (1):
  hwmon: (emc1403) Convert to use OF bindings

Svyatoslav Ryhel (2):
  dt-bindings: hwmon: Document SMSC EMC1402/1403/1404/1428
  hwmon: (emc1403) Add regulator support

 .../bindings/hwmon/smsc,emc1403.yaml          | 203 ++++++++++++++++++
 drivers/hwmon/emc1403.c                       |  21 +-
 2 files changed, 222 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml

-- 
2.53.0

