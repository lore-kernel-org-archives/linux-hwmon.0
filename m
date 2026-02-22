Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70C63590C3
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 17:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771779829; cv=none; b=iVVwGIBbYzTKHlZtxATTE3rk0+KpMee3c8TgMrqc54LKYwiiDZEsvS9EpiqGUJx4dYwBSlvSiAcalcuxSSVT3+NRUF/E/RzhrJhQL9oJyhhEsSfodHcMZW12aCUSeI4NVUXYMu5jwiMzAR2qiszlC5loxoPN6PMmSZaxZa9f4Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771779829; c=relaxed/simple;
	bh=/B2AURpLRResgweOZQy1ZCUoeez3siSOBLhC5OwWTEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EvxIjzOeSJOrpzyYTQiseJ8D4mKb4HAzOlf7o73zVQzb9kHyMfFf2IwoZdHBFQaiiyNU/vFEGsMCZ8Fr3xIzVFUmAbArvJLxnsom7UEJacmMKYUK2Hgp4ldAZBNxUlsue5zg01a5umortjP7CRTY38syHiMtKuCBHSc/Ra+dklA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWBMGoLV; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWBMGoLV"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-3543b9f60e3so1564536a91.3
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 09:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771779828; x=1772384628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnQd6JEtLIjrWrJ2e4Q/WkIQthpBWZKwpASED8F5QdA=;
        b=PWBMGoLVkHL8YRv2XSMhnQdAHymp7j75pv9aqWFvcXM62k4yfSgjTF4uy2bleYZJed
         eW+CglBFnEGHi3jSKnk4T05bwPUnbficQKGPb54FZN7akV0ti6GS7liFPyvYdNPFfSsc
         PuwJLvyjb1Ycz2kmfiVZaemqYOwDqcrRbjay7tqKweZ2uhOYSKxhhtTVJJr94nUYuOsB
         o0Mrxp5/gALkAlczFDPY65N87I4cYoj2TW/rBR+eC1ZatxWlDQNoj63jSNnYBsFSti2T
         62lFl7JeFq6T1atThNUVk2W9EjPNjzav5C9ZBMSkoGghVjBhJauRu/F+w70Vg+nzfvbc
         j8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771779828; x=1772384628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fnQd6JEtLIjrWrJ2e4Q/WkIQthpBWZKwpASED8F5QdA=;
        b=nDhbbAOhxyib+ufTBdwKtp+S6nc6kLWs4ReVx9qj0lk1UUnAmcf3xQB0Z2LwqUMOmT
         4RADmeaFNHHx6xPzWlD8t628nJfFzvl8X6Lv3VSOk/eq+Id1BCSp91reAa2NblcMEmbH
         ng7zOR/C8gfZVcQkjq8iH4/3HAHvGpYlU2bO5Ea5IgKdv6b1topG2mrcA0f1qFTckufW
         fRiB+zxscsfJn/VW8p4mA6w72NKTarRcKtC4+WqDO/3YKE3ApPLNMS2Q3CtHPrRJZjPn
         J7MTS6kfoGQGiNSDv2MQ59e5ccT504PU+yfdkEmryvPkjJwc4v6bdax7M1R+6m4j0rDc
         Lx5g==
X-Forwarded-Encrypted: i=1; AJvYcCVo9wZ/G380PsVg3d3EWieuU96xyl97nXCXmAN8pfZKB5hv/w/wx/cUY52W1kDtvoRf/wKB3EmZv2y1Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGKsakM+ms6v286D3NgW/Qt7/C9DppL9T/twuVSGZJoShnSMnd
	SQGdLrNikIuwKj4KvjOhT1kidPeQXPl1V5nR2S/lKBh96k71tqKlgPgV
X-Gm-Gg: AZuq6aKhBP+wAxzwQ0KJEZDAgREcw27FXT/tgvgH84rihffW//FfbTBcDJ6zKJTsiY7
	iz+OwZ3bOGQ0QSRMBh230MDxFbgr2xnnerXUmPg4ILBgf084uCJAfe/VDmR3pu+MZuI3xPO/xpN
	w6kxMjWZJBM2mR7qXi9weerqJG0TDWLKBZ2ePydB76OFu3H8dQSk3y0Dud8V8sQkL6G7S4lLvYt
	42JDnwzDUm0O15C5k+bgXZd1QGapTbb9OwK1b/4gG5wijGkgpI6o7RCMESvt9ztcpFh1Z8N41Cd
	L08sT/yE6B5ZaYEtjTYAwdimeMD1StvD9H8svn3Xwqcb6e+BUt3EGZ1pH5aYDJj2zPX6H2dblec
	AvwUlaWNVZOe62Gj86/45rpUFmXObastw0xvqcCZK3sw/JWV61HLPoZrQvd2eLioDYm5YTUDjyP
	e0w9OCQJW4ls2TTpEQ
X-Received: by 2002:a17:90b:3c43:b0:356:282e:7eb5 with SMTP id 98e67ed59e1d1-358ae8c05aamr5557435a91.24.1771779827931;
        Sun, 22 Feb 2026 09:03:47 -0800 (PST)
Received: from yu.. ([120.242.225.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358bf39ba25sm1555688a91.2.2026.02.22.09.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 09:03:47 -0800 (PST)
From: Hao Yu <haoyufine@gmail.com>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jcdra1@gmail.com,
	akhilesh@ee.iitb.ac.in,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hao Yu <haoyufine@gmail.com>
Subject: [PATCH v2 3/3] hwmon: (aht10) Add Device Tree support
Date: Mon, 23 Feb 2026 01:03:32 +0800
Message-Id: <20260222170332.1616-4-haoyufine@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260222170332.1616-1-haoyufine@gmail.com>
References: <20260222170332.1616-1-haoyufine@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Device Tree probing by adding an of_match_table. This
allows the driver to be used with aosong,aht10, aosong,aht20, and
aosong,dht20 compatible strings in device tree files.

Signed-off-by: Hao Yu <haoyufine@gmail.com>
---
 drivers/hwmon/aht10.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
index 4ce019d2cc80..66955395d058 100644
--- a/drivers/hwmon/aht10.c
+++ b/drivers/hwmon/aht10.c
@@ -62,6 +62,15 @@ static const struct i2c_device_id aht10_id[] = {
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
@@ -377,6 +386,7 @@ static int aht10_probe(struct i2c_client *client)
 static struct i2c_driver aht10_driver = {
 	.driver = {
 		.name = "aht10",
+		.of_match_table = aht10_of_match,
 	},
 	.probe      = aht10_probe,
 	.id_table   = aht10_id,
-- 
2.34.1

