Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1946818D65F
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Jun 2025 05:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748841101; cv=none; b=BHwx9x13ye1EAOtiOqIpdB4gO4odx6HHbgfI+14z/XaahkkTsEAbbpYiILYGmO92QIGlex5J9bg4UxDFcOfH1AYsg+p3hEo6nQGutCtZX5YCSbciK3vZLXgwcEUAaKe1cNYLXZSRdDhuCNAXmbMIW8IrhH2UWFaY4lYeWU6oy2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748841101; c=relaxed/simple;
	bh=+pqB+woQ+johQDR7Xt+BkyHCFQPBmolBse1yy1Pv8T8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jStgj5VTwjZ4qCbCyCOWZhrHClu7xsAs6pl6dgrEW7st4sORsA6MndZmP9aWHhTKdG987ZibDwnkfa4iN6Iu6PQIE5g2DH3yzN247vF0z9HEeMPRsQz3GXa91Q+sobuOWU+2pyDiCBu+7hyumOASOlKtdKEwcn13kpuRM8+AOxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=bJHOkuky; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="bJHOkuky"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234d366e5f2so51184925ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Jun 2025 22:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1748841099; x=1749445899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SX4qDXPOyGHybeO07OFB098vYbgW31M4pU8wGvxmZ/8=;
        b=bJHOkukyjQZ5ifLiEl0myWuNF/sJV1d3PPHO5MY/90iI1fDhbYkpp65Dtqe5HZDB9M
         0RFTbwlu5nlUhrs4MUVP/NKEZtYlBws6R/EaS/507s3W6TZZA+hsGQ4mtM3Iro3+U81c
         WNXnG13HYqlVOA06g+xYFpelzcewdzjI00SC8HVeaUSVeDcd94PMlKgzEeRCISm5SVq7
         9PB55OpjNMuCEgiMDMYyCM8tAXA+9ZdNNlSbCKrFluOvo20Dz2+uDQ3/35vQ7h9T7DlC
         3KbQClvmK5D+7j68OasTakHpYcez/KwDgHTtTLMvj6E6KPuSs+EBEh3mYaS4hJLHzgDk
         D25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748841099; x=1749445899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SX4qDXPOyGHybeO07OFB098vYbgW31M4pU8wGvxmZ/8=;
        b=dLaLrREZn/x9ej2pLxILELcaLJscAhPjQQyE5k5g4gZsOwjHC7l/P4RKeOZ1p7Gf9l
         Glo0alWJkH3rYvFdZLmxEs3YOWCoiNYZKMAiiMzcpj2PwNj7VoMKKBy/aEXYZge4SIkO
         q7CposabJek8ibalw8HXbCJ9GjSwVbGOojun70/ZtZ/JCDJWK65jTBkRn36nGXNBuL/A
         zIpALKeQpsXfNtw+BSoZlaQQEyHqs5odjjSY/PDKsVoLSaxuXG3bma/FGMxwxprMnPBZ
         R8ejF+m/rsuNaxM//fZS5Aryd9yzo6LVgghpRE4HzgWjEiZ/SSTDcvNBlmwCruGwaNiW
         CKIw==
X-Gm-Message-State: AOJu0YwsEJzRdlhuZam2FEAmd1CO+PnIUAf52JtTrN5w1YRANaRHlRqK
	ktlS+XOgD6RQCpQFmVdlNtJ6vd6Gt5wPVDlFb4nDZrlo7kSfv1fEweTJNr6TET16NdU=
X-Gm-Gg: ASbGncvDtRLZP9sMSD1QJCSry7bYkR/oMH3uLRTlgJvSXfnnldM3UgjBHXeIz4N2tyE
	YdFg7BvKgar9UOPSoOQgt6mFKmOldTFRS8a3VbY2E7Q+aqkRfxcc+uOQqIv2W8IuzyayFeBgkjH
	HYTQ35fL5MIMZ2ZtkuMcWz8VK/XSn5gb5kyWZtk5JlXGvDYo91npeNP6mNHSizAs/qBHy+/r4zZ
	f5zJzb8/pnZBz2Vwk58wZmsl2a8sWHB/u90QsUnHZSon7m4Z88ks79+3t6NgatXINkNo/FDBdem
	v9cj4gjdY3d5ZDX/Q5DezuS5Me8An7VUMyZmgOPwuU3NBMTfvGpxKmUVN1AXfikFwlamZw0o
X-Google-Smtp-Source: AGHT+IFaWnoGFbax5U872Z0YWq7JXogH8BZhBsBdP2E8k3bemDAidjl2iZmiByhbIG/70t/jYpFxFw==
X-Received: by 2002:a17:902:f70e:b0:224:376:7a21 with SMTP id d9443c01a7336-2355f9ef4damr87327775ad.42.1748841099440;
        Sun, 01 Jun 2025 22:11:39 -0700 (PDT)
Received: from localhost.localdomain ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc85fcsm62709085ad.38.2025.06.01.22.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 22:11:38 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	grant.peltier.jg@renesas.com
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chiang Brian <chiang.brian@inventec.com>
Subject: [PATCH v4 2/2] hwmon: (pmbus/isl68137) Add support for RAA229621
Date: Mon,  2 Jun 2025 13:04:15 +0800
Message-Id: <20250602050415.848112-3-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250602050415.848112-1-chiang.brian@inventec.com>
References: <20250602050415.848112-1-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RAA229621 is a digital dual output multiphase
(X+Y <= 8) PWM controller designed to be compliant
with AMD SVI3 specifications, targeting
VDDCR_CPU and VDDCR_SOC rails.
Add support for it to the isl68137 driver.

this patch depends on patch:
dt-bindings: hwmon: (pmbus/isl68137) Add RAA229621 support

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>

---
v3 -> v4:
- Add Changelog
- Remove unnecessary "From" tag
- Link to v3: https://lore.kernel.org/all/20250303083537.3312250-1-chiang.brian@inventec.corp-partner.google.com/

v2 -> v3:
- Fix the corrupted patch by sending plain text email
- Link to v2: https://lore.kernel.org/all/CAJCfHmWJ9N1R8x6ikU02_RYq9ieq6yWY7CGdfvc4hRqHnX5szg@mail.gmail.com/

v1 -> v2:
- Modify subject and description to meet requirements
- Remove the override of isl68137_probe
- Add the of_match between raa229621 and raa_dmpvr2_2rail
- Link to v1: https://lore.kernel.org/all/CAJCfHmXm-fPD70uN-mNJdJkzf9B526y8p=Jh5E+W5cwJ0NVhEQ@mail.gmail.com/

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
2.43.0

