Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD714335575
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Feb 2026 17:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771868507; cv=none; b=bcaASF9AHjqwmDxNV/EVt4ZiAM6XwZtULu9Zl5iJvF/u/vAQcmoMsKTTxZmCPA466QaaeGVBFdi2k08nqcVteytcCsaQvBbeOtYwfGKx8wb+dwJV05jskRJmeupfiEXp4buju7kh8V2H2bi6hyXDUEUOdU6SyW3fFzA37LD9vAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771868507; c=relaxed/simple;
	bh=tidd1TdFYWp4jDWkTB+dQ7/+l7i8iyrf+OeVMuTs/Q8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PeDt6GQtTmRghCcGGVDQmYCjKRP7onmIPJbCbSdgZIS+i+r68D8d2tSFM0Sy8fBoCcg/zaYWtJJIT2SvdFi+fBwJ6Loudr75sf2AaDzonztt1oyGTtoQ0HGWWHfnWPKopHA7N2NxFhZHzKa9Do8n6+klZyw4JCKoi483R0DhGSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y16jBxtZ; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y16jBxtZ"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-824a3ba5222so2444580b3a.2
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Feb 2026 09:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771868505; x=1772473305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMOrkl/BziQHRI8pHgCZt8ZfPDD6UJ51/RQxt9kpqgc=;
        b=Y16jBxtZWdwFhHIcAN8rw3921Z7sc6jXDT7rEtuYRzev2gTpylr7fPoX2TnpuhXOJx
         5Qrc3poS+12GVgcTgEyZ+oKFmOxohbhUdn9AWQedAsyul8SqItwJGFW1JHUWJqiKJHAc
         yIgq0KVynzM/SjpHIVECL7reLGRX/aOK2GS4sPtNFX0V9+mKC5NbOvcyoHRU65a+xxzN
         N4jfM3AZuuhm7MkH4OWLX/3xA6Wg1YHpgJRENkZ1xUkKFJxOlPw103A5XEzKy97BU1Jc
         mDN1wPOIQ5iXeIuzAo6FJY/4UxUNO4ZsLo/h/QxgafxYlCrMaf+prvXVaZu/DKPM+B3b
         4B7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771868505; x=1772473305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XMOrkl/BziQHRI8pHgCZt8ZfPDD6UJ51/RQxt9kpqgc=;
        b=jZn/DqH5Q2SGh36RlIHRKWk79T6R9UXIg045ttcOKgh+R6psHeomyfjmCXuPB+Rn54
         AedyVKA69ZnlTlyg+AUyi10a4MHnhWBHjWEoUm9EiOZIDy5V4TR3Kok9JG4KmY8mPf2s
         LllkVrb+eziSS3zSdhA87s4y/eB9SS3XCM7P8ZQzqO9rsd0dRbQMFC/3f1f/EFjn1DgR
         b6zZPtkmynNz2QxHr+7F7oy+kCcPWXI2+gIjlxdim0aCNjEyeoaDYLQmqPAFcFMkTK3a
         2ugE6z9rubPP6opCEgh423C2SYJ7f9q1qWN5uhl/Dz1P8vLcKa62aY6aBSGBHhC3WElH
         bMHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxf9Ita960LgimOcEeSlmZMI/qQ8xwi0mc6sQ3a3Kf3d00y+1zHXj6uQf5OVB9YGt/bIl+CVko05AK1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEfba+4+wqIJwlumErxS1UQm0mzBJd92ROioq/EgAI0Gna43bC
	8QBLLvjHa7X9Tdoi5c1iawhkdttPMLDJuHoSYbP/kAsd+WxypkygXkGN
X-Gm-Gg: ATEYQzwTPhKR8Q7SUleCx62faANMEN65IOa0QVWRaDRUl0vTwJJg1soK8KOtFMhUGPU
	9MGWgZl/C4EXCnf8GfpZKWE3W4NJtw/eV8Q/S2UTrooZ8jm0Yi1VhnTBn4YyQDFywDphOtlVduB
	NQbUjweLndakn01CLDA3DiBHTLBMYsax5AZafDfqdmOYH9zbnbj6Y6QdSDbtcosFUYMvEFQgSUl
	4RatLZNenAS/i+Na8GhksE6zThn5IZ6Dll2aoRr1ChDcWI7G7LxaYNi8ZuELrbSl+/5ApkPWLLb
	upzKBSpO2WDauTKtGi0JGO3zgLYBnahWKuW7aOd0jq+a2L6G+zAAqnk4R5118CEeHnv5EdCJgJV
	lWe+WpXapSPjkKuVLRJVimkvz01iZm/RiLTxkJZHreSsxPwtXW5jzUIzhc4DwiK+GbsPBQBnwqo
	UXGNocntZSFWWiXMCP
X-Received: by 2002:a05:6a00:1d83:b0:823:3056:c2b9 with SMTP id d2e1a72fcca58-826daaf421amr7076910b3a.65.1771868505069;
        Mon, 23 Feb 2026 09:41:45 -0800 (PST)
Received: from yu.. ([120.242.225.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd47c737sm7873090b3a.0.2026.02.23.09.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:41:44 -0800 (PST)
From: Hao Yu <haoyufine@gmail.com>
To: krzk@kernel.org
Cc: akhilesh@ee.iitb.ac.in,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	haoyufine@gmail.com,
	jcdra1@gmail.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org
Subject: [PATCH v3 2/2] hwmon: (aht10) add device tree ID matching
Date: Tue, 24 Feb 2026 01:38:53 +0800
Message-Id: <20260223173853.30617-3-haoyufine@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260222105831.7360-1-haoyufine@gmail.com>
References: <20260222105831.7360-1-haoyufine@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add of_device_id table to allow the driver to be matched via
Device Tree. This is required for supporting the AHT10/20/DHT20
sensors on platforms using DT.

Signed-off-by: Hao Yu <haoyufine@gmail.com>
---
 drivers/hwmon/aht10.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
index 007befdba977..cd802dad5eca 100644
--- a/drivers/hwmon/aht10.c
+++ b/drivers/hwmon/aht10.c
@@ -60,6 +60,15 @@ static const struct i2c_device_id aht10_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, aht10_id);
 
+static const struct of_device_id aht10_of_match[] = {
+	{ .compatible = "aosong,aht10", .data = (void *)aht10 },
+	{ .compatible = "aosong,aht20", .data = (void *)aht20 },
+	{ .compatible = "aosong,dht20", .data = (void *)dht20 },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, aht10_of_match);
+
 /**
  *   struct aht10_data - All the data required to operate an AHT10/AHT20 chip
  *   @client: the i2c client associated with the AHT10/AHT20
@@ -375,6 +384,7 @@ static int aht10_probe(struct i2c_client *client)
 static struct i2c_driver aht10_driver = {
 	.driver = {
 		.name = "aht10",
+		.of_match_table = aht10_of_match,
 	},
 	.probe      = aht10_probe,
 	.id_table   = aht10_id,
-- 
2.34.1

