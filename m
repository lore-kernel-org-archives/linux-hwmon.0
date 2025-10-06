Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0601D265623
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Oct 2025 21:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759787668; cv=none; b=eP0Y+XprBl2s6LzWsR/F8Sn6qNwF8iblDu+JrKRzBlq8q6ZQJQG8U1zvuINGHhhCxWh+SCod8142K2J0RfNNB0Hxc2Cvgc/Dyh7Jc7i9VvlkqS2v8Eg1KOTEJZ4qFLy2Gq7r3LqWXpH+szcbB6aughC+sSMRAgqj2IlAdH+bkaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759787668; c=relaxed/simple;
	bh=SDk0ccNxqbagGL5JM2RvP/qQ71Mw0w3Sux7TGmbM89w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RAdenCoO2jjUD1vWotOkEo+M8XgnRbIaD0WLUKm+N5QLWC3b0p6PiAOtjiwxX66fObx+BRFGtTNJA7Nfv0GoSIkXtF627Rv1OVPrAl7WDXQ1eod4QgvfTFIY1wj/keVP7oUXeXUpZ093RmrAdnQg45Umdecn13ed9zVHHunlA/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKiqWG8R; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKiqWG8R"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-856222505eeso600339985a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Oct 2025 14:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759787665; x=1760392465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHzE09hpsw0lAJL0J8v7uFjrU395EJVLjHASm1HYY4s=;
        b=AKiqWG8Rit6wYf5ZiVdmg8+/v1KXWj4nmZsVctvwomGDm0n7gDoJJ0r8KWy1p+GNrW
         etLpFxXI0rSy0zFcAfvUEEokPC7lWv4wcoJgfZYvHYiTLo9AayEw4L+/3K/9e6Ja7Mid
         fsjkmVT4mjtyHDTsxv9HQRgqe/6zur9RJNhncM8qSzQmMmdu4yheLf8yTdMGe4zRvWXs
         svSGF9Co7WWJJWsDkBacnJ2LO0Wz+/NlC+IMjvKzyhpbyiohcAqGMjY7p6g2s1FA+OjS
         KiajEEZ0I3ofYgyJUQOsRRRzOhtsDRwyMB0fVNkG80wAwzt/gCqzA11N54EhiD5eHYT2
         HkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759787665; x=1760392465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHzE09hpsw0lAJL0J8v7uFjrU395EJVLjHASm1HYY4s=;
        b=GqMIhGmpmEGCc0y2WEasadtwxOoVHqeX2hH0d3UfQs6h4u70YEaFeIcfXJo2VJ5Zh0
         x2UEmr9DUmAE+ElA62V7cxKEBygk0262ekxMltlPn+FtxRLjfYy9BNdzMORuf0xB18II
         x2HEo/FjyYya7OnD2LfcU3Vtbp8CrN+iXby7t9twRqa3r0/AvGXhhnqMci7ldrdJi+H+
         7Jvs0BqJrqi2G07WsC6JwmwSTgbS2vhJUnugSvuTkAJTu1hnPK+1vuxFP6Lmm7Mz44Ed
         i3OlkAMorNXezEsLdLPzPAK6RYFgeejT0TmrBuwR4XWy1EGKehPsmmZnme0dMEcjm+1d
         cz6A==
X-Gm-Message-State: AOJu0YyRO6H4w34fm5m7t1F4mwdSmNSGADB6Z4LZ4hAhj6we5bwwKCc5
	821exRZbzWaQXG02bbpYIBozylPg2GxGPbV69muoQ38Ta/6b796/grkl
X-Gm-Gg: ASbGncuSzxA4OhEN6y64Xis5HDFzvT80TPMFJE/fTO6Yreob/blO2j8h/HNue7RTf4B
	nwwU9mUWUmJ4BbTjfX+rAYD9p8KMYKfJVjtXLQ90LYRbiKbYGq8N7wNuYnf4A0Q6K0PPZO/6/wd
	ntjzfAuuhcXDe1CJ+1m0pvr35hz5jQUvFvzUIbC4t1YgS9rSVwR9Uy3yeNL0/cSfkHhF19CCdB1
	wn9m9qGUnA5XIIhBJa7y1V2PpI/QwdtkyCDW7qnlM2wFEMTSc9gByQYBe6AbOhxQUD7X3epBGzI
	Veh0OPB984VX4sPfkTnhcxlWD0x+9uNtCTamrUNLtLnAjmsmyUgCF42OhG1fz086bL4g9QQL4cv
	PkG7A2XVg4lnwNL6k5H9AQAkVp7xEkTTgmsH9k6upe8OrczEJfxZP+hwgfIA=
X-Google-Smtp-Source: AGHT+IG2LvrD5cGaVRdPojLb3sWgPRcj64j9A2zviwnX8ynP3ZNTQ1PYKRgkchhEsVFBNjv83jnmsQ==
X-Received: by 2002:a05:620a:3950:b0:817:4e4a:6969 with SMTP id af79cd13be357-87a3b891276mr1586802785a.78.1759787664836;
        Mon, 06 Oct 2025 14:54:24 -0700 (PDT)
Received: from fr.lan ([81.200.23.195])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-87771129478sm1314168585a.1.2025.10.06.14.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 14:54:24 -0700 (PDT)
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	Ivan Mikhaylov <fr0st61te@gmail.com>
Subject: [PATCH 3/3] hwmon: (peci/cputemp) add Intel Emerald Rapids support
Date: Tue,  7 Oct 2025 00:53:21 +0300
Message-ID: <20251006215321.5036-4-fr0st61te@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251006215321.5036-1-fr0st61te@gmail.com>
References: <20251006215321.5036-1-fr0st61te@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to read DTS for reading Intel Emerald Rapids platform.

Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
---
 drivers/hwmon/peci/cputemp.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
index c7112dbf008b..b350c9a76894 100644
--- a/drivers/hwmon/peci/cputemp.c
+++ b/drivers/hwmon/peci/cputemp.c
@@ -364,6 +364,7 @@ static int init_core_mask(struct peci_cputemp *priv)
 	case INTEL_ICELAKE_X:
 	case INTEL_ICELAKE_D:
 	case INTEL_SAPPHIRERAPIDS_X:
+	case INTEL_EMERALDRAPIDS_X:
 		ret = peci_ep_pci_local_read(peci_dev, 0, reg->bus, reg->dev,
 					     reg->func, reg->offset + 4, &data);
 		if (ret)
@@ -539,6 +540,13 @@ static struct resolved_cores_reg resolved_cores_reg_spr = {
 	.offset = 0x80,
 };
 
+static struct resolved_cores_reg resolved_cores_reg_emr = {
+	.bus = 31,
+	.dev = 30,
+	.func = 6,
+	.offset = 0x80,
+};
+
 static const struct cpu_info cpu_hsx = {
 	.reg		= &resolved_cores_reg_hsx,
 	.min_peci_revision = 0x33,
@@ -563,6 +571,12 @@ static const struct cpu_info cpu_spr = {
 	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
 };
 
+static const struct cpu_info cpu_emr = {
+	.reg    = &resolved_cores_reg_emr,
+	.min_peci_revision = 0x40,
+	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
+};
+
 static const struct auxiliary_device_id peci_cputemp_ids[] = {
 	{
 		.name = "peci_cpu.cputemp.hsx",
@@ -592,6 +606,10 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
 		.name = "peci_cpu.cputemp.spr",
 		.driver_data = (kernel_ulong_t)&cpu_spr,
 	},
+	{
+		.name = "peci_cpu.cputemp.emr",
+		.driver_data = (kernel_ulong_t)&cpu_emr,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);
-- 
2.49.0

