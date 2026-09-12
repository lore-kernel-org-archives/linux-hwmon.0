Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B0FEED8
	for <linux-hwmon@vger.kernel.org>; Sat, 12 Sep 2026 14:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789224643; cv=none; b=mATXfxYXa6if3S5cDBFjIi1lCwnfGIy4jqhO/3WOZeCgd7UfdYwAJmoNt5louARG1npV/ZBrGhT3/CV6qOoEiAWRtT0lSmTcBlwQP6CqgnRsgrvErfybMFElTeOk/Wr5l67eh7ikeQAHsQFHOo+mtTd08teYGBXPSaaGm/u0a1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789224643; c=relaxed/simple;
	bh=L6Ho1h7vQKoB+8LVtrJXtMTiuI5njpXxXtMeUVyvgNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d/ILESSlkF+b8WnjhCtEob6w1VL3hCJc31d2RwY3jvszWWGUHggmUqW6iLEV3TJT5QK+Xy0/CbvfBHA1sq9A/0zxzBDNfOXrLBF8riFb8P17zmWqS/6uJDK+fx4i80No9qFY8cm+5YN0wKgEI75zpwQx95bdlqaLIR7RSs81V34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOx7Lemf; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOx7Lemf"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2028201a91.3
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Sep 2026 07:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789224641; x=1789829441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yNf5Eu+ffluZYTIWbz18PwMfJkJZ83b9zMgkcFpxnew=;
        b=BOx7Lemf38GKib9FZuBQgMl93343wFXJYkIUdQbTG46Drg3lrew5bX6Snh1WPbiqHv
         hS0jo2lxizCpOt/WSC/UhzpvbDOUsHAmCOu6EeutKfFAghiR5wBNBjb41RZlQjV4NTVk
         oZqDpToL/JKC/pvc/DrW6W+g0+O45sJL3luTag2EEAdxOjKS6ckBJCcfDWKKTz0UT/RC
         1nh61dXJDnujVlWjV/iTHhx5nRGeOYW6H44lq01u6m6yHNcwl1sDqPV0Tr2xz+UWSRkv
         0HfmX+XF1ml1qLYMqcobalcmMr6uqej5VE1xvUH3K5+xXhM2iuzebxCE2Pk8uNAN/VeK
         Pvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789224641; x=1789829441;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yNf5Eu+ffluZYTIWbz18PwMfJkJZ83b9zMgkcFpxnew=;
        b=oN+I/Mf4LRoPNffz8lvhZrzLmAD/ZlDXUGn1JMF3nTQEESZpB5ylB4K2qIXikjB8hC
         pvYX4Cwz9Tyq3oTNOcTsUy5+ruLSz3brgHdcQVXcc4nGq+FvYmUMc7XLBkEZQxYBARsb
         K7G0omzKRRn5Qr/+h+z8o6dQ87SSKmQt5jTNikhqrlgQQXLL0HXyTxxB3dXgtI15rbdq
         X+5MSFWcc2qwbZBcKLARqgPV0NE68iUa0XLPtS3BDmm5PhQxhCaL5HigDvrqSClysxIE
         pbRQjkrRzC8kVyrs/F1Mdco7xlyvD7HR5srbdIvPEQQl9wVBhKJleGqv7l/JRq80VzJu
         hk7A==
X-Gm-Message-State: AFuF++l7V3PddpFgFanrGV9TRa04UxD3qxlu3vdUGazIBtQkrHnpyvn1
	Yb4Zl9/Z/NWUwY/40iJefJa9ppfwnbVkH7w/cSDS/33UJZ8ij2dJk2ZmkqAvbpZu
X-Gm-Gg: AYBFou1GOM2om24WwmPqlmm5Cvvyh62+SaPidDmxrr5EiKGVteIbCsm9TZroOzNHtNe
	brHPaDmSK+TiqmPcBhvugfWdSXRDJW+HFrp6bJob+XD9KnRJ6CC5hhsgwhfBJI9j8qcGBWCyXbg
	oGh0YxPTuIBvLBBRomrXD9/Egna0KWhsPikmqRlcM7TvfJbec5hhcUI7G4LxARyRym3agG++fdZ
	8ybUuvs5hRFvJCPxem3PmJNAZsqGZBzUQbtcq79l+bHjPow5d8f0Y4LVSUiH2Ei2dSxFab1Y3bc
	cBvALomiuPFbuFc6wkUttH3W63FGC0HMbr/161GB3W1+8+vWg5Nsmvg8XCqYmuPjcEGUnMwUsy1
	Cm9LglirjmE5yRHFQpYDJIhZYo7+WPQzPh9mB2ySUANEiidyUwbu4bKW3yDKBsqFkH1yScFtCrP
	ttiz6oLqp0hMeqzskaD3W3j5Q7MxJmZ/TNTJYyuJAJ3FNmTvBbeJ7Cmi03kLp5ZB6/s6LpkXIc7
	tJTfKY0IYDo
X-Received: by 2002:a17:90b:5823:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39d9c0aad8dmr16939714a91.16.1789224641082;
        Sat, 12 Sep 2026 07:50:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994872e0sm10814779a91.8.2026.09.12.07.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:50:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Subject: [PATCH] hwmon: (pmbus) Validate number of phases per page
Date: Sat, 12 Sep 2026 07:50:38 -0700
Message-ID: <20260912145038.2411447-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is possible for a PMBus driver to configure a phase count larger than
the PMBUS_PHASES limit and cause an out-of-bounds read.

Add a bounds check for info->phases against PMBUS_PHASES in the core API
to prevent the potential out-of-bounds read.

Cc: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 5104fd29307b..d69f1bde1795 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2982,6 +2982,11 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	}
 
 	for (page = 0; page < info->pages; page++) {
+		if (info->phases[page] > PMBUS_PHASES) {
+			dev_err(dev, "Bad number of PMBus phases for page %d: %d\n",
+				page, info->phases[page]);
+			return -ENODEV;
+		}
 		ret = pmbus_identify_common(client, data, page);
 		if (ret < 0) {
 			dev_err(dev, "Failed to identify chip capabilities\n");
-- 
2.45.2

