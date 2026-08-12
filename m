Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9986A4266B2
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 10:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530948; cv=none; b=ZdZh6ERPFWuy84VC6N6unwHat7vPuaxBI+TvdyDsB73qDpD0WUK4ijZJoB72DuUZeu461JQeSiJJ3T5U3vr7KJUI8gOc9knEBXpP71awtSvll6gqpdVpVRvsagbGJleAdf2RNL3WsLnzmUSWKdhvs3pGkPLqEy6tTq8f3HfIyFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530948; c=relaxed/simple;
	bh=A8DIEFpFNqDFRL8+i8ZGzIw9hnWN2FGFZ1t9OB5cd70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=snQebZ3lvCcTyB2+sjGGMpp1emkSeyFGKW25liJAxRlXhZwG10UP+fjU+hGUWXYSWZYKZDcigd8CTgBc0CMNnX78kv/TF0Fy2PuLT+lWwYZbu11KdkrkGSh3TyMOqPALn0RvmV1b+avWzmLCRdBVHkrYP+k1uAGAE7Pi8+gKv7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=ExoVSDRn; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="ExoVSDRn"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ef1dc934d1so7118546d6.0
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 03:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786530945; x=1787135745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+fo2o3VZGAKByil8hU2O5hxAnTzJGxdmK3zHYdry2g=;
        b=ExoVSDRn0Hu5kuBxwaerOJaBWr5bVwytYQn0idi3L/RBNwixGZsDevTqKzBPz7Ako/
         P8d8Ww1nrAFWnnME3BlJK/AD0o2ZEDfAwbx8TUdBlFTEHF01ChMcH3xpbmBKjQ0tWBnP
         YJdF8MD7qUpAC8sY3ARlRca019ywDbeC/NyeS/PYGN9/4t0G9+kw0kABJEplF4Gmidu3
         Mw8F4S+2/2dLWKBU9w7hT3/2QcmYNtynXjDSNu3avJ7bO8PKLVGDztv1MRE7bXwbFlO2
         I0/rSFzw7DMHHvY0wPKuq3aPJWTmFs6/ALDhAEo1sJWaaKVkq0NqK47yZ82YcZRgl7x0
         iEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530945; x=1787135745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+fo2o3VZGAKByil8hU2O5hxAnTzJGxdmK3zHYdry2g=;
        b=kcNguaY/N1HGn+P/KHoNmsIZ1cPe935JwKz27ycc9fxW49gCqRHEG+47TJRjtANDNY
         fW4IuErMAosU6cP/NPvgZ+CwMni002q/syVhhnvQew3OXKH8rCiCyn9v4BiYGRZLspSo
         jeb4HjI1jEyvPOs+qpaumZlSAVmnN2dgOp1xlur7XzI+Dc5u1KggZW0TxJnO6W2yZtlg
         GQhV0qmLNyjuWirc0LJnyb/9oekjR471xfZ8f5pFAnchwfpHrhBuz7a4MxT04SDNrzrZ
         bOsk/s4e4Kt5m40mux+G9Hxq0oPY+0geVzj8yGfLhggCJVuoVZiHaCOhSTJ0nNaNFaMI
         XIsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrk0ogGXLZHgWjUGJY1P2GqNGm5TfCci2yk2Rzhyud2/WzSpuucYyjrRma5mF3klucDiHRWiJtZsulozQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YweVrGfnesjFvElWHtsWNJNZHHs0Wb0rdzc1tabSVYCJYr0KAJB
	k96erKa+15sUfbUY0YqLTxqTZUsMmKsypxvIFWULgD2bHwlupPN7gHqADeezlR5rOuk=
X-Gm-Gg: AR+sD12gCES0Mwdr6nTngZxVlvqSyowpCuc78EbQ/a4+xRMY+J3mxpC1b0lJVwDe/D/
	0KKmzikNVTcFaxhLs6W5nIL8zdI+I1TOX6gpl+yQswh9IzPkAW2UlB9BnXJCBC2jo6Nvn6nva1a
	tR6kqArsqXhycJz4EB+vP6ItgwjO0qs5prgzSKX+0rKlP1ec9PglnrR5ey8IcTDZP+ZNH3X31Wd
	wI2tI3hij345FI77EZfjdp6SC5j240d65cTTgQdZWOViLow+ICdPkKmOl0KyZGPmAbAZkA25ZbI
	B/LtD1U3eSA8Wkprw4Kb7Hcj2AqEKyiMZwCQvhDOEeSqLa3P5tky+RNTUOQ522+zS1fU3NJbDqs
	9LYmVQT5ubvYMbUhOSEhdcrnaMFxaqdM64wkm5eZaRiGMN74O9d7FslCEi3q54Ro8I74NlizPBA
	U3SnLE5pMs6smp41rKzdaVNGFB9QJGO91yqCE419zymtsCSsRk8+IY0cFtLhxStX1uGO11lmZ3Z
	a+nCBEWSIcrOQ6m3gJvK/J8cN409w2jVTYlWuBmc0vj
X-Received: by 2002:a05:6214:2b82:b0:8f1:617b:2692 with SMTP id 6a1803df08f44-90a707b3c4amr27757526d6.10.1786530945437;
        Wed, 12 Aug 2026 03:35:45 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a6c29e942sm18718386d6.12.2026.08.12.03.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:35:44 -0700 (PDT)
From: Arie Miller <renari@arimil.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arie Miller <renari@arimil.com>
Subject: [PATCH v3 3/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III White Edition
Date: Wed, 12 Aug 2026 06:35:32 -0400
Message-ID: <20260812103532.395049-4-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812103532.395049-1-renari@arimil.com>
References: <20260812103532.395049-1-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Will Smith <github@notthatwillsmith.com>

The ROG Ryujin III White Edition uses the same report layout as the
other supported Ryujin III variants. Add its USB device ID and list it
in the driver documentation.

The device was tested with the driver on the author's hardware.

Link: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/pull/10
Signed-off-by: Will Smith <github@notthatwillsmith.com>
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Arie Miller <renari@arimil.com>
---
 Documentation/hwmon/asus_rog_ryujin.rst | 1 +
 drivers/hwmon/asus_rog_ryujin.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/hwmon/asus_rog_ryujin.rst b/Documentation/hwmon/asus_rog_ryujin.rst
index cfdfe3712f19..b0d7ce8dd921 100644
--- a/Documentation/hwmon/asus_rog_ryujin.rst
+++ b/Documentation/hwmon/asus_rog_ryujin.rst
@@ -8,6 +8,7 @@ Supported devices:
 * ASUS ROG RYUJIN II 360
 * ASUS ROG RYUJIN III EXTREME
 * ASUS ROG RYUJIN III EVA EDITION
+* ASUS ROG RYUJIN III WHITE EDITION
 
 Author: Aleksa Savic
 
diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index 79e5b6d6dae0..702edb831394 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -19,6 +19,7 @@
 #define USB_PRODUCT_ID_RYUJIN_AIO	0x1988	/* ASUS ROG RYUJIN II 360 */
 #define USB_PRODUCT_ID_RYUJIN_III_EXTREME	0x1bcb
 #define USB_PRODUCT_ID_RYUJIN_III_EVA		0x1ade
+#define USB_PRODUCT_ID_RYUJIN_III_WHITE		0x1ada
 
 struct rog_ryujin_device_info {
 	u8 temp_offset;
@@ -590,6 +591,8 @@ static const struct hid_device_id rog_ryujin_table[] = {
 	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_EVA),
 	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_WHITE),
+	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
 	{ }
 };
 
-- 
2.55.0

