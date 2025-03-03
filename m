Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17F24A3C
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Mar 2025 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991468; cv=none; b=ql+z5iZ81vhqPlEh8bm2f1qBGaxgMHes/kM12BNwuho2BwcNX8pKDnlwaNivXBc8APrAw4nnLIKeXtLuFSg3NheIRlWq6RbI+8fGOyoZbxfSXnPm1EOVPcYqx7hl8k/wED3iRjSrO+AQr5BCtIAYlT0zahfanPHk+JDV0rivUYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991468; c=relaxed/simple;
	bh=8VZ49AWBVYyNZmsf755Uc2UV8WmJE8odHGrmIwJnDZI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=X+lop6n1K50bYnCONbaPb0a29oZrN88p8qaXJSHAFBiNii1OdJ0HsNhqFh44lsfgLAuWSTCQ1fvguBOsc9QGjkxMWD0156TePamYDueVb7kh3pR5e00ilQQ8JQrgw/7b3r58qhTeL8zzgwg7Vxq6IC9ogAakD/YLNvFhtcYk2ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=Zg0VxjIW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="Zg0VxjIW"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22337bc9ac3so77085185ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Mar 2025 00:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1740991462; x=1741596262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iAm4K37wYrIAfzZn7V1KmUxERbsQAXepnImlh1Wup2M=;
        b=Zg0VxjIWHK6UnPkjEyhbJALfbJkXe+rV4rZ7WH2XLC2ktSb20PVjKjm8nq/9yrKl/k
         WOKyLVeAdQGg/DEK4xs8fR5Q6hltFJ0y26J9QMSyPZ68kno81vwnKeIHAeAEMHTAJL5f
         FVJMQVLRMJ9nmPV5Ey4Mlofwiy3aOwIM+M8169ZkIH9lb2lsvviLsI1tn6xkdmS/PqSK
         EcKtUi5QcLfFkBbVpRbRyu29rezaSdwQhR1hWFVOmL+tzjU7EBLSpdRuOc2jGQNLhW7t
         sCDCyhinVjQOHb+/slgXhMQ7NB7gAHlz/NXgqVmQRZf4GmTI8DFqiUOlt77qlu+IzS7P
         D9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991462; x=1741596262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAm4K37wYrIAfzZn7V1KmUxERbsQAXepnImlh1Wup2M=;
        b=w2r2PVx7lZ4zHoUU+qUkJQ7akX5qKVLEIjsDrz1PcxEBnnG3JB7fWIck7EWPzrgMY3
         n7xxHlD45K7CidbEbu3IEjB+L+OrgE9600naAYTMX4726kFTXyIeaL+WK8KRhVqzhH7X
         LVaG2FV5H0zUTEoQ8od5QNj6IIU7qkBHNPLfRYHehMyhw+Hkl5IB+pF7HeRSvUIRJNZs
         7FGn0yfTOszgDHx3itkd6+P+WmkD2ZgQ3l2Je1ORYMjyBJWH05pJK6MQNtsqjyQttpcB
         AP/hi1pKVdcK3khUBvsOEzhsqR8CqiV8ONReApJDrmbDkkJxkJaG+D8obDUNNTRrAoeh
         XBCw==
X-Gm-Message-State: AOJu0YxAx4NQK/AprGYIMcATwlSvicUyrgTGoWyx32J3CKkKJXc7H8Wh
	Vc+cHMRKKxkgA56d1Eb5mD0/l+REJRMcQGy8/6kv3kdP7hK6RY0XY9xBTZ19UxTqslA6EJLVGDR
	D6eI=
X-Gm-Gg: ASbGnctWmXRqOWK96ViXxMIBCLyqaJbK3L85dDypZszXDGIF3aoalujh61mhTU36F0G
	5/RpX3B3MTc1gg+H8BnLEpmTegKX3FeeHwZDrib7+YTbMKMX8i8XR1ebXE1Bw3+ssSzcjU75RHi
	upCd82EJeHI26203a8zMHI1ig9MfBZDfc0eLEhyhhvfiKvOa/2TzENW5h/lpOUNhuWZ09vOheXF
	z8Jp4H+ub1oDyB0bgkdjoCfEHnNtyHaeIGZPJALJzDZpBxioa10vp7CL//1nBlfiWUaq3b9k9gG
	wTW5lmxYnKnaeSGysaUVmovHa6h8aQuG9l8BF1bRulgnxdFZA2TvI3MUAy76A0KNX1VTmnYJIor
	zt1hseHYMW5oxQodlOk7ADp+6EfD2u66MvceYEjrYV2bZ7AjytDv9
X-Google-Smtp-Source: AGHT+IG2o9/fuerMDXEZ3njYhBvGHanEfgle2sMKU6SsgTwwqXyU0OCFHfRFISD8ipWe691dVXZkwQ==
X-Received: by 2002:a17:903:1984:b0:223:5e76:637a with SMTP id d9443c01a7336-22368f96123mr172595685ad.23.1740991462451;
        Mon, 03 Mar 2025 00:44:22 -0800 (PST)
Received: from localhost.localdomain (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5a1csm72664505ad.137.2025.03.03.00.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:44:21 -0800 (PST)
From: Chiang Brian <chiang.brian@inventec.com>
X-Google-Original-From: Chiang Brian <chiang.brian@inventec.corp-partner.google.com>
To: linux-hwmon@vger.kernel.org
Cc: Chiang Brian <chiang.brian@inventec.com>
Subject: [PATCH] [PATCH v3] hwmon: (pmbus/isl68137) Add support for RAA229621
Date: Mon,  3 Mar 2025 16:35:37 +0800
Message-Id: <20250303083537.3312250-1-chiang.brian@inventec.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Chiang Brian <chiang.brian@inventec.com>

From: Chiang Brian<chiang.brian@inventec.com>

The RAA229621 is a digital dual output multiphase
(X+Y ≤ 8) PWM controller designed to be compliant
with AMD SVI3 specifications, targeting
VDDCR_CPU and VDDCR_SOC rails.
Add support for it to the isl68137 driver.

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
 drivers/hwmon/pmbus/isl68137.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 2af921039309..c52c55d2e7f4 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -63,6 +63,7 @@ enum chips {
 	raa228228,
 	raa229001,
 	raa229004,
+	raa229621,
 };
 
 enum variants {
@@ -465,6 +466,7 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
 	{"raa228228", raa_dmpvr2_2rail_nontc},
 	{"raa229001", raa_dmpvr2_2rail},
 	{"raa229004", raa_dmpvr2_2rail},
+	{"raa229621", raa_dmpvr2_2rail},
 	{}
 };
 
@@ -512,6 +514,7 @@ static const struct of_device_id isl68137_of_match[] = {
 	{ .compatible = "renesas,raa228228", .data = (void *)raa_dmpvr2_2rail_nontc },
 	{ .compatible = "renesas,raa229001", .data = (void *)raa_dmpvr2_2rail },
 	{ .compatible = "renesas,raa229004", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,raa229621", .data = (void *)raa_dmpvr2_2rail },
 	{ },
 };
 
-- 
2.25.1

