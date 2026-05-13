Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF613FE367
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682323; cv=none; b=hU06O/f8i3XNUFGF2DCOcpxR/GhxeCsutzsGmnOKxShy4IO2uBS5QnEApFxK8DM0aTMuHuC+8AaxKqSJQGyesMNB20+Y7fHYTUWBPF2z3vqEPuQTrQiLzAHJ3ZJ1jKtWXR7VaoesfcIp0nrPcfFyYW0vlbxdV5JY9Dizejxj2Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682323; c=relaxed/simple;
	bh=+6zwVCtG864uamNmimMqypdoe8h9uDauLZgpAqSsFMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q5FuTAyB7ITyHVHkcBrCPp09wz6bXR4uHVrr743BBsf2TTr2JOuWOX5ogxHIBNLeNaf976JqiW31z+Zbw2nSRhXwaunMjakkfUCiNCcVR7yUPcm4l7LJT+vdsa4mUAHwHBCJJ29G6nuKKi6TafcsXC885ZCMO0Agn2g+y3htBqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHGc5LSg; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHGc5LSg"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c156c4a9efso9221150eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 07:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778682321; x=1779287121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8kLNggbWqjz++3PriDBIk0KxBz954OLWmlX/tVh91k=;
        b=VHGc5LSgHvw0ijV6p6/Hxp3MPQwiJnXirzvVDGsdPriNXzp9AvSwDw0wlsiUcb4GkW
         iEIGzmRE7lS92atAxDJ9zQC8jDJGfrpB6bwgRE0x5dSFNyaOdh0QctDzs+FirBQY6aHu
         pRv8bVxvwq4r35nyXE7UkeBSArd724u1nVVQ6CDcqot4yej20gKgaHLL/X1AOfOv+zYQ
         BJEtlMyNTEYezzdx+JfiJSk4FzDME4B0H8N2IZEJL8oHOw7EwDCs1URpHjix+HURGCcd
         qtXaBtZCBJRV2bBeQzE9DZg7XV2r829ID4j3GqjJv3aSW4DPVFpxO0MoS1t6tBWUq5Q6
         dQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682321; x=1779287121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8kLNggbWqjz++3PriDBIk0KxBz954OLWmlX/tVh91k=;
        b=aZpgjajCAMjqzS3+CKG7oYLqFi6QUw/3/ySzJ03Pw5YKpev1J9mi42xOfuYOZbhvdJ
         7+5qIRe2CXHCq4PwIywRWogTJotD90ixEyA/hjiPEjilTCKrfMxQUJacB3aqKUYA3WfB
         eZCO/HEis/xhgMPR9C/mopiaeREsudVa5wW7WtABIg/9HemITRaed0O6g2I9sXuqCkER
         seVwTeY3IVURb+Z4o0Ap8hPJO37jh2m+FTypkNx6K1tWGbqOIX9vD0ppqvASSCdyC0Iv
         oxJG+MFC+ioOivWAmqrBMIyfmuQ4aqz7J11RpQ1WDZZYhHb4IEEfjGRl76CPmGebgzkf
         7j9w==
X-Gm-Message-State: AOJu0YzV3jiv1IKmr8Q+16MNi8CYY0gmwzQTMmX8fNjR3JM2vWfSIVpC
	AfRmh0W6w2EHyRWgYURaVWMixqwhNlDukZ2rU0rOl7PYUDAX8ixLS3cAzoT4Kg==
X-Gm-Gg: Acq92OFdZyVhYv3RCxvxAHU3HL+qi1N5dN5NFfqMeOEFA2H4igGjqbv23ZmF6ws489Q
	IzZPGULbqLNrz69f+PfiosXSV2qmqLqhKrbaWuIBA2+oHtNy6ZY6RTc7A6kVhp6i3ctwYfA+g55
	TMZpp5oxDIwAcaCXnhJ3hhDgrtguOLi8Ka3JWTH0+0AN1gjzZR4L+doccYnQor7mX412JWlpjDs
	dluwpob7j9QLwhJXmY93OBQ6Rd0tLwhyMZmUAtGjTofF4ZbOkiImF8VbLAibs5uU/M6R1IUaGu2
	qjKzijvUijdnZJG+I804DvYqNs1PNyJfR05OcMQqUnW8EKFQjFPqzv4G8yIrwC8fDgxP740x4tq
	MQPsXtlfZM7gcBDYSR33hqIurN9fIGDf+0RAnEaCUAMnK6+JDMYsJQC2bcu6QSBtouL0FA588u8
	jOapduRPq5UeRAsmU/eCCydlXjCsDz9LyhauAV
X-Received: by 2002:a05:7300:5403:b0:2f5:23fb:9aac with SMTP id 5a478bee46e88-301568fdfb2mr1673977eec.31.1778682320586;
        Wed, 13 May 2026 07:25:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eafc2sm28055928eec.4.2026.05.13.07.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:25:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/4] hwmon: Support guard() and scoped_guard for subsystem locks
Date: Wed, 13 May 2026 07:25:10 -0700
Message-ID: <20260513142514.419345-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for guard() and scoped_guard() for the hwmon subsystem lock
to simplify its use, and convert existing drivers to use the new functions.

----------------------------------------------------------------
Guenter Roeck (4):
      hwmon: Support guard() and scoped_guard for subsystem locks
      hwmon: (lm90) Use guard() to acquire subsystem lock
      hwmon: (ina2xx) Use scoped_guard() to acquire the subsystem lock
      hwmon: (adt7411) Use scoped_guard() to acquire the subsystem lock

 Documentation/hwmon/hwmon-kernel-api.rst |  7 ++++---
 drivers/hwmon/adt7411.c                  | 10 +++++-----
 drivers/hwmon/ina2xx.c                   | 10 +++++-----
 drivers/hwmon/lm90.c                     |  9 ++-------
 include/linux/hwmon.h                    |  2 ++
 5 files changed, 18 insertions(+), 20 deletions(-)
