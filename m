Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FD537BE7E
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 11:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313454; cv=none; b=QAJJkBQws29p+gtpGuDtTQ/EuTVrAuckUrNnBJ7znySgPmc5dqLfxQiSDpKvomUdlWED/0/09NDI4pUPSwIG+FYYdscw67Q7C1eMsz6eZXcKKViCowD0nDdDidRDmOfZDI8OUZIUQ3sL1GsaMRpRDINA1kmBWm5RQkMnQDq2CRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313454; c=relaxed/simple;
	bh=KCZMJ38gn2LyIsVqkMURMry+8AUXbyr+3NsdpSCsEOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RYmC/yCxIBcUSk5Js9jIG1Hnd5QcoOck2gkvrZdIO8EyrVVY5osaEeJqCevYxvar5rteUWj51R40nToHpLxRv3FhDFH5sYnWAwpJahkgkimdX7kXdzDlBOMEqqKDTh9Y1mn/Nn8gX74+AfPqf1DR9vqrjkqtd6xkQedTTnQ0oEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ozPMJmlN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ozPMJmlN"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d530328efbso8218545ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 04:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787313452; x=1787918252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=step2LqMI1gl+3y6Ukugh+S+2EQ6YaQnPmTC7tXJkhk=;
        b=ozPMJmlN8MBQz58MHkSjliQxJqG0o5M+cLNq2AqCSTlMoPJEmUbE05NsXbh39yRYEk
         K2FvXhlMPhWlTR0cC96AJ2vyu0/NkSRIbYoVv8mFvvmGGjUbmMHTMlMIUeq93e1S1cnk
         BemkBJg6KaQrsgeizbN/YZo9K9GqoTooBSjG9dyL1S4XqNQLA7fgE2wa08/DL3y4UGd/
         GWqJIWgVxhgB1y9FdUL8tf2xMuGJ1+ZdMi2LB9wyD8vSpRdf+TiSolsE0JZoVlCqIvlw
         RfuwP0w3TYcQ8SDm/vr9xDGbIzOQo5Mtn3RdwbLNpH7WY1G1dXnFztwV+VJ3AbuWyvPP
         8bgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787313452; x=1787918252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=step2LqMI1gl+3y6Ukugh+S+2EQ6YaQnPmTC7tXJkhk=;
        b=icWtuR8CdpaJuCt+3+ueNtySs4fSMxIF+y29gofnHfRbsXwAPrVRi7hsLG2WbKV5XS
         jLKn59yh3ZkDwt3qh5mIfnZkEjW15Md8ZMliYQTbpETpiajRii9ewMlkfZdmjqDT/9ZY
         3kqyh3bwXhsVrUdR4l2+3XbV+bqDE4jABaOiWm1/bBynWK0C7xuKaulbqo1liF9Dwt8O
         hqow2ezGOxFxt/QvlRL5EVWatYRLYqY6cYNeeoDB7wSowHAgaLvxT9xlIIwsqrowR98z
         M9V31qHVaoICWvJq9nqyHpI8+vwBdbf5ZTo47fYt9V1x1+dhPqPYijRiBFrNsIm/PNVd
         OAOA==
X-Gm-Message-State: AFuF++lvEdQJlBsa8yn45dqXvdm48BJjLxPqVERNxi/n1LV5+HlxhsED
	V7NXtA1TqBEmBlA0izlsHLYZUp8/ugGXaqrTp1elVbybUa5nfkVgypOt
X-Gm-Gg: AR+sD12RirEQ3JuiUB9vVmVUKWCJu0XQ4plTBs/JXVgtGUrlIt89wYwlcQjXfrgSMGW
	dRqkNcq+RaoQChHd+RnMMbrAWqElFBUpKS5XZBNs3Pj4FISp18rv1thNTRcmR5D01/dDCxSthFe
	RN/T0XtqrnEePSMYgwujazBKvo+0Y0vXhPngCyv5iHbWYuEDb3Dqb888hZrWOJWImaWfvTwnBYi
	dVqChN+sTZqs65VW+vUyOnEfqaUD/w4QD/EI34fZzGafp1SoZVWrVFibHmyXIxRNfePc92QZCuB
	PzXS+bHoMQqwJyUnVGbh0hXCFn/aqaDmqf2DK1VgA793cSQmJggXUcrkghk7ylICVumTeW7UMkC
	5Mit5A0J0ul2dPXBgp1BpA3lQWyPqdlZivsmRODimT05Xi5V0GfXd72nXYJZAuoNxqhvXEgz3vQ
	Y2mOVZKE3bKz0nlkbkMyxYTvRLzKkBBlEOo/vMfHuabDOD582IJjGldy11EC9qLjpJw2YTJDbfv
	I3c9XNamHyF9WPunULUGVr+xIoMIAz/MD5E69/rdeUrO4xd2JycltQjdw5OAfU=
X-Received: by 2002:a17:902:ebc3:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2d64b0427fdmr116312605ad.12.1787313451901;
        Fri, 21 Aug 2026 04:57:31 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e3a2713sm17922095ad.58.2026.08.21.04.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:57:31 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>
Subject: [PATCH] hwmon: (yogafan) fix non-kernel-doc comment
Date: Fri, 21 Aug 2026 19:57:20 +0800
Message-ID: <20260821115720.2017516-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file description comment starts with "/**" which is reserved for
kernel-doc comments, triggering a kernel-doc checker warning.  Change
it to a plain "/*" comment since it does not document any function or
struct.

Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 drivers/hwmon/yogafan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
index 48fa5148d..278cb089b 100644
--- a/drivers/hwmon/yogafan.c
+++ b/drivers/hwmon/yogafan.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * yoga_fan.c - Lenovo Yoga/Legion Fan Hardware Monitoring Driver
  *
  * Provides fan speed monitoring for Lenovo Yoga, Legion, and IdeaPad
-- 
2.43.0

