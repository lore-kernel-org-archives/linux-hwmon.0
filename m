Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952F222B8AB
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Feb 2026 10:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771498735; cv=none; b=QiAY8Wlrvw1S70r81LxbSxFTp2I7OdQoGSBhIthzmhID7rwTCEfR/xGKPJHj3o7WZ/jxDwMCfsMz3yNUvp3wkCtIB0HhbPCZqfutW5XZx62Y6kl9M0OlWryNtlKItkMqhsquvnN00mdPK7uxX2ZK5ZRsHnUpkwspPjsLmxdZO7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771498735; c=relaxed/simple;
	bh=v7Ln36tAHP7qBrXwMfNCRfR+1MwugDj8qIFgVwam+O8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UOGVb/Ku9jaBywkGkUP8f1btr08ofkF4bxBdrqHa/BiynYT/d4J3X9X36QM64dT6cLAEcwhY/eX/0IdG6vWJXBf+4C6LKEn+nQMVdQKwyJ1o75VbpxgWdtKqgOv/djZFEOxqfM0ALN0TR7hoSnAzvNtckOO0n+B3Dx8rWa9X8cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiLWifq3; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiLWifq3"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2aad1bb5058so8275255ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Feb 2026 02:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771498734; x=1772103534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnTETGcGMywOispd3Uniut5lXDOEv1AIFJuxKzNySRM=;
        b=DiLWifq3T0RKNm3nMaBTyHgCS1C6rbAwFXWUgbb4sTxA+Z8LkRFy19lqFD4s7UxRS9
         LW8AndaxLdcWeRoXwxX6mWBzKFtExRqfrL2t8pxg3yaS2mQtwDGt9fQ+YQWn6yC1FJyB
         Qs3MBH/biHyJXNybYT8F5dKIRE8fFuUFQ0tsjAlb0aDC789OmEkoPqIsMG8Ox+s8sAxB
         JdYSpfdcYZ2K4Ty9wx/wb/C/RyJcoIaBxLTKFjmEO6RENwHfC912Wc0nfvTS/mOP70cH
         x0601iuGWyNZWgNZWnm55KuY20YN2VTgc2K7Txi+2B5TjloAOTB46uiD1JFC6fTz3Jt1
         r+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771498734; x=1772103534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HnTETGcGMywOispd3Uniut5lXDOEv1AIFJuxKzNySRM=;
        b=bKYjXQEqyyd3XOPVhGaXQ7QPGsm6OgNyiBDmkf6HqAriS8sAubgJt2idxtWLnqZBtg
         nMm0XLibsOjPJRPbf1oaN2AT4WcpGJ6pwwT73avGWFAAhoQy0rcBs/6tEt4rkQrnXcoU
         p4hfaqfbAbHja/whIjdOGTV1DI0RXtGGVzwRsphG427oJlA9tB8YePSwD9bjQfXYHG//
         g426F0LHa9UXztQwI/L87HMmzOtI2FCJ+NqrQeUnEaMFtf1o4kUbnvFSk186qn9MbHSY
         4q5wnvq5wGd2nzGrlkc3cQCv8a3vMjPuMASzKevGBLfyyGdh9zkc8QWYCnU5MyqDoZoQ
         laTA==
X-Gm-Message-State: AOJu0YyYYk5dRlSBljC3cI73Xs3EMf0FHTKL1B+zqWiH9e0n7rtwfRMy
	r1MaqrGhz4XSjguDnnvgof/DwjWa8T3ED7694Pe/gleckphAgJHRxI61
X-Gm-Gg: AZuq6aIcBeGMOSczGWlCQvhNCl1B7+xNtmTKnOa8SFqDjZuuNDEcnuLIDmQbZNI8JKS
	qjxFDSB10UP5ADCYwyz0WCZ5ycPihptDQJZuBEX7oWiRuCx4bkhMKfOD5NdjhHqiw59k25pnRgV
	B0ULabKG8Sk81nN/87SYdiTy8vQmmmCtJUCuDm6tICr6/+cAOADB6SlRUiTC5ZWV1MG5EDeHK/O
	jDpk0SfJV5uwzUleUAT6VLpHsn22uUERF5z3PiX3x5NwS+Wr5fbvYw5veQKjS+Nza38Ddxzr5um
	DVkgh2IDvp9TLdbLcJruBrzUHOtHd8VVgbOdSQiFTD9mkBEfd23W8R8B4xRp3oVAQqK+8OfrPaA
	2xzTUTauq415QUNO7oK1yaNsokPAh8GRUNMoBck3sr8GQcHUzZ1YbWHC/uBMTEiMJzFICYtrJ9f
	migGBcHvYGikIsWWomX97g3e+v0VzP39PVUjnnoYtL3JtlYQ==
X-Received: by 2002:a17:903:238b:b0:2a0:c1ed:d0d9 with SMTP id d9443c01a7336-2ad50f6df20mr42474765ad.46.1771498733914;
        Thu, 19 Feb 2026 02:58:53 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:939b:3231:1953:3f2f:aba4:9c8a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aadd9e8sm164339745ad.74.2026.02.19.02.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 02:58:53 -0800 (PST)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: =?y?q?=5BPATCH=20v2=202/3=5D=20hwmon=3A=20=28pmbus/core=29=20Add=20support=20for=C2=A0NVIDIA=C2=A0nvidia195mv=20mode?=
Date: Thu, 19 Feb 2026 16:26:29 +0530
Message-Id: <20260219105630.11929-3-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260219105630.11929-1-Ashish.Yadav@infineon.com>
References: <20260219105630.11929-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Extend the PMBus core vrm_version handling to support NVIDIA nvidia195mv
VID mode. This adds a new VRM/VID encoding type and the corresponding 
voltage conversion logic so devices reporting nvidia195mv can have their
VOUT/VID values interpreted correctly by the hwmon PMBus core.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
 drivers/hwmon/pmbus/pmbus.h      | 2 +-
 drivers/hwmon/pmbus/pmbus_core.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index d2e9bfb5320f..3ddcb742d289 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -416,7 +416,7 @@ enum pmbus_sensor_classes {
 #define PMBUS_PAGE_VIRTUAL	BIT(31)	/* Page is virtual */
 
 enum pmbus_data_format { linear = 0, ieee754, direct, vid };
-enum vrm_version { vr11 = 0, vr12, vr13, imvp9, amd625mv };
+enum vrm_version { vr11 = 0, vr12, vr13, imvp9, amd625mv, nvidia195mv };
 
 /* PMBus revision identifiers */
 #define PMBUS_REV_10 0x00	/* PMBus revision 1.0 */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index be6d05def115..4d7634ee6148 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -885,6 +885,10 @@ static s64 pmbus_reg2data_vid(struct pmbus_data *data,
 		if (val >= 0x0 && val <= 0xd8)
 			rv = DIV_ROUND_CLOSEST(155000 - val * 625, 100);
 		break;
+	case nvidia195mv:
+		if (val >= 0x01)
+			rv = 195 + (val - 1) * 5;  /* VID step is 5mv */
+		break;
 	}
 	return rv;
 }
-- 
2.39.5

