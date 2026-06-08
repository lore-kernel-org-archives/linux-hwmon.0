Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03D030C63A;
	Mon,  8 Jun 2026 01:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780882828; cv=none; b=bUV5riGSVEXhjrMKH0Nr0tQboIVHDTFQeIw0Y4pAk1r1AKc5ksN3eFkLfg5u0+FGVmNOqVb0COgFy64WTYGMma1leVshoiQfEQRBuJp8YT/lf4okIM6QbGdhN8sck5cbrNlmdLJVYsZLEK2X+gRc2IGGZlLvDHb2AFcyg+6z42o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780882828; c=relaxed/simple;
	bh=gslXQrU+w5oJztQmlaqt9M/3UOzlgJHRRBnoFLgWt7w=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=GY8CLYzeF2v/9qkDRaV+J74cAliNIOZOFMaTyKO/WcjV9LNDeXyNdzcTRmaE4xPM61ubaKGUfkfPgaFIHrJOH51ER05Lt/SfkQEKtQ783ZjTl5qTQnb8hdZNiVepUe5i4GUiMSXBZputkNd2Ra8TIvXhvY8ZROhOZbMzipo9w8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=qQ/i8MJc; arc=none smtp.client-ip=203.205.221.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="qQ/i8MJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1780882816;
	bh=79CxeHwI0aFfituVNZQShxBVMzwxZTg5XVtRwg++6kk=;
	h=From:To:Cc:Subject:Date;
	b=qQ/i8MJcr9Y1r4kcG3pnh54gLmqja+YXzPlHW/nSrEkkXfbydvQBkwApBK/TpBvEe
	 PfIWQWFMBA2Da326EuXffovFpQyAScUO/clNdeWJZMGLkxx6+l+h3vb5oRCgcohhwM
	 LhRgB3JRGvpSwYXggHvlrODvXUW1A519PPfyZBXA=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id A0E980F7; Mon, 08 Jun 2026 09:40:14 +0800
X-QQ-mid: xmsmtpt1780882814tfoqb9ku4
Message-ID: <tencent_35D37336AEF71136DC95545290D15E462708@qq.com>
X-QQ-XMAILINFO: N8xf3Kn/xs1HDDWGOU7gIEPnfJ0PWOiJatPJTio/B1l0fsWIy1CNWhow2aGstY
	 e6FW+UhqqLw/beBE8pqhLe7aMfXztQxTAMMOBPIU2Pj6Y2AFOw3xPNejzrzmOrnm5BPltQq07GpW
	 /oQzOg1nOWCTRwF4L50BeYIO+72X4oyyieLgVAXp95jx7Dvwdf7nEZj26Xt8A4g4uyrAIGHuqfZX
	 ZZ0azv2W2XSUI6sNtutPgNjY40iOUbU6BqQx5BS8fRnxbfcHmkEmm18VbzttiKXuXpDf4IB4NW3m
	 D6+FLFZMrsZg2pgN+vHj2p3/arDys8Y65Y0nOSE+G+Bn9zJ2w/73J7GJ++088uYXAPxfjpB3tYlt
	 kAf19nBakBO1wubyzD88AuzPCKiz0a5Sr5UQ0vuRPxnaFJgnwpziXA05tBSaF/g0hONJVjCJyZvS
	 155OWGWdph1ggENkAn7JHaVHvJ49YDUFnYOTVN0zUeVw1cy8NdZxqW1rq6zMCydxHhTAXqC6GsId
	 C9g3YfRFRKfWxhq3ESg2nfIqOSMxd7gBzQhafAtN0djcWbRqzrRyMgQ25MtzFZnyWqp3GXckZqD+
	 i7C7Fe/BK+Dtz+nAb0tnsaBZpgI71XCMICObuRJed7BCLr0AXJkeY5TKHsnaqYJX7RgubJx/RBAS
	 fW+PZrYOWIPmkoCPgNJrRv8y7Y1i0c4IPmvFwO5t5xmr49be6/jl0jPMXtNF0Tbi2qjSnEnPlHIy
	 ammONL/aEk7dKdBSrUgQRA29gKVQ7eUpUXjxM3rqCaSncmp4kWJ676czdtdE6VcKeWOJo9HHuNO9
	 SsgBCA0b6pt1GK2D+3xC4aP5pxZyrQQc0dFefiWOdusiFW1/boyfR0sV9tITHKha26AlWYeBUYA8
	 a23XgoeHTsSaZCo4qwh5rGixnn3n96W7xqZeJP7hn0DcHViWWowx8zV0cAyhbduwsBbpgVmpNIpp
	 fcxC449FeNTEYllZ/BrvnsdVzG3ruhpINW6DoAt9lQvVNPDOFhoIB3PmXDRBIRodiN8ryK67b/bF
	 8xRsklu+e3Nf2wmMvYpqLj9jEcEFs=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: xiaopeitux@foxmail.com
To: cryolitia@uniontech.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v3 0/4] some cleanup and fix in gpd-fan
Date: Mon,  8 Jun 2026 09:40:09 +0800
X-OQ-MSGID: <cover.1780880972.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

Patch series: hwmon: (gpd-fan) cleanup and fixes
This series makes several improvements to the GPD fan driver:
1.Replace global driver data with per-device allocation
2.Initialize the EC before registering the hwmon device
3.Upgrade log level from warn to err for platform device creation failure
4.Fix a race condition between device removal and sysfs access

changes in v3:
1.All patches add v3 version tags

changes in v2:
1.Add a new patch for fix race condition between device removal and sysfs
access.
2.Platform_create_bundle pass a driver_data pointer 
3.gpd_init_ec needed before hwmon registration as a separate patch

Pei Xiao (4):
  hwmon: (gpd-fan): drop global driver data and use per-device
    allocation
  hwmon: (gpd-fan): Initialize EC before registering hwmon device
  hwmon: (gpd-fan): upgrade log level from warn to err for platform
    device creation failure
  hwmon: (gpd-fan): fix race condition between device removal and sysfs
    access

 drivers/hwmon/gpd-fan.c | 226 ++++++++++++++++++++++------------------
 1 file changed, 125 insertions(+), 101 deletions(-)

-- 
2.25.1

