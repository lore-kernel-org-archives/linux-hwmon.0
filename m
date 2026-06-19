Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C3A373C1E
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Jun 2026 10:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781865149; cv=none; b=rIXG8FfLgSdYcV5yHgYqC4klZ7wYdBhjz82b5Ky+Uf8qCI8l2imVKPiFbdRiQsrmKqQ0MuH8cY6im5MWNDVBI8EOg7V2Tri4dI1hiRReTcN3ZrLHKFbPScvob5U9rx+MeSRHzw+R7u6MCwdvwi8MZ6KFCVttp5gG36qObSeasXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781865149; c=relaxed/simple;
	bh=VEnQVtwZkIU7RBSHiSyT7NGob5OOuJi2SIKdnJrA1CE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T4aVCyBubO6J4CcFrGY/0oHV9bjLAH9wBI8RKP9aoY1HmiWcQxjE4qkDPTD/sL0jSNyZdit1fd+nXpC2XrEBjqXVqDD9BDSH2IklCPWvykFwXvufz0g8afRyM/kc8pHLJFVWNyaLeJMDuen2maZnw0K6gbmcI4rYcfew3bRlAB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFR7WXAJ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFR7WXAJ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c07a6520cafso210205866b.0
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Jun 2026 03:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781865145; x=1782469945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yWdatNxPt/OSZnGzSt5RKlWyXLWzuEupMhedHxPLM4I=;
        b=ZFR7WXAJpO6xikfbQnyaz4HBl9CSM5PhdFfUa1IhzVoR2UW3hMt8Xgwgzc5BFayI2S
         cUXt6o0NKBrdSeKOZ1j1mpBDKYI0DTb3WKZ3cJZY/H8VWAjymYAsk2ziN2SXJzZuY6AQ
         fDsNvhIDBhl8sZounmG3rQ2xjaRC5h5KmZtu/kvcyZGEfewsh3beTUZTw4Q3Drzxoln2
         xxwJLTSLjpLYOTd9sQt4eKG9FBeWn6bWbISIknWXrmJulbV5oZQsI0H4vq4WIY/70RyH
         dCYFfY5h3CJ6qvZtxsa7A1RpCc0HIOUkf2mT8io5KIUKYt50XtTXlzHuEvbZVLfaymF/
         x4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781865145; x=1782469945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWdatNxPt/OSZnGzSt5RKlWyXLWzuEupMhedHxPLM4I=;
        b=WjTLXvOaLwk5vfznXeycXAdY8O29824LPqSGYJgKG2zsyimdiMrFFih0aD13fWLOai
         6rB3y+ZLJpy71K2yMFa6XBV9yScUCtUapRb4IOphg8BEO4iw8iRufY2QxJpgnZPji6yz
         LR3CRpcPPh7OWm+GzZ7uV/4lfkBF6cKLIvxF34s7132opKvuWaUSO7PLEPi+XehWYFeE
         BnO990CiDgrDfeVLWiiN5rA/4YpSuKl5Jjt6LivDXRpl2fOGF9Qi5VbsRpR5hucAt2y/
         b5G8rTe9/vKtqSZEM9wZWsu/UePPpKnuBhrl5bbMpxjyim+RnTAVxthLnGEbQ1T8o5qV
         geOQ==
X-Gm-Message-State: AOJu0Yzaj6X99Q7oSc0+SvAQMsKiV4afBEppm71y8WNaIYllcZNsMHE1
	qDrGJB3FYWv+eV5dR/S/5QV9rxYktYhgG86hSbe6jAr3BX0uWnifjHQ4
X-Gm-Gg: AfdE7cnjBnYZR+4xfToKa9d2Sa20U8fICcsJWcOzoNiysd0SQ9z1mF0kqXs7NiqnmzD
	b/UasVxUiaKT5GiAmOZEMHnu+pRB3mtswvpgQ73RzVGn6tvhGSvvu+4Ay3MlA5XPqtZ8d9BDlG0
	bI9OOVQE+NaVY+tLGYXXwqSb4aqxedoZeLSBmXA6SOoO6FlU+o8Jz4z8pYA7DmH/jXr/05tdKUe
	nerpol7EhOQ0nSIfbCPJSnRanupMd9+hAhmkzN8kGTmLtTcmFaIXPDf74fvyAXO+1UaPDVbKGQc
	BNzYt2J1ffizgvcoSy2H5X+u1gU4XRzCwCySE4H7xkLqAWJkf1AY4TK0BV6q1MI0wVNo2UraGIN
	RH2n9PhCmKxaXvchyWBB9Sig0Z0L7y9InhtoH9YLUXcakdXl+/JaAts6Gr+1+74CDQ1ZOcIbtJu
	N3BbNVpbi6S+jNG+KIFNfK+L3D0c41oCkkRA==
X-Received: by 2002:a17:907:9302:b0:c07:5319:4c32 with SMTP id a640c23a62f3a-c097ae487b4mr145500666b.8.1781865144713;
        Fri, 19 Jun 2026 03:32:24 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a8490cd59sm76702466b.16.2026.06.19.03.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:32:24 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] hwmon: emc1403: Convert to use OF bindings and add regulator support
Date: Fri, 19 Jun 2026 13:31:50 +0300
Message-ID: <20260619103153.216444-1-clamor95@gmail.com>
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
---

Jonas Schwöbel (1):
  hwmon: (emc1403) Convert to use OF bindings

Svyatoslav Ryhel (2):
  dt-bindings: hwmon: Document SMSC EMC1402/1403/1404/1428
  hwmon: (emc1403) Add regulator support

 .../bindings/hwmon/smsc,emc1403.yaml          | 191 ++++++++++++++++++
 drivers/hwmon/emc1403.c                       |  23 ++-
 2 files changed, 212 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml

-- 
2.53.0

