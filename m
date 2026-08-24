Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ECC385D75
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 18:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787596752; cv=none; b=RGsBnwWQSa0RXsqKRKqGw2utbEKBZfMCdBdLiR9+IXvDVFqG8ZXoV8PWf8WK8Wq/HAZpgneNgKEX1CKm+H8r6R2tN8zi8DkYM76PVPrsUCeQJi8JbNayXSLJYt/t3Kdeytot/T7rLEwPM/ZpQK2tOHIm2LKemrtVasyDHIpJ4SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787596752; c=relaxed/simple;
	bh=3zTrUNP97wjygcEyxUmUMs4ernWyBlapMobTCcEOsLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JqjcyRmDlrNt8689/StCQ7xBiRzJbloW2sKZikE0ppVDGC+SPVXN20wUDFxaB5u1vWi4Ookucm9GPWFrwHD7Zr9Key0kC7jHQqtIQTKO2xoFR/OuLtbSirjfpZhvKnkD0Af40P4gI1nOePbMepWv4ZTkqLmMD62qp6uPuRXJ1/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBn/OwzN; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBn/OwzN"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so387667a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 11:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787596750; x=1788201550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNGuRramHsyQedVrqROIzZg6iP7sI/lSPknDcuWVUUc=;
        b=kBn/OwzNF6zi/8HqX9mV/gBhhauV13H/WoF2Iuv+BkB4dlX1/koXfELDN4jLW0kh1j
         u4PKFDVwRRwr0CaJnEjiSj8SNBi/X+zypXZv0VeVu3we2gEp30TiPd8cXCL2lPuDG7VV
         ZdWuxPa3D4c1/gzjpb2eK2Mk+2fo7cbJI06Ewk3jCeO3lDyv8Vaw1zl+MYEDLviHVj15
         Hd8ozAll0M/YiDvuj6Sjue6PztWkumvy2uLB/GDEAm5KWKDnlxrmcwd5enpbxJRxEpyq
         3IJoF19XQsLA5ksPAF7de1GyEx8lwTITQVMu4ISUOacWXF1SxMPjfqWho8Suwtck7M5c
         QGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787596750; x=1788201550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yNGuRramHsyQedVrqROIzZg6iP7sI/lSPknDcuWVUUc=;
        b=hebQOtfTPlX/hKHshUGKZ9fJTi+huWEiHPK+OpKHkpxPqtCu6RwBMa03mbybfSnI3b
         egNPdcWcBIHVRturNexasdwUFgLwpIfaM5icx3OZJXWI5xcyX0y2Aafx872ALxK5NqR0
         HiZTG1mfoTjEo9n/NS/yMlJ7hwVavUiJitC6sbXBtqZ67cFpT/8Dr9uVK8hUi3uzl3KI
         NkEoXFGTo4HsxiAGBRsPiwkiMzC56f1Fv3m24gt96oNl/1uxfrXM5ibLDqkrckpoa0Jz
         92PewK+w8qazYFGBaNcLxO6MRKCWeyzxww34w/nFznLWoUlQXlITExV+Ow2oB3YNFSju
         vtWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+7HYUAwDSlP1BfQaLzP0kj2LebkC8QDyrChNlabK2KugWyRfPutC8hOHCe4ULJYCm+M5L0uvSdxSL2w==@vger.kernel.org
X-Gm-Message-State: AFuF++l8w3pGJEeRPiN8Eo/o87fF2wX+GKtcXG8+JwECpIuqhLxZYcvo
	DPFNhwhCuObd86RIYLAWDTibEcWIactWQQQfh+DcjpZhGTmU6YrHxmdP
X-Gm-Gg: AR+sD11hnt21dbzi03Mx80rJx5KkaaHIE8irR+T8EKPcjNnQ1cBRcHwfFRoMMpPxf9x
	IrEgTVNfD5qFX4xpDsCrZY+I1uPE1Uydilk0Kr9zlLtChOvnTDp8XecINud1k106cfI4n01S48t
	dnlZ/CWAqWNSPn6CJa+XB9v9Zxnbb7Kj9HTh01pUbZUG9gpsQXPXw5+35p2rWUXn0iETx2CQ4iy
	8x/KGq4WjjXkBQD8NicMxbmID34K/Lwh3ZrJ+y4xBNRvDuz50nImivaK9mBGdaYTWGnDwwDyJwU
	fNqvD3yNDi5E6Fq+DaPzljNouyViybG0nWTtlRXrW0MbULkhIZpuub3KHONrarXhPTw5ikdqW5o
	QcAlwOqiyLjkmRRnTrDnl4WI1H1pmACWI2ZQFPauPvXum0cBZgexPY4XA3WqStSWQjAGe2t2sqQ
	cZNucHqIUxEWDnWp/TV93sm/scJ+NWouPJq+oq8a4KbRIqaAE5j0ZVvfQk+Co1433t7HSTqGof8
	7qj8PPTpyRu20dSezK34+J0TY+dGmMG47T/cLx8BTrUhw==
X-Received: by 2002:a17:906:794f:b0:c1c:4c72:e6df with SMTP id a640c23a62f3a-c24e2860886mr95058966b.0.1787596749638;
        Mon, 24 Aug 2026 11:39:09 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([2a02:2f08:440b:2900:8e59:1937:8c58:aeb6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249673d43bsm1307499266b.47.2026.08.24.11.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:39:09 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (lm90) Reject channel 2 on chips with only one remote sensor
Date: Mon, 24 Aug 2026 21:39:00 +0300
Message-ID: <20260824183900.8983-3-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824183900.8983-1-flaviu.nistor@gmail.com>
References: <20260824183900.8983-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Validate firmware channel definitions against chip capabilities and return
-EINVAL when channel 2 is configured on devices with 1 remote channel.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 drivers/hwmon/lm90.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 1c603272538a..3faeb2c6ab01 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -2712,6 +2712,11 @@ static int lm90_probe_channel(struct i2c_client *client,
 		return -EINVAL;
 	}
 
+	if (id == 2 && !(data->flags & LM90_HAVE_TEMP3)) {
+		dev_err(dev, "channel %d is not supported for this chip in %pfw\n", id, child);
+		return -EINVAL;
+	}
+
 	err = fwnode_property_read_string(child, "label", &data->channel_label[id]);
 	if (err == -ENODATA || err == -EILSEQ) {
 		dev_err(dev, "invalid label property in %pfw\n", child);
-- 
2.34.1

