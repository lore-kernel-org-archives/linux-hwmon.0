Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80043D092D;
	Wed, 27 May 2026 08:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869586; cv=none; b=q4Eqmb13Giy6ucfXGBYLk4uHrzi8jUSm/6bjPqigIOdj5xmKLtuyYYREE19sqiDdSTNG9cysMVUKe7cp4UI4wtkYCKGL/4o6j9ZMoD6TfWYzLiD+2tLbg/qgnZ5J54TL7mVjEvFSJbqBFnz6oNp9GInsGHPbj+V9l9oH/OXAavM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869586; c=relaxed/simple;
	bh=PJI/0OCwHO2Fn6mzq/s1XHABKDONV3du61S+3/32ikU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=KxDcSa7jvCyAzPox2Mw9vGZq2ySRTYyBpNNVfTzswS52fYkcgDtcXcy0IGOv+8zIZ48bEL/GEzpEVo6AD4H74BC9RJghuk5Z0qo3b4oWmdA/zUT4Ds21KQPfU9ZHGoI3IFc6ilJZX8gF3bPQeNqHu6XduLGPKpZIwkBp8oCThGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=ZiSi+MNn; arc=none smtp.client-ip=43.163.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="ZiSi+MNn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779869582;
	bh=s+gv3bCyBiFdhdGpOV9qIzoa3h/dhnm5AXIqtqXa4XQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZiSi+MNnXNoojxWTwN9o4EsruEwbiHzsyavVnWik7IJqDxY7E/2gkXneSWvi0m37n
	 qpE61mg/NbrM9D2ZpQnDITVYpfUiqYiwf7JWLkgJh3/kHCQ6gg2JqawLDex2YahII6
	 U0849QK8XcYzJXl+r3i1UlAM3mfzfyPaZQKQfQFs=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 339BD2B7; Wed, 27 May 2026 16:12:57 +0800
X-QQ-mid: xmsmtpt1779869580t8rule520
Message-ID: <tencent_F6CCA9B9DA441472AB5119417E7B619DB40A@qq.com>
X-QQ-XMAILINFO: NM4txV5xeln2VB+zFmGlaHqz+Lw3IJGd7jwGyYTTA/kOGQARkausMRepijAQSd
	 WfXkoPhUCDvhMMoBc1xJ62dE3owVWWg4adHrDZ585IHhhk3HYOb8yMSf8YfqtRevDxNhufdQUPme
	 h51VHxjKs+xBDVx8jtK4bC8O30sbyhQOUKQnxdsq5w1zlyxue4QhgMkpniTlMH58BsE8bxWRlVmh
	 nXxVZ2ZGwU7WweGOcEVvzu1NZmRbaPCKPi1/xFdqr+UDaH2Qx20BKaAYMUwDaEFji9bQiVFgCgso
	 m3jSmhL5ik2V0nNhoRE6I/fcx74eQ+3eKSeJ+Rk9kZZ0drb/U5HSoHALPq3JPnaVkndc4CUuAoYY
	 1SQluDBSYnqMuelt1eFBJj3Q21QNu/SK+vY3hS+StJSN7lW8v2MdM9j6Vl2X1p2ovgJYUcp7u4R1
	 ARx1X1EKsl8HEwBAxIdxmFSDJiiBDZ2/EbtSrMTCadgNdsB8KzXIbPx/5ACDQh/yXBP58fDDGSH7
	 5JXPly3NB9S70pBFnspfDGZv1fjW/KFJYGYlX3NtTLMsZNYTFYReUJor5uYXuKbsPrJbb3u8V7v+
	 qFuknGevYAYoTqB8vuS9OEyO8YLTzTLaBQ5cpQjaRNnhh3q9240hlmW0QUVCnnq7galrB+UGGA/2
	 8oVxO5XfYgosNmSJhv4dGGI5K8YTsYt8zo1fSDVtPqeES5S1MCb9JfuPUY9OW9S3Ux0dMYMJQ/YE
	 ++Hg3pPvvwiICDCbpYX8qvleuRnkyXj6S58Pba/76Hba6aR0IUOkNOQOUzOR8FQnOug6pjqw/9j2
	 CZyIdZqUzC+1yBZ6Vll8eZiUbcUP3unGSo3Hc+JtoQWVsZKkfgeO1YmXe4cp0nhjc9TVhEvO9fV7
	 JwFuuRHsA5xtdP+oTEk077qUunlgQ2jvKEYbOEZ+LakpNQo/CFsolIh4JxA4K5nt70YCtARpoQ6i
	 ugowFVzzXTXQucb/bNs95ndKjjtwRGfnmwIpVbjfcVUWjZxskNWGvCTActl+Nx88B5d4SDN6Zvdx
	 poFKAMGLrrFWRsegQavijhluo2s9s=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: xiaopeitux@foxmail.com
To: cryolitia@uniontech.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v2 3/3] hwmon: (gpd-fan): upgrade log level from warn to err for platform device creation failure
Date: Wed, 27 May 2026 16:10:56 +0800
X-OQ-MSGID: <dd7b8d506dde2c187af9dacbd3fd6408a6cc9ead.1779868768.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1779868768.git.xiaopei01@kylinos.cn>
References: <cover.1779868768.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

When platform_create_bundle() fails, the error is fatal and prevents the
driver from loading. Use pr_err() instead of pr_warn() to clearly indicate
a critical failure.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/hwmon/gpd-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 745b3fb9e3a4..b18725f4d108 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -712,7 +712,7 @@ static int __init gpd_fan_init(void)
 							 match, sizeof(*match));
 
 	if (IS_ERR(gpd_fan_platform_device)) {
-		pr_warn("Failed to create platform device\n");
+		pr_error("Failed to create platform device\n");
 		return PTR_ERR(gpd_fan_platform_device);
 	}
 
-- 
2.25.1

