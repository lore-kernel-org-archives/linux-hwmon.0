Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385730;
	b=YOE+cWVFrxmXAv1BIQ9wINwA+fNHiBAFupu7+DHTyKgFV+Y1su02g2tUxqy2FC0eFXiQ
	 lCVWhnV8kYe1rWmnMJN7jhddK2UBwZwVDshKl1kcsxgDuRaNGs43dWNa4a0QyYxex8Caf
	 sNSJqW2SA1eD8V8FzKYetrkFsLH2ze9nVYnVT1DiAW32vYJf+Td3O6Kg3cNnixbkG3AGk
	 40Yv8t8LjqLOiX1RTtjbfHUXC/IPgoGSoO1WFtz04LTJGn2qjFs8F8trRiW6TGHr5dbZx
	 zWeI17JNWH4NArbQ2nvJePYSkvK/+Z7aC6E1JxxklDhVAgLfI0DTZoH3bkRzEqo0jfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vib/5TwxB3fUtDLG/5zdfJfLg2wHWLUrNvbITdsjIUI=;
	b=aDdlhD8ls/+qtuoOr7THHdv1E2GpPpcIJZpEpuWU8idLsz9Rz3k3lRN+NIdLFdeX7NCp
	 hV9RdEabFfCxZxeHAtdm9o2UCzPi91ht23st2M7HJbNuNlyHyDwM+Zo1aE/i7mZabDF/8
	 pN9YpH0FWWk0R5cCzp74Nnjef6ygk53opxQOXvJcTiMoGKiwRsnsCiyvHptI3AVbC2lp0
	 zQiFZkhdSPaLuJRJM//u5yCoF5mZM7uPU+PbwRJdbWzCoQWwZ1G5tQhnFfhwxW39VbMc0
	 NIKzpJpYszekna6kfx329RRlbmNz763i0WVQq+Scp4Adu9ijd3Q7DOrSdDrhuL0VMCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hj/zEf5Z";
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B99960A260A
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B99960A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hj/zEf5Z
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c40f29667e6so430204666b.0
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 00:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794385728; x=1794990528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vib/5TwxB3fUtDLG/5zdfJfLg2wHWLUrNvbITdsjIUI=;
        b=hj/zEf5ZsGeU1Dj2Uyl6zl40lou6eCr69g4V4+JHq50ZUtlDFqgarsqdQpNTQj6h1y
         SW7L6jF6CZswNIy2McH+GbiOR3a74uPCevRWpcRdwwgVFfWVX1gHssPEHUtvC2nVer43
         mQurA2rNYiOm4A1O3UCtYPxNLO5I+au509Qv904jiJNBaxyJpg+uj3vJReqwyqvIuYqk
         YFSdamBwN0GOPESlfEWa0f2lEMini4o97i22EvGU7PTHQVj1RsMfZU5XTF3CF/0a+SZY
         KvwdaTZG4lS8og4zu5Zb7/Nmu0DtkvtimNEB0bgXS329O6NSBCwk4Z8QajH5YqypplIJ
         ARgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385728; x=1794990528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vib/5TwxB3fUtDLG/5zdfJfLg2wHWLUrNvbITdsjIUI=;
        b=qoJiLmsmcuKyVLTtSrJXdJx0RKxLXTEJKTCbWsb+r/rdBexZbJLydYbJ/aUPaWMVfS
         B4LCHuL/80ySuXDsJfFygfML8f0baPgQYpwLdofGyn6Lv4+ST4AlkCfmlk5KevQfvnSP
         5gIL4rIgF1f01TW8W7Bj4WIssOpnx2eruBTc3uKDKHrhuGxA/MVY7a9yixBf8qH37yJM
         CK8deR0u7sWVN1by612kp5P1HIz3WLj5E9QaONzXrcvKWfTA2V99gj1powOPIIafW12Y
         uDYJPOEUsv/IGOYlAZ2XVTPdNFsEgM5M/d79Chf5m+YuAOrUXkDlGPfV/KLOcENZ1pmy
         mr7A==
X-Gm-Message-State: APuU4Z9zGb6I42ekY2RwgKlAF4LnsUGN5MWE6cwZwTVHhUprAzFaxvhH
	4wtWYneFFEZUCpA+GP5me3+GlWFw/a86qdQ11mTj4MrI3fO+KvcPOolM
X-Gm-Gg: AYBFou2XXVmakqDQ96jWdCgdIHMNW9fw5KeO+2AXRhGO06E9UUCh6dta90NZHtTSmJ/
	kVV2mHES0c3tSjkxCueTrR5XSnNgq2x2LjMOdAF4YEYmgZLoV9Eew1MAXqORbJxfUuX7T/LRS4v
	3gm2kT2QrGhsRdkJqWojGuAVGDkmTW5+o1iW7St+B3wIWXE+zKLX9bnz/RzVuVPFJnHWueXcqby
	KiIvwhlPlQ4IOf8FKUzKt0Wh52ai/kJXFZ42ozn5msJW2S31ox8huEKx8UIahEW/dXkImsqO199
	yL7vwnIbIieT78bFr8NfvJnmnU1rcHUdUUEvrGypMGFz0PFVPK/ScB16WShVRw1GeXH9oKYOaWm
	2mAWXjnxbvt+wMTiG1CL7eosOlF4d4x0W/F6qpdjSh9jkPcos1AYKVpn2ZP4Js6z/SUnc8ptcpw
	tfJQqegqeb8O03cpN3XlM7FCqrGJawTV24PhlJjhAGyjD9wQ58qbAyCp9BHsj/xfoQscoFeFS2c
	cnwcritY9pMPbA112W6An2CmZtchFUi7mp4u0lH/RTyi4o2/+wS73vSY0+9HcNeGyJ/jdt8mWAH
	cKmjDPvWAKLhAZEwThPffW1eb8yNKhrjtM1KeypFNqs0JE7TwEe1dVcqYDka5ZUSXD0QV+64t4I
	9lks94puyNqaUpDmrBJE60A6lhsm8+OvntyOdx8dvqsvECb9iXFbsZJDPujPKpP6/EOBIftuIbi
	eu5etiZB5lK8niH4Rtvh4SuzSeAEiRcAh8jUwinnIhrmsV
X-Received: by 2002:a17:907:c10:b0:c33:ae8b:817d with SMTP id a640c23a62f3a-c5066cf55b0mr113938266b.46.1794385728356;
        Wed, 11 Nov 2026 00:28:48 -0800 (PST)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56ffc7sm210135866b.17.2026.11.11.00.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:28:47 -0800 (PST)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH v2 1/7] hwmon: (nct6683) Add customer ID for ASRock B850 Steel Legend WiFi
Date: Wed, 11 Nov 2026 09:28:32 +0100
Message-ID: <20261111082838.1418051-2-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111082838.1418051-1-jdahlin@gmail.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
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

The ASRock B850 Steel Legend WiFi has an NCT6686D with customer ID
0x164a, so the driver only probes on it with the force module parameter.

Add the customer ID so the driver probes on this board by default.

Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
Tested-by: Alwyn Kik <alwyn@kik.pw>
---
 Documentation/hwmon/nct6683.rst | 1 +
 drivers/hwmon/nct6683.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index 62da8fd011c8..4c137eda6583 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -97,6 +97,7 @@ ASRock X570			NCT6683D EC firmware version 1.0 build 06/28/19
 ASRock X670E			NCT6686D EC firmware version 1.0 build 05/19/22
 ASRock B650 Steel Legend WiFi	NCT6686D EC firmware version 1.0 build 11/09/23
 ASRock Z590 Taichi		NCT6686D EC firmware version 1.0 build 01/25/21
+ASRock B850 Steel Legend WiFi	NCT6686D EC firmware version 1.0 build 10/29/24
 MSI B550			NCT6687D EC firmware version 1.0 build 05/07/20
 MSI B550M			NCT6687D EC firmware version 1.0 build 05/07/20
 MSI B650			NCT6687D EC firmware version 0.0 build 09/27/22
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index de5b0194c256..0565ca9290eb 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -209,6 +209,7 @@ superio_exit(int ioreg)
 #define NCT6683_CUSTOMER_ID_ASROCK5	0x1621
 #define NCT6683_CUSTOMER_ID_ASROCK6	0x1633
 #define NCT6683_CUSTOMER_ID_ASROCK7	0x163d
+#define NCT6683_CUSTOMER_ID_ASROCK8	0x164a
 
 #define NCT6683_REG_BUILD_YEAR		0x604
 #define NCT6683_REG_BUILD_MONTH		0x605
@@ -1640,6 +1641,8 @@ static int nct6683_probe(struct platform_device *pdev)
 		break;
 	case NCT6683_CUSTOMER_ID_ASROCK7:
 		break;
+	case NCT6683_CUSTOMER_ID_ASROCK8:
+		break;
 	default:
 		if (!force)
 			return -ENODEV;
-- 
2.53.0

