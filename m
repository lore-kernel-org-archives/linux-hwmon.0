Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjPJRjbg"
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57BD9EA
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Nov 2023 16:02:55 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1cc3216b2a1so12960715ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Nov 2023 16:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700179374; x=1700784174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CjjsNIVQLO7uSgWiuihqRU/tj0v0w91Gakpavwjbf7o=;
        b=FjPJRjbgmgPkC3zFDpY4f8slEytCxGB/BbEm4srDmoVt6L1ZkhjfswMhaqKfxF3ctX
         qdiyQI/YKHEttY7AcuTiLP1p8Nvemsjzbxq8EyQoeZySKVYhg8PKa9O3dkn8ZQ/VRIFT
         NoTgE79xFlev7xDCMYjOzQs+9i6V7LcJxpcmu1FsOyZCACczW42otveESUzaexUUuVS9
         WwVx/OyD2c8zaDnlsTMbiCmhiz3WhCYh6srDhySGATtGwl7al0qIBnRiv+ChXHmZYOYn
         Qm5wGzKLWFxy4QaedwXay+BHabg4bhxDES8WTcdyYa5Y8CbSOk7bH2e61roqMtc6VQeA
         kgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700179374; x=1700784174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjjsNIVQLO7uSgWiuihqRU/tj0v0w91Gakpavwjbf7o=;
        b=jG5Z/HV8XOIKVGghZRy5x4+DJPO1JRzeEn4NkMovfITXCkueWofsH6v9DMB5fb3q65
         XABHUeHglqLWm2tpo+dFqcqFX5kql2bb4rMMCxBQ3CYnJJvpiXCHGe8HyfuCBi2tZzyC
         6LFSuHVAEWfaG12+qMTUChXTpp32GcD4RG1eq+uUBdkfX44xWAd8HkgppdmlfL7oCD8N
         G4OmA9v63eAeZKyhJ7x0o4b5OFH4K67J8hyRfExHMHWyjvABncdfazFo60atACd8W7x1
         y+e2ihncCQSdlkxCGrpVdXZFsNGM4KE/mcYMjxomTLLpmjBX6t5hz6s/BZwP8023eRSu
         KqKw==
X-Gm-Message-State: AOJu0YyqXBnPT9sZLm/32pvwBev0D6USvXF6izOy15v6Iber+uN6Mswr
	VEg78PfHgN/+xSwx3448ipWLs1MuUEk=
X-Google-Smtp-Source: AGHT+IEx/6/Y23JddXnCjpAObFS6t9Fq2NrJQFb6KwPrHL4vErV37o3LP/4ipTdC2+bcf1Spe2d8tQ==
X-Received: by 2002:a17:902:db03:b0:1cc:32ae:4afd with SMTP id m3-20020a170902db0300b001cc32ae4afdmr12931330plx.46.1700179374021;
        Thu, 16 Nov 2023 16:02:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w1-20020a1709026f0100b001cc3fae06a6sm231783plk.159.2023.11.16.16.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 16:02:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Kees Cook <keescook@chromium.org>
Subject: [PATCH] hwmon: (nct6775-core) Explicitly initialize nct6775_device_names indexes
Date: Thu, 16 Nov 2023 16:02:51 -0800
Message-Id: <20231117000251.1197405-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changing the "kinds" enum start value to be 1-indexed instead of
0-indexed caused look-ups in nct6775_device_names[] to be misaligned or
off the end.

Initialize the string list with explicit indexes.

Cc: Rob Herring <robh@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Fixes: 0a7093e69c1e ("hwmon: nct6775-i2c: Use i2c_get_match_data()")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775-core.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index d928eb8ae5a3..7534d5c657bd 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -63,19 +63,19 @@
 
 /* used to set data->name = nct6775_device_names[data->sio_kind] */
 static const char * const nct6775_device_names[] = {
-	"nct6106",
-	"nct6116",
-	"nct6775",
-	"nct6776",
-	"nct6779",
-	"nct6791",
-	"nct6792",
-	"nct6793",
-	"nct6795",
-	"nct6796",
-	"nct6797",
-	"nct6798",
-	"nct6799",
+	[nct6106] = "nct6106",
+	[nct6116] = "nct6116",
+	[nct6775] = "nct6775",
+	[nct6776] = "nct6776",
+	[nct6779] = "nct6779",
+	[nct6791] = "nct6791",
+	[nct6792] = "nct6792",
+	[nct6793] = "nct6793",
+	[nct6795] = "nct6795",
+	[nct6796] = "nct6796",
+	[nct6797] = "nct6797",
+	[nct6798] = "nct6798",
+	[nct6799] = "nct6799",
 };
 
 /* Common and NCT6775 specific data */
-- 
2.39.2

