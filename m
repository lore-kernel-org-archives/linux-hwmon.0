Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CA238F928
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 14:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682325; cv=none; b=Q+hJihUcuDahkfbEyj/QY/8XOVDwJpbE1rH2o6v5KkOUiYndA6cg3i5BAkZSPNEK5CAePBY6Ae/c/d01XAbgp2CalTQjO/jPA4zXfRgNELs7DFBG2OrbGbcytP8g9dJT6IvJwyFNbWJe0mcf5zSQSgUAzkUfOD6YDcufJ+xh5ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682325; c=relaxed/simple;
	bh=2J6Z1aWXa94L0ypaDUb/nGQT6aqSYlQMERR5enB9Gfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FlmD3sYvTUCPlCpHNuiU01zKJkeWPXLTsPotS6atbStecTfAsn6s+gVDtKhvFuzLGlZ3CdAVT/hYDy5/Ed4aE2gBU5xiM0kNBF7X18dA69OufvvFQLDUGV0HIuioycoyTABZFGv47ilIFuaTPwiviQ7DP7J60EzutJXcD5OXZgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWpgXC9i; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWpgXC9i"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-130c9dcbd25so6285559c88.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 07:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778682322; x=1779287122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pt12hQ/vcTj5sdQffSNzTYqGnNKO0mgUTFUTx9KUeOM=;
        b=jWpgXC9iULcNqYYo6dOqGNN9/hBMCJHGAsbWemN46q3F3w8K+Gt+KxEaK0x7jGun2F
         DovGVPOHT6s+nLEY1M9Vs43RAf6b3oiR+CNYlhDKhKXDJjYUbz55hX2+ZqZmAZXadMrX
         FEatIWkbZP28JzBqYhJiYkNfuk8xJ7/Lz0bQBgh/RaK1BJTLTKTdzZjnvlpw7MtJg5JN
         BTO6YGX6z7xqfX/IB0QUT/Yab+W8qz97uI33CdXt8x4opTnwth3GqSpdCdwSQjBLSz7w
         WFmwB3cA21o+gFVK/jQlYmlWzl2ydPLbfirLSYEJ63qCy7pWr8yxnRa5A5vzaUZAS1R/
         sJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682322; x=1779287122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pt12hQ/vcTj5sdQffSNzTYqGnNKO0mgUTFUTx9KUeOM=;
        b=Kg3p6NldF13373WkguR2mhZrpe6rvrPLynOD8AkFvIyNrdpknZH2wCv6R/JMMW3pgv
         Xn9WHd9+VNlc3CD4OXPEWPh0Hleo3RcmGDNmagtuT6W2ibbgYTx1tmk8Bl8QmGNPPEne
         WCdxjhFzT2M8XYTV0R9UK/K9zhvNJueyicQKXcfgJ31CGPUD28m7YFxw5g0VE3faRf25
         DbbRE/8/g8mbhCVb7v7KpXRZ8VVOBqBL13ffEZqsOEmDoUXb69WEYNJr/X6mH69FysNr
         /BQMPfdrSZoXq5FEx/vNWkqKjMNhA5CpHKUskg7GNun14SwRSM/2xADTqEt30oF+BTZC
         X4yA==
X-Gm-Message-State: AOJu0YzL6kA+VIfPBOEzztIRUTTrBuDaZVNiwqiRtvP4Y4fEbI8OecF8
	P0SBFYOtH12Vgq98cvvFo8Uz80drgY6r7/T1xRJlTK0qdjurBL4cwRQioGQq1A==
X-Gm-Gg: Acq92OE5Hi7+EMZ9A8/9c8BDjOnv06p+tvky0G5C+o+zpKUViTV5WJ6/qVzB2XgKCcL
	pw3YZeZBgIq2XNv0LGHSZaPHsmhybudxV+R52ReCBNGA2T5R6iOc4M/lWhTg2GfqOPH+Nzd5EMp
	UlCnwvdex5lxXSLY8ZaHWpU8sL0+Dyju02ac1IH1Nl3KhGrHbc6nQi9Brpfdool4zD2cFBvXPsy
	Vqiz0YomIO1x0tgCiBXfF5Mj5/0Dx8MfafCpgz/oLy6WQP1Ka68QTk4pyWJZdu+mp3EEWCGxBKM
	wm3TlqfIkn+8Pce6XgBUMvFG5sGN1Oh52umpX9X0jpZn4u3g7iO6eucp4IQ0IEZMOFQACYfIT9X
	g/P08LoY6fJVq8iOMwsONH2Pu+AC+5tzU2jeymP8uzw4idQgzrUdG9C/FcgdyDLvsn+RxVBedgg
	4h1QswEtP+1uMoM/YRkAbm/6kwZ3i/i1ytgO0N
X-Received: by 2002:a05:7022:660d:b0:12c:91ef:6e63 with SMTP id a92af1059eb24-1333af97fd9mr5221739c88.7.1778682321952;
        Wed, 13 May 2026 07:25:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210d40sm28594610c88.4.2026.05.13.07.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:25:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/4] hwmon: Support guard() and scoped_guard for subsystem locks
Date: Wed, 13 May 2026 07:25:11 -0700
Message-ID: <20260513142514.419345-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260513142514.419345-1-linux@roeck-us.net>
References: <20260513142514.419345-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for guard() and scoped_guard() for the hwmon subsystem lock
to simplify its use.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/hwmon-kernel-api.rst | 7 ++++---
 include/linux/hwmon.h                    | 2 ++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwmon/hwmon-kernel-api.rst
index 1d7f1397a827..9fcde32a140d 100644
--- a/Documentation/hwmon/hwmon-kernel-api.rst
+++ b/Documentation/hwmon/hwmon-kernel-api.rst
@@ -85,9 +85,10 @@ removal.
 When using ``[devm_]hwmon_device_register_with_info()`` to register the
 hardware monitoring device, accesses using the associated access functions
 are serialised by the hardware monitoring core. If a driver needs locking
-for other functions such as interrupt handlers or for attributes which are
-fully implemented in the driver, hwmon_lock() and hwmon_unlock() can be used
-to ensure that calls to those functions are serialized.
+for other functions such as interrupt handlers, attributes which are fully
+implemented in the driver, or debugfs functions, hwmon_lock() and hwmon_unlock()
+can be used to ensure that calls to those functions are serialized. Those
+functions also support guard() and scoped_guard() variants.
 
 Using devm_hwmon_device_register_with_info()
 --------------------------------------------
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 301a83afbd66..04959e044fd0 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -495,6 +495,8 @@ char *devm_hwmon_sanitize_name(struct device *dev, const char *name);
 void hwmon_lock(struct device *dev);
 void hwmon_unlock(struct device *dev);
 
+DEFINE_GUARD(hwmon_lock, struct device *, hwmon_lock(_T), hwmon_unlock(_T))
+
 /**
  * hwmon_is_bad_char - Is the char invalid in a hwmon name
  * @ch: the char to be considered
-- 
2.45.2

