Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4762FD7D3;
	Mon,  8 Jun 2026 01:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780882906; cv=none; b=LvESV3Xp2hg1IrWM6bdHIjLKAceqe7lHZuIp+ynR+CiTlsU6S29vBzUft3iOuJDnZgNIre/pRo0uu8esmsv+2lo2y1uYJbw08CVu0T3YwpZxdsFxCQNgnn0POkURBbtXKvBGGP2KsijKnN4hCSS+pVIvaLHp7DPvjoHQY6YOB1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780882906; c=relaxed/simple;
	bh=TDL6jHZH5JQcSlvNof/iKJlqgd+sDVNLKs+q+54pHcQ=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Iy/sOOZ7/TyaCDgX9S05cTFKtS0vi1ChM/ywDURCACfMHgQ2MDN41enYo95rzajo6PUC50a9xGiOQDLnUgwkwqL7oljJX/EMwgJ3Fp5EdzdXdYJoXEceTrinEUxhL8AAS8XVugG2akH0gV7pMXrznJMstqgqWm6LEgoi7p1WIPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=fSnHHSda; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="fSnHHSda"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1780882895;
	bh=RLxQEWz6FhUuzVAjwTMhcraxPmuEk2A1rexHJ41eVbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fSnHHSdaN5mPmPpmujVgUe0dyfy9kCLnJ+PtYanmjHK0OrkRTAG0hVXBFcdHA9x26
	 EeB6yOKHINsLM++PyOMbzh8ISYTlWcTrDTs6k4UunsimuDqAvyRK1YT/vZKoZ/yU09
	 T3a7aPuRN8h78oIlyf91cyw3H64Cpu6eO4koyPSE=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id A0E980F7; Mon, 08 Jun 2026 09:40:14 +0800
X-QQ-mid: xmsmtpt1780882817tf2le6a85
Message-ID: <tencent_A052CD0BE2646D6ED4152D429F1B9A4A1E05@qq.com>
X-QQ-XMAILINFO: NFi+Ea4/qQimYhZKtVmBgh8VqYbisWJHVZCt+DSqY3nU4QAYFmQhT3x4NTHDj4
	 QGckm9mQaiqQlX/vBLuyS8L3BuSJzQJPgNY7odNGlREOgalLrSTkO6LlUR07rPLzqgf+0MHJOZMV
	 HYET38g78eG5U0C7MGXswR/iJVY0WoV+NacfTZGP7xNj8Lk1KOxyReC7G49ss/POArbHIflantRG
	 d7wXjz2AGVkYL5BFEAq5Q74YjRJd3qRvI4BSZQw+3X9opH6Rpazjl7OCXOXDqmrxIuFKFMe10eie
	 4MwYStLg/YG1NCc2W30EEbgNSbmRqbiBqJ5PJP8qdsNHVF4RKMU6x57Fq+AJ9JHgJojskXfs9dbf
	 vzjlasruzN1/YEmZMJxIEKR9aaFatR7Yu62s7vu5qAdg1+iX/vnaj0YKS7RofQw6R2rXFdau5iyV
	 4TLN+5gqP4FxxVmlRo8kBtS2n8tfBisj5XqoJ+cR3AmRGpSZAm9Wx+PoClREWYir3h26yiqNw/17
	 5NPGi8lqRSqoKUNV6eBGdBTN01FtfzV5xM3WlnP9aYFCpy8Dzk5qutSnz7mfkIwiCQg4wlwL/3AT
	 cjLXwnEIhkl/T/K2dfrpIzm733j2RncFgPjfbhcQbRKdy+rzj5zBEKgp2F12Zsqp+rBv2RNbtZvD
	 8QKiivortj6SVlucBwV8uEddhsXywXM29S3j4LiNAzouS3K9sYRZn2s6gKPDRr8mNe1dhAk0Z490
	 X0k/60NH9AzTqlxYZcJonEGsLMEHVomqv/3KkPmZw4JZdYe79/A37nCV6MbucES3+VhaqJDUpvCu
	 cVvLposY2SbRQkCnV4tNvRN6Gr5YUIIElC+0Z7C+n+H4821zd7cLVXHpYorBcXGdFp3Hl3KD8ABm
	 lLVtH/grB7JTF6ULpMYpfxZnKdE+jgP85YsV1CIL7gK5IdCyD1gsekK1o1sAto8RH9FRFKJVDOVQ
	 bhaLOwIbWibBTGN+wqlSld8EUqy4HbbC615cU+yRqiQjgZgWUWS67J315flSfG2AsyG09Zwo7GhE
	 rA9sdJPZaotwW1jHa/Iwf4blskJKH/F7aQzCOsypSuXkdAXd05m1d6Ellr414=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: xiaopeitux@foxmail.com
To: cryolitia@uniontech.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v3 4/4] hwmon: (gpd-fan): fix race condition between device removal and sysfs access
Date: Mon,  8 Jun 2026 09:40:13 +0800
X-OQ-MSGID: <37aab8653a54a0567cad365233fc147c51dd73b1.1780880972.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1780880972.git.xiaopei01@kylinos.cn>
References: <cover.1780880972.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

Replace the manual gpd_fan_remove() callback with a devres-managed
action using devm_add_action_or_reset(). The original remove hook
resets the fan to AUTOMATIC mode, but the hwmon sysfs interface
(registered with devm_hwmon_device_register_with_info()) remains
active until after the remove callback completes. This creates a
race window where a concurrent userspace sysfs access can interleave
with the EC I/O sequence, potentially corrupting EC registers.

Using devm_add_action_or_reset() registers the reset function as a
devres action. Due to the LIFO release order of devres, the hwmon
device is unregistered (sysfs removed) before the reset action
executes, eliminating the race condition.

Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
changes in v3:
1.Add v3 tag

changes in v2:
1.Fix a race condition between device removal and sysfs access report by 
sashiko-bot
---
 drivers/hwmon/gpd-fan.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 1b57a5add934..d1993cd645cb 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -609,6 +609,16 @@ static void gpd_init_ec(struct gpd_fan_data *data)
 		gpd_win4_init_ec(data);
 }
 
+static void gpd_fan_reset_hardware(void *pdata)
+{
+	struct gpd_fan_data *data = pdata;
+
+	if (data) {
+		data->pwm_enable = AUTOMATIC;
+		gpd_set_pwm_enable(data, AUTOMATIC);
+	}
+}
+
 static int gpd_fan_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -617,6 +627,7 @@ static int gpd_fan_probe(struct platform_device *pdev)
 	struct device *hwdev;
 	struct gpd_fan_data *data;
 	const struct gpd_fan_drvdata *match;
+	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
 	if (!res)
@@ -644,6 +655,11 @@ static int gpd_fan_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, data);
 
 	gpd_init_ec(data);
+
+	ret = devm_add_action_or_reset(dev, gpd_fan_reset_hardware, data);
+	if (ret)
+		return ret;
+
 	hwdev = devm_hwmon_device_register_with_info(dev,
 						     DRIVER_NAME,
 						     data,
@@ -655,19 +671,8 @@ static int gpd_fan_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void gpd_fan_remove(struct platform_device *pdev)
-{
-	struct gpd_fan_data *data = dev_get_drvdata(&pdev->dev);
-
-	if (data) {
-		data->pwm_enable = AUTOMATIC;
-		gpd_set_pwm_enable(data, AUTOMATIC);
-	}
-}
-
 static struct platform_driver gpd_fan_driver = {
 	.probe = gpd_fan_probe,
-	.remove = gpd_fan_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
-- 
2.25.1

