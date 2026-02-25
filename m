Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8950338F246
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Feb 2026 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772013103; cv=none; b=LDeAxipSpVUXby8kIoAkf0CrTO9AH4V0/Mvv2ZxCy7bujbEU7hDt3f7WAESqJvRLCAuFqj/hQwT3AJY39z99NTkAlh/SbdNZUqjq0/fM0T06I1+oqEM0vnBShqJ3IoLSYLpq4nYWR7EB6pvSzNLzdqI1pok9YnqZKkSMN5QIBSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772013103; c=relaxed/simple;
	bh=P6wKGDmbT7eKbm4qfK7W83uJm6uaEtWIKE0S5h34TlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aGOAhwdqYng5GwFiL6Jk/fC9zJRdEFO7uT7j50aCN02csMVyW23fKh6x/XAOPDDUezP4hp1V5DROzwyligbfODn12yMETTPEWcCTh9fieKd+TjJsFve0WB3VhQ8K6xO4afHzHy5InzAHvwR40WbT/pe8vTrIMSZLxHZq2fFasTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNVMGjwI; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNVMGjwI"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439857ec679so1549311f8f.2
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Feb 2026 01:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772013100; x=1772617900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h7St7FbJ+o1PN/SA6fmu1avVMiYkbGVBh1ecJWqCjgE=;
        b=iNVMGjwIhM8KKTCXRQ0F9DTQgp/lS68frNXhugD0kC5kXrBZkWtU9fSBNSwuz2QVTI
         hYXnYvuPtAoH+GTJJqepHtdxcO8m9fS7gXfakuf/ZjbHv4+j9uj10SQ7PUNtmxbOpN/e
         vyMrSgBM+l4kRx2ab1oNbHtl39pBho3Rw0VaaHn+IjFprAKuxiGzDquVGCIFQiXvhjFe
         Yp1AjBmjDT7uXQK6K7EGOWPXgyUEsZBL7aJO2JqJjHdzYk5kgpogZOQhlhKqTZKIFq8r
         Z4oyjFRSn4lCG5kD5TimK9Na0OHF7O+SpfQ1aOdzlJyT+N0CmEpcf4Z2fLhWRGlMbmHr
         AItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772013100; x=1772617900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7St7FbJ+o1PN/SA6fmu1avVMiYkbGVBh1ecJWqCjgE=;
        b=Y/t+XU1jo97BvpioV99aQWehRB3l5kOYB69PKN1I9qKPZaZHck3ii6g9irXc9FCIXk
         TswUlwjl5WmMcBgjSu2BSC4uMJJ+Y0i1GhUFXc76tC+C7Gc0GLnsc6NUwx+myEkthQXL
         2gP/Z+I6UTIBU5vTWLhCBXdQib7BySW+ogYE7BLu40nMsDBCoA7hTLlGZ+l1Lw/eRQJs
         jGSBS/2F6ODteFnHLsO0dtB47YTMxGoLjL+DO4ly2R+Jge3zYaXnCpRibNKkQgH8+7pJ
         yrYlyIfPHB6rEIlpgDnPaaOsDg6Oynsj4vaobk+GRwR6lAsmNcIeZFxcnqD3gUi8HbTs
         OjfQ==
X-Gm-Message-State: AOJu0YzURPxAhA95L8lIxQseFVtdQ+Pg/1hZfDxG0y6hmn9YW0pdmaoA
	P5OevjXlpQ24vl6z6LhpKCA4VSJfW4RYuveDaCRWSYtp06nzTh5KaRz6skBlmA==
X-Gm-Gg: ATEYQzzR7mhsAEnx/GPlv1FMLHeDnktqkYvKzQgsFWHdfGVubOvFzPZnRK4qvjDjeTl
	65YyhXWzmoPx6Av1CZGKiECvDo40xHX41GHvbqcXqfUAVi58wuSde7KpFSa6pEioBXyPkufA8eX
	0AOJs8Up/NCqtuc4NTPaZ5aMPaO4kTPRVN/oGr1ZI4Z14KPCP9lKnxIPghTJUelL/pEP2U/mGDr
	CUTDAXBDIShgtrY4wPA/pc+q1kFCPWOVTw6qtV9903UADs8sk9KggRx2fl/dDn7Pks28wIvExUN
	mWaVjAY3MgV/QS+qz/oEup33wfN5wEugFO8T9GXGA6OBWrjcO0AhMmoQ5kEIDbGUS4P+Hgx+2Bh
	28gOTk0z0vXkR5clZam+TjpcG1twxb/xahiYGt3dn7iZX1R58dMaGeMVyuAAtpL9JGPaEDaKSvD
	VgH7VQvycZs23QwPRnJ52Pa8d1gyJah5sa3XzEpW3oCg31SfqPrxf37ntTxE/12gbWOsm84Auun
	q4EyEg6dCAFeA==
X-Received: by 2002:a05:6000:178a:b0:436:30b0:75a2 with SMTP id ffacd0b85a97d-4398fb3cc5emr2959516f8f.56.1772013099614;
        Wed, 25 Feb 2026 01:51:39 -0800 (PST)
Received: from flaviu-Aspire-E5-572G.. ([93.122.249.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm31204449f8f.29.2026.02.25.01.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 01:51:39 -0800 (PST)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>
Subject: [PATCH v2] hwmon: tmp102: Add support for TMP110 and TMP113 devices
Date: Wed, 25 Feb 2026 11:51:32 +0200
Message-ID: <20260225095132.29954-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TMP110 and TMP113 temperature sensors are software compatible
with TMP102 sensor but have different accuracy (maximum error).

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
Changes in v2:
- Drop the binding change since no ACK from devicetree maintainer.
- Update only the Kconfig and documentation.
- Link to v1: https://lore.kernel.org/all/20250915170819.126668-1-flaviu.nistor@gmail.com/

 Documentation/hwmon/tmp102.rst | 21 +++++++++++++++++++++
 drivers/hwmon/Kconfig          |  4 ++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/tmp102.rst b/Documentation/hwmon/tmp102.rst
index b1f585531a88..3c2cb5bab1e9 100644
--- a/Documentation/hwmon/tmp102.rst
+++ b/Documentation/hwmon/tmp102.rst
@@ -11,6 +11,22 @@ Supported chips:
 
     Datasheet: http://focus.ti.com/docs/prod/folders/print/tmp102.html
 
+  * Texas Instruments TMP110
+
+    Prefix: 'tmp110'
+
+    Addresses scanned: none
+
+    Datasheet: http://focus.ti.com/docs/prod/folders/print/tmp110.html
+
+  * Texas Instruments TMP113
+
+    Prefix: 'tmp113'
+
+    Addresses scanned: none
+
+    Datasheet: http://focus.ti.com/docs/prod/folders/print/tmp113.html
+
 Author:
 
 	Steven King <sfking@fdwdc.com>
@@ -27,5 +43,10 @@ operating temperature has a minimum of -55 C and a maximum of +150 C.
 The TMP102 has a programmable update rate that can select between 8, 4, 1, and
 0.5 Hz. (Currently the driver only supports the default of 4 Hz).
 
+The TMP110 and TMP113 are software compatible with TMP102, but have different
+accuracy (maximum error) specifications. The TMP110 has an accuracy (maximum error)
+of 1.0 degree, TMP113 has an accuracy (maximum error) of 0.3 degree, while TMP102
+has an accuracy (maximum error) of 2.0 degree.
+
 The driver provides the common sysfs-interface for temperatures (see
 Documentation/hwmon/sysfs-interface.rst under Temperatures).
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 12763950d11f..3956d385bf05 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2337,8 +2337,8 @@ config SENSORS_TMP102
 	depends on I2C
 	select REGMAP_I2C
 	help
-	  If you say yes here you get support for Texas Instruments TMP102
-	  sensor chips.
+	  If you say yes here you get support for Texas Instruments TMP102,
+	  TMP110 and TMP113 sensor chips.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called tmp102.
-- 
2.43.0

