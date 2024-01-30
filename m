Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A2D81AD5
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jan 2024 15:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706628551; cv=none; b=OWPU0nE9kBwp42UFTFsoWozCuyG/lQjymjxuFvE5kYh4T2OeNOAixq/K72u/sXSeOb1XtBIQGoiL2Pq0GZGrT5uMEuMDtbdzNxPTN0ggv0/Unxu71KqnJhK4/W8oE7sCSEOMT4mlggPsNb5kiEs8Uu8MbqXe/FwpncNF4qXyoRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706628551; c=relaxed/simple;
	bh=f7vh7CU8f3xf9WNo29CQlCllyeFojlMOf302dp2eR80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WgjwuTqaIlGjJD01RQn/Qz2LewS6nNf82cKvunY0ZbaokRiiS3jIra5Pi17DjaluKIOQUGpWiGcK4wpiwvXAhwOZAc5t4oKGF/KuBVSBog04bZ/wkJb6jRgN9TUTUStjjTGKYnhEDI/XCgjJizS/Tj0KNG1SXBpI71FBNSKdB+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=WRcDLtQo; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="WRcDLtQo"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51117bfd452so2022467e87.3
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jan 2024 07:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1706628548; x=1707233348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3cxab9c1GLUbr8ktMoVPuxVQEtnmwbdONtYqM9ZydT8=;
        b=WRcDLtQo553sR4CyII+D876Z3PFwmrfLiN8TulBEQvEGMV9TZko2nQ9a2bSnCSqg4n
         AdFweCZjmGNcHgsImZ6WRBhVy/iK0Urkk+FljHUGUcu6Nir3Ph02IBYk9j/LhPl8RXtb
         qt2Mz7J4Wi2by1I/X/asnR16WFZ5hzDf5B/Lc/kCtA/mqdDL4wf2EbaHf8mSXPgKq1m/
         rDxYpga6L8UJj+JVi6V2fH8m094otzru32Ud0kc6tTGdQyciE8e2VfXhaM4DFPG7v8xd
         oPeewYoACh5o27qVlQiykeXHrZjOuuhm5lfuxQW1RpM7m6zFjBK0InqG1PgdJ2+bjmXb
         mk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706628548; x=1707233348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3cxab9c1GLUbr8ktMoVPuxVQEtnmwbdONtYqM9ZydT8=;
        b=kI483ZbeSuc4kzLf+Owi6zyg4qdmlbRqeTo5OYfN9ZD6hA3a/wgeW3yXdq1H2kT06g
         ynANIn9lg8IdXBAUkAPvglnoBOAicbgT/1uub+F50jlJ+b9zXPMoblyLGR3XN+oANtKP
         +27axAGcj+NMeAalpppxzFA0KJMWLOS+5PKtxlY9cw+zE0bQgo6UeWGza+UNju95heQN
         HT7JBuNbrM8EJPl54fOMCgDeLlA48todGcw02fh/g1lDTTyoC6lMOgv88Py/TIJAsYWC
         8beAk7/CIMKsDLGU+RUaCcsWcSu/AGBTV0nDyhbxlmL7ACmrpyJwfcczKiIURWbVmZlK
         hE5A==
X-Gm-Message-State: AOJu0YyCsybzuRAJHvppC4F6z1i1TzBFG3D3jzyczBRPxXLD8uYrSWka
	901IlNRW8PxqvuOmJvExHCJs7rlIWEbTae8v8oon4sB+Cg38DBjbRkZkfOq5p9s=
X-Google-Smtp-Source: AGHT+IHRWWiuqSXJHYBa2mWLkoAEmi0JD/TCwrJIulgko8uqY0Cl9Ng6mMs04IFk85wfJzEcQWrnVg==
X-Received: by 2002:ac2:5fc2:0:b0:50e:8e74:6406 with SMTP id q2-20020ac25fc2000000b0050e8e746406mr6673763lfg.36.1706628548324;
        Tue, 30 Jan 2024 07:29:08 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUfocgrKJv+URBYzOY4RWauWTJgEQJn237C3KiCgKl3fWxUsDDcduOSTYvhoMSfdhNqjFLGrP7He9j9Q1Wuht+bdScLyL+EqZ7EdbUw7G8US0Edc/rUXIhhQXAv+Ix8LrgRGPgigC3TEywbRftUXQCXQU5pxUE07GDfoqCOa9GXN8xopXzojLuCosi84PTS7971Hz+S7igF5wOXe5o4T5iANdbjzyA2wdChOemY2uDURi8ipQC2T3H+oA==
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id d4-20020a05600c34c400b0040efcf63492sm2975039wmq.18.2024.01.30.07.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 07:29:07 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Cc: mazziesaccount@gmail.com,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus_core) Allow to hook PMBUS_SMBALERT_MASK
Date: Tue, 30 Jan 2024 20:59:03 +0530
Message-ID: <20240130152903.3651341-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Use _pmbus_write_word_data to allow intercepting writes to
PMBUS_SMBALERT_MASK in the custom chip specific code.

This is required for MP2971/MP2973 which doesn't follow the
PMBUS specification for PMBUS_SMBALERT_MASK.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 1363d9f89181..cb4c65a7f288 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3188,7 +3188,7 @@ static int pmbus_regulator_notify(struct pmbus_data *data, int page, int event)
 
 static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg, u8 val)
 {
-	return pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
+	return _pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
 }
 
 static irqreturn_t pmbus_fault_handler(int irq, void *pdata)

base-commit: 861c0981648f5b64c86fd028ee622096eb7af05a
-- 
2.42.0

