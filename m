Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3C52FFDF4
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455533; cv=none; b=kDP89beevdGFr5FRUI2p18rbuTx6s0toosD4FvoV0duuImD4lVY6wV2ZTU1aRgKQH2LuLa/GS52fcSUqqrXHR6WQc9eJuO23cdqIq97/ObQgpBiLzfVvdBPhMxxMOrGRMfC2+Z1Y17FoKVWANM9oQ7nf+CCbmeKibrdk21tu8KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455533; c=relaxed/simple;
	bh=2hvApESaQXTm1ALy3QysZahaZ9l1iKkRn0bkbtH3W0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBwJKT8iz0uTMlY6Sr0iGaGoXYc/8cAPIO2wYc2dAziQMf7LrKtaMpGQlv6RKUytcvDAAL7HdnhvLmBCrNjwESeSN7aSuD0Vf1zpeYQIlMGpdfOs05Log0XC2MPBWxhwxeGqhbO6KUIluOMD3Laso/Su+FvCT6B2SYpyAv/lZv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TT450/MK; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TT450/MK"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-26c209802c0so53785325ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455531; x=1761060331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlVhUHZXUmhmGOhBWjhhUY1ryQdGfuUnSAai6q3UUFo=;
        b=TT450/MKTyXhap5gd2B+Rfyb+9hvoMUG4n8pOdQ2ouR0FOqdLy9mwZpi5p4XQ65XtA
         XFc/WUODZazxOsmAEps2MeZdm2mxcxdUUrgRVelOY9GmplaBh/GSbBs6MGehmyoTAdcH
         g9uyMHpvTewyMrwJnXEHCNCCk/ycpBfQahGVfNTSjKNYoK+ndcX7C46YNLGsS15RkMyC
         9XppSaegOb3n1WmGv06NdPtJpKJYdF5uuU5kGMDXeawGnpRGUTsFJDpSOkx7ob9vjfbn
         i8+QLwy/i8uWUFSrXHo7oUCT2J/j+uIkMeqECLrn5xBfJ2VzzqQXy+mSDZWcE/8t4Two
         D+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455531; x=1761060331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YlVhUHZXUmhmGOhBWjhhUY1ryQdGfuUnSAai6q3UUFo=;
        b=wdZpVoGlcChN2zD/uj3nX5CtOO7WGuHlPPpYz1EW9IWyjUX+TEoVU3rsGk+tj7rwyt
         qcnDisEfaJ+6UMu2ZP0RwKjCMJTllO2bQ76n1DSCyLByM4Iazwb7Oc+7WwzjVvDGFVNV
         WOU4rRkU7fjlybushdM4VCLOA0r6eSY1cReUP/OxnGYzK0GqFInbp6mTL2bT0hYTTspN
         dFEkCowr31Q48e1vo5Btw8752+NqaipodyOWo3z0XfFtNZOgQds58vcBJx1jL+VJnXzx
         spQJEJDqrc6V55VzTHlb2wf2mVmwToZ+sipY6sSJ7gofDDljgOqPk7zXs1umcKva2nz/
         iKAQ==
X-Gm-Message-State: AOJu0Yyb3ijdvEpk+ZTaOtfYGhbX95Pc/b4OBT4PrikLvECrlWBSaQpo
	+dE2RSBpG276aooLIw4qmF9Y17uhWZCajtNrbUwq5O41AF4gaObaYhveygLgMQ==
X-Gm-Gg: ASbGnct/BaeyXCbG/ZW/B574G88j7yWqXCx4pGNlmVCCfqt6mVfwjWpBhPsCEidQcgn
	SJo6qgF86oAXl6s3sh3hEPAWhQDwagykpp3anh02LcCS1gHc8Kn2ULCoeO1A1Xo3VFLbH9etisY
	TefaTz+GZnRiGykPBdp5FqGMRL7wZOCwBc3Hg8vWCile3i+SYBltPUvueq6CHG0K1ZNKyVrsrIM
	Vw75ClF+nVOSfiqzIcucpJ8hAb4fazZrNQbfCVihGrUNJE/XLaQH0A5eNgwQTIswdBa14LcabvH
	iWiT8UOuLQwxgZi9AVabhIMwZ6Xb2WIzQCTra/lVAC+tdLKCjrLR7TK73H/isAMeiAKlsm6RcOC
	qlXlfFbqyvI6NkRUrwI3dl5W7DSL9krPEKRHbx0s6PyDLTJgjBh9V8g==
X-Google-Smtp-Source: AGHT+IFXNe/hI86eMMdTnzd66gi34i0YepKAxLlGb7y9VpnZkgkpcmtYaq55UQvNsTfIEkae9TtJrw==
X-Received: by 2002:a17:902:c94f:b0:271:479d:3ddc with SMTP id d9443c01a7336-290273748efmr364710495ad.15.1760455531251;
        Tue, 14 Oct 2025 08:25:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f070basm168520025ad.77.2025.10.14.08.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 08/20] hwmon: (tmp108) Drop mutex.h include
Date: Tue, 14 Oct 2025 08:25:03 -0700
Message-ID: <20251014152515.785203-9-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014152515.785203-1-linux@roeck-us.net>
References: <20251014152515.785203-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver does not perform any locking, so including mutex.h is not
necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp108.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
index a971ff628435..60a237cbedbc 100644
--- a/drivers/hwmon/tmp108.c
+++ b/drivers/hwmon/tmp108.c
@@ -10,7 +10,6 @@
 #include <linux/hwmon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/i2c.h>
 #include <linux/i3c/device.h>
 #include <linux/init.h>
-- 
2.45.2

