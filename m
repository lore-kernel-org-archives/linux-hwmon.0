Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F56286430
	for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779031237; cv=none; b=dFyPrVUUp1tHBa4NdX57Ro8SM/+v2UGpgxxjITMepSslVI1a/d7WKRHI38uVWdryEgpRAeDOFkEjtLOzmYutUyjVJPV7hsz6pwUQ5jv/PXmjeGeVElk546WGHRNsV8k0e7Hz3rKL7OVPWMuJlciekST0WohV6C/U5X3NrMFcL9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779031237; c=relaxed/simple;
	bh=dJyNMSvdMIo+TtWNUfATVXGqa6j0u/eU3Mht4XZUgNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U4+FUFWFI/wjX8/QJQL4Wh695wxUDD3bY0+2uZ8PiRs+199FCt+ff7e3LYf5vbnRUXO9iPQLSp0j/LAQ85yzPTAbIDSYOc6PVKH02Cwqc2xFH0mAIQ2F3rUAkcCecX7gWKjOaFaLhihO1u6jXBmMKpw0P1yNeAyGQjiKmtMtII8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STx487jX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STx487jX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso7758275e9.0
        for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 08:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779031234; x=1779636034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AFVIUU0J0nxYU5ZWZxhZGfLg53rVQTovKwy4dX0t/wY=;
        b=STx487jXRiVE482w+B8+IPw40OeGgpkAkFeEgazejAwqgvcw//XuYWtSTxq51UjGiJ
         9zrzMpwyMU49tfeMrFFX7BSgomN9N8tH1UEgF9B78dkBusBnfjQQ07DBnjGhwH7rpUlW
         mN+5BfXX6tYRjuQshbUuxWn7A+y0FEvwNf0VeFUi3Ryz8kJe+fZ7/PkdLpK80g1aRV8i
         2RD2EfRXfPs+m7nWJun+OfNEouHsakutBpZqFcOWPnq+hEaBYTiFlGeVuoZ97v06V2rj
         XNWXXrvUfF70yqxbdsrNWbgyNK43do3ESpPwm6ihEgjjdmFnnSnaeLfL60cw0YR/2ky9
         scvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779031234; x=1779636034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFVIUU0J0nxYU5ZWZxhZGfLg53rVQTovKwy4dX0t/wY=;
        b=pC1xtS1+PT71Kgkhbe+dEz7S4qwCTTCZCbHZBnfhlIC5Fat66eVZLJxWNG2oc1G8HT
         XzkszNtizdVuIXy7sb1+IljplNAh8Y+tmjuDZjWHg6MJfbLWA7JnTFygbCUxBQzy2xYY
         jZU4OCO8ZbeOYHelVxW0MgkrPvUz1h9JBncoQIsjtg/ih0stJXw5ppxoil1gzAT9PWeQ
         3u1xKBrMUVbk9ff1OvyBFaigx2SI5UpvNFi+nvD8yq2DB0d5KmxzaeG2dEEZYw+xMDh9
         zqKbRV00bH+0Ev6LWZTL9MR0W+FwUMJX+sqU+zaY+hErCCeE/VBu72agAk59r6fQqIeb
         ou5g==
X-Gm-Message-State: AOJu0YzKHzt7L+BPez8Luk0hg7ae5ZmiYtZ53jszaAa67NWJG9RbemDR
	RzI6SkdHxXRXFQUNyfkyHR14StA9qm1OzS7IAfGXGYk/1cC2sDWsisR+JY85JliD
X-Gm-Gg: Acq92OHXei8eC9acs9PnHYhLKDeiyvHTfmaQz/FMX1fK+TUSRbFDncJogjsHGXO/Kob
	v956DAxx8H3Bx8gqQlOBzIyaC2UhpSoGzVeCMapGUkqjUcljac2IG6tHKr1L9QDXh/RE0wbOwTg
	XVPm380JbuP6uX5+x9uQ28uiEOriff+SOxh54+mDOFhlNKS9kZ11t42WFnYcv8GjrsmbANji6tQ
	213Qy0TbIFCO0ZAilqAQ//UqB0Iz+iXEYEpD39bHWSrQZBD1A5ANL6UgWsHbnDBSB//hTYz9Qgt
	W0l6IooqU5IGObyxnwTwdggOH/5MQ87oEciAsCiXFpQU7RaCESP/dqbMo8IRU4rHE38pqPscDaV
	vbIpMES7OvYyIdMVwb8mk8JPTy5+r5wdpEZ0vwxgfErwCVhBUEf/7ZDSoBad46fTk90q2Y/aF98
	of9RvU2pZdrSfEAO5r13aqpPSCcU4/8vg=
X-Received: by 2002:a05:600d:10:b0:489:e696:8362 with SMTP id 5b1f17b1804b1-48fe60d7882mr142200175e9.13.1779031233726;
        Sun, 17 May 2026 08:20:33 -0700 (PDT)
Received: from arch ([37.45.196.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fffb9aac4sm134652075e9.9.2026.05.17.08.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 08:20:33 -0700 (PDT)
From: bakshansky.lists@gmail.com
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	Roman Bakshansky <bakshansky.lists@gmail.com>
Subject: [PATCH] docs: hwmon: (coretemp) fix outdated documentation
Date: Sun, 17 May 2026 18:20:27 +0300
Message-ID: <20260517152027.350356-1-bakshansky.lists@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Roman Bakshansky <bakshansky.lists@gmail.com>

- Remove broken Intel wiki link; add Intel SDM download page link
- Fix description of tempX_max to clarify it is not Core2-only
- Correct tempX_label string for package temperature (changed in commit
2bc0e6d07ee5 ("hwmon: (coretemp) rearrange tjmax handing code"))

Signed-off-by: Roman Bakshansky <bakshansky.lists@gmail.com>
---
 Documentation/hwmon/coretemp.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
index 7a5fbb37b0f3..f63b21f24d42 100644
--- a/Documentation/hwmon/coretemp.rst
+++ b/Documentation/hwmon/coretemp.rst
@@ -22,8 +22,7 @@ Supported chips:
 
 	       Intel 64 and IA-32 Architectures Software Developer's Manual
 	       Volume 3A: System Programming Guide
-
-	       http://softwarecommunity.intel.com/Wiki/Mobility/720.htm
+	       (https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html)
 
 Author: Rudolf Marek
 
@@ -51,12 +50,13 @@ All Sysfs entries are named with their core_id (represented here by 'X').
 
 ================= ========================================================
 tempX_input	  Core temperature (in millidegrees Celsius).
-tempX_max	  All cooling devices should be turned on (on Core2).
+tempX_max	  Maximum recommended operating temperature (Tcontrol).
+		  All cooling devices should be turned on.
 tempX_crit	  Maximum junction temperature (in millidegrees Celsius).
 tempX_crit_alarm  Set when Out-of-spec bit is set, never clears.
 		  Correct CPU operation is no longer guaranteed.
 tempX_label	  Contains string "Core X", where X is processor
-		  number. For Package temp, this will be "Physical id Y",
+		  number. For Package temp, this will be "Package id Y",
 		  where Y is the package number.
 ================= ========================================================
 
-- 
2.53.0

