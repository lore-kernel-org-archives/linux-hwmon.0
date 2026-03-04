Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE2A35F174
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 22:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.227.64.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772662482; cv=none; b=NDFoDKjeVDvmMeMNEUAS0CGc9Zf1uOY23uFBIJlCrpNLpi+AvOZTTmADJsOUUfwsFMFT9zuyXOP3EcZ9XVMdXxRblnisw0GtLjRskUwHbtEv2Xdo7iIe+2Cf6FHfkgoVcL3xE7pPuGTK8w1XUfv7kEP7eP6YShU/+KmXZ87QS1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772662482; c=relaxed/simple;
	bh=AOPZpo6SNe8kEwHxhHEN2ZlZXcz94YxxG67sKmsKBM8=;
	h=Date:Message-ID:In-Reply-To:References:Subject:MIME-Version:
	 Content-Type:From:To:Cc; b=ewFAfHNEYvR3W55MFSJxMoz9iNQn6L3EJtqTaWTwzvedjB0millNZUu6YwfikF4HfxmyAa8CHVqF2GV/sprDC/sSyZNPtll2Gy82fG26lRjDSubc5MnUY+buO3m3VTuiTNTwf2GXaepuEevMxip9JW3gTg1IuZuvo1kGxQCkZTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rere.qmqm.pl; spf=pass smtp.mailfrom=rere.qmqm.pl; dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b=c9pmSUNQ; arc=none smtp.client-ip=91.227.64.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rere.qmqm.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rere.qmqm.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="c9pmSUNQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1772661925; bh=AOPZpo6SNe8kEwHxhHEN2ZlZXcz94YxxG67sKmsKBM8=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:From;
	b=c9pmSUNQIXPGypTfqzmWKDIOrP4FZzFb4GJ85195b14IMCcaha9QiIIAgnGdeW+1F
	 /l+tWqE6A7mY3b139edfq/fRpGVSyIk5OREaDoBav0iNuicZhS4miXhos5zFcvvewZ
	 WnjzbaoF1diOfsH2FbbOJPlDL4qUSuBtYJKCdglECfURHbuY2U2RMY35OLnn19LUF9
	 HzhiU/6DHypmB9pJRZ8bvh314aSD+5tANWcmo7sTuDCFAJeAQuY4ahiNKwpYRpquLE
	 ZUExZzJDaf7wCs6/H53jSwjMR09jga4En//6AKhdXTRqsoDh65Q7NjhIMG1siApkQv
	 RmMgH19/QCaQw==
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with UTF8SMTPSA id 4fR6DP2Qvczd2;
	Wed, 04 Mar 2026 23:05:25 +0100 (CET)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.4.3 at mail
Date: Wed, 04 Mar 2026 23:05:25 +0100
Message-ID: <5939119b783a9b71b51593fe19a2fa53b06c069d.1772661800.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <c7a3a0b6c1658a8ce4cc5962de18c5b2cdbcdb8f.1772661800.git.mirq-linux@rere.qmqm.pl>
References: <c7a3a0b6c1658a8ce4cc5962de18c5b2cdbcdb8f.1772661800.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH 3/5] hwmon: gigabyte_waterforce: Allocate buffer with the
 driver data.
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From:	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
To:	Aleksa Savic <savicaleksa83@gmail.com>
Cc:	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org

Avoid an extra allocation for a constant-sized USB buffer: include it at
the end of the driver data.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/hwmon/gigabyte_waterforce.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte_waterforce.c
index 06eae143bc4e..ef27c1ff8fd8 100644
--- a/drivers/hwmon/gigabyte_waterforce.c
+++ b/drivers/hwmon/gigabyte_waterforce.c
@@ -64,9 +64,10 @@ struct waterforce_data {
 	u16 speed_input[2];	/* Fan and pump speed in RPM */
 	u8 duty_input[2];	/* Fan and pump duty in 0-100% */
 
-	u8 *buffer;
 	int firmware_version;
 	unsigned long updated;	/* jiffies */
+
+	u8 buffer[MAX_REPORT_LENGTH];
 };
 
 static umode_t waterforce_is_visible(const void *data,
@@ -348,12 +349,6 @@ static int waterforce_probe(struct hid_device *hdev, const struct hid_device_id
 		goto fail_and_stop;
 	}
 
-	priv->buffer = devm_kzalloc(&hdev->dev, MAX_REPORT_LENGTH, GFP_KERNEL);
-	if (!priv->buffer) {
-		ret = -ENOMEM;
-		goto fail_and_close;
-	}
-
 	mutex_init(&priv->status_report_request_mutex);
 	mutex_init(&priv->buffer_lock);
 	spin_lock_init(&priv->status_report_request_lock);
-- 
2.47.3

