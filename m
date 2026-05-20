Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAF62F8E9E
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 19:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304602; cv=none; b=fbDKa38NVD9ArgLPlE3OfHY+tWswltKfwpiEd2IdGgY4n4ceMvNGxg54zqrsDHB0tD6jZU99ZNMdDqPJs9V4GPBaffQsTrP6HzUotnJF7VjYW9Z2Ez6q8Gu6bMRno9i2Q6b9wIRZ/iC21WpcPnf7wUTYzZYmiD3+Ef0B0j7Fd4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304602; c=relaxed/simple;
	bh=ZvGZl4XeWLXFFeQ4aTEV4yxa0gPtVwWnwBVb7wd3R/U=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=SivhMUdJhJTk4mBl5z2ZnUz+qM0bQk4KIYPPU78quI76kaCb7ftghEDSriJT6OcjRKIMg2vVn70seJpXUxdp0Q+vN2cqovVCIggHAVJ9ZlJ0thX1qAG9w1mmGI+Z3WFlTiEAjmKus32UauuH/Yo2isvMnCdZNWfmpS9y7KE3e4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mozm9lK2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mozm9lK2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso46660285e9.2
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 12:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779304599; x=1779909399; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83m6SZbEBpihEPTjW8tmO4zGxJjuOBgsUIutZ8PnXrc=;
        b=Mozm9lK27Of2QyOF3F86gLX7jgHJ9ZUKH+nTDcnQO4ki09neKEjnThGNUPZoLMleam
         u9C71WJ708YsxR457MmaaflfXIwfXW09oU6ZfKPUrnTAodWfVqQ9T1yOss9xf2HV7AjP
         U8treQ1g2d7/3UuPUzv3LFK7xxjEEcsZAJ+ZB5ivoHgJ6HnRda2glN7OjERry8+CqJcV
         TYRJmT0sioYdJkrj9+9fQ+w88nb8HBf/UuFMVnkIUkQKYa0LBSNf2QsnuKVONygXYGqp
         8XH/8nwoTaaEUbTsg8JG9vT7U9q/waHnmA1F+ZYsTQ+iRgWc87EDMg+xlA1/PThrPJI9
         cHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779304599; x=1779909399;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83m6SZbEBpihEPTjW8tmO4zGxJjuOBgsUIutZ8PnXrc=;
        b=hrokKOA5s2momHzHln9dGxbIW34piBarIVEwuiToGgRFz8wIDjjDIhBCSWsBG9XdCE
         u/DSRS/kVRGgm7yvF/pMIPisrbz/O1UnruyS9o1TYqweDhU4IoHcPLcUZ/hgxKYnH3Jx
         2Sas1Tt+QhwwXUi3rFnLZ1lAc0a+HThvFdyleevpB07TOWQRPL6i/Oh5QaY38dY+Tih6
         ZuXWQDVlfRAwiz3bruntIHPiH+aOvVSA/vgt+Xtnjca1L2blhRunKP4Eg3b90znR7XSo
         6qU/mZynJD0LXftipq2rMB8+cmPd3O21fs3CxsvJCCwz+ZCoudEghIFxsnrbQUViz6It
         UmhQ==
X-Gm-Message-State: AOJu0Yy4m/VrWCGZdS5kQ+bvPMr7jeHFj5tzpuYZgekDDp8KBwqockAf
	73boU2aDlgLYtpERgzfugGI6n0Cf8GEPKMSD67+47K8xe/STOJXcKV+0
X-Gm-Gg: Acq92OELJhPOlM9mw6sIRbnpOmOWI+gX92XEBhtcztqXqFBZxfrNKGdado6MAVZbRXM
	uN7XCtlbh+fY9nIRcBEvLmt1UnVPISPncK+4ucPf1/9JumWcSXEXjaZ9AQONPB4qpBZ/COQ16S2
	40+86n6AUUsbNP+rhsHs2XWcync3qawKX6sfuMRBIIJSIjhq/cTO7EcbeDGxclrj3iQ8NIqt5M2
	cf2V4stNHYrnJ0BzsOP6PR/dcI4gr883613qCU5pY44OnDUIFUWoYYf05WyM89WNfxl70Ksx/Xx
	GCipyakRa2YLJ3GdI4CMSq+lOC1dYjE48KfGL5Ym9z4EREz798IaVOELr52nVu42lDqo73376gR
	5wYVBFlhNWImGRUOz6ui+lmjYhrLHrcgXzc7X/p0Bk49H/RMDkXHdj9fWMpX4I+OjYH2uZllcSf
	AJcbR3zVV7GoSIBxgLDk2EEvdb3o7G/fu+KTsz8GhdbhrnSAcbyoztm+CBUORb
X-Received: by 2002:a05:600c:1f8f:b0:490:2153:2c3d with SMTP id 5b1f17b1804b1-49021532e9cmr108317935e9.20.1779304598955;
        Wed, 20 May 2026 12:16:38 -0700 (PDT)
Received: from [192.168.0.2] (p5de56645.dip0.t-ipconnect.de. [93.229.102.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033dab0besm10206805e9.15.2026.05.20.12.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 12:16:38 -0700 (PDT)
Message-ID: <4eee938d-e4ca-427d-a161-aa9ef737af3c@gmail.com>
Date: Wed, 20 May 2026 21:16:37 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Reiner_Pr=C3=B6ls?= <reiner.proels@gmail.com>
Subject: [PATCH] hwmon: nct6683 Add support for ASRock Z890 Pro-A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

 From ac010d19f5ba1e44a0ddb83cc570f18ca3348015 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Reiner=20Pr=C3=B6ls?= <Reiner.Pröls@gmail.com>
Date: Wed, 20 May 2026 20:59:57 +0200
Subject: [PATCH] Add support for ASRock Z890 Pro-A mainboard
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Reiner Pröls <Reiner.Pröls@gmail.com>
---
  drivers/hwmon/nct6683.c | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 0581770380cc..1b9092f48c7d 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -177,12 +177,13 @@ superio_exit(int ioreg)
  #define NCT6683_CUSTOMER_ID_MSI3    0x207
  #define NCT6683_CUSTOMER_ID_MSI4    0x20d
  #define NCT6683_CUSTOMER_ID_AMD        0x162b
-#define NCT6683_CUSTOMER_ID_ASROCK        0xe2c
+#define NCT6683_CUSTOMER_ID_ASROCK    0xe2c
  #define NCT6683_CUSTOMER_ID_ASROCK2    0xe1b
  #define NCT6683_CUSTOMER_ID_ASROCK3    0x1631
  #define NCT6683_CUSTOMER_ID_ASROCK4    0x163e
  #define NCT6683_CUSTOMER_ID_ASROCK5    0x1621
  #define NCT6683_CUSTOMER_ID_ASROCK6    0x1633
+#define NCT6683_CUSTOMER_ID_ASROCK7    0x163d // Z890 Pro-A

  #define NCT6683_REG_BUILD_YEAR        0x604
  #define NCT6683_REG_BUILD_MONTH        0x605
@@ -1248,6 +1249,8 @@ static int nct6683_probe(struct platform_device *pdev)
          break;
      case NCT6683_CUSTOMER_ID_ASROCK6:
          break;
+    case NCT6683_CUSTOMER_ID_ASROCK7:
+        break;
      default:
          if (!force)
              return -ENODEV;
-- 
2.43.0


