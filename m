Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0583016E5
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Mar 2026 11:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772884367; cv=none; b=qnCsf5r511S1dW1iRSE+vv85edQobZ32fFyU/3/qupFZBmyEz5kQV17d6043tca+3Zn+yDU11DaE4tIC4UYIxH7vVIJnUVaGZ9XMv32KuA2GJVCtY9+B3GumfWLyFWx7SHILho5DUpzdepT3MGyj/HE+Xkoj5JXfD+nJQcRYTdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772884367; c=relaxed/simple;
	bh=x14hvFkGwF04Zj4c1Booyr8tA2c9CZMGV8bNdLcE47M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hSyVmJGEUZy0HfZvfqdXfIQit40a8Tgie+QDkZXNEtQeOKy4XhvhhNFefY/sq4qZG3DuSw51iOSfmrjorrGYcwpf1TT7dL+kD/LrLsD/GgCK+6mHs3xehXca1ham3ltUIwfZYt+m3KPPVFvt67g6KFy/e+TPg47KaQJqfYYvwdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RddsZBUQ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RddsZBUQ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ae527552acso23637295ad.0
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Mar 2026 03:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772884366; x=1773489166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dZDKh4IaVMdclzCWCv4XLUPdebdU7YmkNEuX3WsVI6M=;
        b=RddsZBUQEchcYXGAEM4WvCEidp/AHz52fq6kSzS242LxJQUJ1GMyt1tfBTO6hzcp0e
         W20dnzGLLnFX4oW6ZLLX9dmSFL9J/NA6PPE4NJeSllAdBLazCzWQYNAK5MA7YXytMGCd
         4O98t/ZDrJjLWd4VRp8UKRa5qBBFpVlOj+CxIyez1Ddh9WuHfLScRE9/gvQsy6fcN6oU
         g9KkMjaN+nykzn6y1AcRGFJq+8s3GzmxyKwhZtOvHkih+LNH90/7U1kj/FTeySEcyW/V
         9Rx/u9PVgv40jaZz7IQN7rjdKTYPRA/najf4HqG8H9XzFjZkax5jt+xbsvTO64VEI5NY
         HrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772884366; x=1773489166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZDKh4IaVMdclzCWCv4XLUPdebdU7YmkNEuX3WsVI6M=;
        b=GK9wLSzPdHhAUTqzkrzVOy4hOIuyjxdOlOH27BRtksZtMtyRXk/XGsR1csZr9opLSv
         HVx9Cvtyo+RF/lEqAyOvMSY4TCQRaN++Y6bQC5OA7XoSbf/DD03FnftGThwiWD2jPpzR
         sH6P1wxt2dB+mZ2T5AJiTDpyL0NUofk4ru02i9Q5wigkn7qcyIsKHRRrnesplyl/cuu8
         YYE6FlsmEJt8rO1cJlFfd8xL3svEr58puV0+aXWlE9fJwHccuwnQS20JG3T8aN7hEhU5
         yATtvtgG62gbUt2c9/fa9vN/gKQhjuj411RVZp2Pee6R38ZCFHqdalyu8qMw5TKBxchI
         dnuA==
X-Gm-Message-State: AOJu0Yy1ML0O8dei6S2Kax7LzY7nzInfhY8Oz46JKfad+6WZiY0Ubec6
	RWt0GvZ/wpE1tvZJ5eDMrWpaalBLXb6FKgwWGljrJ24OCW0thWF4qNsAXNo33Q==
X-Gm-Gg: ATEYQzw13jvgaBvDiCSa8XhL+j/IV2XBe1JW/fpqUzImuPpTHDTo+8whQCHchBAbnQ1
	Isfik0dFgW6XkubfpZQRKK1IFUoCYkysF15hwQJoD057EbeYSJ1GN0dbWrMuiy7izDYGxxgiwKG
	JfUQIdvIy5JgW+HhneDqxmMnPj9v7G8h6OlnX1VfSDY04TxVGf8IsZ/ghLvWJwKVgn9fDAUN0jP
	HgQW5fR+A8hMir1Q62NsCJO9FKhUGP+Tny/5Kb2vJuXxJmqhCnAVFRdOQcfbwQBPk7RbhwgOs1I
	B4Gu+ATxloNY95Pkj8He7TtqYpzuRci5RyV40XrHEgfIFNo57/xw7WiMZbhS14dDm1sQskaY1zC
	YTfn83ge5Q6gfEBWLdNHJhzqR+dx9AtuSMh6yFhNLid5OHuYtIaJ1u4RLzBY3SIMDWJEQJgK+so
	/05qEqpYHhK3QcimrumkcoMS8hNHXhcJbueKQ3b3b7YehLS+3NdL9bonNfHyQctOy66izx1ch3
X-Received: by 2002:a17:902:ef08:b0:2ae:5b64:12da with SMTP id d9443c01a7336-2ae82506badmr59211005ad.45.1772884365886;
        Sat, 07 Mar 2026 03:52:45 -0800 (PST)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([2401:4900:4e5f:8ac8:a739:6c36:ff08:6f05])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e78f77sm67756675ad.21.2026.03.07.03.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:52:45 -0800 (PST)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH v2] hwmon: (ads7871) Fix incorrect error code in voltage_show
Date: Sat,  7 Mar 2026 17:22:26 +0530
Message-ID: <20260307115226.25757-1-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The voltage_show() function returns -1 when the A/D conversion
fails to complete within the polling loop. -1 maps to -EPERM
(operation not permitted), which does not describe the actual
failure.

Replace this -1 error code with -ETIMEDOUT to better indicate
the timeout condition to userspace.

Drop the else block after return.

Note: not runtime tested due to lack of hardware.

Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
---
Changes in v2:
- Dropped unnecessary 'else' block after return as suggested by Guenter Roeck.

Note: This patch applies on top of my previously submitted patch:
"hwmon: (ads7871) Replace sprintf() with sysfs_emit()"

 drivers/hwmon/ads7871.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index b84426c940c5e..753bf77ce19b4 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -125,9 +125,9 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
 		/*result in volts*10000 = (val/8192)*2.5*10000*/
 		val = ((val >> 2) * 25000) / 8192;
 		return sysfs_emit(buf, "%d\n", val);
-	} else {
-		return -1;
 	}
+
+	return -ETIMEDOUT;
 }
 
 static SENSOR_DEVICE_ATTR_RO(in0_input, voltage, 0);
-- 
2.43.0

