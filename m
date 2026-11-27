Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757324;
	b=k4AE8VY6JOKzRmBxDhvKNNaIg6qyUp7uQKr+cVGRk+IArdwM28IigK3mjW/Dky/vvE3Z
	 oCl3U3laXss968UdJrkiMEuOpu/Gek6scww3B9AGuEMtGQWi8FpW093S1aUzp2XF8awH8
	 e+u9a2S3yYI+yehZ8R97te4qcbyXJGtszUsIqdYXPjKtYO2p2q9AptMxnYtU9o1ucWuwI
	 ocPZAMs7DI1gkrK9lXS5LpPeFgQao8bM5bbmJJ2t9KxHOlffRfvEUq82VnP/2aSDIV0XB
	 oFSppKI2yRGSoE3dakHNCQgCTPcLkEF7KLZnaa59t4xDtbhhiUAeqIhZaRw/OxWspiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=TdUf6KB/FNH3fbgr4TqtEM818JFeVephPzr1hPpbgiI=;
	b=SpbuyMCU49UQfI6T/W8jpzQlFP9wYhJPH4ePAvedK0ItTBpPT9HwBIXuR+JI0kFpkCDb
	 HgLQsESSDNN54H0P4HM/qBiZ5HxRbNNYTnI4UXtaHJe3kbrjYwZCJMdZwLAm0xALr7gyv
	 HpTjtzwFVRX3Txh9Jzej3mR82cnoBZWnGbjZbzhT/WI/hi3BV/SS/pMRCb6awPO1dkiwZ
	 +DYI7lVE4xj12AhClGZ8Z54vXN5CCxzprHQWFH0CupTE/kHZMxNtp6nWAOvuIZLZkBD0z
	 4ldpSd4eWtnXc3ByMA586IK6j5Qza7aulxaukYFeS37/ZoXY3cpx9sUcP2zsv6FP7ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kerzcc1K;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC8F606A31E
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 05:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CC8F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kerzcc1K
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dee593f18so7197100f8f.3
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 21:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795757323; x=1796362123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TdUf6KB/FNH3fbgr4TqtEM818JFeVephPzr1hPpbgiI=;
        b=kerzcc1KWJx3QCpqFrSzrkKSQ1PEd8pOxqmjIKOYubp2vQeMdUDjf57BUSZTPM6X26
         V/imo/dK2gBiABO5wyqyOuTcWe9vE9PA5N02RWajkORsUw3Xdj7/gdpXEB0b4lR8cuaO
         fUj8TjPSLxXJeozkdlIB9+rTvRgBAPsKdASyWY/D9zts84/0VotIOMAbOpbpykACIQBg
         Jje82t03YeLXFJmS629YmtHxN0ylRXBSB6rO8YLUGlNCCzaEDbmyBoDV6SQQB1RkMAZZ
         q6j0nEDcy2sgQC+MmfsO2Kmh9jp8eUcVGUB0VcVmpJAMnOvqRWX1l2nuYIs4tNFt7Nr7
         ZmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757323; x=1796362123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdUf6KB/FNH3fbgr4TqtEM818JFeVephPzr1hPpbgiI=;
        b=N9797ySUF0xHEJYCNnC+gXjBgPqukLnxiXfghhbnyn5l2grmF8lNGJOR7SdrKJY1Xo
         +fl4iYBM2JVlUa8eWBNnD+aUkVuR6MU/xlGleX44H1C3Cpv0kvCNVEpmOMMFBuZIXz0w
         8sAiJR/Hgng5LPwUfo5+cxfE9Eo6T6X6THXyr+smcqZNjgApxLYfwq2rOm6wAc8lauqH
         Jl8WJiy1AxpphJT1vJCubhcVX+t3mVSI9RlbY58bYHbP9zgbbD0H5fV9hhkrX/2FC2WN
         1lsNLys31YLkbMraZLj5/4z1vhPoC3HNYVR7vaxC8MdmMRrNrfLzwqNe0XEsYSV/LdIh
         gxHw==
X-Gm-Message-State: APuU4Z8kgY4k7xspLhi46OCVR+EQscFfElznHrmESHqfbdrUtgWfNFrW
	D4RlBZewJJSIT9MY4r2boUf2NGIspHg1vPZtLkMQf0OCN2JxPdHA+J/1UH6bY4ij550=
X-Gm-Gg: AZFdTZef+cDB3HSOAdp1qttTrA8/wJtUkYi64I/zhYGcelDq9B/jAaJdv36k7BwGvNU
	9vjEs/k4nHO09NWeHXEbLJXEM9Qdc2SdC1F8K/kiTTF0ChFOlocsLty9exDfidBtlocjgmT3eJ4
	mhi/vJMJC6IoRr4xRYSQk1+BDbB+tsOy9DTXWNwifLlcBvCOAMiTNeA8FmfvRT5F88jb9C1N+Ui
	oLkJW6Wzlv0Q++shXD5DuJgYQFIb5qj2o5oL29UbkhOfD0B3ykJRaFq46qP4rqjPrt7DE1CxuLk
	pRpnlSOnt1/cwEubyV/vmcCtPJWLNbDXuwWzQs5cbXpSAjuqo2TpFtr7DD1TYUK85fcsysBQr/5
	bmZtlLiqZ+6K3VcEd0H4XHdBI0Sz9JN+zCaMXZKWgQuht4Zav8lHieMdmbwZld4lXIgrru1MgBK
	Yib5K6uwn423dXZcTPJaoLfgfoRXQ2rKNEq1DZYKg7U3kysXY0KeDP9DwrduQOb04kYO+XQcG22
	BKe41sQilSF82eW90RZTg4BXKXGeSRkO2Ya5ThckyXgllzsRpmPYcIpO/mzk0TxV+htclphfaPS
	sAD5BE3wDu1AJxrq1Re+rPy4KbLgzF/T9yifIxHfXBVdebtteTfYCimv+/3lwaIqBVKRbh8FibG
	kNgtG4UGK9/v7Hh2ss2yYTTu5g8Wl9IS//0ewcECQ22g/NBxeowA/ou4lAYhXRwZom1czab+GpD
	JFu+ev+KCn4E23iQ15l87AslCQ/HquGHuQpT+m6UNYuZ9Qmh+Z3rA4sNYf43w5Ypdy
X-Received: by 2002:a05:600c:3511:b0:4ba:73f:ef5 with SMTP id 5b1f17b1804b1-4bb88828304mr482429785e9.34.1795757322788;
        Thu, 26 Nov 2026 21:28:42 -0800 (PST)
Received: from sergio-82n7.homenet.telecomitalia.it ([95.236.10.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm649073745e9.1.2026.11.26.21.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:28:42 -0800 (PST)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] hwmon: (yogafan) Support >2 fans and add additional Lenovo laptops
Date: Fri, 27 Nov 2026 06:28:39 +0100
Message-ID: <20261127052841.492895-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Guenter, all,

Apologies for being away over the last few months due to a family
illness, and thank you for taking care of the Yoga Pro 7 14IAH10
(83KF) fix in the meantime. I am back actively maintaining yogafan and
have audited the pending user-reported DSDT dumps.

This 2-patch series is based on hwmon-next (12c53b6b6):

- Patch 1/2 expands struct yogafan_config.paths from 2 to MAX_FANS (8)
  and adds the 3rd tachometer field (FASF) for the Legion Pro 7
  16AFR10H (83RU).
- Patch 2/2 adds DMI quirks and documentation for 9 user-reported
  Lenovo laptops (reusing existing yogafan_config structs wherever
  identical).

To avoid merge conflicts and duplication, this series intentionally
does not touch Yoga Pro 7 14IAH10 (83KF, already queued on hwmon fixes)
or Yoga 9 2-in-1 14ILL10 (83LC, submitted separately on the list).

Build-tested with W=1, checked with checkpatch.pl --strict --codespell
(0 errors, 0 warnings), and documentation verified with
SPHINXDIRS=hwmon make htmldocs.

Best regards,
Sergio

Sergio Melas (2):
  hwmon: (yogafan) Support more than two fans and add 3rd fan for Legion
    Pro 7 16AFR10H
  hwmon: (yogafan) Add support for additional Lenovo laptops

 Documentation/hwmon/yogafan.rst |  21 ++++++
 drivers/hwmon/yogafan.c         | 112 +++++++++++++++++++++++++++++++-
 2 files changed, 131 insertions(+), 2 deletions(-)

-- 
2.55.0

