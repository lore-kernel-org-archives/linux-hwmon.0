Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BD73570BA
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Dec 2025 15:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159337; cv=none; b=OCnHZ0Sq53fIx1jsWJ8+1y+oZvLGFw/4bG7LKA47rUPPgwp0o+df3EtZuiUSAhAXcDEA3fbafDcjvz3r9SLsiog5CVF5DiP/lKHJr7lHF8R5czjy0WZnal03a/Tqy+CEnjABssBK/ZwFvBudTlrEjLCWN1Civmt+odUFBJ/o1eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159337; c=relaxed/simple;
	bh=uHiA5FhcPLryQ8ugAxpypmlpj7SFCrfJ3SjCiilkFFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SqU1mtka/59kRi8GIVvevMP8eTUfEgb5jy2DSSwWnVvpQ2HrNdK3NoB/gC+tnRCl1l2twSu7sA1hb/VAf9lSJXWjbjXE0jtbLLhOySwuxG5oJijGQHby+vYYTRQ5LWGH0KYapWXKN5Ms+zoUrJ4gLPffHXkDGZ797ZlZOKuzkRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QS9QfCDv; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QS9QfCDv"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37d13ddaa6aso14061531fa.1
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Dec 2025 07:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766159334; x=1766764134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58qzkSPXKwLAUoCHlaJiWgl2e0ZZWj9EjRv5jxRxgI0=;
        b=QS9QfCDvr2nD21KHnV6IeUvgZvP0iPiOesUoA4PdteTIzoNe8td5xq3NdVopg634iQ
         rcHimwpN5it3bqhHI2Nr5l/MYYn0xaKcIRnFdzPuzAC8XQ8wQ9MqRtkTizt5SX5xkX2U
         DGuqJRbvCOehgHxE6uZV/QNT7uz8OepnqN2meMpppaimMlWtRedysSlnJjpK/UjCoU0j
         J4+orAOuV+u6x7G0ZCKfVQi9baKLNQelEmBae0G8yhujUPBu6F2spXb5p8MnPP9+AdxX
         Tv0Uqw3/FUbV6BKXKbn5QMrtDP2yDC40OdcEnqKsPqzL66I7cpUjLGzUe4zp7jYKfTWY
         nCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766159334; x=1766764134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=58qzkSPXKwLAUoCHlaJiWgl2e0ZZWj9EjRv5jxRxgI0=;
        b=CYdsGC5hIsqrUBvlWnPeSQLcFDq+OJYzJhgxsSRXc3VsddEr+VG+JT7eZbRAXhDiDr
         KfZE5yalMmXYO6kmTzguVLoQC1BDrihK8ko3rQl+oPm4SmfcTl9dTj347+7eW0yZDeVJ
         ZJOFxPpKQ5/BAzBtBJBte/zSzL/leyovxt3mqsjhN7XPVz2D2g73Mz2/UVaRDTs0x389
         j/lr3vP0vD85zE2sfpEbTrt/zgG+37ffci2EoLn/004kPQq67xAZrXQBC67OVad3MCVP
         Vu4+VnRW0F//qLqandPn9g3ZkXJwl5/y00ujqJJbbh32/BQX6brbpzfaDZRefd+L//GH
         HOig==
X-Gm-Message-State: AOJu0YxpcurbJMH0q4YGTPcGyt8Q5QVYbwtudiy3eF7VlRXRJ5ZN66jP
	lSOrD2JVajz7cIDfkos0bBWSwOhD9nMO3av6DH5V1rtwM/9vODXqHXKE3WJowQ==
X-Gm-Gg: AY/fxX6yR3pCDPMjOh1zMDja/tEkIsOkSbMZhHl6wlpQHxxKylsWdPmmlo2PXwZ7hzU
	dZXspTeQtTKYjmY+XEHvC6yCffqAVhg8apa0e12G5dcNKWOhallBYQwQV7k6oMA+cvy02LpzCFm
	nKEp3mPCE20ZdXtFlceCI+XjwZjBhEL0FBM20rRm10aYntx+t8wYdw2FZRbaukxlTUQkyr1vXN2
	Uh9zvIDYz1hcxh3ZKgnVamV2ICMnisvNO69+7CIudJO20PJwTNNJenOhq7SVWvgE7vRCOiN41hh
	iuqGw2vrP1pnCcXIWJsOBeZqB9FJtTzQDSz2yEg6vXoxFXk85CBUBd0FAj+Wzv9N1+DfP/0EVXa
	KzPDEp++9CoVDTf+q+N8TYtjaTFySoNid25CsPajNWEejkcMkQlUXCMqshj64qBr9+xagg25p5Q
	ijJ8PoxR2pzRBwyqE5MzFXA2FtPSh3KNr+rmMZdzn42IzFULbtfgOhA/t7l/hjYN7XN/AFDyZbv
	ubvSFHPxOUhFnhe
X-Google-Smtp-Source: AGHT+IF95+Ws35JnyyvzCS5quO6tFnqnGPIRzFJiFpWaWJpei0LOPhjD+jVCG3zPqKkV3g7C4E9p3A==
X-Received: by 2002:a05:651c:f01:b0:37a:9558:5bda with SMTP id 38308e7fff4ca-38121596988mr8904691fa.14.1766159334062;
        Fri, 19 Dec 2025 07:48:54 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (84-253-208-48.bb.dnainternet.fi. [84.253.208.48])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381224de76csm6356391fa.10.2025.12.19.07.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 07:48:53 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Fri, 19 Dec 2025 17:48:15 +0200
Subject: [PATCH 2/2] hwmon: Use sysfs_emit in show function callsbacks
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-hwmon-fixes-v1-2-21b29097ea3b@gmail.com>
References: <20251219-hwmon-fixes-v1-0-21b29097ea3b@gmail.com>
In-Reply-To: <20251219-hwmon-fixes-v1-0-21b29097ea3b@gmail.com>
To: Kari Argillander <kari.argillander@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766159330; l=1530;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=uHiA5FhcPLryQ8ugAxpypmlpj7SFCrfJ3SjCiilkFFg=;
 b=A+nWb7oXCmtaGF0cVl0FtZi2O6GY5Lz17fZwLZyFJ7Y/kYUFz5hIBTb9dut+4bQyNmnX4FODf
 d4lQWwuYtH3Cp5RgcjoSk9pVhtE/waVT2lkXr16R5iWL2zxHJ7jRi7d
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

Use sysfs_emit() over sprintf() to prevent potential overflows. In
hwmon_attr_show() that is totally impossible but looking other places
many still use sysfs_emit().

Also according Documentation/filesystems/sysfs.rst code should use
sysfs_emit().

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 drivers/hwmon/hwmon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 7a784d685d77..714caa6a36a3 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -73,7 +73,7 @@ struct hwmon_thermal_data {
 static ssize_t
 name_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%s\n", to_hwmon_device(dev)->name);
+	return sysfs_emit(buf, "%s\n", to_hwmon_device(dev)->name);
 }
 static DEVICE_ATTR_RO(name);
 
@@ -446,7 +446,7 @@ static ssize_t hwmon_attr_show(struct device *dev,
 	trace_hwmon_attr_show(hattr->index + hwmon_attr_base(hattr->type),
 			      hattr->name, val64);
 
-	return sprintf(buf, "%lld\n", val64);
+	return sysfs_emit(buf, "%lld\n", val64);
 }
 
 static ssize_t hwmon_attr_show_string(struct device *dev,
@@ -469,7 +469,7 @@ static ssize_t hwmon_attr_show_string(struct device *dev,
 	trace_hwmon_attr_show_string(hattr->index + hwmon_attr_base(type),
 				     hattr->name, s);
 
-	return sprintf(buf, "%s\n", s);
+	return sysfs_emit(buf, "%s\n", s);
 }
 
 static ssize_t hwmon_attr_store(struct device *dev,

-- 
2.43.0

