Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566E3219EB;
	Fri,  1 May 2026 12:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777637156; cv=none; b=nv7GwwuDZ1vzyb/BDua5OXtMu8WUTvQuoQnLkxci+puMZJ4lkryQ2RjrV8cKUunGG3s0BvuWAeFZfXENR7H4awXyGWR+VlFJBeBq0E12rdjp7Ok9IwnYhZoRvKhyb7RlpyQAMwoTyz3JZtXTyTwdHmICI631mPovRrGXpdq30/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777637156; c=relaxed/simple;
	bh=SRUzy9l8TtngC3PuTDNk5a9R+TOteqSQrkJU2zN+cRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KhCV+fYH39o36HszSOugh64EHhhiBgGXXPjzurw7xVYBjbmbRd/4O51aqL338FAtLl2f7fZP59TOKrq1SwYThsA33IPa0MBvqUKNVau5zCJZ3s7PRjWoDRCs5HeXrRwvDgjXI11r7Ymjw7UdNAQmdVJhNz3biAFTut/0uragvgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=ChFo+lF4; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="ChFo+lF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777637129; x=1778241929;
	i=markus.stockhausen@gmx.de;
	bh=SRUzy9l8TtngC3PuTDNk5a9R+TOteqSQrkJU2zN+cRY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ChFo+lF4ejxl2x+Z87C7wPXOczMcJVK+SFL1gBfFYPDZWrnZxxa2oPjsR5v9JR1z
	 JEjGPG+cxEJ6F+9OsliLGDrgcjSgm2MQj0rlFSye5Vx9So3krbJyASex56394Lz2h
	 aTivzr+mnCuYxO2wKn0wnXlQ+MWxKVOEbuKwhfTqu/Qxshf1X4lPFRf5ykuMvK1U0
	 oA9TzbKfKmiIeV+0wkU1TpP8Z+zsFcgeqmSC+PUsQn4MAyV2sVBpl9pey8Fe3XWWB
	 LD6Qhcl65O3OqxrjZD1jWYFB69MhRtZguIuVkBpfxyeT5sx5BRaB+vOjABUbq5x40
	 J3HvqYSNC8jUCTsDyw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mqs4f-1vWXaC0FtZ-00ZuSU; Fri, 01
 May 2026 14:05:29 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH 0/2] Support active-high alert polarity for LM75
Date: Fri,  1 May 2026 14:05:16 +0200
Message-ID: <20260501120518.3085501-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UTPrFiCUmZU9t+Xoo5X/fNZTV1l0UvDw5iGNz4/C+cwiDUXsjFN
 +j9i3S4xF30XoQdjMa9Y7DjrMKrpVecmlNzcCm02QcMwwTQgTLfLVnQqdcnn6ZABrDL3Ykb
 FY6zBq9SqrxPYfVg7bAoo6M6PPcmD5x/ds2E4TkdN4xxxMW9jNg1aNxnO5SqBrm3PK1riG8
 VUvxq0X/m2Ct2wXEkKGJw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QtukiQofWs4=;F2V8/BvpdRLSAKAjwXjAMNs9Zbh
 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

The LM75 configuration register allows to switch the alert polarity.
In default mode the alert output pin is active-low. There are hardware
designs that use this alert output for an hardware assisted automatic
fan speed control. E.g. the D-Link DGS-1250. Implementation is.

- temperature below Tmax threshold -> alert pin low -> fan slow speed
- temperature above Tmax threshold -> alert pin high -> fan high speed

Provide a devicetree configuration option and a driver enhancement to
support these hardware designs.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>

