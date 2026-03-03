Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA96263CB
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 15:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772551681; cv=none; b=AxtqtjwaNOAzBdNoSTIqzKOzGJV1JUMw5Brh51ifUzxjnm+XwgSjzXHRVCufByL2eEExeDi8aoEYE0qZadG6uKyENHM1/yYqVOQbILugKMCIW1NcLLNhcCFSIzMzkPtiv0/94G/fd9Cu5hDgyXtGevLtjilGNuJwWC4JgEhsR+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772551681; c=relaxed/simple;
	bh=kYJJHsqHx6zKSWNQqz8FFXC6CFenxRclS+YVSyeOTSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nr5Ryc9OSrSSAbER312QQtW6gbgX5eUQ9BzMgZzmxFsHUI0E2KyiUiZOZRby/HQ+AScH3njEr0p5ZstKM+n55VYfsHnoV9UOv3VbyW71xxXM3F6HSNEb/8nola6NqKL/eXC98G6ESduFvuCmKo9BCZGMuiJQQGdVvUFwND/LffM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turingtested.xyz; spf=pass smtp.mailfrom=turingtested.xyz; dkim=pass (2048-bit key) header.d=turingtested.xyz header.i=@turingtested.xyz header.b=ESHNzCnv; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=Q995bs+w; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turingtested.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingtested.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingtested.xyz header.i=@turingtested.xyz header.b="ESHNzCnv";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="Q995bs+w"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=ESHNzCnvX53ZA9QAqrkZIqnihjmwx8o+WS9WMy+fZPAJR2lXPMumpj7f31hYU7j7xiLczMcZ2OeInucECyUCSflOJXvAxnKqoWn/9HbmGNzIsUQbrXNSLsrKnS76Nx9SSPtOLMVrMuuuo8L7C2FF2WI1EA7VRhLwFSLGh2n/tQBGO9QozHzWtcM3O/5c1ffWFAxORDblMpRX3vGqUCsUy8kP0DDkwX/Rtdt/2UC2uixAe5Ow0mKl8exbXt+vxVMoameenDF2R33nKjMXMWFXa7Q+2cANE+xVzxHjH5+u0WjaV3sd8bEOOUGd8egLsm8U1VlHTYqaguh1E2BATEnVdQ==; s=purelymail3; d=turingtested.xyz; v=1; bh=kYJJHsqHx6zKSWNQqz8FFXC6CFenxRclS+YVSyeOTSk=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=Q995bs+wokauOn0/gELve0k7hZj1M7QeRgGN9bDTJGCPOC7GFqYtyX4GsvbjrOCE5syjdXSMjcdUxr1KsrXYd7Gbi8cIuNvaHStKVhxJt/+H1CIJSI6+7JNs1tBFz5MzUmHs5PdmL+SDYAsD6SYLMSBGrA8F/ACe2GluBIPWxRtWbaHrxYLggQDDs/W9W4LLQ80hTa4bdpoZ0oUSVMV3YqhdeYrWnGie6FU2Wx6A+mX8s1V1Z0LcoQt0fEHN8PLfYNRldn+S6cWgktzYy/LpMa5IWUiUGvm/pLboN+PPonCZn9KUDOQknkyhNoWBEGQdzUoW5ncGWdxhiv5BCLTK4w==; s=purelymail3; d=purelymail.com; v=1; bh=kYJJHsqHx6zKSWNQqz8FFXC6CFenxRclS+YVSyeOTSk=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 591296:32372:null:purelymail
X-Pm-Original-To: linux-hwmon@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -284707955;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 03 Mar 2026 15:27:58 +0000 (UTC)
From: Amay Agarwal <tt@turingtested.xyz>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	Amay Agarwal <tt@turingtested.xyz>
Subject: [PATCH v2 2/5] hwmon: (max31722) Replace sprintf() with sysfs_emit()
Date: Tue,  3 Mar 2026 20:54:53 +0530
Message-ID: <20260303152456.35763-3-tt@turingtested.xyz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303152456.35763-1-tt@turingtested.xyz>
References: <20260303152456.35763-1-tt@turingtested.xyz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Replace sprintf() with sysfs_emit() when writing to sysfs buffers.

sysfs_emit() performs proper bounds checking and is the preferred
helper for sysfs output.

No functional change intended.

Signed-off-by: Amay Agarwal <tt@turingtested.xyz>
---
 drivers/hwmon/max31722.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/max31722.c b/drivers/hwmon/max31722.c
index 9a31ef388396..6c5c86c75c36 100644
--- a/drivers/hwmon/max31722.c
+++ b/drivers/hwmon/max31722.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/spi/spi.h>
+#include <linux/sysfs.h>
=20
 #define MAX31722_REG_CFG=09=09=09=090x00
 #define MAX31722_REG_TEMP_LSB=09=09=09=090x01
@@ -56,7 +57,7 @@ static ssize_t max31722_temp_show(struct device *dev,
 =09if (ret < 0)
 =09=09return ret;
 =09/* Keep 12 bits and multiply by the scale of 62.5 millidegrees/bit. */
-=09return sprintf(buf, "%d\n", (s16)le16_to_cpu(ret) * 125 / 32);
+=09return sysfs_emit(buf, "%d\n", (s16)le16_to_cpu(ret) * 125 / 32);
 }
=20
 static SENSOR_DEVICE_ATTR_RO(temp1_input, max31722_temp, 0);
--=20
2.53.0

