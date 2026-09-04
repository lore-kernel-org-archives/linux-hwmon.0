Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA6B358378
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Sep 2026 02:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788488497; cv=none; b=V5d4+LteaNa9q4EFCtFhQ9kYNyaoRMP0fYU9ZGCr/CtTcCuYZ7cwX7F/9eaGZdmxERs4/pRU+1Jt8lXm9QUNTOrCWkX320WbNkjbVJF1qNzSlFxfAND8xFxUnO086oEHWwVyeVQ26O8N2Q5Y9yk+rtpMzU1vP6rHKTNbSj955b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788488497; c=relaxed/simple;
	bh=kJ8A2o/UZ0mgONwUJC/941kV4kbtBGHonCNWzYdcslo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rjr+tt3N0NYCmjxADjr1Glo/SHNcfoq+s3qcsBG0JJUic69OwjuD4zeyqi55UnE8QbXzLg90E1k0PmocYQQ2Wc7k6ErA2xgmh8S7q1VPmLKg45KJQBTbE27XGWbAkpEIAkmsZeuzXx6ckYmBz33rJF5ejXZRisbYG0b/LxvH3cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=gqWmVYh8; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="gqWmVYh8"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-90e7bde5596so5998236d6.1
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Sep 2026 19:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1788488494; x=1789093294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+/FE/y9ST1Zo9N51I7plUbyGgWh9xTfCZH/6siYgus=;
        b=gqWmVYh8D2U4EFeCsvuSr1Pq+fj7Sseufv0gILhvcwJn9XNkcu4GjO8h2Uj3OsiU87
         U/sp9b+fVpesB22gTqAy73gwB63EhwI0HgopaaltMoZcvjgmDvaDA5YbaNuoXJnYUuPo
         WUkvKPjsH4n6ToLTa2mOBLFIbreEb9mxHCA7p5wiqMvXDJhiX0WZb3sEA5teY/TRLnnK
         bQhN5V9ETmghZ7v+wQT3wsmh7rqSZrwbkpizUA3Fx6VwGIv0sk4LG1aX/k1JvVXhu1mS
         WUV17jpZFfSZyA2ndBrnmLFBuY/DidUJK629657tW+p01Ct7gI1geV+Qv4On/Bla0+Rw
         NBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788488494; x=1789093294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+/FE/y9ST1Zo9N51I7plUbyGgWh9xTfCZH/6siYgus=;
        b=JFeFNJxk0RCzF27+cHzQqtaD1X/WPlCk2aWdNeAxRESBx+JtzDNSEgiRof3V5wVbY/
         E1+mNtmgz3nwm1GGEfSYLmpnS3+JQ0yFHSLyk1fHEpM8V3gKy4MedcK+qGlfyOmASl5s
         g5O7vAxdIvVMj/P9cbNeJQoesd1JGjf0zk6cmQS0eOLKo6g7VRDMyNr0Ov2IxYcH+wKJ
         H0ttKIfJKhAipJ3KKRwACGykJ0ZZTPo9LdPatP/rmImL/y5p2Gln0e14Ndv0JcUIuL7J
         io08Hlr5PapmUF2WWZ/D5dVBpR38bw85fdpVShydjf8aqUyiirop9LNBcDoIIcCGgdjE
         6ZIA==
X-Forwarded-Encrypted: i=1; AKwUvByMtU7ivYjz8eQ0ZCK1G1bQqYPNEp1XdS9w0uWcfDvlBkFzA2A0jWtx4AdxELJWd2x7EXcCFwCTB4LeZw==@vger.kernel.org
X-Gm-Message-State: AFuF++mqDcYKJbyXlwT+1GCjpnBfLqP/a+R9ieVhAH6TLduk6BKSWmPf
	rFngORsqxPZsEdsIV0+6cMlmoSO0yUWilmC+o04T6tkQlx9QH0Qk0BYmydpRq2NW1AM=
X-Gm-Gg: AYBFou3gYNpul0aomICXIUq3GhWxtREh5AskirRLGt6mYEhWYMKBun+bciyPewuhEv4
	wFS/WB2PMnhFLVogeTZZJ4hjQ3EDDDd/d2eM935kZyRlMU3pjQ1QAaceTpwkeRrXL9vagxWhVEI
	UUG595jEMTEVlYBonnQORxlRcWV7Vray/ojFbMPNqJhNeGloLlY4U2Bn9J7gHNwPDwHQ8wmptFj
	BIxCeyeCBAs7DCWUHaWCAfsLVPfH2ocxEvGCIP575jieP2xdqiqEnXIpXPWaw2leGbpSxveXEUl
	A+gi9HBBRbDGJnzRUBd39XDQnXYRTnKSr5Ix3YdqNh59Kv3iFVKt/k2R2EHJTW5Cn2Cx/PkywWa
	Qd4Rj/lKzJnOj0Et4s4Lauy26LSBpEtgW/NCuYEtRbbSy3cYmkNy1TOqAP9d7+D3Px/9uAjYIqF
	e6LmYqp5/NsGubYiRLjbhByKNZubXtjndu7UkOL8CMoYIC7BWDVyl6bod8QwQgGIrjQjJIzWYaW
	7NvqZQspiSLYCkPTP5jGZlTp0ig+6Q+tx2FRb87MWzjksI=
X-Received: by 2002:a05:6214:5f0a:b0:910:3451:340 with SMTP id 6a1803df08f44-9103efb477dmr42621986d6.31.1788488494443;
        Thu, 03 Sep 2026 19:21:34 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040595f81sm9508846d6.2.2026.09.03.19.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 19:21:33 -0700 (PDT)
From: Arie Miller <renari@arimil.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arie Miller <renari@arimil.com>
Subject: [PATCH 0/2] hwmon: Fix ASUS ROG Ryujin HID report handling
Date: Thu,  3 Sep 2026 22:21:27 -0400
Message-ID: <20260904022129.97896-1-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A Sashiko review found two pre-existing issues in the ASUS ROG Ryujin
driver: missing HID report length validation and a race between completion
updates and reinitialization.

Reject undersized reports and serialize both paths with the existing
spinlock.

Tested on an ASUS ROG Ryujin III EVA using a DKMS-built module with 16,000
concurrent hwmon reads and 50 liquidctl status requests over hidraw. No
failures, timeouts, lock warnings, or HID errors were observed.

Arie Miller (2):
  hwmon: (asus_rog_ryujin) Validate HID report lengths
  hwmon: (asus_rog_ryujin) Synchronize HID command and report handling

 drivers/hwmon/asus_rog_ryujin.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

-- 
2.55.0
