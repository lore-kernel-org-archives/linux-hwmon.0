Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AEE24339B
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Feb 2025 01:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739064986; cv=none; b=DQrhOTBojW2s9hE7EYPF45lLjbvJ8yUwy+sukhJk92f/1lpo5/6werxe5wmnfLmPE4tU1py8XxJbYAYpNkb5fLZgMarl3W7yNeZOCwsFaclen9bP2WV3tgZdx8ltJ0WB1ODFUr80z5gKU74ABbYjN6BzWeSEFkHxQP9H/Vhnex4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739064986; c=relaxed/simple;
	bh=PCIQ4g/SL7oqYMqPYtr2SBAe2+SJcg7+3QCRBjDatu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cosjuCVUbWkVrvqjBIoI3chlndtH0BGwE/wBBQ+btaKA1O2DftmACNHdz7w2d3hYvUBQ4jJLjpiq4/ks7yHRQj5GoaeC4YSvUqlxKlAlqo3zt2zBllH6PZy7E2vBZYAhMHaHPId/o6uAc1DrMlxAQwfFOUaowcovJKos8SHs/1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGSw0H7c; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGSw0H7c"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f9f6a2fa8dso4570779a91.1
        for <linux-hwmon@vger.kernel.org>; Sat, 08 Feb 2025 17:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739064983; x=1739669783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxeo6wjfBjZDxxwkZouvZBJMcSOB01vFgGKBOtIKOrE=;
        b=lGSw0H7cgghdpynTsxMFWJvVAmE0iUl7laN8uUqJlAx25N2AK4hvhV7dZDySrAFXyd
         0jvu8rjBVhpUdudVO5CWefssm/SvIM53ak5j6syaueZmGwg1MiAPD+x5DIbzyERTHIz4
         YDNzsqAb28swvRClDGiu0hZP0rH9qoK+j+9/HuR+JEc2kXOdxuy3fzlwA6NSjSlw+ZiB
         /+u2ssrg4XQORFO2PAPN1ew95SMk552LMbA0XAvbGQRaODZXq1mOI/D85kVxXPkGjjEw
         8UzZin2H4M80etnVCcfCOjyCMFvHuMqFCx9tT0PDRcu6QKMoP4hftxltXT8BirgTRP4v
         D/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739064983; x=1739669783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vxeo6wjfBjZDxxwkZouvZBJMcSOB01vFgGKBOtIKOrE=;
        b=NxvbdhPp3QWovFGDEzdc5O8cwgy5VfrgGQXEVXrylOfXTUC47+aiSIYrs0zd04bdv0
         IjHUsxzf7h+ngKPF6QuZvvKBqzI7xmMUp93nW/yZZrOJtPaFIIv0F5sL8lokh81R4iHT
         JKulY7ZZhm6FwDv8jaqknJxdb/gTTi3f8w3R9cHLmM+h12m6nTsEfgrSR4e4t5I/0esC
         jox40qREBwMUpSq0OUTaRFjWIZdGzA3/bbPe2UyNEhqUINR5ZyE1co6IMByjBGjc8Xst
         hrYbR+505qm1iNkorH6M6Ne9fCW0tayxHQ1imQTI0ZcyBnW8pzjJDZFJpVFyNQtnSq1u
         S+ZQ==
X-Gm-Message-State: AOJu0Yz3D+NsjBq9O8IO2jAwUUAQ2OVLC0S8mMIPaO5OpsGH8bz/poLp
	GCysVNh/ITlSxf1k4ra4EvJm6g/k7RWu5tUv5v9HIkydMkQ8fJwZHs1bzA==
X-Gm-Gg: ASbGncuZ4nyiiWAlsltHG1FB1uiXKYjoXCAxwrhNJwD614feq03Rwt+a6aouTfjsoh0
	UOYFPcdE21o14jc8H7Slh9OVIcyh0pwOGbmKYzRV3cA6fP9vTflGTKoWvCmIAKHHIhmv++JmGDC
	b0uNYIsGNXbAGaqupbwBSKkQekCl1sunEnjDcdZPimuj3oHP5mUzP+3xjQJrmoiruUq3mqUQ9+Q
	Ql8yTJ9c+28qnlGJS7YiA/7/nB84wmF1YJpKFCE6jB7LQ+JZQhsBUaQg82G/pgTH2Oa1pRqpgg/
	Tp0E3Ww9tRRyB/lMdxNlFC7kipiW
X-Google-Smtp-Source: AGHT+IHgQYDZ+5vhdetjIxY1GipLHbpOLk1mI0y8ML/ww7Uo9urp9VhrVuyxYiiK1isPmUXRG+/Cvg==
X-Received: by 2002:a05:6a00:4615:b0:72f:9f9e:5bc8 with SMTP id d2e1a72fcca58-7305d51599bmr15004410b3a.22.1739064983279;
        Sat, 08 Feb 2025 17:36:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7304c780da5sm5092390b3a.69.2025.02.08.17.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 17:36:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/8] hwmon: (pmbus/core) Declare regulator notification function as void
Date: Sat,  8 Feb 2025 17:26:14 -0800
Message-ID: <20250209012617.944499-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250209012617.944499-1-linux@roeck-us.net>
References: <20250209012617.944499-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regulator notification function never returns an error.
Declare it as void.

While at it, fix its indentation.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 39cdcbb96215..3085afc9c1ed 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3313,17 +3313,16 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 	return 0;
 }
 
-static int pmbus_regulator_notify(struct pmbus_data *data, int page, int event)
+static void pmbus_regulator_notify(struct pmbus_data *data, int page, int event)
 {
-		int j;
+	int j;
 
-		for (j = 0; j < data->info->num_regulators; j++) {
-			if (page == rdev_get_id(data->rdevs[j])) {
-				regulator_notifier_call_chain(data->rdevs[j], event, NULL);
-				break;
-			}
+	for (j = 0; j < data->info->num_regulators; j++) {
+		if (page == rdev_get_id(data->rdevs[j])) {
+			regulator_notifier_call_chain(data->rdevs[j], event, NULL);
+			break;
 		}
-		return 0;
+	}
 }
 #else
 static int pmbus_regulator_register(struct pmbus_data *data)
@@ -3331,9 +3330,8 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 	return 0;
 }
 
-static int pmbus_regulator_notify(struct pmbus_data *data, int page, int event)
+static void pmbus_regulator_notify(struct pmbus_data *data, int page, int event)
 {
-		return 0;
 }
 #endif
 
-- 
2.45.2

