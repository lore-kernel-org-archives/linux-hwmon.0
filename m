Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606013D170B;
	Wed, 27 May 2026 08:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869585; cv=none; b=FEgAoiANxHGTXufIgDUDNeB8RR+ablEI9DqISS2m4uMF96h92P/dd6AY5fKm5dHy7FB3Gvta+OvYlLdUuLtGQbNxMeVpHhsy6WmfQoLCxTEHGv2aWQmqwqpFvjeelhaO4dmz9gjGLqSs1helXxwH3Zvjul4s84DWHEgsJX2LEUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869585; c=relaxed/simple;
	bh=UizHERatWLvNTMBEHdJ5vlSmLiGqoFpCmiNfzocBfCw=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=WHUg+EDAlyss48LCLLiXLHRObmFHxZElFZD77p7+moWmyiZ/ZBwvEuuz8Ua6gMzOsIEnqPRvTJ/mOjtzF9bEaRGBYWp22xf/arfKHFnLrmXOIyLlHstEScGJJ/VIWgkM1NNENK242pEGdLR0n0/SoGTsqt4erKGSzPG4nW+atkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=s8IIEqQ2; arc=none smtp.client-ip=43.163.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="s8IIEqQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779869579;
	bh=BZO8g+l1n4IozwKBzHD+c0K5xcSUfUkkN0VB+7wK6Cc=;
	h=From:To:Cc:Subject:Date;
	b=s8IIEqQ2AGRNJ0d6DQCTtddcc+Elx7aHWZTU0JMfU3omLx60dvOas0t8j5g4s9y2Z
	 5rFwyqiOcRrNPS+PYFhfw/zoH07Ujw9580zZIxrMsLvhwOHHXpS1q430Quhd7KD0FT
	 B6hQG4fnb4yqgFujBhUQJ4tsbJqMIdK01RWFhjt0=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 339BD2B7; Wed, 27 May 2026 16:12:57 +0800
X-QQ-mid: xmsmtpt1779869577to6bgef75
Message-ID: <tencent_20405679099F24CD71BBAA45807113506D0A@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJAqAPPwAGVWMXMDu20RlgSQV0RMid6sjsyMIQ7J/0lAGz2dMMUv
	 cARbdsR39VDWi5CWlytK9J7L7t97vx2kW9FBIWt7cljRt3KHgSv3Z/cVP904Q3/0hrZY38OU7YQW
	 B83p6v37v4zbFBqxSXwIoYWDOEQ5hFurew2Sjg7hKphATo0z/Wzr7v9SbQLTzL3IYdr+tSXIcC2o
	 wcWUUInICgYnUOgbeSvEYbEVVqrz5Ju17dvmUIeDmX8/NOt2+J5ayEuhNRlYIHBpCbo0eEEUEAwv
	 FteL4YzbsybUq1pTHpd+Iba8seunTwy5jUrvgl6MfsDistgQNh+lpnhNxIVf7s8DFZShUbXIPPG4
	 zRvWxl6+PDy24Ohp9CStx9gWdMnZ9WPBEvF33L7ai97L/5RTIh3GMiN4AlZ/hC75tFl4Y2W9cCMl
	 AX1KL+VoVkhDIkfAREYyxt2I/iytzSciA5DS8Zyz3+ajWtix0s9ziL17WehnEXafUJnNu1P3YTe+
	 wekAhwvezPxXwW3WbgdLV1T+zEA5RTau4mYrZd5NNmJgOaZ98qo+wUOJ016an1b2G2N7wab7W3SG
	 6SpBzPh17ogZvNmUpiGW87w4oNKQy719rutk9OR+60iJpohaExTmsfh0C2TMLok7wOBDTkvzXcZL
	 Ta2xvXb0gn74q+UXi3+kz6kSd3Qoxw/7SPFF8RDuW9wST1mA45B8Hf2m0PLj2CxH+iloN5mPJXXI
	 g1Zjyn3BFuITj+RBzb9zoIljFIDF7LfjCc/EVLhGt+/mAPJ9wPBtjPZoLij4X6PqA5AgHoscqxvN
	 oyFppL4Zmbhc49yujh5z+Y7IrfeZ8Lrt3Y3TAjGovFsEmljx3sN7i24KulhklaZVm23ita7G/t4O
	 jnzyBhQvnXaH3fWgREWR5w7QSnIBBM4f/SUQlqz9DC8WQ568xYkbcT0nWRN0bs3f7s0IS1+06l9V
	 VKdoRMdn4bvpHag7kG+H+uGeUiO1s1hLqG3u1ClTnJRSbVxCOjWt7564+b2OhKQk8K6CFmsItDa6
	 6ORzY+Sw==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: xiaopeitux@foxmail.com
To: cryolitia@uniontech.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v2 0/3] cleanup and fix in gpd-fan
Date: Wed, 27 May 2026 16:10:53 +0800
X-OQ-MSGID: <cover.1779868768.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

Some cleanup and fix in gpd-fan.

Pei Xiao (3):
  hwmon: (gpd-fan): drop global driver data and use per-device
    allocation
  hwmon: (gpd-fan): Initialize EC before registering hwmon device
  hwmon: (gpd-fan): upgrade log level from warn to err for platform
    device creation failure

 drivers/hwmon/gpd-fan.c | 213 ++++++++++++++++++++++------------------
 1 file changed, 116 insertions(+), 97 deletions(-)

-- 
2.25.1

